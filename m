Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550326F7A82
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:16:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujry-0008Vn-TT; Thu, 04 May 2023 21:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrq-0008Or-Hp
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:15 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujro-0006zL-UD
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:14 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1aaf21bb42bso8117185ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248651; x=1685840651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qm7H0VopL6pYa5B3koINncB8EyaAHKhgvY10lBiE+6I=;
 b=W4cNZD1671eztUuONkYxurdPHfNbkYPzUOxYeuCr98ogfRdDHMLe/Znijnni97L3Sg
 uvHpUuJ7d5IHTZBO5MRpi+TYddR29SUonrPP3Us8ZmdRwsE8i53E5kLBnibqUGXhroYo
 FCQrmoqEX3Gu6pOoJS5ISNuF0xg0DTdX/+MFoDtYTv9YWwPbBedVWBl4fRUbjZXO+ecT
 QalPsNbAcu5Jan74Cs4dWOGtwivH6BIcwCOcYPxm9DkSd4cUEVMGCDq1JuW7T1iKfqmL
 vGPFYGjJvKV6fOmLsOSzUj7GHzgFaAf7nHsyg77JWPoZKaFBrdknMyPZ1PNL8JFq7/IV
 CkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248651; x=1685840651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qm7H0VopL6pYa5B3koINncB8EyaAHKhgvY10lBiE+6I=;
 b=J95bvxkCa8LyoYX2fnauhdCcUfMb+BsMZdmMvRFhS7Qle48II2/38Qpeld9TMH5Uz7
 8ipKZ5VmMgJEo4IXQR4lmciy7hXIiLttTFQX5lS2+CuaTCnb1SCVtkFW7C+JwpSxvYwW
 ihOTN/3zWnQqQWLKw40pYQd89pdHKGALSJ1IHRssXxLvveLfu1+gNnSr+J/L0TbSappN
 V7DnanXsVxNYBNLg3vFeuQqZujtN0TliweRRdYmBMaQHVXZ2yC9JtAebeIEpyAyjYRpJ
 YU1OJnxiTc6bYhdChDqB400/ddOb8TkRqDKsDohNOp6DHifBtF6lP90NRgcjF7wO5Gg3
 g4vQ==
X-Gm-Message-State: AC+VfDxpS/nAvmZ5+fQNBJrKjIWIqAaaI/g9yh49dh0/UV6gHvCwGLxB
 MIb71f0UDoPzU5AEyrbhgye0dd0z5B5Nmg==
X-Google-Smtp-Source: ACHHUZ7YUj/YQ5tufZw9dGFejl/0iNdakQUoSuq1yl2pWFx8Yk8lUUQqeO+BjAPNPArGIcZzZuFtug==
X-Received: by 2002:a17:902:a716:b0:1a9:80a0:47fc with SMTP id
 w22-20020a170902a71600b001a980a047fcmr4859135plq.17.1683248651391; 
 Thu, 04 May 2023 18:04:11 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:10 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/89] target/riscv: expose properties for Zc* extension
Date: Fri,  5 May 2023 11:01:28 +1000
Message-Id: <20230505010241.21812-17-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Expose zca,zcb,zcf,zcd,zcmp,zcmt properties.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307081403.61950-9-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 97b0a77d8e..ed8dc61d10 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -87,6 +87,12 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_11_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
     ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
+    ISA_EXT_DATA_ENTRY(zca, true, PRIV_VERSION_1_12_0, ext_zca),
+    ISA_EXT_DATA_ENTRY(zcb, true, PRIV_VERSION_1_12_0, ext_zcb),
+    ISA_EXT_DATA_ENTRY(zcf, true, PRIV_VERSION_1_12_0, ext_zcf),
+    ISA_EXT_DATA_ENTRY(zcd, true, PRIV_VERSION_1_12_0, ext_zcd),
+    ISA_EXT_DATA_ENTRY(zcmp, true, PRIV_VERSION_1_12_0, ext_zcmp),
+    ISA_EXT_DATA_ENTRY(zcmt, true, PRIV_VERSION_1_12_0, ext_zcmt),
     ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
     ISA_EXT_DATA_ENTRY(zbb, true, PRIV_VERSION_1_12_0, ext_zbb),
     ISA_EXT_DATA_ENTRY(zbc, true, PRIV_VERSION_1_12_0, ext_zbc),
@@ -1491,6 +1497,14 @@ static Property riscv_cpu_extensions[] = {
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
+
+    DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
+    DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
+    DEFINE_PROP_BOOL("x-zcd", RISCVCPU, cfg.ext_zcd, false),
+    DEFINE_PROP_BOOL("x-zcf", RISCVCPU, cfg.ext_zcf, false),
+    DEFINE_PROP_BOOL("x-zcmp", RISCVCPU, cfg.ext_zcmp, false),
+    DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
+
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
-- 
2.40.0


