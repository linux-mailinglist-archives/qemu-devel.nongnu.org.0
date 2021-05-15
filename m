Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EAA38177C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:10:24 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrFX-0006tq-SC
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9D-0005s2-CX; Sat, 15 May 2021 06:03:51 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:47889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr99-0006O0-C6; Sat, 15 May 2021 06:03:51 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N7zJl-1lTmer0cM7-0154DC; Sat, 15
 May 2021 12:03:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/16] virtiofsd: Fix check of chown()'s return value
Date: Sat, 15 May 2021 12:03:24 +0200
Message-Id: <20210515100335.1245468-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yMxAyluc3nKt4dIdebDpTE4Kw1UVmdbj91ORM8n/HuB4pJxHw4u
 fYZSGk1xnjVGTzwtxjMaa+1x+33zKtSqwBMtPKmyKej9YiDIFQRoVv/XWNf5j3Ugx5qtfre
 5dh84ctIcoJoC69UQH3GrIuk9FaKusStJqZO4Km3Ma0jvCz73q3TcfQKg0pwZJByWyt2bM8
 jX8A9W5XiFMBo7RKYIOLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q1N6ik1CI8c=:RfHtMHc5c2lUiva9QArLIN
 OB8XUhF2YJzC5J9ffNo56NV9VASKzqZeylgspVEAqjKs5ilaEw3VhW7KQN9UeDzFVhM3PjVIr
 F0sA6OmJth+xUoOVPNZdVV7TolYqQqgNzMDK5B9QWBbcltM1ImmmOnSvuwhtUZz/+0Mv5qMh3
 kvxGw30uG+GioIAtS2I3d7vxWxSIaI/C1OmggyQpIl9/NEYYoYQeRNy84XFGYpdpNEMqYnaax
 F1I4fhYYbdAE2I8JRCEbE9u+kfP4+MmUdf6X0ghd1y5LtjCpajXa/0EFX7yiblu14m1iOZgzu
 h1yQ0uGc7+b5/EXcbawIgoeZNy+IgndvHEeVfoByLDM3pBTp4YlZl5udmTmn8b49I9c9iTaA/
 U845lyobWiqh3fAUHILoK+ogqR0i7t4pvtn1UAhyh8T+hOGZMPEz6EFPEBS8sNiIN9mHr8Me2
 LS6x/5p92QuoTnhFgc752XLK2O5M1lbgkexA6xtYwBG5YOttPZNaZQNuZJQzInRgf4xnFrHfN
 7923WIZVeojhiW9hG4O8ug=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Otherwise you always get this warning when using --socket-group=users

 vhost socket failed to set group to users (100)

While here, print out the error if chown() fails.

Fixes: f6698f2b03b0 ("tools/virtiofsd: add support for --socket-group")
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <162040394890.714971.15502455176528384778.stgit@bahia.lan>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tools/virtiofsd/fuse_virtio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 1170f375a57a..9efdbd8ffd0a 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -1024,9 +1024,9 @@ static int fv_create_listen_socket(struct fuse_session *se)
     if (se->vu_socket_group) {
         struct group *g = getgrnam(se->vu_socket_group);
         if (g) {
-            if (!chown(se->vu_socket_path, -1, g->gr_gid)) {
+            if (chown(se->vu_socket_path, -1, g->gr_gid) == -1) {
                 fuse_log(FUSE_LOG_WARNING,
-                         "vhost socket failed to set group to %s (%d)\n",
+                         "vhost socket failed to set group to %s (%d): %m\n",
                          se->vu_socket_group, g->gr_gid);
             }
         }
-- 
2.31.1


