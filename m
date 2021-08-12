Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5C3EA538
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 15:12:26 +0200 (CEST)
Received: from localhost ([::1]:53678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEAVV-0005Xx-Sc
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 09:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEAUh-0004pC-2x
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:11:35 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEAUe-0000Wa-93
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:11:34 -0400
Received: by mail-ed1-x535.google.com with SMTP id d6so9596387edt.7
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qy+duMq/ewhcf5njD3EmbGdd8S8OutejfwQjLHHuUhg=;
 b=fnhf9sRzEUHiuAqvsFcAMAhDrsfArxg5TDWaMGaxlTuuTqDBHbpDLrbUvfd2HL+KjS
 zj1ZMMR5AQmE6u0xG2Lhx00ExETLD5dYNclXmVgvIGjgWb+XU/uJ3EMPHl+JsZ/YEp5e
 tDLAdNncFlAjLWXhHu7PBuB3JkPZHOGVb863bWj/j83MYZp4/iqrp8o5BBORIIHIT8T/
 qsCYHAzGcIY9p3i5hmNXB4TzRF/5QgSJiDhopC1f9nUhWNac570s3+IvchYViAThn4aO
 aaateNjwwBYVHbJzl8RWwxjxXTLOUN4rBpNB5jlRz7Pxki/kv1v1DBkT4hbP/lPWOmeS
 UZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qy+duMq/ewhcf5njD3EmbGdd8S8OutejfwQjLHHuUhg=;
 b=mcwJg4O/zmJKqOmXkConnjCGzQkJdk0UkQOT7QXDmoTlCIvPd2XgZ3JVzypnFsPRXX
 LARBWoM3o64DTP457zePW2Nx5UORc89R/TMNrWaEdaKXck+/p74otG38P6cGFnOiBWYX
 EQqy+1XloejEo9YKHZzOH87xBaqPj8Keoe/E49oesmrLD9b90g7uLN7taXCi4Xnx0dLJ
 Omn1+B9g37+g8aX9eggP6s3otRMLizGFj1Y1do3kBFLW4DpOXda9e2XrclSNxgm44Bov
 QCmN5b69AaUZOXSrRAh367eTnsL+9RQ3YBELIZ+t7Azy7Oce/HCf+2zOMePuXYxfwa+h
 E34w==
X-Gm-Message-State: AOAM531ghVVkXrGUGmuhsVl2Dam0pB73s4M23XTmZ7hG4TaoVUFyqaM5
 XuwHYqZNTf9poHeQRNNT8ESmPSis3HnYpFmeq2lXlw==
X-Google-Smtp-Source: ABdhPJwJKuUa4N6nOVfpgWYLBPne5eZdk5RkyZppgChhL1YHB/mH02A5CKRW3W29rqLYXFcNrVglRpn5rYiKueWg74g=
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr717936edb.36.1628773890666; 
 Thu, 12 Aug 2021 06:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <1628773760-870-1-git-send-email-tsimpson@quicinc.com>
In-Reply-To: <1628773760-870-1-git-send-email-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 14:10:45 +0100
Message-ID: <CAFEAcA-geonAK3NeNosh39HBnpkr_XFveaLFR2GZBj=AU8tAxQ@mail.gmail.com>
Subject: Re: [PATCH] Hexagon (disas/hexagon.c) fix memory leak for early exit
 cases
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 14:09, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> Don't allocate the string until error conditions have been checked
>
> Fixes: a00cfed0e ("Hexagon (disas) disassembler")
> Eliminate Coverity CID 1460121 (Resource leak)
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  disas/hexagon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/disas/hexagon.c b/disas/hexagon.c
> index 3c24e2a..c1a4ffc 100644
> --- a/disas/hexagon.c
> +++ b/disas/hexagon.c
> @@ -33,7 +33,7 @@ int print_insn_hexagon(bfd_vma memaddr, struct disassemble_info *info)
>  {
>      uint32_t words[PACKET_WORDS_MAX];
>      bool found_end = false;
> -    GString *buf = g_string_sized_new(PACKET_BUFFER_LEN);
> +    GString *buf;
>      int i, len;
>
>      for (i = 0; i < PACKET_WORDS_MAX && !found_end; i++) {
> @@ -57,6 +57,7 @@ int print_insn_hexagon(bfd_vma memaddr, struct disassemble_info *info)
>          return PACKET_WORDS_MAX * sizeof(uint32_t);
>      }
>
> +    buf = g_string_sized_new(PACKET_BUFFER_LEN);
>      len = disassemble_hexagon(words, i, memaddr, buf);
>      (*info->fprintf_func)(info->stream, "%s", buf->str);
>      g_string_free(buf, true);
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

