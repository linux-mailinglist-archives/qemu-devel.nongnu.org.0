Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02670F4F9C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 16:28:13 +0100 (CET)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT6BF-0006Sf-PM
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 10:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iT5pz-00077R-UQ
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:06:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iT5py-0006Up-Ov
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:06:11 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35846
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iT5py-0006Ul-LU
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 10:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573225570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p8tsVTUfoEfZv9VhDPcAAEq3rQMQDEoIiccaTGADpU8=;
 b=P0SYLfkJGVGCb11QTJjMqlUAk20H+WQ5mqs3rRZmk/zucwuAvpgmMnkM1I+T0e4bcj9o+e
 VzYnts2khSCvYJi8K/ae7bGbj1rKfJaN9Pg8bSv/DbBsgMzb7B5avj8H6BL+nAv2LB/qRP
 tP7sD80B4N2Q4pc8eLmS4ZWpJDdnY7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-_sIIgBRpN5GmaQELGwyHUQ-1; Fri, 08 Nov 2019 10:06:07 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 018C3800C72
 for <qemu-devel@nongnu.org>; Fri,  8 Nov 2019 15:06:07 +0000 (UTC)
Received: from localhost (ovpn-112-25.ams2.redhat.com [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62F8350;
 Fri,  8 Nov 2019 15:05:58 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 20/25] osdep: add qemu_unlink()
Date: Fri,  8 Nov 2019 19:01:18 +0400
Message-Id: <20191108150123.12213-21-marcandre.lureau@redhat.com>
In-Reply-To: <20191108150123.12213-1-marcandre.lureau@redhat.com>
References: <20191108150123.12213-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: _sIIgBRpN5GmaQELGwyHUQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 armbru@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a helper function to match qemu_open() which may return files
under the /dev/fdset prefix. Those shouldn't be removed, since it's
only a qemu namespace.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/osdep.h |  1 +
 util/osdep.c         | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 0f97d68586..9bd3dcfd13 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -462,6 +462,7 @@ int qemu_mprotect_none(void *addr, size_t size);
=20
 int qemu_open(const char *name, int flags, ...);
 int qemu_close(int fd);
+int qemu_unlink(const char *name);
 #ifndef _WIN32
 int qemu_dup(int fd);
 #endif
diff --git a/util/osdep.c b/util/osdep.c
index 3f04326040..f7d06050f7 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -370,6 +370,21 @@ int qemu_close(int fd)
     return close(fd);
 }
=20
+/*
+ * Delete a file from the filesystem, unless the filename is /dev/fdset/..=
.
+ *
+ * Returns: On success, zero is returned.  On error, -1 is returned,
+ * and errno is set appropriately.
+ */
+int qemu_unlink(const char *name)
+{
+    if (g_str_has_prefix(name, "/dev/fdset/")) {
+        return 0;
+    }
+
+    return unlink(name);
+}
+
 /*
  * A variant of write(2) which handles partial write.
  *
--=20
2.24.0


