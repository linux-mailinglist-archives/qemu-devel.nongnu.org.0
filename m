Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705C50B60B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:18:39 +0200 (CEST)
Received: from localhost ([::1]:38088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrJ8-0007z6-FA
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqKY-0000Jy-7b
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqKT-0004ow-NF
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650622554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGECfgCA062ozS385htHljf3FpYVHp12BzT+d6+p2DU=;
 b=QB16d9RxOku4Vvo3LrjABwqxNpVWkvvOcCcJFtavm8L1T5ITeLpeqk7U++E8xa5HUrm2p0
 ig0vlKXtBi9n8rh4+ia4gvya14YDDULgWt+HdyCxTYChITTCpVM8wnhnZsJK6X8Ht6yX3Z
 ITL3cy57FHuDKU/yQHgf07rZKxzLV/E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-EEiRR7XKPJKHTp2odb98fw-1; Fri, 22 Apr 2022 06:15:51 -0400
X-MC-Unique: EEiRR7XKPJKHTp2odb98fw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF8A610726AB;
 Fri, 22 Apr 2022 10:15:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA37D46A0C4;
 Fri, 22 Apr 2022 10:15:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/13] dump: Remove the section if when calculating the
 memory offset
Date: Fri, 22 Apr 2022 14:15:16 +0400
Message-Id: <20220422101525.3260741-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
References: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

When s->shdr_num is 0 we'll add 0 bytes of section headers which is
equivalent to not adding section headers but with the multiplication
we can remove a if/else.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220330123603.107120-5-frankja@linux.ibm.com>
---
 dump/dump.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 285ed4475b0d..9c80680eb2a4 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1817,23 +1817,15 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (s->dump_info.d_class == ELFCLASS64) {
-        if (s->shdr_num) {
-            s->memory_offset = sizeof(Elf64_Ehdr) +
-                               sizeof(Elf64_Phdr) * s->phdr_num +
-                               sizeof(Elf64_Shdr) * s->shdr_num + s->note_size;
-        } else {
-            s->memory_offset = sizeof(Elf64_Ehdr) +
-                               sizeof(Elf64_Phdr) * s->phdr_num + s->note_size;
-        }
+        s->memory_offset = sizeof(Elf64_Ehdr) +
+                           sizeof(Elf64_Phdr) * s->phdr_num +
+                           sizeof(Elf64_Shdr) * s->shdr_num +
+                           s->note_size;
     } else {
-        if (s->shdr_num) {
-            s->memory_offset = sizeof(Elf32_Ehdr) +
-                               sizeof(Elf32_Phdr) * s->phdr_num +
-                               sizeof(Elf32_Shdr) * s->shdr_num + s->note_size;
-        } else {
-            s->memory_offset = sizeof(Elf32_Ehdr) +
-                               sizeof(Elf32_Phdr) * s->phdr_num + s->note_size;
-        }
+        s->memory_offset = sizeof(Elf32_Ehdr) +
+                           sizeof(Elf32_Phdr) * s->phdr_num +
+                           sizeof(Elf32_Shdr) * s->shdr_num +
+                           s->note_size;
     }
 
     return;
-- 
2.36.0


