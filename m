Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F537687D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:14:25 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf37Q-0006gL-6w
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lf35y-00060o-60
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:12:54 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:50463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lf35v-0005qH-UF
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:12:53 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-26bNcMCoNnSPibWcMQdsaA-1; Fri, 07 May 2021 12:12:31 -0400
X-MC-Unique: 26bNcMCoNnSPibWcMQdsaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81FCD6D588;
 Fri,  7 May 2021 16:12:30 +0000 (UTC)
Received: from bahia.lan (ovpn-112-195.ams2.redhat.com [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4B705D741;
 Fri,  7 May 2021 16:12:29 +0000 (UTC)
Subject: [PATCH] virtiofsd: Fix check of chown()'s return value
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 07 May 2021 18:12:28 +0200
Message-ID: <162040394890.714971.15502455176528384778.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise you always get this warning when using --socket-group=3Dusers

 vhost socket failed to set group to users (100)

While here, print out the error if chown() fails.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/fuse_virtio.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 3e13997406bf..638d3ffe2f8a 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -978,9 +978,9 @@ static int fv_create_listen_socket(struct fuse_session =
*se)
     if (se->vu_socket_group) {
         struct group *g =3D getgrnam(se->vu_socket_group);
         if (g) {
-            if (!chown(se->vu_socket_path, -1, g->gr_gid)) {
+            if (chown(se->vu_socket_path, -1, g->gr_gid) =3D=3D -1) {
                 fuse_log(FUSE_LOG_WARNING,
-                         "vhost socket failed to set group to %s (%d)\n",
+                         "vhost socket failed to set group to %s (%d): %m\=
n",
                          se->vu_socket_group, g->gr_gid);
             }
         }



