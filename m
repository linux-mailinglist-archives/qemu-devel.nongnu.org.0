Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C06F7A61
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:07:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujt1-0007YR-AX; Thu, 04 May 2023 21:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsy-0007Od-EM
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:24 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsv-0007Qz-32
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:24 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ab0c697c2bso10730945ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248719; x=1685840719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duqrjjIQV/MCrH+vSirPVU02qGF+Zve4B4fYCslucG8=;
 b=DIUY9Wq2lBrtUsqJ997YWxcMddyfePWs/gWg3XG69QOFixEsyCdC2SNbs5TbwhxTbX
 M7gSN5KCcM59vu3uXA4+sdSCsOO5cpRFZ3TEJ5n3njVnb3iZRbL4aQFZFluiDGCzmhhr
 FjK4qmfRhri6AbY6QH2r34PP89DpX7z/zoZTiH6yGTv++F/zRulJZGeD7uwB6rLqFsMw
 U8dTrHuEd0KG+joEoyAsrx6ThbaMnMYdAwpD8S6UOREGR+EQrHHfHDHp6KkD7GCdqpbQ
 1u7gZWl5KMz+Bc+n+BiNuWqASduKZJRTtEljyOHfiaQbLpHimEHLQ/wDG/5hx+Dhbhj+
 EipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248719; x=1685840719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duqrjjIQV/MCrH+vSirPVU02qGF+Zve4B4fYCslucG8=;
 b=MIuLJYRrQ0trzY3FPZETTTIMTev24iLQ2anuWVj5Xf9nc2DboEpNDcrFf291ZeElgC
 E07v5o0BQFc7iwBNw+itViK1JjC6xz8LUNaE6lXlAiNcWaIUuXvTIlB93xLh7VNebfOB
 x5nOiZqBcPWb0zeUYQZC3L9SRcV2SFsNPTKfTJDNnrXXoM5PWFGosUaWrkYV9C7a1Ace
 HVOGv+FX+SQRMOyDJuDw40Xqf8kjrXxSPBfLgaNvpUnx99XQVebj/eEbmN0hr+Q98g/e
 GO15J2ZKSMXXb/wroESHUiuwYcW2NcnOBn5K9dET/OqiPDgkWtfoxu41rcEYtDzAcYke
 ve9Q==
X-Gm-Message-State: AC+VfDwq9TtUMGPi/B5Q247kNBczSAYvUaum2RrkFNwRSpsbac2UjjBx
 ZcDXkXTWaNzuVvPPRWUIPq9ppH3dtuiFzQ==
X-Google-Smtp-Source: ACHHUZ5pASjEWprqu9IltUTBgBBFwA0yj3ZfJENh7UkfzRAlH7PHL2inpJzSAK+01uo+9lYfb/Ee2w==
X-Received: by 2002:a17:902:d315:b0:1ab:13bd:5f96 with SMTP id
 b21-20020a170902d31500b001ab13bd5f96mr5593529plc.4.1683248719245; 
 Thu, 04 May 2023 18:05:19 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:18 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 35/89] target/riscv/cpu.c: remove 'multi_letter' from
 isa_ext_data
Date: Fri,  5 May 2023 11:01:47 +1000
Message-Id: <20230505010241.21812-36-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62f.google.com
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

We don't have MISA extensions in isa_edata_arr[] anymore. Remove the
redundant 'multi_letter' field from isa_ext_data.

Suggested-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-4-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 132 ++++++++++++++++++++++-----------------------
 1 file changed, 65 insertions(+), 67 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ed8f36c649..fbf612292a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -48,13 +48,12 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
 struct isa_ext_data {
     const char *name;
-    bool multi_letter;
     int min_version;
     int ext_enable_offset;
 };
 
