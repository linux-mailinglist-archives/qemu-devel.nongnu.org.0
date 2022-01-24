Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0584997AE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 22:29:25 +0100 (CET)
Received: from localhost ([::1]:60826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6tw-0000h1-AC
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 16:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nC6qA-0004G2-7T
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:25:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nC6q3-0005Hh-Jp
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643059517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/g/LXhkbE8+3+qxuZKpirQzG6Je9wxEiOrxXHsSH9HU=;
 b=FrQYSDQoifpvHLbhtIiEZanhFnWE69gG2+2ZInahCNb10docoXKoKGx0O5kuVggCZRKdX+
 2UrzVoxLtDTTeKqWwR8JJEUhwgocOX6dlYC4L2+9gNU+jae9Mf2F4q155kAxxAVeEEQaS9
 jlY1rK+RoHMJ1G4eAWabfKzYOhXolQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-bqzelNYTP2yJUtdFdA4LKA-1; Mon, 24 Jan 2022 16:25:15 -0500
X-MC-Unique: bqzelNYTP2yJUtdFdA4LKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0DD1801B2D
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 21:25:14 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3F65DB8A;
 Mon, 24 Jan 2022 21:25:14 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id C1AAD2241C5; Mon, 24 Jan 2022 16:25:13 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 4/9] virtiofsd: Extend size of fuse_conn_info->capable and
 ->want fields
Date: Mon, 24 Jan 2022 16:24:50 -0500
Message-Id: <20220124212455.83968-5-vgoyal@redhat.com>
In-Reply-To: <20220124212455.83968-1-vgoyal@redhat.com>
References: <20220124212455.83968-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

->capable keeps track of what capabilities kernel supports and ->wants keep
track of what capabilities filesytem wants.

Right now these fields are 32bit in size. But now fuse has run out of
bits and capabilities can now have bit number which are higher than 31.

That means 32 bit fields are not suffcient anymore. Increase size to 64
bit so that we can add newer capabilities and still be able to use existing
code to check and set the capabilities.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
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
index c3af5ede08..f3f5e70be6 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2063,7 +2063,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (se->conn.want & (~se->conn.capable)) {
         fuse_log(FUSE_LOG_ERR,
                  "fuse: error: filesystem requested capabilities "
-                 "0x%x that are not supported by kernel, aborting.\n",
+                 "0x%lx that are not supported by kernel, aborting.\n",
                  se->conn.want & (~se->conn.capable));
         fuse_reply_err(req, EPROTO);
         se->error = -EPROTO;
-- 
2.31.1


