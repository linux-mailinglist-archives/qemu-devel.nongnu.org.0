Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD40F32EF87
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:01:56 +0100 (CET)
Received: from localhost ([::1]:46296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICtn-0002ao-Qh
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnk-0003xI-0L
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICni-0003OF-Cj
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614959737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6+KUDXS7s2v2nQ+4pIf+NkFStYfF9ZOSsr41dCIHIi0=;
 b=eHsMJo/CGf09LDwfhGraA6IwFQkanS3vvYTMw1HBAOkVBUdsHyk8MPtBukso2BfWs4lUfu
 LSQ6luu+imWvAW4r3evbhLBIqCjS2xyx/dvC4tZxO1l59RO0M/aGmoVFGQOtYV6dIdR+D4
 6G3/vwBZSuKvPeCOcFgFNIjjRMEVs54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-TR8RReP1MLiNIGUotbGT0g-1; Fri, 05 Mar 2021 10:55:28 -0500
X-MC-Unique: TR8RReP1MLiNIGUotbGT0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EE14EC1A0;
 Fri,  5 Mar 2021 15:55:27 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D35B60843;
 Fri,  5 Mar 2021 15:55:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/8] target/s390x/arch_dump: Fix warning for the name field in
 the PT_NOTE section
Date: Fri,  5 Mar 2021 16:55:11 +0100
Message-Id: <20210305155517.1604547-3-cohuck@redhat.com>
In-Reply-To: <20210305155517.1604547-1-cohuck@redhat.com>
References: <20210305155517.1604547-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

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
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Message-Id: <20210205093921.848260-1-thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/arch_dump.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index 50fa0ae4b679..cc1330876bef 100644
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
2.26.2


