Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A2457B5AA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:37:25 +0200 (CEST)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE815-0001bc-V6
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kK-0004o0-Kn
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kG-0000Cn-2R
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658315999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/f8QL4E3dsHsVYwKyYpzIbZN83Oa7b/hCiQbtuC7g4=;
 b=PK8D2KS/opTEhH48cJVFy97Bd+ENHQMvdUwV6KRSxWnIKsC5iVhreTvjuync3OBuWExdPh
 w1e7mMzyrId1umuKzmG0C/2Eva/Tx7aWWyolFrdB+y3xxK01KWN6DNpRdsc2Jrp0f2r7M/
 xiQ9P7OPWFsDKEYiWk/du1bhu7ZNTfE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-2HqzFyZhOkWTfC41BTzlRQ-1; Wed, 20 Jul 2022 07:19:43 -0400
X-MC-Unique: 2HqzFyZhOkWTfC41BTzlRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D67B801231;
 Wed, 20 Jul 2022 11:19:43 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 708962166B26;
 Wed, 20 Jul 2022 11:19:42 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 09/30] multifd: Copy pages before compressing them with zlib
Date: Wed, 20 Jul 2022 12:19:05 +0100
Message-Id: <20220720111926.107055-10-dgilbert@redhat.com>
In-Reply-To: <20220720111926.107055-1-dgilbert@redhat.com>
References: <20220720111926.107055-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

zlib_send_prepare() compresses pages of a running VM. zlib does not
make any thread-safety guarantees with respect to changing deflate()
input concurrently with deflate() [1].

One can observe problems due to this with the IBM zEnterprise Data
Compression accelerator capable zlib [2]. When the hardware
acceleration is enabled, migration/multifd/tcp/plain/zlib test fails
intermittently [3] due to sliding window corruption. The accelerator's
architecture explicitly discourages concurrent accesses [4]:

    Page 26-57, "Other Conditions":

    As observed by this CPU, other CPUs, and channel
    programs, references to the parameter block, first,
    second, and third operands may be multiple-access
    references, accesses to these storage locations are
    not necessarily block-concurrent, and the sequence
    of these accesses or references is undefined.

Mark Adler pointed out that vanilla zlib performs double fetches under
certain circumstances as well [5], therefore we need to copy data
before passing it to deflate().

[1] https://zlib.net/manual.html
[2] https://github.com/madler/zlib/pull/410
[3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
[4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
[5] https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00889.html

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220705203559.2960949-1-iii@linux.ibm.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd-zlib.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 3a7ae44485..18213a9513 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -27,6 +27,8 @@ struct zlib_data {
     uint8_t *zbuff;
     /* size of compressed buffer */
     uint32_t zbuff_len;
+    /* uncompressed buffer of size qemu_target_page_size() */
+    uint8_t *buf;
 };
 
 /* Multifd zlib compression */
@@ -45,26 +47,38 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
 {
     struct zlib_data *z = g_new0(struct zlib_data, 1);
     z_stream *zs = &z->zs;
+    const char *err_msg;
 
     zs->zalloc = Z_NULL;
     zs->zfree = Z_NULL;
     zs->opaque = Z_NULL;
     if (deflateInit(zs, migrate_multifd_zlib_level()) != Z_OK) {
-        g_free(z);
-        error_setg(errp, "multifd %u: deflate init failed", p->id);
-        return -1;
+        err_msg = "deflate init failed";
+        goto err_free_z;
     }
     /* This is the maxium size of the compressed buffer */
     z->zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
-        deflateEnd(&z->zs);
-        g_free(z);
-        error_setg(errp, "multifd %u: out of memory for zbuff", p->id);
-        return -1;
+        err_msg = "out of memory for zbuff";
+        goto err_deflate_end;
+    }
+    z->buf = g_try_malloc(qemu_target_page_size());
+    if (!z->buf) {
+        err_msg = "out of memory for buf";
+        goto err_free_zbuff;
     }
     p->data = z;
     return 0;
+
+err_free_zbuff:
+    g_free(z->zbuff);
+err_deflate_end:
+    deflateEnd(&z->zs);
+err_free_z:
+    g_free(z);
+    error_setg(errp, "multifd %u: %s", p->id, err_msg);
+    return -1;
 }
 
 /**
@@ -82,6 +96,8 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
     deflateEnd(&z->zs);
     g_free(z->zbuff);
     z->zbuff = NULL;
+    g_free(z->buf);
+    z->buf = NULL;
     g_free(p->data);
     p->data = NULL;
 }
@@ -114,8 +130,14 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
             flush = Z_SYNC_FLUSH;
         }
 
+        /*
+         * Since the VM might be running, the page may be changing concurrently
+         * with compression. zlib does not guarantee that this is safe,
+         * therefore copy the page before calling deflate().
+         */
+        memcpy(z->buf, p->pages->block->host + p->normal[i], page_size);
         zs->avail_in = page_size;
-        zs->next_in = p->pages->block->host + p->normal[i];
+        zs->next_in = z->buf;
 
         zs->avail_out = available;
         zs->next_out = z->zbuff + out_size;
-- 
2.36.1


