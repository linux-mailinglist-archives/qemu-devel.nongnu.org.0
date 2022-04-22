Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C237750B62D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:30:40 +0200 (CEST)
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrUl-0008PL-SK
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqLC-0001Qg-Bs
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:16:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqLA-0004sU-Q7
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650622600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V+C4GEug/y+QDL51lRuwik+lTntgUagWVw/Wl00bh5A=;
 b=buYDpzwSlQ0mBb8kvQSWseS9HpBikRwEeUycrEuLDHaai7d2AzpybsutgkJYCC8/0TVmbR
 VNgLjldgtKP6AxFq7lnc9MRqunvNeDUXqUMtqDfBb4RXNgfrtL8EznZNXocsPdd5IakmXU
 PCfDZmGo5abo1GNoE1dZv1YrcSPiZQs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-NJHjkEQIOl-uRJSNDggahQ-1; Fri, 22 Apr 2022 06:16:39 -0400
X-MC-Unique: NJHjkEQIOl-uRJSNDggahQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DE403C21184;
 Fri, 22 Apr 2022 10:16:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24E1240EC000;
 Fri, 22 Apr 2022 10:16:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/13] dump: Cleanup dump_begin write functions
Date: Fri, 22 Apr 2022 14:15:20 +0400
Message-Id: <20220422101525.3260741-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
References: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
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

There's no need to have a gigantic if in there let's move the elf
32/64 bit logic into the section, segment or note code.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220330123603.107120-9-frankja@linux.ibm.com>
---
 dump/dump.c | 42 +++++++++++-------------------------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 0d95fc5b7a3c..929ef953515c 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -564,46 +564,26 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    if (dump_is_64bit(s)) {
-        /* write all PT_LOAD to vmcore */
-        write_elf_loads(s, errp);
+    /* write all PT_LOAD to vmcore */
+    write_elf_loads(s, errp);
+    if (*errp) {
+        return;
+    }
+
+    /* write section to vmcore */
+    if (s->shdr_num) {
+        write_elf_section(s, 1, errp);
         if (*errp) {
             return;
         }
+    }
 
-        /* write section to vmcore */
-        if (s->shdr_num) {
-            write_elf_section(s, 1, errp);
-            if (*errp) {
-                return;
-            }
-        }
-
+    if (dump_is_64bit(s)) {
         /* write notes to vmcore */
         write_elf64_notes(fd_write_vmcore, s, errp);
-        if (*errp) {
-            return;
-        }
     } else {
-        /* write all PT_LOAD to vmcore */
-        write_elf_loads(s, errp);
-        if (*errp) {
-            return;
-        }
-
-        /* write section to vmcore */
-        if (s->shdr_num) {
-            write_elf_section(s, 0, errp);
-            if (*errp) {
-                return;
-            }
-        }
-
         /* write notes to vmcore */
         write_elf32_notes(fd_write_vmcore, s, errp);
-        if (*errp) {
-            return;
-        }
     }
 }
 
-- 
2.36.0


