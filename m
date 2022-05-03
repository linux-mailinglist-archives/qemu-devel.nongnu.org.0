Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705A85185C1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 15:41:06 +0200 (CEST)
Received: from localhost ([::1]:53034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlsm1-0006JF-6P
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 09:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shuizhuyuanluo@126.com>)
 id 1nlsjf-0004HW-2U
 for qemu-devel@nongnu.org; Tue, 03 May 2022 09:38:39 -0400
Received: from m15112.mail.126.com ([220.181.15.112]:53346)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shuizhuyuanluo@126.com>) id 1nlsjZ-0003ru-PS
 for qemu-devel@nongnu.org; Tue, 03 May 2022 09:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=wqJwB
 kcNQsQcmfntOxUMeGMPpGzTbkFTSTOj3vASXfw=; b=WJunDnmvzeFvoDj4Ney1t
 n3yRje3EQx7eVpRUfkSHpzPNS9xbWyu5Anj4P9ptW9arVvmyezw9/59SCHxg4s0N
 D7TNIbQi4TBAp6k4bPH86ZLzEDf/OJ4MrqZi6h9lhsHcwflLeuUnjic5tO15dTM1
 oKCIWj5J+8lwNwzybqH72o=
Received: from localhost.localdomain (unknown [101.228.28.144])
 by smtp2 (Coremail) with SMTP id DMmowABHS_38KHFixa2dBA--.22839S3;
 Tue, 03 May 2022 21:07:09 +0800 (CST)
From: nihui <shuizhuyuanluo@126.com>
To: qemu-devel@nongnu.org
Cc: Ni Hui <shuizhuyuanluo@126.com>
Subject: [PATCH 2/4] target/mips: Fix df_extract_val() and df_extract_df() dfe
 lookup
Date: Tue,  3 May 2022 21:07:06 +0800
Message-Id: <20220503130708.272850-2-shuizhuyuanluo@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503130708.272850-1-shuizhuyuanluo@126.com>
References: <20220503130708.272850-1-shuizhuyuanluo@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowABHS_38KHFixa2dBA--.22839S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7JFWxKF18Gr4fZryDuF4rKrg_yoW8JryrpF
 sFk3Wjkr48XrW29F9rGw45Xr4UCFyrKayUA3ZrKwn3Xr90g34rW3W8tryrKF4fGF95uFn8
 ZF1Fvr98Cw4I9FJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR8nYwUUUUU=
X-Originating-IP: [101.228.28.144]
X-CM-SenderInfo: pvkxx65kx13tpqox0qqrswhudrp/1tbiHB71elpEGjQkeAAAsh
Received-SPF: pass client-ip=220.181.15.112;
 envelope-from=shuizhuyuanluo@126.com; helo=m15112.mail.126.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ni Hui <shuizhuyuanluo@126.com>

Actually look into dfe structure data so that df_extract_val() and
df_extract_df() can return immediate and datafield other than BYTE.

Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
---
 target/mips/tcg/msa_translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 76307102f2..aa45bae0aa 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -68,8 +68,8 @@ struct dfe {
 static int df_extract_val(DisasContext *ctx, int x, const struct dfe *s)
 {
     for (unsigned i = 0; i < 4; i++) {
-        if (extract32(x, s->start, s->length) == s->mask) {
-            return extract32(x, 0, s->start);
+        if (extract32(x, s[i].start, s[i].length) == s[i].mask) {
+            return extract32(x, 0, s[i].start);
         }
     }
     return -1;
@@ -82,7 +82,7 @@ static int df_extract_val(DisasContext *ctx, int x, const struct dfe *s)
 static int df_extract_df(DisasContext *ctx, int x, const struct dfe *s)
 {
     for (unsigned i = 0; i < 4; i++) {
-        if (extract32(x, s->start, s->length) == s->mask) {
+        if (extract32(x, s[i].start, s[i].length) == s[i].mask) {
             return i;
         }
     }
-- 
2.25.1


