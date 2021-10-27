Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718BD43CBC3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:14:31 +0200 (CEST)
Received: from localhost ([::1]:49262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjhG-0000Kv-J2
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <42bdeb04b6a4bf3e54f4d7f87193803268ba8255@lizzy.crudebyte.com>)
 id 1mfj0R-00074V-9Z
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:30:16 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:50073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <42bdeb04b6a4bf3e54f4d7f87193803268ba8255@lizzy.crudebyte.com>)
 id 1mfj0L-0008Jq-Ct
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=55Az06BNW6PdRAQb0nHaPh5YBa/adb1onc7HuZodmCc=; b=MSZeY
 KWyAbJA92IjSsqzxvgOBFO4CNqHRBANd+1wWF00ys8bZufgYqsfYArFosm9G+97qyqMY2Tqe1UBHd
 /zvQkyCTWxAoVkHVwzByraFm3R4RogQ3EMztg3T9ys0Nzt+6RoCOLh6YQycCcLdRAloSKI4j9sjjE
 l3NHVCv2s6kvEaqRrM7iiTIpWhi1475P2iCh3txR0gxI56jp8yBk3I3HiGHMjlSeu78Yv1pOSKP2W
 O00nf7JaX+/HHm4ZFj4yBihP/xUNRLRQgDMfW0l0ZAyu3gyeEZHcXskZytIL9LwZ2qiLIwJqIHSFq
 A+6Ji4uZPHYsn/BMaDPigsTr4WsHQ==;
Message-Id: <42bdeb04b6a4bf3e54f4d7f87193803268ba8255.1635340713.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1635340713.git.qemu_oss@crudebyte.com>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 27 Oct 2021 15:18:33 +0200
Subject: [PULL 6/8] 9pfs: make V9fsString usable via P9Array API
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=42bdeb04b6a4bf3e54f4d7f87193803268ba8255@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <ce9f7a0a63585dc27f4545c485109efbec1251da.1633097129.git.qemu_oss@crudebyte.com>
---
 fsdev/9p-marshal.c | 2 ++
 fsdev/9p-marshal.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/fsdev/9p-marshal.c b/fsdev/9p-marshal.c
index a01bba6908..51881fe220 100644
--- a/fsdev/9p-marshal.c
+++ b/fsdev/9p-marshal.c
@@ -18,6 +18,8 @@
 
 #include "9p-marshal.h"
 
+P9ARRAY_DEFINE_TYPE(V9fsString, v9fs_string_free);
+
 void v9fs_string_free(V9fsString *str)
 {
     g_free(str->data);
diff --git a/fsdev/9p-marshal.h b/fsdev/9p-marshal.h
index ceaf2f521e..f1abbe151c 100644
--- a/fsdev/9p-marshal.h
+++ b/fsdev/9p-marshal.h
@@ -1,10 +1,13 @@
 #ifndef QEMU_9P_MARSHAL_H
 #define QEMU_9P_MARSHAL_H
 
+#include "p9array.h"
+
 typedef struct V9fsString {
     uint16_t size;
     char *data;
 } V9fsString;
+P9ARRAY_DECLARE_TYPE(V9fsString);
 
 typedef struct V9fsQID {
     uint8_t type;
-- 
2.20.1


