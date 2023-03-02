Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7E36A78B5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 02:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXXRz-0003aE-Mf; Wed, 01 Mar 2023 20:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXRx-0003Wj-U1
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:09:37 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXRv-0007gE-4j
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:09:37 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so1171582pjg.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 17:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677719373;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=y9R/oA8vmfl9hBW325XUhmooGKOvMuCINXa6CSyGPts=;
 b=GZqQVFEGbbeKOjhGF2L9VHINPE9oe/8IwuMsnxAuVnGLpFMkEhU6Yu4T+kXaMhsXrM
 wuNU2bg+ZVB1C4WCxJ+b/LPC8e8LtTf58JXn7FBLauXG5hHOwhmJt1U91sfDqmlVg9uh
 q8zbwrhwQih784z6hzhI0zjC7LSBN74ui75SgVA4Znk/S5hv0GFUVYmdsxuelBy3ePVc
 WDj887dPNrEnOqRi5FPQLeKaMAUpwW3cx2t5BYHhvxA6ftpd3nes2YZIMPKpg23YZS9g
 ewsdLi+YFL4Fre3lAiJoW62ubsDrPrTnUq1SgE98ibXDQ6PN0cElyf+CEJj+YpyHaUt+
 zMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677719373;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9R/oA8vmfl9hBW325XUhmooGKOvMuCINXa6CSyGPts=;
 b=bSy+mJcn34HQVQNo+p1i4XUJZy5RGUmgESETRtrKil+8UOUTuJEsNwVYYrQYjBqKX5
 oi7u3DRqe0OrJdFTCAJA/8fCQs80/Tqq0D5eity59gTCguqCWWu3Uq7mq45C85iLRzUc
 geXmVNyFpADsyIC1hGkGMLwarc75w5SkFwV9Am819Nzjzflmvmrh20uojtDW58TVltG9
 JwLZFsG4kPHV9MGicacmSG28/WvZx+8+/ECjWGIQUC4uChrVEHu1MDSglQhq2/tk6wJc
 AyHYUAMuzvGEqcQKclcHuBXfTu+OdT8bIzgUrMJHJyl+8IDQzsv+roO/TtobQMet2HsV
 8DPw==
X-Gm-Message-State: AO0yUKXga2TQ/JVNB7ZSBwXtUcsIIzj0aUCKo8uYcCinf6abMgSSjct6
 o16i6ZjplLGTcODKiYYPtWyhiw==
X-Google-Smtp-Source: AK7set8A42bxH8GZf43CYkUL9BkcA+mzUPY0n0FTogNtyQxBRRFuDagAfDs2WMihvFqX1vyy4QGvTA==
X-Received: by 2002:a05:6a20:3ba8:b0:cc:8266:994e with SMTP id
 b40-20020a056a203ba800b000cc8266994emr7702664pzh.4.1677719373240; 
 Wed, 01 Mar 2023 17:09:33 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 e3-20020aa78243000000b005e5861932c9sm8465433pfn.129.2023.03.01.17.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 17:09:32 -0800 (PST)
Date: Wed, 01 Mar 2023 17:09:32 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 17:00:40 PST (-0800)
Subject: Re: [PATCH] RISC-V: XTheadMemPair: Remove register restrictions for
 store-pair
In-Reply-To: <20230220095612.1529031-1-christoph.muellner@vrull.eu>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 philipp.tomsich@vrull.eu, manolis.tsamis@vrull.eu, 
 Richard Henderson <richard.henderson@linaro.org>, cooper.qu@linux.alibaba.com,
 lifang_xia@linux.alibaba.com, 
 yunhai@linux.alibaba.com, zhiwei_liu@linux.alibaba.com,
 christoph.muellner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: christoph.muellner@vrull.eu
Message-ID: <mhng-a63a4188-b9ef-4df1-b914-28f027bb557f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102e.google.com
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

On Mon, 20 Feb 2023 01:56:12 PST (-0800), christoph.muellner@vrull.eu wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> The XTheadMemPair does not define any restrictions for store-pair
> instructions (th.sdd or th.swd). However, the current code enforces
> the restrictions that are required for load-pair instructions.
> Let's fix this by removing this code.
>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>  target/riscv/insn_trans/trans_xthead.c.inc | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
> index be87c34f56..cf1731b08d 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -980,10 +980,6 @@ static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
>  static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
>                               int shamt)
>  {
> -    if (a->rs == a->rd1 || a->rs == a->rd2 || a->rd1 == a->rd2) {
> -        return false;
> -    }
> -
>      TCGv data1 = get_gpr(ctx, a->rd1, EXT_NONE);
>      TCGv data2 = get_gpr(ctx, a->rd2, EXT_NONE);
>      TCGv addr1 = tcg_temp_new();

Thanks, this is queued in riscv-to-apply.next .

