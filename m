Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61EF516499
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 15:25:01 +0200 (CEST)
Received: from localhost ([::1]:32958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl9ZM-0004NX-PV
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 09:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <951fe2f89f46f5d51eead066556edc7369e23915@lizzy.crudebyte.com>)
 id 1nl9Sb-0001Do-J9
 for qemu-devel@nongnu.org; Sun, 01 May 2022 09:18:01 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:49419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <951fe2f89f46f5d51eead066556edc7369e23915@lizzy.crudebyte.com>)
 id 1nl9SY-0005HV-Az
 for qemu-devel@nongnu.org; Sun, 01 May 2022 09:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=UHp1FZ3jSPBJ1DJ+nvKwoCAHVka/edXXXWSQF8lJAW0=; b=ODFdM
 pcmeoyyyf87c7yU2Qcc5czpA/Vwl0hG6MhBM7wt1J3NQcvxjzLmV3u/MXjMjcc9VXRsj4S7hADjmV
 4INzloTdfLwB7s4oBGTH7b5KRU+YmNJTe0t9qMCh90BT/vcAbU/d4pco3KNFL1KG8JCi7O82594zb
 71tN0KytoyU/6WsWsaawL8OEwmaT/r1apPVCsz5SQCXLIdLCWWNF4pCH1dMhMHtUSayXEg6/G3kRv
 MetYrVpdzFR9uS1Q4OWpvyMdGWTtljutxGobzCtTedpzTm6CL1s2etuio3RhV4m+g6G5GxAAKWPnn
 dC/4FmzzEzCNvI8zxJvxymggMsfbQ==;
Message-Id: <951fe2f89f46f5d51eead066556edc7369e23915.1651410615.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1651410615.git.qemu_oss@crudebyte.com>
References: <cover.1651410615.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 01 May 2022 15:10:16 +0200
Subject: [PULL v2 5/7] 9pfs: fix wrong errno being sent to Linux client on
 macOS host
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=951fe2f89f46f5d51eead066556edc7369e23915@lizzy.crudebyte.com;
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
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <b322ab298a62069e527d2b032028bdc9115afacd.1651228001.git.qemu_oss@crudebyte.com>
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
2.30.2


