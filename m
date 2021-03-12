Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAA1339034
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:42:19 +0100 (CET)
Received: from localhost ([::1]:32770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiza-0006k3-4s
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKiUi-0002hy-Gs
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:10:24 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:58326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKiUg-0003wq-TA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 09:10:24 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-2MY1dohRM4-VGnZJoCtmeQ-1; Fri, 12 Mar 2021 09:10:18 -0500
X-MC-Unique: 2MY1dohRM4-VGnZJoCtmeQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CB07EC1A2;
 Fri, 12 Mar 2021 14:10:17 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B4AF5D6D7;
 Fri, 12 Mar 2021 14:10:15 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] virtiofsd: Convert some functions to return bool
Date: Fri, 12 Mar 2021 15:10:02 +0100
Message-Id: <20210312141003.819108-3-groug@kaod.org>
In-Reply-To: <20210312141003.819108-1-groug@kaod.org>
References: <20210312141003.819108-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <mszeredi@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both currently only return 0 or 1.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/passthrough_ll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 27a6c636dcaf..f63016d35626 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -221,17 +221,17 @@ static struct lo_inode *lo_find(struct lo_data *lo, s=
truct stat *st,
 static int xattr_map_client(const struct lo_data *lo, const char *client_n=
ame,
                             char **out_name);
=20
-static int is_dot_or_dotdot(const char *name)
+static bool is_dot_or_dotdot(const char *name)
 {
     return name[0] =3D=3D '.' &&
            (name[1] =3D=3D '\0' || (name[1] =3D=3D '.' && name[2] =3D=3D '=
\0'));
 }
=20
 /* Is `path` a single path component that is not "." or ".."? */
-static int is_safe_path_component(const char *path)
+static bool is_safe_path_component(const char *path)
 {
     if (strchr(path, '/')) {
-        return 0;
+        return false;
     }
=20
     return !is_dot_or_dotdot(path);
--=20
2.26.2


