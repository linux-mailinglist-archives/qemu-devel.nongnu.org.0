Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D451F6E8DF1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:22:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQTt-0008Bv-D9; Thu, 20 Apr 2023 05:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTm-000849-Rm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:27 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTl-000736-5i
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:26 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-187c78c6657so413312fac.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982482; x=1684574482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5N45ubsjNCygEC6P5v69RHMKiqNUCJpmzXZaGG+uWs=;
 b=o42Rsgge/kE+TpFzDmOQPPtONGnGBHt3Q6XZKrUDoKq74xt3cZ+NF1mo/r1R2VH8pl
 B73UkrwENCbbbuBmx7PtUjrrAVRqaDkB9K8ueJlbH/KMZ2N1599/cEaV+0qmqeDqlz+z
 Hj7OdW0Z5kGBpwh7uggJ1dgykPawouMzGJn04/fT7onYuOpVo0dRYPOhyH6VrsLgwMOg
 q3nEqP+CERC+ZMVpwdbiL2rPdKNBKq77DFwNavHu/W56CeIZI/40qB5ott0QLQWWrXpb
 gghdE+9H5ZPzQAzjZYHVHCVB9oK85kA4Kjbt2MgbefNCqbSjUBS3BH3BY1RO7XWJgdHF
 hnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982482; x=1684574482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5N45ubsjNCygEC6P5v69RHMKiqNUCJpmzXZaGG+uWs=;
 b=L/4JBlWUgyeemfOc8Ld19wm5quhISG6umpJZMHBxT7SO/Z0IOatl5ZT5o0Fd32OZdl
 Wn2dGNuCh5z8HaGRTziXTwDDHeAIbGkOPj1AcpE/RG0f+MnHxKpinNhTJ5UQJykshgVh
 DG18AFXTlro1+IIybAI/2S+gr0O7AnIcx7sTEn/sJdXtLS1HGS0TmlGWorwNXoerzxJ0
 SBrPzgmmv+jOEVIHOnfjJrnWjHKgPGXXhkcobXp7LeikVOR8R4PrG3MnU/KCvDIoaVe/
 gS9e4VvNFcww5q1jT09KfpxmTfwB5KS3w4T0aoc7cpkDTntcbcd+iXbqDWoq5oVsjmLH
 KpHQ==
X-Gm-Message-State: AAQBX9fXXnBfXTJqiEZZllhGrZt2eTCIoA8xRVdTQxMBQ5/v7lZxB8t5
 /1bNJiy1awf4qNGySyKqy68VGroIjsFodwv521w=
X-Google-Smtp-Source: AKy350ZBFKYehZOTKapbJidxx4e6aEYFvkw/GEE0QsT6PglWYVW3znzCybsQFzcYfmeOJ5WE3h0DSw==
X-Received: by 2002:a05:6870:5247:b0:187:d00f:ba91 with SMTP id
 o7-20020a056870524700b00187d00fba91mr579937oai.25.1681982482139; 
 Thu, 20 Apr 2023 02:21:22 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v7 05/12] target/riscv: Mask the implicitly enabled
 extensions in isa_string based on priv version
Date: Thu, 20 Apr 2023 06:20:53 -0300
Message-Id: <20230420092100.177464-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Using implicitly enabled extensions such as Zca/Zcf/Zcd instead of their
super extensions can simplify the extension related check. However, they
may have higher priv version than their super extensions. So we should mask
them in the isa_string based on priv version to make them invisible to user
if the specified priv version is lower than their minimal priv version.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dd35cf378f..9bb0e6b180 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1721,7 +1721,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
+            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.40.0


