Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC1B6FB0FF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:13:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0eG-0005dp-7F; Mon, 08 May 2023 09:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0dQ-00043J-9E
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0dD-00013H-4f
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/hKGndNrp0PsXrFDZ6n1QgzwLLa55x5VOyYS7RgSyU=;
 b=cEczX0/VOT+N0hynt8gdpKox4PLaQVGRNitV1XokXmw9+nsW0zwNlFb5Bo+zppdMEwZf/h
 Z+bnnQquPj4hOcgPXB6Fe+v2Ux+t7Dy/aGHgvti3orpZTB/vt8rELvg4FWhGVCmhPYXPS+
 RDPru8dgKfmon7AOErafoI+4XCddumo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-fVKP_jbxMTWcxRe3rNcgbg-1; Mon, 08 May 2023 09:10:19 -0400
X-MC-Unique: fVKP_jbxMTWcxRe3rNcgbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F393C1C0950E;
 Mon,  8 May 2023 13:10:17 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B63A42166B40;
 Mon,  8 May 2023 13:10:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 09/21] qemu-file: Account for rate_limit usage on qemu_fflush()
Date: Mon,  8 May 2023 15:08:57 +0200
Message-Id: <20230508130909.65420-10-quintela@redhat.com>
In-Reply-To: <20230508130909.65420-1-quintela@redhat.com>
References: <20230508130909.65420-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

That is the moment we know we have transferred something.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 6ebc2bd3ec..8de1ecd082 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -301,7 +301,9 @@ void qemu_fflush(QEMUFile *f)
                                    &local_error) < 0) {
             qemu_file_set_error_obj(f, -EIO, local_error);
         } else {
-            f->total_transferred += iov_size(f->iov, f->iovcnt);
+            uint64_t size = iov_size(f->iov, f->iovcnt);
+            qemu_file_acct_rate_limit(f, size);
+            f->total_transferred += size;
         }
 
         qemu_iovec_release_ram(f);
@@ -518,7 +520,6 @@ void qemu_put_buffer_async(QEMUFile *f, const uint8_t *buf, size_t size,
         return;
     }
 
-    f->rate_limit_used += size;
     add_to_iovec(f, buf, size, may_free);
 }
 
@@ -536,7 +537,6 @@ void qemu_put_buffer(QEMUFile *f, const uint8_t *buf, size_t size)
             l = size;
         }
         memcpy(f->buf + f->buf_index, buf, l);
-        f->rate_limit_used += l;
         add_buf_to_iovec(f, l);
         if (qemu_file_get_error(f)) {
             break;
@@ -553,7 +553,6 @@ void qemu_put_byte(QEMUFile *f, int v)
     }
 
     f->buf[f->buf_index] = v;
-    f->rate_limit_used++;
     add_buf_to_iovec(f, 1);
 }
 
-- 
2.40.0


