Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC4360C22C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 05:18:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onAN7-0004UJ-St; Mon, 24 Oct 2022 23:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onAN5-0004Tp-BW
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 23:12:55 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onAN3-00053I-R7
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 23:12:55 -0400
Received: by mail-pg1-x532.google.com with SMTP id b5so10354287pgb.6
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 20:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OwOLh5ZeT9l1nr/HHUcvLzRJpD/PCdhMsmXZX8AYtS0=;
 b=VIfd52F5Ouy+qNlGf+MQjC5kr0CJyTBniMM6LMVoRbrwmnRsUMrPWV1loI1a7j9Y95
 IW/3UrOrkp9tPog32J0diiUUZQ8rWts6ErXJn9CxHFc0ROgop3yLdDNKKluMSCC34run
 IiVhveWFusS099XyJDLv10pdZIwYD/SG0ZWU8qLwt/3FWCTpF1N3U9s2lDCnrabC0NIB
 JYWNENiG84ORgwEYcUpOnOYK3F6cHYUVPY+aiC08YujOT7fHcCQ7jx+bzCVHTLjlwtoq
 cF26NfZkwmiT9HCCDEfbCGXPaYEi8UgTSMbivpVSE5CizMp/NmXe70JJRlhpH2Zpz5Sc
 4KSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OwOLh5ZeT9l1nr/HHUcvLzRJpD/PCdhMsmXZX8AYtS0=;
 b=mIk1M4k1HPmuepxVmsYThqfcJt1qghrSZ8/aackVhe5/L12bwDALSqeS5AZwGePsFG
 I2QKm4T0MZtkqIM90rcCruAGWakEvrVsmejlN8ldwNjwXb9iqLq+yDSysz6fk/AZzNi3
 Z7D+HZpa6eZ0KeFVaE5LTL/ozMeOt0ZLxbdKjuBpShGKEL70/MZjJNu6lY6GSyAWmn8W
 FjHZT1EV9JB5dzIzCurpBZxTov5EFbw+Zfu8e2BtTsdLgaZyAtx1jE3WNmmlen0HmpgS
 9dErFgvZ9kVaA4gemaC8/bWANrHoISyVOTEvQT2AcF+MnKw3akVUkiX1HgBk4Ne/4bPz
 pyFg==
X-Gm-Message-State: ACrzQf1X8Fv6qCrIKWc7K66HTmy47hJC3sK+MZPo1LwXwBEcdUm/Fmd1
 y4iC7p3xh8JHDpm86WkN/LdgJsNrP0fgQpKk0Y8=
X-Google-Smtp-Source: AMsMyM6tIEQJ69rRRaxbi8/1x4dDptAhZ9YLPq6luZ0x7zNZZNoNyVjCjhZ1hyothC5nqURv74kCNszWHwNe3qXnzfw=
X-Received: by 2002:a63:1a65:0:b0:460:d5db:8688 with SMTP id
 a37-20020a631a65000000b00460d5db8688mr30784029pgm.221.1666667572077; Mon, 24
 Oct 2022 20:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221020233836.2341671-1-richard.henderson@linaro.org>
In-Reply-To: <20221020233836.2341671-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 13:12:15 +1000
Message-ID: <CAKmqyKN=s50o1jM+jUvG70M4U4h_shuMtwVGmJLfKJ1GUkOuPg@mail.gmail.com>
Subject: Re: [PATCH] tcg/riscv: Fix reg overlap case in tcg_out_addsub2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x532.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 9:47 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There was a typo using opc_addi instead of opc_add with the
> two registers.  While we're at it, simplify the gating test
> to al == bl to improve dynamic scheduling even when the
> output register does not overlap the inputs.
>
> Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Supersedes: 20221020104154.4276-4-zhiwei_liu@linux.alibaba.com
> ("[RFC PATCH 3/3] tcg/riscv: Remove a wrong optimization for addsub2")
> ---
>  tcg/riscv/tcg-target.c.inc | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 81a83e45b1..1cdaf7b57b 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -687,9 +687,15 @@ static void tcg_out_addsub2(TCGContext *s,
>          if (cbl) {
>              tcg_out_opc_imm(s, opc_addi, rl, al, bl);
>              tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, rl, bl);
> -        } else if (rl == al && rl == bl) {
> +        } else if (al == bl) {
> +            /*
> +             * If the input regs overlap, this is a simple doubling
> +             * and carry-out is the input msb.  This special case is
> +             * required when the output reg overlaps the input,
> +             * but we might as well use it always.
> +             */
>              tcg_out_opc_imm(s, OPC_SLTI, TCG_REG_TMP0, al, 0);
> -            tcg_out_opc_reg(s, opc_addi, rl, al, bl);
> +            tcg_out_opc_reg(s, opc_add, rl, al, al);
>          } else {
>              tcg_out_opc_reg(s, opc_add, rl, al, bl);
>              tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
> --
> 2.34.1
>
>

