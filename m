Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95542D955
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:33:35 +0200 (CEST)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazvS-0003FR-7x
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mazoR-0002eB-PI
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:26:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mazoP-0005qa-4D
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634214376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A36PDf1cOLGw5pexrSQUsw40QoWe3Skt/wEZ0j/KAFE=;
 b=QT/hjQqKuxDkTbtE0Qo/5rvzSBcFeO9SuETppASS1yzGPaJPYN92lOPmrDmyFPe5wDtqFL
 AAyHWRlmQ/96hJGjCcPcfh+VcPd7srSkvzj/ElyUIh7fnwuvMQZDqCyIzeykFWKxjUOuBH
 8viY5knaolpIJlbjHdQzYihN6yuDiEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-ohbH62fhPp-jrRBfMT0fzA-1; Thu, 14 Oct 2021 08:26:15 -0400
X-MC-Unique: ohbH62fhPp-jrRBfMT0fzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 365978015C7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 12:26:14 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.192.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07CFF57CD0;
 Thu, 14 Oct 2021 12:25:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH] virtiofsd: Error on bad socket group name
Date: Thu, 14 Oct 2021 13:25:54 +0100
Message-Id: <20211014122554.34599-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: xiagao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Make the '--socket-group=' option fail if the group name is unknown:

./tools/virtiofsd/virtiofsd .... --socket-group=zaphod
vhost socket: unable to find group 'zaphod'

Reported-by: Xiaoling Gao <xiagao@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 8f4fd165b9..39eebffb62 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -999,6 +999,13 @@ static int fv_create_listen_socket(struct fuse_session *se)
                          "vhost socket failed to set group to %s (%d): %m\n",
                          se->vu_socket_group, g->gr_gid);
             }
+        } else {
+            fuse_log(FUSE_LOG_ERR,
+                     "vhost socket: unable to find group '%s'\n",
+                     se->vu_socket_group);
+            close(listen_sock);
+            umask(old_umask);
+            return -1;
         }
     }
     umask(old_umask);
-- 
2.31.1


