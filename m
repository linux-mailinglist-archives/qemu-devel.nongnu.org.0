Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38F310811
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:41:14 +0100 (CET)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xc2-0008QJ-0t
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xaV-0007uV-69
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:39:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xaT-0000Sw-K9
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612517976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vwaMKLVPT5yDr/IYYbwiHBYRp6227JGEdmt6WssAiuI=;
 b=aZXM0Hbz3jBzMBjA3PTHkb44/446NeLJKl+Ftt1oQIPaBz8P1X9YBVOSkpjUMqG7ZalNvK
 vweenSE5nxbBnhnXwXzf94fejMkAiRZyVNTUlNfBxqb3jtBaB3wx3M9kX33VXTV2BZbFQ9
 ET91n6oAeBN+DlKxLbkfk0nO3d7ko3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-e516U8vANp2i_yS_TepwJQ-1; Fri, 05 Feb 2021 04:39:28 -0500
X-MC-Unique: e516U8vANp2i_yS_TepwJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8A6D1934102;
 Fri,  5 Feb 2021 09:39:27 +0000 (UTC)
Received: from thuth.com (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B27110013DB;
 Fri,  5 Feb 2021 09:39:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH v3] target/s390x/arch_dump: Fix warning for the name field in
 the PT_NOTE section
Date: Fri,  5 Feb 2021 10:39:21 +0100
Message-Id: <20210205093921.848260-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

There is a compiler warning with GCC 9.3 when compiling with
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
 v3: Do not touch the namesz field

 target/s390x/arch_dump.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index 50fa0ae4b6..cc1330876b 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -212,11 +212,13 @@ static int s390x_write_elf64_notes(const char *note_name,
     int note_size;
     int ret = -1;
 
+    assert(strlen(note_name) < sizeof(note.name));
+
     for (nf = funcs; nf->note_contents_func; nf++) {
         memset(&note, 0, sizeof(note));
         note.hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
         note.hdr.n_descsz = cpu_to_be32(nf->contents_size);
-        strncpy(note.name, note_name, sizeof(note.name));
+        g_strlcpy(note.name, note_name, sizeof(note.name));
         (*nf->note_contents_func)(&note, cpu, id);
 
         note_size = sizeof(note) - sizeof(note.contents) + nf->contents_size;
-- 
2.27.0


