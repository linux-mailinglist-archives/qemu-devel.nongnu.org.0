Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278222DAD43
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:32:08 +0100 (CET)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp9Ut-0008JJ-2x
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kp9ST-0006yt-Fd; Tue, 15 Dec 2020 07:29:37 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kp9SR-0006Q8-Lo; Tue, 15 Dec 2020 07:29:37 -0500
Received: by mail-io1-xd44.google.com with SMTP id o6so7173444iob.10;
 Tue, 15 Dec 2020 04:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=trBFpF8rnEjG+ce4NnSNr8qISYVwqCt4OaHC1AuDVyg=;
 b=gfBRYuB9N554VMInmjouAo8GOJUylsRwyO1kO2Cl3TKYFaTlIbibNaGRoMaA7A/iYD
 xSdplIa20AaAaQZtx0HNDTeGgMUTc6tXXOHYnwOvFEKbgtWuPMRN6c6qhKMwrtu2SAPa
 8CQa8yGOUG04TvDx0u3R+G/VIP/ejTM20XBxeGMadpULmQfNbsKvd+8mcROk87Vg3Vgd
 47jsub2e8wy0DHR6NA85Z5opQ2QgXwykjzqPos0SqBl5X7Qw8NyccQ1BloloZ+VJ7MEa
 ctSraqj+N0dNva+rWnuyWn1Rwlg7Yhah7rYpDv7DsuEI73ZTOeMP5htN8LpWuIrmcEEd
 nBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=trBFpF8rnEjG+ce4NnSNr8qISYVwqCt4OaHC1AuDVyg=;
 b=a+EuQSjS0zVlwFvJIccex0jpuF1Jut2emosB+TrJldZlZKDNKGk8xczog3FT5q18fh
 bxgPfF6fk+w8NMNnRF+4p3wnbIgx38hYCqY5OxlAORd154s1S7oM4M6K7hxvh3YSY1px
 uukToCUKM7ydmGo6o0vWOcRsGD/1qoCZl9nWxDP61tSsPzLbfHD/U8zQxBzVb3Vx2w6B
 XOQv6+coDWV7IfeN8r4cRQ/uLCOGzZnlWNvmzdrZD6i08O30oVJoj5/cPdQWYkjkp2xB
 tdk4gMQjTtEYAZWFlOhZttVI+2Oekx55rwuWS9ik/KvR5YNGD1v3jk9WPuSlpgaH0OUS
 Bjkg==
X-Gm-Message-State: AOAM532qRwtB/oleZbCA4Er41O9no5G5s2C4HoEvFCwhDF5O/6SUgKcP
 lurJ6mxokhRxLNpzV1ecoT/E35UYaHrHho3j+ww=
X-Google-Smtp-Source: ABdhPJxYvex4Ra0ASJbVPSG+D+4/xJUCnoRrDnYeRnFEXR07QKmICOzlouoauomZXXeJGMkMsEJxympAvD2A1S8yiiI=
X-Received: by 2002:a5e:9512:: with SMTP id r18mr38530963ioj.86.1608035374260; 
 Tue, 15 Dec 2020 04:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-3-leif@nuviainc.com>
In-Reply-To: <20201215114828.18076-3-leif@nuviainc.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 15 Dec 2020 13:29:23 +0100
Message-ID: <CABoDooOJ9aGnzrHr7EY-57QNukm2_qckvVM7NGRWwtyvucj_aw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] target/arm: make ARMCPU.clidr 64-bit
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-io1-xd44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 12:52 PM Leif Lindholm <leif@nuviainc.com> wrote:
>
> The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
> 32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
> Extend the clidr field to be able to hold this context.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5e3cf77ec7..fadd1a47df 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -938,7 +938,7 @@ struct ARMCPU {
>      uint32_t id_afr0;
>      uint64_t id_aa64afr0;
>      uint64_t id_aa64afr1;
> -    uint32_t clidr;
> +    uint64_t clidr;
>      uint64_t mp_affinity; /* MP ID without feature bits */
>      /* The elements of this array are the CCSIDR values for each cache,
>       * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
> --
> 2.20.1
>
>

