Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185A46B5077
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:00:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pahxB-0008Mx-Rx; Fri, 10 Mar 2023 13:58:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pahx9-0008Mh-Db
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:58:55 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pahx6-0000im-Ph
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:58:55 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id 72083342111;
 Fri, 10 Mar 2023 21:58:47 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :from:from:message-id:mime-version:reply-to:subject:subject:to
 :to; s=mta-01; bh=L2mHHiDOSmpOwAj+HjaINwRTFilnYOsMBivDTzY7AmQ=; b=
 rHbhZCvdOzBA9MVxHJDs7tV6FiDTaxEeN56KjL8X2XloHOJCjYMoOGYeonkUJfMy
 oMVedrBzdpXoV0wlxOaR7DK3IldGA4YP6sI28hGaVFoiomtdcj7UokksZU4xTEg0
 0cMUAW5gqlmbMfBp2FsH/isQRUCShaJATZ2Qeh9Ja9s=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id 678873420D6;
 Fri, 10 Mar 2023 21:58:47 +0300 (MSK)
Received: from [10.178.120.230] (10.178.120.230) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Fri, 10 Mar
 2023 21:58:46 +0300
Message-ID: <3454991f-7f64-24c3-9a36-f5fa2cc389e1@yadro.com>
Date: Fri, 10 Mar 2023 21:58:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Mikhail Tyutin <m.tyutin@yadro.com>
Subject: [PATCH v2] Fix incorrect register name in disassembler for
 fmv,fabs,fneg instructions
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: <palmer@dabbelt.com>, <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.178.120.230]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=m.tyutin@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Fix incorrect register name in RISC-V disassembler for fmv,fabs,fneg 
instructions

Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
  disas/riscv.c | 19 ++++++++++---------
  1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 54455aaaa8..882594c1be 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1014,6 +1014,7 @@ static const char rv_vreg_name_sym[32][4] = {
  #define rv_fmt_rd_offset              "O\t0,o"
  #define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
  #define rv_fmt_frd_rs1                "O\t3,1"
+#define rv_fmt_frd_frs1               "O\t3,4"
  #define rv_fmt_rd_frs1                "O\t0,4"
  #define rv_fmt_rd_frs1_frs2           "O\t0,4,5"
  #define rv_fmt_frd_frs1_frs2          "O\t3,4,5"
@@ -1580,15 +1581,15 @@ const rv_opcode_data opcode_data[] = {
      { "snez", rv_codec_r, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
      { "sltz", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
      { "sgtz", rv_codec_r, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
-    { "fmv.s", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fabs.s", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fneg.s", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fmv.d", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fabs.d", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fneg.d", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fmv.q", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fabs.q", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fneg.q", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "fmv.s", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fabs.s", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fneg.s", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fmv.d", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fabs.d", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fneg.d", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fmv.q", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fabs.q", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fneg.q", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
      { "beqz", rv_codec_sb, rv_fmt_rs1_offset, NULL, 0, 0, 0 },
      { "bnez", rv_codec_sb, rv_fmt_rs1_offset, NULL, 0, 0, 0 },
      { "blez", rv_codec_sb, rv_fmt_rs2_offset, NULL, 0, 0, 0 },
-- 
2.34.1



