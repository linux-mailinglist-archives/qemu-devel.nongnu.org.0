Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EAB30D692
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 10:47:18 +0100 (CET)
Received: from localhost ([::1]:40720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ekn-00026i-F4
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 04:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Eil-00013e-4l
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:45:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Eij-0005SF-2f
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612345508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2g8HqMsFZtyXedyKvysVpwugjr2MaVZDc32AQTBwee4=;
 b=FQWGM9kJXcyNy40lzidzqixkgjVfsLjmZzqA4NrVujRHkr5/59VmnFkMgihlLve2GaJCnI
 6dLOBbd/3PT7qXPOiR3alF4vNHGVq2Mw1XhGYEwD7HjHl91DbZejPhz0MSExgwZmzd9FdB
 7lX5JzYvXG/azgGqWIvK4KLeUoz7hWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-h8qDllWRNneWKEXpgQEy6Q-1; Wed, 03 Feb 2021 04:45:02 -0500
X-MC-Unique: h8qDllWRNneWKEXpgQEy6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 860911015C83;
 Wed,  3 Feb 2021 09:45:01 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC63E62461;
 Wed,  3 Feb 2021 09:44:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH] target/s390x/arch_dump: Fixes for the name field in the
 PT_NOTE section
Date: Wed,  3 Feb 2021 10:44:54 +0100
Message-Id: <20210203094454.260583-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Since the name should always be NUL-terminated, we can simply decrease
the size of the strncpy by one here to silence this warning. And while
we're at it, also add an assert() to make sure that the provided names
always fit the size field (which is fine for the current callers, the
function is called once with "CORE" and once with "LINUX" as a name).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 The ELF-64 spec can be found here, for example:
 https://uclibc.org/docs/elf-64-gen.pdf

 Here's a CI run with the compiler warning:
 https://gitlab.com/huth/qemu/-/jobs/1003508341#L1248

 target/s390x/arch_dump.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index 50fa0ae4b6..20c3a09707 100644
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
+        strncpy(note.name, note_name, sizeof(note.name) - 1);
         (*nf->note_contents_func)(&note, cpu, id);
 
         note_size = sizeof(note) - sizeof(note.contents) + nf->contents_size;
-- 
2.27.0


