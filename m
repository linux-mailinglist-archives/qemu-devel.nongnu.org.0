Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E630F9C8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:33:42 +0100 (CET)
Received: from localhost ([::1]:54776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iVh-0004FQ-FA
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7hhI-0002kA-MQ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7hhG-0005Mz-Vs
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UpWiyjueqJEJtOXymDajSybtd0fe5yV4PWLr9bpJQ9s=;
 b=dUMLll0/vzMp6OlgNcqURDGlN1jXhRP2FyLbLCIR48nYG1YECh29tewPuBHzngEjW1WZf0
 jSIz5dktiwbWjTFwZhe2jeRmFthLToJkS/0QmUlXPXfTbp2aCYw830sCKaJ5kMUt2KZ5n5
 WBRH3U5uv77S8VKDKjjd7AFBIMaLOww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-QdpwJubTME-JAq9oeOJbzQ-1; Thu, 04 Feb 2021 11:41:25 -0500
X-MC-Unique: QdpwJubTME-JAq9oeOJbzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 260AC80402C;
 Thu,  4 Feb 2021 16:41:24 +0000 (UTC)
Received: from thuth.com (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 627965DEC1;
 Thu,  4 Feb 2021 16:41:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH v2] target/s390x/arch_dump: Fixes for the name field in the
 PT_NOTE section
Date: Thu,  4 Feb 2021 17:41:17 +0100
Message-Id: <20210204164117.721110-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the "ELF-64 Object File Format" specification:

"The first word in the entry, namesz, identifies the length, in
 bytes, of a name identifying the entry’s owner or originator. The name field
 contains a null-terminated string, with padding as necessary to ensure 8-
 byte alignment for the descriptor field. The length does not include the
 terminating null or the padding."

So we should not include the terminating NUL in the length field here.

Also there is a compiler warning with GCC 9.3 when compiling with
the -fsanitize=thread compiler flag:

 In function 'strncpy',
    inlined from 's390x_write_elf64_notes' at ../target/s390x/arch_dump.c:219:9:
 /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
  '__builtin_strncpy' specified bound 8 equals destination size
  [-Werror=stringop-truncation]

Since the name should always be NUL-terminated, let's use g_strlcpy() to
silence this warning. And while we're at it, also add an assert() to make
sure that the provided names always fit the size field (which is fine for
the current callers, the function is called once with "CORE" and once with
"LINUX" as a name).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Use g_strlcpy instead of strncpy

 target/s390x/arch_dump.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index 50fa0ae4b6..f205123834 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -212,11 +212,13 @@ static int s390x_write_elf64_notes(const char *note_name,
     int note_size;
     int ret = -1;
 
+    assert(strlen(note_name) < sizeof(note.name));
+
     for (nf = funcs; nf->note_contents_func; nf++) {
         memset(&note, 0, sizeof(note));
-        note.hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
+        note.hdr.n_namesz = cpu_to_be32(strlen(note_name));
         note.hdr.n_descsz = cpu_to_be32(nf->contents_size);
-        strncpy(note.name, note_name, sizeof(note.name));
+        g_strlcpy(note.name, note_name, sizeof(note.name));
         (*nf->note_contents_func)(&note, cpu, id);
 
         note_size = sizeof(note) - sizeof(note.contents) + nf->contents_size;
-- 
2.27.0


