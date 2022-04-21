Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4985750A55F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:27:55 +0200 (CEST)
Received: from localhost ([::1]:50584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZes-0003vK-34
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <eee249e308d99bb72ede83fef7bb7dc5a54ec43e@lizzy.crudebyte.com>)
 id 1nhYlJ-0005ym-4G; Thu, 21 Apr 2022 11:30:29 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:59121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <eee249e308d99bb72ede83fef7bb7dc5a54ec43e@lizzy.crudebyte.com>)
 id 1nhYkw-00086e-Oi; Thu, 21 Apr 2022 11:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=QsVY2zjD9aqJJYFr/7np1NGV5vFcJmG6mUCglu8h6ME=; b=XBy7r
 eBuOPQDYO/yCsEDxME3DqdBOt86tZ/4SQrGotx+erZVUMZlHbslyC3/1IcUXtUDrdb5WyezVwvwMn
 GOi76+1juCF9G+kHN+xf0QZSMd5gfHvKnjlQtVmXVL+8yfy/97fdseQCEtAhcL33RxMZyx1P66iNh
 h+nE740WRux5AdOBhqMsQxpgPUJG/IXGdF7O3N6Qgs6NkFGIceECiWopGdXv2HYoTJ59PkPbuLtLr
 v4D3FIcCpvoxZgjhfgON5kGIDVCky1dqB7SrsCbdazd40SCgcNCi/LvUG+umE13NbRFaV9tWLWiWI
 jU6qnFQ7p1OqVdg6a0zrbV0zZuxhA==;
Message-Id: <eee249e308d99bb72ede83fef7bb7dc5a54ec43e.1650553693.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1650553693.git.qemu_oss@crudebyte.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 21 Apr 2022 17:07:49 +0200
Subject: [PATCH v2 4/5] 9pfs: fix wrong errno being sent to Linux client on
 macOS host
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=eee249e308d99bb72ede83fef7bb7dc5a54ec43e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Linux and macOS only share some errno definitions with equal macro
name and value. In fact most mappings for errno are completely
different on the two systems.

This patch converts some important errno values from macOS host to
corresponding Linux errno values before eventually sending such error
codes along with 'Rlerror' replies (if 9p2000.L is used that is). Not
having translated errnos before violated the 9p2000.L protocol spec,
which says:

  "
  size[4] Rlerror tag[2] ecode[4]

  ... ecode is a numerical Linux errno.
  "

  https://github.com/chaos/diod/wiki/protocol#lerror----return-error-code

This patch fixes a bunch of misbehaviours when running a Linux client
on macOS host. For instance this patch fixes:

  mount -t 9p -o posixacl ...

on Linux guest if security_mode=mapped was used for 9p server, which
refused to mount successfully, because macOS returned ENOATTR==93
when client tried to retrieve POSIX ACL xattrs, because errno 93
is defined as EPROTONOSUPPORT==93 on Linux, so Linux client believed
that xattrs were not supported by filesystem on host in general.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Link: https://lore.kernel.org/qemu-devel/20220421124835.3e664669@bahia/
---
 hw/9pfs/9p-util.h | 30 ++++++++++++++++++++++++++++++
 hw/9pfs/9p.c      |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 2cc9a5dbfb..c3526144c9 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -58,6 +58,36 @@ static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
 #endif
 }
 
+/* Translates errno from host -> Linux if needed */
+static inline int errno_to_dotl(int err) {
+#if defined(CONFIG_LINUX)
+    /* nothing to translate (Linux -> Linux) */
+#elif defined(CONFIG_DARWIN)
+    /*
+     * translation mandatory for macOS hosts
+     *
+     * FIXME: Only most important errnos translated here yet, this should be
+     * extended to as many errnos being translated as possible in future.
+     */
+    if (err == ENAMETOOLONG) {
+        err = 36; /* ==ENAMETOOLONG on Linux */
+    } else if (err == ENOTEMPTY) {
+        err = 39; /* ==ENOTEMPTY on Linux */
+    } else if (err == ELOOP) {
+        err = 40; /* ==ELOOP on Linux */
+    } else if (err == ENOATTR) {
+        err = 61; /* ==ENODATA on Linux */
+    } else if (err == ENOTSUP) {
+        err = 95; /* ==EOPNOTSUPP on Linux */
+    } else if (err == EOPNOTSUPP) {
+        err = 95; /* ==EOPNOTSUPP on Linux */
+    }
+#else
+#error Missing errno translation to Linux for this host system
+#endif
+    return err;
+}
+
 #ifdef CONFIG_DARWIN
 #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
 #define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 4a296a0b94..0cd0c14c2a 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1054,6 +1054,8 @@ static void coroutine_fn pdu_complete(V9fsPDU *pdu, ssize_t len)
             }
             len += ret;
             id = P9_RERROR;
+        } else {
+            err = errno_to_dotl(err);
         }
 
         ret = pdu_marshal(pdu, len, "d", err);
-- 
2.32.0 (Apple Git-132)


