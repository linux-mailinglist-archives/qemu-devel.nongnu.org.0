Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F0B610ED6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:42:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMls-0002Dt-SN; Fri, 28 Oct 2022 06:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMln-0002Bc-TK
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:23 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMlm-00020h-A4
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:23 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8FE1D219F7;
 Fri, 28 Oct 2022 10:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666953559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxNN+bHmh99vHxaMD5hTuWnC6gOpUab965bxfRxyBnw=;
 b=Cof0Z8KRyM/YiZ3Kf63K98qmdkDbJR+X8Gc/IW+z1LIPfJKnw75BvwT+EV+kjc7vqUPLs7
 L3BpPjDl0+E5oyifLyCjkfNtwLPhAAzqlK8KJOsAUlk7hCrbGPVy0DvGdU7iaoS1m/EoPO
 G7OSW0clNqv69M17YgJaqeJSwIff5cM=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C85013A6E;
 Fri, 28 Oct 2022 10:39:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yENfCFexW2PVPwAAMHmgww
 (envelope-from <nborisov@suse.com>); Fri, 28 Oct 2022 10:39:19 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v3 06/14] io: add and implement QIO_CHANNEL_FEATURE_SEEKABLE
 for channel file
Date: Fri, 28 Oct 2022 13:39:06 +0300
Message-Id: <20221028103914.908728-7-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028103914.908728-1-nborisov@suse.com>
References: <20221028103914.908728-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=nborisov@suse.com; helo=smtp-out1.suse.de
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a generic QIOChannel feature SEEKABLE which would be used by the
qemu_file* apis. For the time being this will be only implemented for
file channels.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 include/io/channel.h | 1 +
 io/channel-file.c    | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/io/channel.h b/include/io/channel.h
index 6b10bce8bbdf..b645989e467c 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -41,6 +41,7 @@ enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
     QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
+    QIO_CHANNEL_FEATURE_SEEKABLE,
 };
 
 
diff --git a/io/channel-file.c b/io/channel-file.c
index a7a90c12dc2b..e213a0fd7cd2 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -35,6 +35,11 @@ qio_channel_file_new_fd(int fd)
 
     ioc->fd = fd;
 
+    if (lseek(fd, 0, SEEK_CUR) != (off_t)-1) {
+        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
+    }
+
+    qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
     trace_qio_channel_file_new_fd(ioc, fd);
 
     return ioc;
@@ -59,6 +64,10 @@ qio_channel_file_new_path(const char *path,
         return NULL;
     }
 
+    if (lseek(ioc->fd, 0, SEEK_CUR) != (off_t)-1) {
+        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
+    }
+
     trace_qio_channel_file_new_path(ioc, path, flags, mode, ioc->fd);
 
     return ioc;
-- 
2.34.1


