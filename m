Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22D6691FFD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTgk-0007rb-PA; Fri, 10 Feb 2023 08:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>) id 1pQRYA-0003cP-Ul
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:26:42 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>) id 1pQRY6-00033g-7E
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:26:41 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98F316752D;
 Fri, 10 Feb 2023 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676028392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rPO7Tl5ZAji92Jbza+uQUlcMvktjS3fjWKiTWL5j7g4=;
 b=N/KCXa/W8Tbj7axofwqyfOqjM1Ues5oEo2SlSiRGFsbQbCZMra4g0AJNBu9bECivfzCZXn
 MWpdajzVA1KQGLeDPnAMllap8wIosiRXaKhVV5d8EidcweEBrCgJ1MbuHNV0bYsV7aOisX
 5XawODh/lYnHD1HpbHRAoDUyVVMwui4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676028392;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rPO7Tl5ZAji92Jbza+uQUlcMvktjS3fjWKiTWL5j7g4=;
 b=rbAAouO3MbP1b4OPm2WktKL4q4OsvSWnACKKPDDGloA50V0Fo27no0/NziaiIPRT4o3lLd
 b/ZODcAqk0vgbUDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BCAE1325E;
 Fri, 10 Feb 2023 11:26:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TRrwDugp5mM3aQAAMHmgww
 (envelope-from <clopez@suse.de>); Fri, 10 Feb 2023 11:26:32 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] libvhost-user: check for NULL when allocating a virtqueue
 element
Date: Fri, 10 Feb 2023 12:25:15 +0100
Message-Id: <20230210112514.16858-1-clopez@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=clopez@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Feb 2023 08:43:40 -0500
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

Check the return value for malloc(), avoiding a NULL pointer
dereference, and propagate error in function callers.

Found with GCC 13 and -fanalyzer:

../subprojects/libvhost-user/libvhost-user.c: In function ‘virtqueue_alloc_element’:
../subprojects/libvhost-user/libvhost-user.c:2556:19: error: dereference of possibly-NULL ‘elem’ [CWE-690] [-Werror=analyzer-possible-null-dereference]
 2556 |     elem->out_num = out_num;
      |     ~~~~~~~~~~~~~~^~~~~~~~~
  ‘virtqueue_alloc_element’: event 1
    |
    | 2554 |     assert(sz >= sizeof(VuVirtqElement));
    |      |     ^~~~~~
    |      |     |
    |      |     (1) following ‘true’ branch (when ‘sz > 31’)...
    |
  ‘virtqueue_alloc_element’: events 2-4
    |
    | 2555 |     elem = malloc(out_sg_end);
    |      |     ^~~~   ~~~~~~~~~~~~~~~~~~
    |      |     |      |
    |      |     |      (3) this call could return NULL
    |      |     (2) ...to here
    | 2556 |     elem->out_num = out_num;
    |      |     ~~~~~~~~~~~~~~~~~~~~~~~
    |      |                   |
    |      |                   (4) ‘elem’ could be NULL: unchecked value from (3)
    |

Signed-off-by: Carlos López <clopez@suse.de>
---
 subprojects/libvhost-user/libvhost-user.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index fc69783d2b..225bbbe3c8 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2553,6 +2553,10 @@ virtqueue_alloc_element(size_t sz,
 
     assert(sz >= sizeof(VuVirtqElement));
     elem = malloc(out_sg_end);
+    if (!elem) {
+        DPRINT("%s: failed to malloc virtqueue element\n", __func__);
+        return NULL;
+    }
     elem->out_num = out_num;
     elem->in_num = in_num;
     elem->in_sg = (void *)elem + in_sg_ofs;
@@ -2639,6 +2643,9 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
 
     /* Now copy what we have collected and mapped */
     elem = virtqueue_alloc_element(sz, out_num, in_num);
+    if (!elem) {
+        return NULL;
+    }
     elem->index = idx;
     for (i = 0; i < out_num; i++) {
         elem->out_sg[i] = iov[i];
-- 
2.35.3


