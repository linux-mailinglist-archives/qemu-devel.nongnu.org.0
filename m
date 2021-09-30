Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB0241DE61
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:06:05 +0200 (CEST)
Received: from localhost ([::1]:60860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyZQ-0007b1-ND
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1c-00057j-F8
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1a-0002Xb-Pc
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VPDvlcrpZ2AsiC5cScB9dMXGiEwsSW+lSbyy/+MdwU=;
 b=CXGxW+MXm2pYknauFM8mokGezTTpPlxPuSbNUoXfRR9vVWL5GosK6irAhJoLJxexiQh0ly
 ZPRaVxnXtyzTrg4CQXPIk1G2lnCEONRSSLyzsiYloIyL4U81E5XkEwajFU9T1pZWH8iLnk
 +wWa3vflYSkvPGlMHG0P5ua7scdZqVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-CbnGJfFgOtqE5JWJ8Men7g-1; Thu, 30 Sep 2021 11:31:02 -0400
X-MC-Unique: CbnGJfFgOtqE5JWJ8Men7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55D4610168C7;
 Thu, 30 Sep 2021 15:31:01 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D96519729;
 Thu, 30 Sep 2021 15:30:48 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id CCE3C228281; Thu, 30 Sep 2021 11:30:47 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 02/13] virtiofsd: fuse.h header file changes for lock
 notification
Date: Thu, 30 Sep 2021 11:30:26 -0400
Message-Id: <20210930153037.1194279-3-vgoyal@redhat.com>
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jaggel@bu.edu, iangelak@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change comes from fuse.h kernel header file udpate. Hence keeping
it in a separate patch.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 include/standard-headers/linux/fuse.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/standard-headers/linux/fuse.h b/include/standard-headers/linux/fuse.h
index cce105bfba..0b6218d569 100644
--- a/include/standard-headers/linux/fuse.h
+++ b/include/standard-headers/linux/fuse.h
@@ -181,6 +181,8 @@
  *  - add FUSE_OPEN_KILL_SUIDGID
  *  - extend fuse_setxattr_in, add FUSE_SETXATTR_EXT
  *  - add FUSE_SETXATTR_ACL_KILL_SGID
+ *  7.35
+ *  - add FUSE_NOTIFY_LOCK
  */
 
 #ifndef _LINUX_FUSE_H
@@ -212,7 +214,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 33
+#define FUSE_KERNEL_MINOR_VERSION 35
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -521,6 +523,7 @@ enum fuse_notify_code {
 	FUSE_NOTIFY_STORE = 4,
 	FUSE_NOTIFY_RETRIEVE = 5,
 	FUSE_NOTIFY_DELETE = 6,
+	FUSE_NOTIFY_LOCK = 7,
 	FUSE_NOTIFY_CODE_MAX,
 };
 
@@ -912,6 +915,12 @@ struct fuse_notify_retrieve_in {
 	uint64_t	dummy4;
 };
 
+struct fuse_notify_lock_out {
+	uint64_t	unique;
+	int32_t		error;
+	int32_t		padding;
+};
+
 /* Device ioctls: */
 #define FUSE_DEV_IOC_MAGIC		229
 #define FUSE_DEV_IOC_CLONE		_IOR(FUSE_DEV_IOC_MAGIC, 0, uint32_t)
-- 
2.31.1


