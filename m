Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ABD11C20A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 02:19:11 +0100 (CET)
Received: from localhost ([::1]:52536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifD8I-0003i6-42
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 20:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58830)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifD7D-0002oW-Ht
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:18:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifD7C-0004xG-D5
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:18:03 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifD7C-0004um-31
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:18:02 -0500
Received: by mail-wr1-x444.google.com with SMTP id t2so820348wrr.1
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 17:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=HS0mYx2ICk6pSEqwdC6wNsFaEiKXYYrwbDgZwYY2qoc=;
 b=Zv+Z/ih6l3wKGkBvoQrtSQRLGXlw3zV+2SW98lLUz2xK+lt+fDeMf1j1yfDszqfIvH
 AwgQJLtjtVDW8blOjc69n6hamktAU2JXMQWp8N0scUaKZLtfR9L2a0ilpjSTbnIMZHLl
 bhiZoE/BW9tddiWRcytG44DPDsyvYMM/Wl9X21abCMP4Uru0QdpTc3K5mg2F7QFh4z39
 r60LT0ifgtjXSlKdxCfLJvZHcnZvgrs64wa+UtiC/QezG94FimLvvj7HiNK0Q671XtEr
 2XOFjgiX7+KMv7LZ7i4OEnloEN0vGMnTYOKciQmLTJMqhOH8vwfNl+Rzb5H3kUB8AW4b
 n9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=HS0mYx2ICk6pSEqwdC6wNsFaEiKXYYrwbDgZwYY2qoc=;
 b=ffq2lBUnmHlhcaB3bumNQsZyMX5PWg/qrcWFeqW/NSy+SU2lvXqYFvs60w7Kvg9Dlx
 mIaAsI4pn0Ac1QUVGi/1q60snOvKchUpCnF7S1qg+APOky3Ne1isIfZ3TLPdRgTgbc/s
 vTDwbvpPO1hdHEs3zIV78Rin/SIWMhS2hDGfDsB305tWyiTP9epUHZyUQOk1fhBR/tDL
 sHxzxecdTyHJWgBaNwqPjiTaBgBwrFFA7Cb95NAWSAggarwAjm05IOGs6tH7TLAjCau5
 XSMPHMKjfNB7+RavQL0NSKTirJLj3can/j69bgJGxwMjNVVlZxGl6bMV3JfdVMzOy8W5
 qaEQ==
X-Gm-Message-State: APjAAAXMb+ANKZHzfK+KFZFqCsW9kIWB15TN2HB6D2dN0SKm3+myFgCq
 2SR6Kf7Roov1SA5ru0w3FqY5r7iA
X-Google-Smtp-Source: APXvYqzCXnQEUdN0F9f4Xb2ycW2IQJZckWU3ICrqv3w+zl2ykz4Vca9LhAqHWAdMJucbi2iWQGnJrA==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr2917443wrv.86.1576113480461; 
 Wed, 11 Dec 2019 17:18:00 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id i8sm4289870wro.47.2019.12.11.17.17.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Dec 2019 17:17:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests: use g_test_rand_int
Date: Thu, 12 Dec 2019 02:17:58 +0100
Message-Id: <1576113478-42926-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_test_rand_int provides a reproducible random integer number, using a
different number seed every time but allowing reproduction using the
--seed command line option.  It is thus better suited to tests than
g_random_int or random.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/ivshmem-test.c | 2 +-
 tests/test-bitmap.c  | 8 ++++----
 tests/test-qga.c     | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/ivshmem-test.c b/tests/ivshmem-test.c
index be9aa92..ecda256 100644
--- a/tests/ivshmem-test.c
+++ b/tests/ivshmem-test.c
@@ -443,7 +443,7 @@ static gchar *mktempshm(int size, int *fd)
     while (true) {
         gchar *name;
 
-        name = g_strdup_printf("/qtest-%u-%u", getpid(), g_random_int());
+        name = g_strdup_printf("/qtest-%u-%u", getpid(), g_test_rand_int());
         *fd = shm_open(name, O_CREAT|O_RDWR|O_EXCL,
                        S_IRWXU|S_IRWXG|S_IRWXO);
         if (*fd > 0) {
diff --git a/tests/test-bitmap.c b/tests/test-bitmap.c
index 087e02a..2f5b714 100644
--- a/tests/test-bitmap.c
+++ b/tests/test-bitmap.c
@@ -22,10 +22,10 @@ static void check_bitmap_copy_with_offset(void)
     bmap2 = bitmap_new(BMAP_SIZE);
     bmap3 = bitmap_new(BMAP_SIZE);
 
-    bmap1[0] = random();
-    bmap1[1] = random();
-    bmap1[2] = random();
-    bmap1[3] = random();
+    bmap1[0] = g_test_rand_int();
+    bmap1[1] = g_test_rand_int();
+    bmap1[2] = g_test_rand_int();
+    bmap1[3] = g_test_rand_int();
     total = BITS_PER_LONG * 4;
 
     /* Shift 115 bits into bmap2 */
diff --git a/tests/test-qga.c b/tests/test-qga.c
index 1ca49bb..d2b2435 100644
--- a/tests/test-qga.c
+++ b/tests/test-qga.c
@@ -143,7 +143,7 @@ static void qmp_assertion_message_error(const char     *domain,
 static void test_qga_sync_delimited(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    guint32 v, r = g_random_int();
+    guint32 v, r = g_test_rand_int();
     unsigned char c;
     QDict *ret;
 
@@ -186,7 +186,7 @@ static void test_qga_sync_delimited(gconstpointer fix)
 static void test_qga_sync(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    guint32 v, r = g_random_int();
+    guint32 v, r = g_test_rand_int();
     QDict *ret;
 
     /*
-- 
1.8.3.1


