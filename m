Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EDC401600
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 07:49:51 +0200 (CEST)
Received: from localhost ([::1]:33888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN7Vu-0002QA-6f
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 01:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN7SC-0004yE-Ai
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 01:46:01 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:35565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN7SA-0003rr-V7
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 01:46:00 -0400
Received: by mail-io1-xd31.google.com with SMTP id a15so7263524iot.2
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 22:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FDw/3xKgLhlglzJAlKnIJVRqtbFezcoSDVxXHzjZtRM=;
 b=Z24Ak9y548I8br/wmRkIBI9NvS1kJggLt9YNwliqoEkHUgBIFb1dsM8T5UzG9UxJIH
 fUcq/MLKkmAsDPQESuJqNAYU1VGEANfN5H5hVNaa09khPSfW56j+j6cmEmH7pHxbWdq0
 G7X8aT55AmOU+VPgYkWaACziQuHjcSNEmRgrHtxVs2GVE2so3Z5hHQYGe9rOYF+qYOal
 qDkCVM8/QOZdFdixWRq1p1o6FNcsGS91Sk4x/opxIah5MNc6vM/tf+foul2LYhEFd0Ld
 aO5I95QZonAtHvoOIzCmsznglaiIuiZpDlyckFEydK1SAbbyxzi31LE97advpp3dRUjr
 SBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FDw/3xKgLhlglzJAlKnIJVRqtbFezcoSDVxXHzjZtRM=;
 b=rP+iG+TZIlo3vFeAFMfR3bhe+nzi1TuZOLzg1KIVnhiaPa7rtK7ce2U2zSVLPo28HX
 HNs5HPOUwdvAQZIcMEuIifUY0vKjCxRdY/HKtaobt0pe+JR+zm8eZesrqWKMLcvCu0S4
 WG4yGm0CfpZAyDHS9MbnzEQDjUwiGZRbkgCM5nh0dz8NQx5wsZ/C7hCIOEbVbTQytrI+
 VSvVen8FdXfHBGZ6k2088ktGWCRHUrgtYVz/MRdUMh5yIDQXeGrfl26wvrUqrVJ3EJwt
 qCh7MYv6bAiKR0dux7ASskDfFMPBoJ643Lx/TAbYxAF2VD87Sg9QsbKJovZnTiDN5a0p
 s3gw==
X-Gm-Message-State: AOAM533n1hFO6b/RW/TAQnW/yNg0KjG7kkDcHqaRdGAQ1lgexHKM66CU
 pOSH0eI4CrNwlwGrHONtz9Nwbz0qAHw0kG+AObU=
X-Google-Smtp-Source: ABdhPJzxsNlbq5xK2TZzz7cd7EwKxVwRSY0FVYZk3BQqQ3HcfaaYXexg/y0+ZSmsPklIZUglgmS1vfEWq5GvnC7cbvA=
X-Received: by 2002:a5e:8711:: with SMTP id y17mr8406353ioj.16.1630907157790; 
 Sun, 05 Sep 2021 22:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-3-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-3-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Sep 2021 15:45:32 +1000
Message-ID: <CAKmqyKPSNQJdR2sQM43fuwFetzUh=k6nSFAKXxeZUxzzPNkAKw@mail.gmail.com>
Subject: Re: [PATCH v10 02/16] target/riscv: fix clzw implementation to
 operate on arg1
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 6:36 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> The refactored gen_clzw() uses ret as its argument, instead of arg1.
> Fix it.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v10:
> - New patch, fixing regressions discovered with x264_r.
>
>  target/riscv/insn_trans/trans_rvb.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index c0a6e25826..6c85c89f6d 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -349,7 +349,7 @@ GEN_TRANS_SHADD(3)
>
>  static void gen_clzw(TCGv ret, TCGv arg1)
>  {
> -    tcg_gen_clzi_tl(ret, ret, 64);
> +    tcg_gen_clzi_tl(ret, arg1, 64);
>      tcg_gen_subi_tl(ret, ret, 32);
>  }
>
> --
> 2.25.1
>
>

