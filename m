Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D705F9F87
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:39:15 +0200 (CEST)
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohszy-00078z-1J
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvG-0000zv-Fc
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:23 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:48750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ohsvC-0005KU-Em
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:34:21 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 508661F8F2;
 Mon, 10 Oct 2022 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665408857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPCQLiTt+xycLpMdzoecrm8X5xdA5JatxxJh/K6EFXQ=;
 b=nbp8qs7V3CumbEVUcOBVCtHWoewLDq3+XiTsTXFiFWXOl733FNc1bGtafxUyzhz8Zgo5Yy
 GmvOZTx2yxJccB6oxXDBzowN5Y01s5EixuZOsL8fqBMte+oIGgYc0LLfL5tl79en4ri1TA
 e2IUyG0pY460uWeF4PwYAIlSLPPaBQI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C180C13479;
 Mon, 10 Oct 2022 13:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MF1zLFgfRGNsAwAAMHmgww
 (envelope-from <nborisov@suse.com>); Mon, 10 Oct 2022 13:34:16 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v2 07/11] migration: add qemu_get_buffer_at
Date: Mon, 10 Oct 2022 16:34:04 +0300
Message-Id: <20221010133408.3214433-8-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010133408.3214433-1-nborisov@suse.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=nborisov@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restoring a 'fixed-ram' enabled migration stream would require reading
from specific offsets in the file so add a helper to QEMUFile that uses
the newly introduced qio_channel_file_preadv.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 migration/qemu-file.c | 23 +++++++++++++++++++++++
 migration/qemu-file.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 07ba1125e83f..73fffbdb9b7e 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -564,6 +564,29 @@ void qemu_put_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t po
     return;
 }
 
+
+size_t qemu_get_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos)
+{
+    Error *err = NULL;
+    struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
+    ssize_t ret;
+
+    if (f->last_error) {
+        return 0;
+    }
+
+    ret = qio_channel_file_preadv(f->ioc, &iov, 1, pos, &err);
+    if (ret == -1) {
+	    goto error;
+    }
+
+    return (size_t)ret;
+
+ error:
+    qemu_file_set_error_obj(f, -EIO, err);
+    return 0;
+}
+
 void qemu_set_offset(QEMUFile *f, off_t off, int whence)
 {
     Error *err = NULL;
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 33cfc07b81d1..ab10c3ad7e42 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -151,6 +151,7 @@ void qemu_file_set_blocking(QEMUFile *f, bool block);
 void qemu_set_offset(QEMUFile *f, off_t off, int whence);
 off_t qemu_get_offset(QEMUFile *f);
 void qemu_put_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos);
+size_t qemu_get_buffer_at(QEMUFile *f, const uint8_t *buf, size_t buflen, off_t pos);
 
 void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
-- 
2.34.1


