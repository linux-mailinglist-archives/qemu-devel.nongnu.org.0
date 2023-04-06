Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B456D9401
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:28:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMqo-0005yY-5n; Thu, 06 Apr 2023 06:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMql-0005xj-RW
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMqk-00015P-1W
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680776893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ax3kWFSBLuHYlkmgU/aMev86zxfS4A9Tx6uOPoi7pXo=;
 b=IA6bnp9ivhYazEsU1T1cI1eKaaUbZHYyIyw576SaV7oLse8S+E6bpt5EWvEWHogroovnDi
 dfrRgIO0rfXomMPVOq1bG0hOMXP0FEhs82SjETy9hzcYEFgJEEBqx6VV2nyoB0GlqBFMI8
 wGvzb5plHGq74poWslyKpEYva3zmEZo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-5uGdMreNMYmHEq4OF8x6Hw-1; Thu, 06 Apr 2023 06:28:11 -0400
X-MC-Unique: 5uGdMreNMYmHEq4OF8x6Hw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-93e99877f3dso69635766b.0
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680776890; x=1683368890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ax3kWFSBLuHYlkmgU/aMev86zxfS4A9Tx6uOPoi7pXo=;
 b=EDee1LoefyBEbEvL837lyTUPkKjVzIKpQaUwKN4w9Um0BdB/KdB7FxDVC95ZO6ZDgW
 DcdQiZXkzQXWom1kcD5Y1Hi+ImlSbx9sOq6yY8Ite6Gk/UakoCV3gow8l6hyGUA2ncEV
 C+VzukxSxnM8cEp++rg/l5ZjBNkPJ3kl5Ll/UxgGMnPa4R1VJtPdMPSwcA25cPm5NXC7
 G0yYx0v4Gc0oWfskxw9fYttd79AWCJjvLXkf8Z48fs7RYWTihLlVgOCZDhCfxRwqhk6a
 nPhFawV5+cqoYWF78BtrL4bhai72Z3GbMcBG9Hetjk6v6HButvRq8/OYnxz0mYQN/5VI
 ObFQ==
X-Gm-Message-State: AAQBX9eoT3BRH4NFMGJldXhrcJOOxzE37tcpt8uz4+UJWhl+eEJbfybX
 vjiszqItHY5BEn+ar01RWz8YXAP+SC1Tdp2OJXaevrKU9+arrB0RWAetF9YSBSJPaJgppMzZNpv
 Ocj1jqsnxyrsgfv+i+hmY/GQ1SmXUiLgg7eoJPKhvLCKbmrYIS4vPOHTfFzSSk44kIPf9bPKykI
 0=
X-Received: by 2002:aa7:c70a:0:b0:4f9:f07d:a978 with SMTP id
 i10-20020aa7c70a000000b004f9f07da978mr4678035edq.5.1680776890332; 
 Thu, 06 Apr 2023 03:28:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350aM7W3/t9ExtMUi9wQP/k31GrHodN1dD+VTyj16THMPfgXBclymtm9ZtKqvlZccE4j8c/gbSw==
X-Received: by 2002:aa7:c70a:0:b0:4f9:f07d:a978 with SMTP id
 i10-20020aa7c70a000000b004f9f07da978mr4678018edq.5.1680776889900; 
 Thu, 06 Apr 2023 03:28:09 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a50c350000000b004c0c5864cc5sm568221edb.25.2023.04.06.03.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 03:28:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com
Subject: [PATCH] migration: mark mixed functions that can suspend
Date: Thu,  6 Apr 2023 12:28:08 +0200
Message-Id: <20230406102808.243438-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
2.39.2


