Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3971CFC3C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 19:33:12 +0200 (CEST)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYYmF-0006yD-UN
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 13:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <masahiroy@kernel.org>)
 id 1jYYkm-0005tb-EK
 for qemu-devel@nongnu.org; Tue, 12 May 2020 13:31:40 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:38452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <masahiroy@kernel.org>)
 id 1jYYkk-0003cR-9a
 for qemu-devel@nongnu.org; Tue, 12 May 2020 13:31:39 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net
 [126.90.202.47]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 04CHV7t1032279;
 Wed, 13 May 2020 02:31:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 04CHV7t1032279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1589304668;
 bh=+VU6zF5MPFCfDw07fM2SgeC3Z5I9vFK8O0un3ddqNT8=;
 h=From:To:Cc:Subject:Date:From;
 b=DgDd0PnFzzxPESjTdL9qg1PMOdd3kVob2rJEWifNAXxy/dCxZu0PNJBZ3TTryE8YO
 1/obV7F9RhlfducrAMQX7T4S4SYHrJZu678akiEFpCWhBWsanUhI37aKo2tig/pPIV
 ZauZdhdN8usWQ/PvCBbWSd0iNz/wwMN6u/m6lqtnG33xnvA7GRd8TC7eJyWbT6KjJ1
 w4ExE0tAylwt6QcHRc2afGMjcf+8kr0ghn4knUTj/wjVFK/abg3pwsfEf41JHkHs38
 xnTYS2adn3cIbIE5si13UDp3OKjfXs0JML8F2LW8Kqoz8/txXj2sn4PexaOzQIQLbc
 rx8fqI5j2nbuw==
X-Nifty-SrcIP: [126.90.202.47]
From: Masahiro Yamada <masahiroy@kernel.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] qom/object: pass (Object *) to object_initialize_with_type()
Date: Wed, 13 May 2020 02:31:04 +0900
Message-Id: <20200512173104.2293073-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=210.131.2.79;
 envelope-from=masahiroy@kernel.org; helo=conuserg-12.nifty.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 13:31:34
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_SOFTFAIL=0.665,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Masahiro Yamada <masahiroy@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

object_new_with_type() already passes (Object *) pointer.
Avoid casting back and forth.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 qom/object.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index e4085d8ae2..9d1a918e42 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -495,10 +495,8 @@ static void object_class_property_init_all(Object *obj)
     }
 }
 
-static void object_initialize_with_type(void *data, size_t size, TypeImpl *type)
+static void object_initialize_with_type(Object *obj, size_t size, TypeImpl *type)
 {
-    Object *obj = data;
-
     type_initialize(type);
 
     g_assert(type->instance_size >= sizeof(Object));
-- 
2.25.1


