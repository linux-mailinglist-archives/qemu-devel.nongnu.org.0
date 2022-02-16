Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5CC4B8FB8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:53:20 +0100 (CET)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOUR-0001jM-3h
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOFK-00084O-OC
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:37:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOFI-00086B-JY
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645033060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tliLQbwA07mU7vtOTiLoggEC+ZM6J3PcmUOIzuRigj8=;
 b=eq2SXBwrUa3psLmZ3mbhka/2yRmJY2S6LjSenabzGeFO3/hZ3mFzgorUAcAoY19cI8UWZ1
 VuzZDkVIaeZy+6Ys0AQWo2OOkNPrXuoRGTWy8W62jhvjiq2pv82VUnfX8ecE3OydnH3hIl
 GGsrhyZ4e8NaDInAxpLwakNZDw9e5Vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-ap15291bNpywIIqaBvEZUQ-1; Wed, 16 Feb 2022 12:37:36 -0500
X-MC-Unique: ap15291bNpywIIqaBvEZUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA80B8143E5;
 Wed, 16 Feb 2022 17:37:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3BE875740;
 Wed, 16 Feb 2022 17:36:55 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, groug@kaod.org,
 sebastian.hasler@stuvus.uni-stuttgart.de
Subject: [PULL 05/12] virtiofsd: Extend size of fuse_conn_info->capable and
 ->want fields
Date: Wed, 16 Feb 2022 17:36:18 +0000
Message-Id: <20220216173625.128109-6-dgilbert@redhat.com>
In-Reply-To: <20220216173625.128109-1-dgilbert@redhat.com>
References: <20220216173625.128109-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, stefanha@redhat.com, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

->capable keeps track of what capabilities kernel supports and ->wants keep
track of what capabilities filesytem wants.

Right now these fields are 32bit in size. But now fuse has run out of
bits and capabilities can now have bit number which are higher than 31.

That means 32 bit fields are not suffcient anymore. Increase size to 64
bit so that we can add newer capabilities and still be able to use existing
code to check and set the capabilities.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20220208204813.682906-5-vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_common.h   | 4 ++--
 tools/virtiofsd/fuse_lowlevel.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index 0c2665b977..6f8a988202 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -439,7 +439,7 @@ struct fuse_conn_info {
     /**
      * Capability flags that the kernel supports (read-only)
      */
-    unsigned capable;
+    uint64_t capable;
 
     /**
      * Capability flags that the filesystem wants to enable.
@@ -447,7 +447,7 @@ struct fuse_conn_info {
      * libfuse attempts to initialize this field with
      * reasonable default values before calling the init() handler.
      */
-    unsigned want;
+    uint64_t want;
 
     /**
      * Maximum number of pending "background" requests. A
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index b6712b763a..d91cd9743a 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2069,7 +2069,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (se->conn.want & (~se->conn.capable)) {
         fuse_log(FUSE_LOG_ERR,
                  "fuse: error: filesystem requested capabilities "
-                 "0x%x that are not supported by kernel, aborting.\n",
+                 "0x%llx that are not supported by kernel, aborting.\n",
                  se->conn.want & (~se->conn.capable));
         fuse_reply_err(req, EPROTO);
         se->error = -EPROTO;
-- 
2.35.1