-#define ISA_EXT_DATA_ENTRY(_name, _m_letter, _min_ver, _prop) \
-    {#_name, _m_letter, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
+#define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
+    {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
 
 /*
  * Here are the ordering rules of extension naming defined by RISC-V
@@ -77,68 +76,68 @@ struct isa_ext_data {
  * instead.
  */
 static const struct isa_ext_data isa_edata_arr[] = {
-    ISA_EXT_DATA_ENTRY(zicbom, true, PRIV_VERSION_1_12_0, ext_icbom),
-    ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
-    ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
-    ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
-    ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
-    ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
-    ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
-    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
-    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_11_0, ext_zfhmin),
-    ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
-    ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
-    ISA_EXT_DATA_ENTRY(zca, true, PRIV_VERSION_1_12_0, ext_zca),
-    ISA_EXT_DATA_ENTRY(zcb, true, PRIV_VERSION_1_12_0, ext_zcb),
-    ISA_EXT_DATA_ENTRY(zcf, true, PRIV_VERSION_1_12_0, ext_zcf),
-    ISA_EXT_DATA_ENTRY(zcd, true, PRIV_VERSION_1_12_0, ext_zcd),
-    ISA_EXT_DATA_ENTRY(zce, true, PRIV_VERSION_1_12_0, ext_zce),
-    ISA_EXT_DATA_ENTRY(zcmp, true, PRIV_VERSION_1_12_0, ext_zcmp),
-    ISA_EXT_DATA_ENTRY(zcmt, true, PRIV_VERSION_1_12_0, ext_zcmt),
-    ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
-    ISA_EXT_DATA_ENTRY(zbb, true, PRIV_VERSION_1_12_0, ext_zbb),
-    ISA_EXT_DATA_ENTRY(zbc, true, PRIV_VERSION_1_12_0, ext_zbc),
-    ISA_EXT_DATA_ENTRY(zbkb, true, PRIV_VERSION_1_12_0, ext_zbkb),
-    ISA_EXT_DATA_ENTRY(zbkc, true, PRIV_VERSION_1_12_0, ext_zbkc),
-    ISA_EXT_DATA_ENTRY(zbkx, true, PRIV_VERSION_1_12_0, ext_zbkx),
-    ISA_EXT_DATA_ENTRY(zbs, true, PRIV_VERSION_1_12_0, ext_zbs),
-    ISA_EXT_DATA_ENTRY(zk, true, PRIV_VERSION_1_12_0, ext_zk),
-    ISA_EXT_DATA_ENTRY(zkn, true, PRIV_VERSION_1_12_0, ext_zkn),
-    ISA_EXT_DATA_ENTRY(zknd, true, PRIV_VERSION_1_12_0, ext_zknd),
-    ISA_EXT_DATA_ENTRY(zkne, true, PRIV_VERSION_1_12_0, ext_zkne),
-    ISA_EXT_DATA_ENTRY(zknh, true, PRIV_VERSION_1_12_0, ext_zknh),
-    ISA_EXT_DATA_ENTRY(zkr, true, PRIV_VERSION_1_12_0, ext_zkr),
-    ISA_EXT_DATA_ENTRY(zks, true, PRIV_VERSION_1_12_0, ext_zks),
-    ISA_EXT_DATA_ENTRY(zksed, true, PRIV_VERSION_1_12_0, ext_zksed),
-    ISA_EXT_DATA_ENTRY(zksh, true, PRIV_VERSION_1_12_0, ext_zksh),
-    ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
-    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_10_0, ext_zve32f),
-    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_10_0, ext_zve64f),
-    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_10_0, ext_zve64d),
-    ISA_EXT_DATA_ENTRY(zvfh, true, PRIV_VERSION_1_12_0, ext_zvfh),
-    ISA_EXT_DATA_ENTRY(zvfhmin, true, PRIV_VERSION_1_12_0, ext_zvfhmin),
-    ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
-    ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
-    ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
-    ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
-    ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
-    ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
-    ISA_EXT_DATA_ENTRY(svadu, true, PRIV_VERSION_1_12_0, ext_svadu),
-    ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
-    ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
-    ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
-    ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba),
-    ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb),
-    ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs),
-    ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
-    ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
-    ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadfmemidx),
-    ISA_EXT_DATA_ENTRY(xtheadfmv, true, PRIV_VERSION_1_11_0, ext_xtheadfmv),
-    ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
-    ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
-    ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
-    ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
-    ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
+    ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
+    ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
+    ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
+    ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
+    ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
+    ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
+    ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
+    ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),
+    ISA_EXT_DATA_ENTRY(zfhmin, PRIV_VERSION_1_11_0, ext_zfhmin),
+    ISA_EXT_DATA_ENTRY(zfinx, PRIV_VERSION_1_12_0, ext_zfinx),
+    ISA_EXT_DATA_ENTRY(zdinx, PRIV_VERSION_1_12_0, ext_zdinx),
+    ISA_EXT_DATA_ENTRY(zca, PRIV_VERSION_1_12_0, ext_zca),
+    ISA_EXT_DATA_ENTRY(zcb, PRIV_VERSION_1_12_0, ext_zcb),
+    ISA_EXT_DATA_ENTRY(zcf, PRIV_VERSION_1_12_0, ext_zcf),
+    ISA_EXT_DATA_ENTRY(zcd, PRIV_VERSION_1_12_0, ext_zcd),
+    ISA_EXT_DATA_ENTRY(zce, PRIV_VERSION_1_12_0, ext_zce),
+    ISA_EXT_DATA_ENTRY(zcmp, PRIV_VERSION_1_12_0, ext_zcmp),
+    ISA_EXT_DATA_ENTRY(zcmt, PRIV_VERSION_1_12_0, ext_zcmt),
+    ISA_EXT_DATA_ENTRY(zba, PRIV_VERSION_1_12_0, ext_zba),
+    ISA_EXT_DATA_ENTRY(zbb, PRIV_VERSION_1_12_0, ext_zbb),
+    ISA_EXT_DATA_ENTRY(zbc, PRIV_VERSION_1_12_0, ext_zbc),
+    ISA_EXT_DATA_ENTRY(zbkb, PRIV_VERSION_1_12_0, ext_zbkb),
+    ISA_EXT_DATA_ENTRY(zbkc, PRIV_VERSION_1_12_0, ext_zbkc),
+    ISA_EXT_DATA_ENTRY(zbkx, PRIV_VERSION_1_12_0, ext_zbkx),
+    ISA_EXT_DATA_ENTRY(zbs, PRIV_VERSION_1_12_0, ext_zbs),
+    ISA_EXT_DATA_ENTRY(zk, PRIV_VERSION_1_12_0, ext_zk),
+    ISA_EXT_DATA_ENTRY(zkn, PRIV_VERSION_1_12_0, ext_zkn),
+    ISA_EXT_DATA_ENTRY(zknd, PRIV_VERSION_1_12_0, ext_zknd),
+    ISA_EXT_DATA_ENTRY(zkne, PRIV_VERSION_1_12_0, ext_zkne),
+    ISA_EXT_DATA_ENTRY(zknh, PRIV_VERSION_1_12_0, ext_zknh),
+    ISA_EXT_DATA_ENTRY(zkr, PRIV_VERSION_1_12_0, ext_zkr),
+    ISA_EXT_DATA_ENTRY(zks, PRIV_VERSION_1_12_0, ext_zks),
+    ISA_EXT_DATA_ENTRY(zksed, PRIV_VERSION_1_12_0, ext_zksed),
+    ISA_EXT_DATA_ENTRY(zksh, PRIV_VERSION_1_12_0, ext_zksh),
+    ISA_EXT_DATA_ENTRY(zkt, PRIV_VERSION_1_12_0, ext_zkt),
+    ISA_EXT_DATA_ENTRY(zve32f, PRIV_VERSION_1_10_0, ext_zve32f),
+    ISA_EXT_DATA_ENTRY(zve64f, PRIV_VERSION_1_10_0, ext_zve64f),
+    ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
+    ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
+    ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
+    ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
+    ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
+    ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
+    ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
+    ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
+    ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
+    ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
+    ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
+    ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
+    ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
+    ISA_EXT_DATA_ENTRY(xtheadcmo, PRIV_VERSION_1_11_0, ext_xtheadcmo),
+    ISA_EXT_DATA_ENTRY(xtheadcondmov, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
+    ISA_EXT_DATA_ENTRY(xtheadfmemidx, PRIV_VERSION_1_11_0, ext_xtheadfmemidx),
+    ISA_EXT_DATA_ENTRY(xtheadfmv, PRIV_VERSION_1_11_0, ext_xtheadfmv),
+    ISA_EXT_DATA_ENTRY(xtheadmac, PRIV_VERSION_1_11_0, ext_xtheadmac),
+    ISA_EXT_DATA_ENTRY(xtheadmemidx, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
+    ISA_EXT_DATA_ENTRY(xtheadmempair, PRIV_VERSION_1_11_0, ext_xtheadmempair),
+    ISA_EXT_DATA_ENTRY(xtheadsync, PRIV_VERSION_1_11_0, ext_xtheadsync),
+    ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
 static bool isa_ext_is_enabled(RISCVCPU *cpu,
@@ -1741,8 +1740,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].multi_letter &&
-            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.40.0


