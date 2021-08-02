Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B83DD5E2
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:41:04 +0200 (CEST)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXFf-0001ar-Bv
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXDr-0000AF-GN
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:39:13 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXDo-0000RH-SC
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:39:10 -0400
Received: by mail-ed1-x52a.google.com with SMTP id y12so24275218edo.6
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S7PGVm5ULdiFkUNjZOUr8Wd5m/4t5uGpnfEHliXOKuM=;
 b=Ys1R56CSUkQH6eQNUN10S++JU0fRj67PrWzfZ9Q8TgAn7uJyxldd+KgYnboOuPdnIa
 BBe/0VMG0yfHIq0U9Dzdfp4eWez3M5zuwZ/aBS9CVF/aLfQDNvwuIINZrdvFFgIP7YKz
 EVsFqRBeJZlFXSn/pFC7jmXOzLuawa6tkTwxvFcv4E5pOsqcwyDMy7pbbTtMxcRDySxY
 pwvX26+2NWxqDn9xP6D5LPMMBM680oCV8s4QMZz7+eWJDuaDC0WiIXvaWp2mKyc15hY7
 o+8wbcIJTUionEWXsG5iHLar8FanAQ+0HlONoXt7b69XCOcgj9lZ65HZ7u4z3iBopUjI
 +REw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7PGVm5ULdiFkUNjZOUr8Wd5m/4t5uGpnfEHliXOKuM=;
 b=OWX8HrOYOtNNwYxAfN+xC61gCfLXvJMi4rHXwcOK5Rqg3IgBOSAPOsfSOBtgJhpW0t
 vI8tnExp4myrzNsbbRbiFwKtPjwL2TPVvreIK6OhOBPTBp2MwvWRC/xEoRK3Qz8Ipn3h
 xid+WJVJryw2GG7paOaGsAD0OlhqdlWRanmzTzH4Z4NbEYugEelIhZSRwq9z2z/xpeV/
 2Dl+lFs2ZKVlwX5E6I29t0lRe6M7rpOlKAbxBFwn74MuwKvz57R4lcNOc8dJrc8m8rDI
 FD0b2HctRIiKaA9fHDtocubzkIiSwA4ydXIlyBF+O3oJa2VW0pafArZu2h9omq1q9TaB
 /5HA==
X-Gm-Message-State: AOAM533ekRUVh5PmWhM541NdL/t6DfYfgP5trM4fxOInuFp6SvYhNCyh
 M8+ArXGH0RHjTR9pUdEMY1rwWQnTsLChRIT8D08zgQ==
X-Google-Smtp-Source: ABdhPJz2pL2V6zBupCaNhkUT0F1o911PsS5yTknqy+GejRfaVUUts1XtTla3rd+3L2bzbtyr++Gp/Gf2L4ACckOH9lo=
X-Received: by 2002:aa7:c647:: with SMTP id z7mr18778822edr.52.1627907947536; 
 Mon, 02 Aug 2021 05:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210731062741.301102-1-pbonzini@redhat.com>
 <20210731062741.301102-7-pbonzini@redhat.com>
In-Reply-To: <20210731062741.301102-7-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:38:24 +0100
Message-ID: <CAFEAcA-M55ZUOWa599jV8QC+_HsfNuGxfnYAiPrAFr4trEaPPQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] coverity-model: write models fully for non-array
 allocation functions
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 31 Jul 2021 at 07:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Coverity seems to have issues figuring out the properties of g_malloc0
> and other non *_n functions.  While this was "fixed" by removing the
> custom second argument to __coverity_mark_as_afm_allocated__, inline
> the code from the array-based allocation functions to avoid future
> issues.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

