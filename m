Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6105850D3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 15:23:15 +0200 (CEST)
Received: from localhost ([::1]:49406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHPxS-0008Mn-4J
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 09:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1oHPrh-00036D-07
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:17:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1oHPrd-0003il-Dt
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659100630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=hVhPPtyE/uqaNn22OicvA1tRwCMhnL/oaNiFnmCk3Yk=;
 b=Cdd++CLljMss/2JQMUtOKXtLiiTED84vWJ3vAX8SHhRLKYKjPkjqkFZf4OdhYgbvJ2yFMA
 WA2Dy+txZMX168HtUqeSJ6HDgeqwXEeqPo3JIBczgpWFc574+cYKBzzRdtmua6OAMuQDNN
 scdW7fCJjyg4D8qvF7NouNnPg/ThFYY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-QSVXwWu8Mfq0Z2Cv0fda6A-1; Fri, 29 Jul 2022 09:17:07 -0400
X-MC-Unique: QSVXwWu8Mfq0Z2Cv0fda6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BA1B280D200
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 13:17:07 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E911918EB7;
 Fri, 29 Jul 2022 13:17:06 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 9DB702237EB; Fri, 29 Jul 2022 09:17:06 -0400 (EDT)
Date: Fri, 29 Jul 2022 09:17:06 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: virtio-fs-list <virtio-fs@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Subject: [PATCH] virtiofsd: Disable killpriv_v2 by default
Message-ID: <YuPd0itNIAz4tQRt@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are having bunch of issues with killpriv_v2 enabled by default. First
of all it relies on clearing suid/sgid bits as needed by dropping
capability CAP_FSETID. This does not work for remote filesystems like
NFS (and possibly others). 

Secondly, we are noticing other issues related to clearing of SGID
which leads to failures for xfstests generic/355 and generic/193.

Thirdly, there are other issues w.r.t caching of metadata (suid/sgid)
bits in fuse client with killpriv_v2 enabled. Guest can cache that
data for sometime even if cleared on server.

Second and Third issue are fixable. Just that it might take a little
while to get it fixed in kernel. First one will probably not see
any movement for a long time.

Given these issues, killpriv_v2 does not seem to be a good candidate
for enabling by default. We have already disabled it by default in
rust version of virtiofsd.

Hence this patch disabled killpriv_v2 by default. User can choose to
enable it by passing option "-o killpriv_v2".

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c |   13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
===================================================================
--- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2022-07-29 08:19:05.925119947 -0400
+++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2022-07-29 08:27:08.048049096 -0400
@@ -767,19 +767,10 @@ static void lo_init(void *userdata, stru
         fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling killpriv_v2\n");
         conn->want |= FUSE_CAP_HANDLE_KILLPRIV_V2;
         lo->killpriv_v2 = 1;
-    } else if (lo->user_killpriv_v2 == -1 &&
-               conn->capable & FUSE_CAP_HANDLE_KILLPRIV_V2) {
-        /*
-         * User did not specify a value for killpriv_v2. By default enable it
-         * if connection offers this capability
-         */
-        fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling killpriv_v2\n");
-        conn->want |= FUSE_CAP_HANDLE_KILLPRIV_V2;
-        lo->killpriv_v2 = 1;
     } else {
         /*
-         * Either user specified to disable killpriv_v2, or connection does
-         * not offer this capability. Disable killpriv_v2 in both the cases
+         * Either user specified to disable killpriv_v2, or did not
+         * specify anything. Disable killpriv_v2 in both the cases.
          */
         fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling killpriv_v2\n");
         conn->want &= ~FUSE_CAP_HANDLE_KILLPRIV_V2;


