Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D5D4997CA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 22:32:25 +0100 (CET)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6wq-0005Zu-0M
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 16:32:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nC6q4-0004EB-SM
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:25:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nC6pz-0005HU-IX
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643059516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpJ5fAGNHH/Ij5bJAGdlwOtd80yBH2QsF/6GahKYcC0=;
 b=cduKogNbu72yRxkhNL27ixiiJQ1fbzjT3BEWBaiJ7JEKEPjZJjumQVge7wQSmewwT3oESS
 2HL8kySHsaph9Y4/ryYqvKL66HhleN9pmBNqeYrURHOi1FF6cNldM7BbZsYDZAQ6X3U1rC
 Nn51coouaewCDZF3rtGtNJswI0+kKY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-9vDECSyiPDCEmc8yzocBmg-1; Mon, 24 Jan 2022 16:25:15 -0500
X-MC-Unique: 9vDECSyiPDCEmc8yzocBmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E9DC192FDA1
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 21:25:14 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 386244D737;
 Mon, 24 Jan 2022 21:25:14 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id B79C6223E7A; Mon, 24 Jan 2022 16:25:13 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 2/9] virtiofsd: Fix breakage due to fuse_init_in size change
Date: Mon, 24 Jan 2022 16:24:48 -0500
Message-Id: <20220124212455.83968-3-vgoyal@redhat.com>
In-Reply-To: <20220124212455.83968-1-vgoyal@redhat.com>
References: <20220124212455.83968-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mszeredi@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kernel version 5.17 has increased the size of "struct fuse_init_in" struct.
Previously this struct was 16 bytes and now it has been extended to
64 bytes in size.

Once qemu headers are updated to latest, it will expect to receive 64 byte
size struct (for protocol version major 7 and minor > 6). But if guest is
booting older kernel (older than 5.17), then it still sends older
fuse_init_in of size 16 bytes. And do_init() fails. It is expecting
64 byte struct. And this results in mount of virtiofs failing.

Fix this by parsing 16 bytes only for now. Separate patches will be
posted which will parse rest of the bytes and enable new functionality.
Right now we don't support any of the new functionality, so we don't
lose anything by not parsing bytes beyond 16.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index e4679c73ab..ce29a70253 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1880,6 +1880,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
                     struct fuse_mbuf_iter *iter)
 {
     size_t compat_size = offsetof(struct fuse_init_in, max_readahead);
+    size_t compat2_size = offsetof(struct fuse_init_in, flags) + sizeof(uint32_t);
     struct fuse_init_in *arg;
     struct fuse_init_out outarg;
     struct fuse_session *se = req->se;
@@ -1897,7 +1898,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
 
     /* ...and now consume the new fields. */
     if (arg->major == 7 && arg->minor >= 6) {
-        if (!fuse_mbuf_iter_advance(iter, sizeof(*arg) - compat_size)) {
+        if (!fuse_mbuf_iter_advance(iter, compat2_size - compat_size)) {
             fuse_reply_err(req, EINVAL);
             return;
         }
-- 
2.31.1


