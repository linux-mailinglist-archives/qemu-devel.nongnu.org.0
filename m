Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9120B6EA711
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:35:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9K-0008Hv-K2; Fri, 21 Apr 2023 05:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9C-0008FX-Kd
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9A-00033Y-Rq
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kolV6k6KV+OnqIqcWjNOq80wXVVZSZ4N43rvUGxnG0E=;
 b=Kqoq+qe+5UXyzx7zaKZeH7tdpNL6JHdhS8/tpN7vBezJaCTJqPv9o0uqbRR0ghu/D8uUgj
 gql6pCYuCrHYCJ842fFVnS6aMm+ZJUPnUspkr8YQhJv7DLXoiA/noZc3ghU9kz2TZer9pk
 H+z014xsdnZK1EL7S4JQ2mOnqAlr+40=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-MwQkM-HYNZ2ZGv3AspGmkQ-1; Fri, 21 Apr 2023 05:33:38 -0400
X-MC-Unique: MwQkM-HYNZ2ZGv3AspGmkQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94f5a1fa123so149650866b.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069617; x=1684661617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kolV6k6KV+OnqIqcWjNOq80wXVVZSZ4N43rvUGxnG0E=;
 b=agtn0Bcgyrg5YNLwumXWyjt5SbnIh/xmc5SImtOTUcLnotTsXcD+APMKL3OOewXm0T
 SS+Q74BosUNjakrzrVfz6PQnDmKi/MDrMq2nqcITlXiF9OwfPpWOcDp7kxv998axrvuw
 X0nR6KcLZsZQ+cyd/DoIjZ14301PkfThfVld+0hFrpdyVZTaVn/oDF4BxGZ9V90w0+08
 Ufy/tSfLFO+EQv5jF/x+6W9E1BunJ540FVw5dKgK9JLT+sCLu3znmIGtyYh74Yt3xbg6
 F+7Cc3uB4z1DJddNnq8wamzWdUMQmnxUNExChnE6Xs6YU03+RdJWTpOn9rMevbfIje8T
 nPMA==
X-Gm-Message-State: AAQBX9fqerGxVVJh1rtwfvLamCIOwpQ15p7+1wyNDr9EGptXEAuiv1lm
 oPgdUF477lg46Y7S4tKAIL5oMlumraNwyCfwyUm6K9Alc/b4hWyouYtChEoECVgLGXcYPBkJK21
 JqEaU4+OznCOP+qnkYYWilNCJ5hTE4v7qxs0MzEU3qbmZx1NHrRbHUgxBECkQQGmCtmXCynLjR6
 mKbA==
X-Received: by 2002:a17:906:4915:b0:94a:5d16:a280 with SMTP id
 b21-20020a170906491500b0094a5d16a280mr1858736ejq.9.1682069617172; 
 Fri, 21 Apr 2023 02:33:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350YCXB0WrskQJnfXwqICc7o5oGt7wK/hoW57BkV46VEc5dcNYQPGGpFYmlzpI1oIV2EB1H3ydg==
X-Received: by 2002:a17:906:4915:b0:94a:5d16:a280 with SMTP id
 b21-20020a170906491500b0094a5d16a280mr1858722ejq.9.1682069616887; 
 Fri, 21 Apr 2023 02:33:36 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 fx21-20020a170906b75500b009531d9efcc4sm1810311ejb.133.2023.04.21.02.33.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/25] migration: mark mixed functions that can suspend
Date: Fri, 21 Apr 2023 11:33:05 +0200
Message-Id: <20230421093316.17941-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

There should be no paths from a coroutine_fn to aio_poll, however in
practice coroutine_mixed_fn will call aio_poll in the !qemu_in_coroutine()
path.  By marking mixed functions, we can track accurately the call paths
that execute entirely in coroutine context, and find more missing
coroutine_fn markers.  This results in more accurate checks that
coroutine code does not end up blocking.

If the marking were extended transitively to all functions that call
these ones, static analysis could be done much more efficiently.
However, this is a start and makes it possible to use vrc's path-based
searches to find potential bugs where coroutine_fns call blocking functions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/migration/qemu-file-types.h |  4 ++--
 migration/qemu-file.c               | 14 +++++++-------
 migration/qemu-file.h               |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/migration/qemu-file-types.h b/include/migration/qemu-file-types.h
index 2867e3da84ab..1436f9ce92f3 100644
--- a/include/migration/qemu-file-types.h
+++ b/include/migration/qemu-file-types.h
@@ -35,7 +35,7 @@ void qemu_put_byte(QEMUFile *f, int v);
 void qemu_put_be16(QEMUFile *f, unsigned int v);
 void qemu_put_be32(QEMUFile *f, unsigned int v);
 void qemu_put_be64(QEMUFile *f, uint64_t v);
