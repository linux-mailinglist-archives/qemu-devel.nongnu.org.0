Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7A950A021
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:57:54 +0200 (CEST)
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWNd-0002UK-3D
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWFo-0006qy-50
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWFm-0003G2-Fa
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650545385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BKRuYv9ssNdmSYk3sBivlB4u2NMQf6j2kMjVOCSPuo=;
 b=WzNt52+jQwYqd/c3l4v6lXFU/mp8ShLRJGR3BA4ENy/l2MsyMXYKGocyuuVaCIZnIkZJtI
 OjTtJsc37mqM0f5ZyRc33WfTGW320o5vD7awGykQEddoNcHt4mjyW1EmqSr2Ac2KSmsz6v
 sQFuxCPtgqIC8Q55NLFjD3buEIjBa4s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-53DkAklCOniaU19SO_47kA-1; Thu, 21 Apr 2022 08:49:44 -0400
X-MC-Unique: 53DkAklCOniaU19SO_47kA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E3E73820F76;
 Thu, 21 Apr 2022 12:49:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 356F4415F50;
 Thu, 21 Apr 2022 12:49:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 09/13] dump: Consolidate elf note function
Date: Thu, 21 Apr 2022 16:48:31 +0400
Message-Id: <20220421124835.2831856-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
References: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 viktor.prutyanov@redhat.com, richard.henderson@linaro.org,
 frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janosch Frank <frankja@linux.ibm.com>

Just like with the other write functions let's move the 32/64 bit elf
handling to a function to improve readability.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220330123603.107120-10-frankja@linux.ibm.com>
---
 dump/dump.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 929ef953515c..4d9658ffa24f 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -519,6 +519,15 @@ static void write_elf_loads(DumpState *s, Error **errp)
     }
 }
 
+static void write_elf_notes(DumpState *s, Error **errp)
+{
+    if (dump_is_64bit(s)) {
+        write_elf64_notes(fd_write_vmcore, s, errp);
+    } else {
+        write_elf32_notes(fd_write_vmcore, s, errp);
+    }
+}
+
 /* write elf header, PT_NOTE and elf note to vmcore. */
 static void dump_begin(DumpState *s, Error **errp)
 {
@@ -578,13 +587,8 @@ static void dump_begin(DumpState *s, Error **errp)
         }
     }
 
-    if (dump_is_64bit(s)) {
-        /* write notes to vmcore */
-        write_elf64_notes(fd_write_vmcore, s, errp);
-    } else {
-        /* write notes to vmcore */
-        write_elf32_notes(fd_write_vmcore, s, errp);
-    }
+    /* write notes to vmcore */
+    write_elf_notes(s, errp);
 }
 
 static int get_next_block(DumpState *s, GuestPhysBlock *block)
-- 
2.35.1.693.g805e0a68082a


