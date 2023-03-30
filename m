Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C056D0D67
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:07:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwd7-0003Ef-TH; Thu, 30 Mar 2023 14:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwd5-0003DC-Er
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:07 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwd3-00022H-FK
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:07 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9CE571F86C;
 Thu, 30 Mar 2023 18:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJoiJagPKO3t1jkKJrbz4/vjoeEXgERDW7YnvkLu2iI=;
 b=btmmURmEsKQ1qXpv/sGq7pgqjjyYP2Jemw1WRB9P5ID60kWlGxP9HG+BIJQJa5GTGx0mS4
 U3kUr41m9NcclequkcpP49NquXjBNiD4otEur/WEvBqzv+Hbjv4mafouNBu4KVbX/mNo6t
 QRO81nk/lNJ+2KiamVMh1lK4zWTEGks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJoiJagPKO3t1jkKJrbz4/vjoeEXgERDW7YnvkLu2iI=;
 b=eMoloApYy1a7Z8XJwxMaIGRldLZfy/BGKw11gPG8OYaeg9QgTtIKdn+YmW0ZEjwtoUOkop
 T/hIBSwmHiS77qAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53D101348E;
 Thu, 30 Mar 2023 18:03:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kPL9Bg3PJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:03:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>
Subject: [RFC PATCH v1 06/26] io: add and implement
 QIO_CHANNEL_FEATURE_SEEKABLE for channel file
Date: Thu, 30 Mar 2023 15:03:16 -0300
Message-Id: <20230330180336.2791-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Nikolay Borisov <nborisov@suse.com>

Add a generic QIOChannel feature SEEKABLE which would be used by the
qemu_file* apis. For the time being this will be only implemented for
file channels.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/io/channel.h | 1 +
 io/channel-file.c    | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/io/channel.h b/include/io/channel.h
index 153fbd2904..29461dda41 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -44,6 +44,7 @@ enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_LISTEN,
     QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
     QIO_CHANNEL_FEATURE_READ_MSG_PEEK,
+    QIO_CHANNEL_FEATURE_SEEKABLE,
 };
 
 
diff --git a/io/channel-file.c b/io/channel-file.c
index d76663e6ae..a0268232da 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -35,6 +35,10 @@ qio_channel_file_new_fd(int fd)
 
     ioc->fd = fd;
 
+    if (lseek(fd, 0, SEEK_CUR) != (off_t)-1) {
+        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
+    }
+
     trace_qio_channel_file_new_fd(ioc, fd);
 
     return ioc;
@@ -59,6 +63,10 @@ qio_channel_file_new_path(const char *path,
         return NULL;
     }
 
+    if (lseek(ioc->fd, 0, SEEK_CUR) != (off_t)-1) {
+        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SEEKABLE);
+    }
+
     trace_qio_channel_file_new_path(ioc, path, flags, mode, ioc->fd);
 
     return ioc;
-- 
2.35.3