-size_t qemu_get_buffer(QEMUFile *f, uint8_t *buf, size_t size);
+size_t coroutine_mixed_fn qemu_get_buffer(QEMUFile *f, uint8_t *buf, size_t size);
 
 int qemu_get_byte(QEMUFile *f);
 
@@ -161,7 +161,7 @@ static inline void qemu_get_sbe64s(QEMUFile *f, int64_t *pv)
     qemu_get_be64s(f, (uint64_t *)pv);
 }
 
-size_t qemu_get_counted_string(QEMUFile *f, char buf[256]);
+size_t coroutine_mixed_fn qemu_get_counted_string(QEMUFile *f, char buf[256]);
 
 void qemu_put_counted_string(QEMUFile *f, const char *name);
 
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 102ab3b4392c..ee04240a21ba 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -392,7 +392,7 @@ size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
  * case if the underlying file descriptor gives a short read, and that can
  * happen even on a blocking fd.
  */
-static ssize_t qemu_fill_buffer(QEMUFile *f)
+static ssize_t coroutine_mixed_fn qemu_fill_buffer(QEMUFile *f)
 {
     int len;
     int pending;
@@ -585,7 +585,7 @@ void qemu_file_skip(QEMUFile *f, int size)
  * return as many as it managed to read (assuming blocking fd's which
  * all current QEMUFile are)
  */
-size_t qemu_peek_buffer(QEMUFile *f, uint8_t **buf, size_t size, size_t offset)
+size_t coroutine_mixed_fn qemu_peek_buffer(QEMUFile *f, uint8_t **buf, size_t size, size_t offset)
 {
     ssize_t pending;
     size_t index;
@@ -633,7 +633,7 @@ size_t qemu_peek_buffer(QEMUFile *f, uint8_t **buf, size_t size, size_t offset)
  * return as many as it managed to read (assuming blocking fd's which
  * all current QEMUFile are)
  */
-size_t qemu_get_buffer(QEMUFile *f, uint8_t *buf, size_t size)
+size_t coroutine_mixed_fn qemu_get_buffer(QEMUFile *f, uint8_t *buf, size_t size)
 {
     size_t pending = size;
     size_t done = 0;
@@ -674,7 +674,7 @@ size_t qemu_get_buffer(QEMUFile *f, uint8_t *buf, size_t size)
  * Note: Since **buf may get changed, the caller should take care to
  *       keep a pointer to the original buffer if it needs to deallocate it.
  */
-size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size)
+size_t coroutine_mixed_fn qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size)
 {
     if (size < IO_BUF_SIZE) {
         size_t res;
@@ -696,7 +696,7 @@ size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size)
  * Peeks a single byte from the buffer; this isn't guaranteed to work if
  * offset leaves a gap after the previous read/peeked data.
  */
-int qemu_peek_byte(QEMUFile *f, int offset)
+int coroutine_mixed_fn qemu_peek_byte(QEMUFile *f, int offset)
 {
     int index = f->buf_index + offset;
 
@@ -713,7 +713,7 @@ int qemu_peek_byte(QEMUFile *f, int offset)
     return f->buf[index];
 }
 
-int qemu_get_byte(QEMUFile *f)
+int coroutine_mixed_fn qemu_get_byte(QEMUFile *f)
 {
     int result;
 
@@ -894,7 +894,7 @@ int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_src)
  *          else 0
  *          (Note a 0 length string will return 0 either way)
  */
-size_t qemu_get_counted_string(QEMUFile *f, char buf[256])
+size_t coroutine_fn qemu_get_counted_string(QEMUFile *f, char buf[256])
 {
     size_t len = qemu_get_byte(f);
     size_t res = qemu_get_buffer(f, (uint8_t *)buf, len);
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 9d0155a2a12e..d16cd504482a 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -108,8 +108,8 @@ bool qemu_file_is_writable(QEMUFile *f);
 
 #include "migration/qemu-file-types.h"
 
-size_t qemu_peek_buffer(QEMUFile *f, uint8_t **buf, size_t size, size_t offset);
-size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size);
+size_t coroutine_mixed_fn qemu_peek_buffer(QEMUFile *f, uint8_t **buf, size_t size, size_t offset);
+size_t coroutine_mixed_fn qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size);
 ssize_t qemu_put_compression_data(QEMUFile *f, z_stream *stream,
                                   const uint8_t *p, size_t size);
 int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_src);
@@ -119,7 +119,7 @@ int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_src);
  * is; you aren't guaranteed to be able to peak to +n bytes unless you've
  * previously peeked +n-1.
  */
-int qemu_peek_byte(QEMUFile *f, int offset);
+int coroutine_mixed_fn qemu_peek_byte(QEMUFile *f, int offset);
 void qemu_file_skip(QEMUFile *f, int size);
 /*
  * qemu_file_credit_transfer:
-- 
2.40.0


