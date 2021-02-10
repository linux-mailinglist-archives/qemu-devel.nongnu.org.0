Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E9D316EA1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 19:30:20 +0100 (CET)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9uFm-0000UI-Fy
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 13:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l9uEC-0008Cq-2I
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l9uE6-0006k9-NI
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 13:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612981710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ywXMJ57u7mxnJnv9y1hUBepiXSNrUv/iIWQOf22l3Y0=;
 b=Ch7zWwo8eDroCKJLxdh1hW+Fh5/YP8E1IdOf2s5vBq71BkXDpZbTVbHo71ZQBG4zNVe/w6
 FinsXy5tNZDZIiH9bMHUrwNrBEiheyy/UmtbKRp2KT4BgUd7noeTk34wql/LZKu7Z2snjz
 ZFF+y5t0lztp/fQ9dd635J72PcJxJVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-e7kGAz9APMuhAUK_PEJu5w-1; Wed, 10 Feb 2021 13:28:29 -0500
X-MC-Unique: e7kGAz9APMuhAUK_PEJu5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 724CDCE642
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 18:28:28 +0000 (UTC)
Received: from horse.redhat.com (ovpn-113-163.rdu2.redhat.com [10.10.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCA5F5C6AB;
 Wed, 10 Feb 2021 18:28:21 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 4493D223D98; Wed, 10 Feb 2021 13:28:21 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 1/1] virtiofsd: Do not use a thread pool by default
Date: Wed, 10 Feb 2021 13:27:44 -0500
Message-Id: <20210210182744.27324-2-vgoyal@redhat.com>
In-Reply-To: <20210210182744.27324-1-vgoyal@redhat.com>
References: <20210210182744.27324-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we created a thread pool (With 64 max threads per pool) for
each virtqueue. We hoped that this will provide us with better scalability
and performance.

But in practice, we are getting better numbers in most of the cases
when we don't create a thread pool at all and a single thread per
virtqueue receives the request and processes it.

Hence, I am proposing that we switch to no thread pool by default
(equivalent of --thread-pool-size=0). This will provide out of
box better performance to most of the users. In fact other users
have confirmed that not using a thread pool gives them better
numbers. So why not use this as default. It can be changed when
somebody can fix the issues with thread pool performance.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index e94b71110b..fbdf62ee9b 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -18,7 +18,7 @@
 
 #include <sys/file.h>
 
-#define THREAD_POOL_SIZE 64
+#define THREAD_POOL_SIZE 0
 
 #define OFFSET_MAX 0x7fffffffffffffffLL
 
-- 
2.25.4


