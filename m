Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45556A78B6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 02:10:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXXRy-0003Wm-Py; Wed, 01 Mar 2023 20:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXXRv-0003WO-C0
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:09:36 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXXRt-0007cm-AE
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:09:34 -0500
Received: by mail-pf1-x42e.google.com with SMTP id n2so9123088pfo.12
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 17:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677719372;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=9IhyZBgpkiaYw+m3kMo0WIF3v6IqKgo35qYNZTGwxrs=;
 b=wZakR0lfSvYGIXF6cLmxf4KhTwgqL+8+8QjeOdnH70ztZ5j3kpQTcH3S150eFQQDdu
 shAPf1jX5BpNedR7P/YOw0U/qCpXUDixWMkAVyI9nmYHYL62OZnVU/BB2WYXFB3VhOGy
 A/0B4NQc8a89IT6JG/fV3qzWn/Z55HxaBb0LoFFWLfTzmbm9aM0XqS0LGsNle/3A+Qe9
 6AKAOzV+7MUIWIjav22aaF247ln26jc2HWUFv+aOC5+1qFge6gRvmdp/RI2x4q+PN4qY
 h838zrwD2GjaQvj5/YwPK6IPnoHxl6YOK9vuFG8iEq2Hoz+TcmCiKo5ELU9v0RAwxqiJ
 bDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677719372;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IhyZBgpkiaYw+m3kMo0WIF3v6IqKgo35qYNZTGwxrs=;
 b=C6jAx8BeLHAjPGLTgcTVSUdL5g7iMfgFhTVbSziZmUCiKwwO26vTqmzXh0NagjzsxB
 v4Xb7keWnlk/tgDAve5braVHxqwRY1D76AWwCvUhNFuZOfnmVPcoNvVuTN0ExtzYgPxa
 dYZHGHBTJ29BZEQR3UlcKSfJURdFaKunP5aIbbchQIDXFi8DXVISFJjhKSlV36C8un1t
 7jgEae6aVCidHW5f5MHJ1jEOAWNmdTkOqwGFw4dkySukEMosbr1FC3XsXw7cseL2RiFm
 HXUl7xQ9uA6WuoOiWUibK8/Gmpx9j6HWfjST3j2upQcZ5FEmQ0M8xaDIfQRdxhZSEKS7
 +7Eg==
X-Gm-Message-State: AO0yUKV39Td3VYzAy3Sp46oC3qfZm/dm8yHnw7hZENOD4Bu370w4pQcT
 pGrZHripMVjJmsP1AFPT5dV9qg==
X-Google-Smtp-Source: AK7set8sM58dORAXP/cwD4EHjc1vl+41989fQlqNT1a+mRLt1hUQBxHtNYhPZoALwuCsbcH30Mn5Ww==
X-Received: by 2002:aa7:96ae:0:b0:5a8:b911:a264 with SMTP id
 g14-20020aa796ae000000b005a8b911a264mr7303213pfk.28.1677719371848; 
 Wed, 01 Mar 2023 17:09:31 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 s25-20020a62e719000000b005941ff79428sm8720650pfh.90.2023.03.01.17.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 17:09:30 -0800 (PST)
Date: Wed, 01 Mar 2023 17:09:30 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 16:58:44 PST (-0800)
Subject: Re: [PATCH] target/riscv: Fix checking of whether instruciton at
 'pc_next' spans pages
In-Reply-To: <20230220072732.568-1-songshaobo@eswincomputing.com>
CC: zhengyu@eswincomputing.com, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, songshaobo@eswincomputing.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: songshaobo@eswincomputing.com
Message-ID: <mhng-a4dadcc5-4822-4582-beb0-0674a8468d20@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=palmer@rivosinc.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 19 Feb 2023 23:27:32 PST (-0800), songshaobo@eswincomputing.com wrote:
> This bug has a noticeable behavior of falling back to the main loop and
> respawning a redundant translation block including a single instruction
> when the end address of the compressive instruction is exactly on a page
> boundary, and slows down running system performance.
>
> Signed-off-by: Shaobo Song <songshaobo@eswincomputing.com>
> ---
>  target/riscv/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 772f9d7..8ffa211 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1261,7 +1261,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>                  uint16_t next_insn = cpu_lduw_code(env, ctx->base.pc_next);
>                  int len = insn_len(next_insn);
>
> -                if (!is_same_page(&ctx->base, ctx->base.pc_next + len)) {
> +                if (!is_same_page(&ctx->base, ctx->base.pc_next + len - 1)) {
>                      ctx->base.is_jmp = DISAS_TOO_MANY;
>                  }
>              }

Thanks, this is queued in riscv-to-apply.next .

