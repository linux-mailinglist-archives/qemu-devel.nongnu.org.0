Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C148DF21
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:43:01 +0100 (CET)
Received: from localhost ([::1]:34994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86w0-0000SF-VY
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:43:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86uu-0007Nd-Q4
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:41:52 -0500
Received: from [2a00:1450:4864:20::42f] (port=34520
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86ut-0007Kd-DF
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:41:52 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h10so12319513wrb.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8+OeM8/Q9tSqMXjzP3qbpv6cp6u2bkSUdqhUYtkZV5U=;
 b=e4shpwUYJB+Ue3CaOQdW/nGd+rssLZVWonl6Dxt7E9x0rqjYZpjhLuosv/zZhSKEVE
 KflyuX3ASNypAn6DH/Aql8CfJ53OwtiG+z4v4bwp2449wTcm7yXEOnYeVhhiHtmtrCsm
 t/EVZMSz4IK5PBOAsrOiWIl58hQFOc86fT8h+wRlKAWqgW2W8sCYVvkbaKIOQDsw0XGw
 8U3N5/FxqRAsXZz/rI8zJ0ll6ISeB8lwO8QC/Vgbjj3m9iVVkPDHYwK7GwM8LctWht0O
 DFNaLNPzz1fUcsAH0trzfa39mdkox4JN/HvRTvzkHvRkBH4Y6vJx/sEltrloqncHv/Cl
 n6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+OeM8/Q9tSqMXjzP3qbpv6cp6u2bkSUdqhUYtkZV5U=;
 b=u0H7L88kmyWoAQbVkmqjnd9D2E8Rdd+VVAd9VF/eFOloeqUquUhB2hTB70Ur+voJOW
 sGU0KOr1dMRyMy1FaKIAoviynLU2d6/Nx457OzD8e4GEv2lAGsLFdIRNjqHsztJepEaD
 ijb2q7S5yxyfue4AHRrCjFfDeX/QI1nkXsILefo57aSZwgwTKA7RUQkPCVOX6lbac2B0
 5HR6nsaMP+A71l78mwDblcyQzewNyHeweLsq8dWphFutIGrF7V3txWLLcYKxJdzcM4HY
 5qXVAfQhWS+up+nj2LdYqz7xkc906Kn3aWa4PjtmjBj8O/EK7bFUvkO/BHdWjfqz0sYs
 5NMw==
X-Gm-Message-State: AOAM532HxO9fezl+lO5/W+/WCtGlz3uYY5CLUEu7b8jxD3FkZuqBOVTn
 e/5jSaJIKDgUSKTyW0SyxVGVDsuIOC38s02YP0urAw==
X-Google-Smtp-Source: ABdhPJzgA518110fVmaDqi7JNyhWJv++kje9SnnhCD0rQmPdu1iJKG/kWIMPfpooSfycY2REhu8ICMdlND1HqK6O7GM=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr5762582wrw.2.1642106509950;
 Thu, 13 Jan 2022 12:41:49 -0800 (PST)
MIME-Version: 1.0
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-3-dgilbert@redhat.com>
In-Reply-To: <20220113194452.254011-3-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 20:41:39 +0000
Message-ID: <CAFEAcA_ueCNVPukWPUksXAYBSg25hgO7UaqJ4v8vqc=Q57Zr7w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] migration: Add canary to VMSTATE_END_OF_LIST
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lsoaresp@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 at 19:45, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> We fairly regularly forget VMSTATE_END_OF_LIST markers off descriptions;
> given that the current check is only for ->name being NULL, sometimes
> we get unlucky and the code apparently works and no one spots the error.
>
> Explicitly add a flag, VMS_END that should be set, and assert it is
> set during the traversal.
>
> Note: This can't go in until we update the copy of vmstate.h in slirp.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

