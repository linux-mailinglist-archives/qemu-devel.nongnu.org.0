Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E5C610B3C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 09:24:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooJim-0006b0-Su; Fri, 28 Oct 2022 03:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1ooJih-0006ah-66
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:23:59 -0400
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1ooJif-0002kk-JB
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:23:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1666941829; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H2MQEfGfqwqqVJRAy/eQjb6AOPoIIa4dAsExvib+DPfbHXMTyqn3ex9dtSSf1npA48t1zo8aVCNK0WlXcZ5Y150olWwGo0S1fCYM1aBoK3f5dgWu6AD5hTsZNxBiCF3/JI/xAhpoNSxXI0WEASwWApZAMVra8iEnNmUzv5toZg8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1666941829;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=NQuh7zi2wtasmtboF4R4qO1RB0L1rHeApw73kba+H2k=; 
 b=adiV6Rw3MXFoEcDafdRf2lYcdQ5EIFm93v2OdPsjv8H9je1N68LDD2yXFmGULZ07Z6M0U2NWmMMRa6xu+M0LLLoelgW5EQNDSv72padGswbsm6GL/TMdhuzM9XvJU4GTzz+Sa3wZK7r/o5qts2izyUGDwhoei/Kr2niO/8dAjb0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666941829; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=NQuh7zi2wtasmtboF4R4qO1RB0L1rHeApw73kba+H2k=;
 b=KHrhHT7FpwrCiqxQNrGhqmIYZgUxv3d7D4VPfAc6QzH6lczLMVzF6sz9IeJ8F4vQ
 zVXBpFXT+X/G0VwNxyZcvHNAbwu7cQla3fT1R6Bc4/RzJWfkCP86gn7h1Q2rzj8gNvc
 6jT/SvdWWYG+A3PUaKJKDpWKhDsUSjYu6wHmviOs=
Received: from edelgard.fodlan.icenowy.me (112.94.102.53 [112.94.102.53]) by
 mx.zohomail.com with SMTPS id 1666941828587360.22039856339995;
 Fri, 28 Oct 2022 00:23:48 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] tcg/tci: fix logic error when registering helpers via FFI
Date: Fri, 28 Oct 2022 15:21:45 +0800
Message-Id: <20221028072145.1593205-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.18; envelope-from=uwu@icenowy.me;
 helo=sender4-op-o18.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

When registering helpers via FFI for TCI, the inner loop that iterates
parameters of the helper reuses (and thus pollutes) the same variable
used by the outer loop that iterates all helpers, thus made some helpers
unregistered.

Fix this logic error by using a dedicated temporary variable for the
inner loop.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 tcg/tcg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 612a12f58f..adfaf61a32 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -619,6 +619,7 @@ static void tcg_context_init(unsigned max_cpus)
         gpointer hash = (gpointer)(uintptr_t)typemask;
         ffi_status status;
         int nargs;
+        int j;
 
         if (g_hash_table_lookup(ffi_table, hash)) {
             continue;
@@ -634,9 +635,9 @@ static void tcg_context_init(unsigned max_cpus)
 
         if (nargs != 0) {
             ca->cif.arg_types = ca->args;
-            for (i = 0; i < nargs; ++i) {
-                int typecode = extract32(typemask, (i + 1) * 3, 3);
-                ca->args[i] = typecode_to_ffi[typecode];
+            for (j = 0; j < nargs; ++j) {
+                int typecode = extract32(typemask, (j + 1) * 3, 3);
+                ca->args[j] = typecode_to_ffi[typecode];
             }
         }
 
-- 
2.37.1


