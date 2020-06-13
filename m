Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198A41F7FDF
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jun 2020 02:11:38 +0200 (CEST)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjtlo-000112-ME
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 20:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jkz@google.com>) id 1jjtl3-0000YF-DC
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 20:10:49 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38967)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jkz@google.com>) id 1jjtl1-00012k-M9
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 20:10:49 -0400
Received: by mail-pf1-x443.google.com with SMTP id d66so5060268pfd.6
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 17:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DgnUJ9ilwAoJ+wMZXH7eyTQoFQBGNuwIEdz7xoUb5us=;
 b=k9McmdPewKhCzp+Lm/OqALwNjxFdCXujF0Ej4iRndQmDE9R8PR0AgxX2yrpX+bHsCx
 vZA1hMCMGuoApKEwc9E0yAcjHblBLlAZ5WN+PTtr0UFDpZdte8gVI9Y/Rfz7n8Gk9vTX
 KC3vwanSuFn7tnbqkw80iLPlIB+Rtxit65qbp3i0pld4pZtTgl/qSH/9NLgvVuZ3tFNv
 rbPxyqywzryruHtLENnv5tSsqAymgVzScDu/6FAtnDh3uazgSV/y5sETfx5Go4cwaFuh
 Oo5iSvUk6mIEbKMUQazPVqCKZqqqTNfiCE/XPBj31IQ2XZGcKfXx9y1qienYn4EgtyVL
 M3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DgnUJ9ilwAoJ+wMZXH7eyTQoFQBGNuwIEdz7xoUb5us=;
 b=jhXw69oxncbkcsS/39nInUQrLt3paRmG8DENPRvy0zXWle1nw+jVSPYPJdfUfPNaSA
 g21mA6RLiwTrIf9jby1T+PzhwToONht8gXvt73T6G/plVDS0/gMOI4PrfbmcM/TIgyNa
 8VSz85hDjbjQOiVWiwUskYa/Bn7wTBo9jK7BuglUQEF8QDbySq0plazGI+6VA1a8YI8x
 tLwtwkttVli0klmkyi9A2/5NkJNf3Ys99HTQsvtBqt4bL+1JseZhDJAV78vpPcjTlkkr
 oyUr4p79hegVlHrJPvR2f9zyz9gzJI4xT6zOdkX/Bk9NI/DN7LILikOOUkkg7iMu2vG1
 w3uQ==
X-Gm-Message-State: AOAM532TbV9FAR1oS0ABAc2Xx1+eFB2oydJcYB/MjriFeHSh/4ph9G8z
 9mq9RF1p17bB6H/Kh/MaQvijTSrMv1XZBWkOvSbvmn3P
X-Google-Smtp-Source: ABdhPJxesGm35XUQj4dM/qwbmIZ6z/WcoeG8iCTP5nwhftwUQj24rLRWhnMrASyuN3gosI3ZmAbwKwuX8LrZWGhIWu8=
X-Received: by 2002:a63:ae44:: with SMTP id e4mr12974689pgp.428.1592007040480; 
 Fri, 12 Jun 2020 17:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200612014606.147691-1-jkz@google.com>
 <20200612014606.147691-5-jkz@google.com>
In-Reply-To: <20200612014606.147691-5-jkz@google.com>
From: Josh Kunz <jkz@google.com>
Date: Fri, 12 Jun 2020 17:10:29 -0700
Message-ID: <CADgy-2vLnLq-95Tn689NE6gAHD-HhJPbFrx3suef1f565bDCtw@mail.gmail.com>
Subject: Re: [PATCH 4/5] linux-user: Support CLONE_VM and extended clone
 options
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=jkz@google.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +    child_tid = atomic_fetch_or(&mgr->managed_tid, 0);
> +    /*
> +     * Check if the child has already terminated by this point. If not, wait
> +     * for the child to exit. As long as the trampoline is not killed by
> +     * a signal, the kernel guarantees that the memory at &mgr->managed_tid
> +     * will be cleared, and a FUTEX_WAKE at that address will triggered.
> +     */
> +    if (child_tid != 0) {
> +        ret = syscall(SYS_futex, &mgr->managed_tid, FUTEX_WAIT,
> +                      child_tid, NULL, NULL, 0);
> +        assert(ret == 0 && "clone manager futex should always succeed");
> +    }

A note for any reviewers/maintainers: While doing some additional
testing today, I discovered there is a bug in this section of the
patch. The child process can exit between the `atomic_fetch` and start
of the `futex(FUTEX_WAIT)` call, causing the kernel to respond with an
`EAGAIN` error, which will be caught by the assert and crash the
program. I have a patch for this. I suspect there will be comments on
this change, so I'm holding off on re-sending the series until initial
reviews have been done. I just wanted to make maintainers aware to
avoid the possibility of this bug being merged in the (very) unlikely
case there are no comments.

