Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA7E143CF2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 13:34:59 +0100 (CET)
Received: from localhost ([::1]:53128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itskE-00051w-36
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 07:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsbN-0005lP-Sl
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:25:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsbM-0001yh-OB
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:25:49 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23012
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsbM-0001yZ-KQ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cKdr2jk4Gs9eG6psTe5oiPCvbvp8DeH+qgnINx8wnRI=;
 b=YYdKb1ExUNhOm+mL4txNbVUUnN1KYxAM4JFo2gI/lrwL0Spr9C0MkCGKoqDaDj7/Jz0Lq2
 kQ/zqwzUDPkfJri3oXtY7iY+zzysMb5gHsBYay70AdR7bDAF5uZNw5DBjf01iT/heuagpJ
 eHIMnkUTonNWrjbvh8d3a6UoaVKBk6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-kuKrnRMiPdS-lF2csCpasw-1; Tue, 21 Jan 2020 07:25:46 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B13B7A0CBF;
 Tue, 21 Jan 2020 12:25:45 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DFA160BE0;
 Tue, 21 Jan 2020 12:25:41 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 013/109] vitriofsd/passthrough_ll: fix fallocate() ifdefs
Date: Tue, 21 Jan 2020 12:22:57 +0000
Message-Id: <20200121122433.50803-14-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: kuKrnRMiPdS-lF2csCpasw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiao Yang <yangx.jy@cn.fujitsu.com>

1) Use correct CONFIG_FALLOCATE macro to check if fallocate() is supported.=
(i.e configure
   script sets CONFIG_FALLOCATE intead of HAVE_FALLOCATE if fallocate() is =
supported)
2) Replace HAVE_POSIX_FALLOCATE with CONFIG_POSIX_FALLOCATE.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  Merged from two of Xiao Yang's patches
---
 tools/virtiofsd/passthrough_ll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index e702f7dec6..e1f76170f6 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -974,13 +974,13 @@ static void lo_fallocate(fuse_req_t req, fuse_ino_t i=
no, int mode, off_t offset,
     int err =3D EOPNOTSUPP;
     (void)ino;
=20
-#ifdef HAVE_FALLOCATE
+#ifdef CONFIG_FALLOCATE
     err =3D fallocate(fi->fh, mode, offset, length);
     if (err < 0) {
         err =3D errno;
     }
=20
-#elif defined(HAVE_POSIX_FALLOCATE)
+#elif defined(CONFIG_POSIX_FALLOCATE)
     if (mode) {
         fuse_reply_err(req, EOPNOTSUPP);
         return;
--=20
2.24.1


