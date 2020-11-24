Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5852C2EDC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:39:34 +0100 (CET)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khcHt-0006vi-H9
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khcGe-0006Ut-8H
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:38:16 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:36997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khcGc-00059D-DT
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:38:15 -0500
Received: by mail-ej1-x644.google.com with SMTP id z5so9597448ejp.4
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 09:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yEQkbWemj9yP5PL3egT3W7uTLdVarobN5Dwe56nrnmE=;
 b=Ih4Uk5CtWtzuKzyhe6dW2+CxxSExT0SXFgLnOpFM5QE6e/WPXPaYF2zU4yVBzrsBw3
 yuBKNE9op6TJP+gjMIEw0G8BMdub8xjKOvEVao+Xyh8IWsuOZzERqhu2SHzMyRM2V904
 PpCmkOmGGYS3twMcLiLYhkLOS7IrAXR4CKxuIHAugB95wyMe5JfYT/Lqf68J4G4OBPig
 Yw4JV7BFlxtQGxiDkB2vw274Wd/j0d/Ikf5Vfa3eJi1JKXjuu4MYlUL5GiB0dKPH83LE
 YpQ3kjH51G+VG6wUOCWfHZLrmM6PIxt+rC6EiBK/Q33Su9C8rOccSUCcSzaaZJ9mI4J6
 HmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yEQkbWemj9yP5PL3egT3W7uTLdVarobN5Dwe56nrnmE=;
 b=imL+UGTnN46wWjbSfh2y0Rnm0lJsVYpS/tYWi+LqNdV5w2G6/8adMSfA5u2YCnsPmt
 eNpbijAWzhZRDMoAHIeZdMFLItgZivgx37AuCHdzfhNMO1eM4SDkT5oJ7mumN6CM1ppk
 nY64Xq6ZVqzaYM91/m6dIiqOMF1xghg6J8f26XVZowPlmepx/0w2XG2RpwKF6PA6tvOY
 /CnoC6p/Jg/cbkqYiT5vsxWdUxTcBiMTEUEYU9LMR76SSDv5FmbEL7sWjQIVDBZvQLI3
 N5kpbIFq1E2zWkElEqkcxTpYuEyKg6VTBzHPK6v2zRcaFdZR88AF4kfnNJdL6o1zN7cl
 cPSA==
X-Gm-Message-State: AOAM530t31Z4eiyPGdHZqdNPhjRPyLB4EVxBKfrsa1oO9dgZdLqUyozo
 iLgz7YaPjVQ4kSzQJ8xm3vplNC/oQhB/c3E5cor5pA==
X-Google-Smtp-Source: ABdhPJz+tH3f8+LOKcrBnmE7YjQTgaxRMxsPOpruDX+x+prFRGzqxsa0Uagob9GgU1stz+irYe7xinq9lJzop88u0ZE=
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr5011912ejb.85.1606239492510; 
 Tue, 24 Nov 2020 09:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20201118165206.2826-1-steplong@quicinc.com>
In-Reply-To: <20201118165206.2826-1-steplong@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 17:38:01 +0000
Message-ID: <CAFEAcA9+XJga5u95QGGbUqTaJJKJA+gvRMw_c+VPnF5f7OuDpw@mail.gmail.com>
Subject: Re: [PATCH] linux-user/elfload: Fix handling of pure BSS segments
To: Stephen Long <steplong@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Nov 2020 at 16:55, Stephen Long <steplong@quicinc.com> wrote:
>
> qemu-user fails to load ELFs with only BSS and no data section
>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---
>
> Submitting this on behalf of Ben Hutchings. Feel free to edit the commit
> msg.
>
>  linux-user/elfload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 0b02a92602..af16d94c61 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2783,7 +2783,7 @@ static void load_elf_image(const char *image_name, int image_fd,
>               * segment, in that case just let zero_bss allocate an empty buffer
>               * for it.
>               */
> -            if (eppnt->p_filesz != 0) {
> +            if (vaddr_len != 0) {
>                  error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
>                                      MAP_PRIVATE | MAP_FIXED,
>                                      image_fd, eppnt->p_offset - vaddr_po);

So (having run into a different instance of this elsewhere), a
couple of questions:

(a) what does "fails to load" mean here? In the sample binary
I had, we got a SIGSEGV in zero_bss() when it tried to memset()
memory that hadn't been mmap()ed. Is that the only failure mode,
or can this manifest in other ways too?

(b) The comment immediately before this change says:
     * Some segments may be completely empty without any backing file
     * segment, in that case just let zero_bss allocate an empty buffer
     * for it.
which is justifying why it was looking at p_filesz and not vaddr_len.
With this change to the code, the comment becomes stale and needs
updating.

(c) After this change, are there still cases where zero_bss()
needs to do its mmap()/page_set_flags(), or does that become
unnecessary ?

thanks
-- PMM

