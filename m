Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33A31D056
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:42:30 +0100 (CET)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5Ir-0006ff-Cg
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5Eg-0004U7-76
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:38:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5Ee-0000If-KM
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613500686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bPppjYUr8n0R4SImxdmVnZA7LVYOuJ5fA7nHO7XOr8=;
 b=Rh0PCgHlj+jSYdiFbrDKdSMW+auvw401lwD/GdYUmozcneprtDHmiLmuhqxJFuXqosQyDh
 Yfz0L9Ju/GwFviIsBq7kashIQhQNvek2qE52XKtZ5HxpKHEshdXKfSV5IbRD6e9MludIxl
 3MFX7k7L5/iJ6BZa4WWBSHQEmRlA0Qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-PVJAtutHObS5YUqkpHJBJw-1; Tue, 16 Feb 2021 13:38:03 -0500
X-MC-Unique: PVJAtutHObS5YUqkpHJBJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ECF884E254;
 Tue, 16 Feb 2021 18:38:02 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-109.ams2.redhat.com
 [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3B0E5C1B4;
 Tue, 16 Feb 2021 18:37:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, wainersm@redhat.com, groug@kaod.org,
 philmd@redhat.com, vgoyal@redhat.com
Subject: [PULL 6/6] virtiofsd: Do not use a thread pool by default
Date: Tue, 16 Feb 2021 18:37:34 +0000
Message-Id: <20210216183734.57810-7-dgilbert@redhat.com>
In-Reply-To: <20210216183734.57810-1-dgilbert@redhat.com>
References: <20210216183734.57810-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

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
Message-Id: <20210210182744.27324-2-vgoyal@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index f78692ef66..1aa26c6333 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -18,7 +18,7 @@
 
 #include <sys/file.h>
 
-#define THREAD_POOL_SIZE 64
+#define THREAD_POOL_SIZE 0
 
 #define OFFSET_MAX 0x7fffffffffffffffLL
 
-- 
2.29.2


