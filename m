Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCA850BF68
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:25:40 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxyM-0001tE-Rx
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhxcR-0000t5-Do
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:03:01 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:53115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhxcN-0000jd-Ao
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:References:In-Reply-To:
 Content-ID:Content-Description;
 bh=XRgs5dgoBGBDr9oS5MRbFhujpNneuzIzg2K4+SgByuA=; b=LTDQ4JRHSj7PS7jOvG31dv/Q7W
 ZB5cT+8p9nbf0eUz5yz+8PNMcOu8i0/sHYrLMr3C/t55uXOeknvcQDdlGTXTeMpLgihR40eBAQrJl
 P8l8Yv+c2+K3v1qKaaDgvgjT/zsxA/Gt8AP0vETbSgpH+/Oypsirx7HCyP9w9S5r9Ny+XmwPHYsPh
 OD0V3dy2DL0UwsPda7DPkigL/etquLdpVrlB4a09h5JMZbQruEXzTWncpVrqar8Pu+2lSR9If/7vj
 6Sfamqo8kSVgsRbeLyTkBYnX6ubInNVSO4lRPybZO0yubOK1HC2gLVQOlrVaDga2fNKMRVP8a1TwZ
 a5O+Mt7SbmZCZ5whMbAq6J/sbt3uRetJNum0op4p4Znw31xcjBGhLnzh6SjDFFt3BbvYihp6cKqn7
 dkTGuC1GoUabk3W6/3J1KoJHonNV04yf5QB93sTVhwRrcZxIdWrKbEz6Z4ct2yZuBSshH8WGtUbiz
 nHkhgpU2Sp4VB5Nd4X/4W4aZjSWomDcCPXUPtxBntMzd5yZ2VuUorQlLZkeLD+smipJlYjfUoGSJz
 jOZzjLoKQXDyvGhRGNtsJdM0GXy9JXuSlLg+kwYpj7/s3+tMQV1MB6hBmAYF+UHfpIB3b4kVxThdl
 Ha2e37FPpqkbh9tzHmQsXrvnrM6fckHGNMhBwlTnM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Latchesar Ionkov <lucho@ionkov.net>
Subject: [RFC PATCH] 9p: case-insensitive host filesystems
Date: Fri, 22 Apr 2022 20:02:46 +0200
Message-ID: <1757498.AyhHxzoH2B@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now that 9p support for macOS hosts just landed in QEMU 7.0 and with support 
for Windows hosts on the horizon [1], the question is how to deal with case-
insensitive host filesystems, which are very common on those two systems?

I made some tests, e.g. trying to setup a 9p root fs Linux installation on a 
macOS host as described in the QEMU HOWTO [2], which at a certain point causes 
the debootstrap script to fail when trying to unpack the 'libpam-runtime' 
package. That's because it would try to create this symlink:

  /usr/share/man/man7/PAM.7.gz -> /usr/share/man/man7/pam.7.gz

which fails with EEXIST on a case-insensitive APFS. Unfortunately you can't 
easily switch an existing APFS partition to case-sensitivity. It requires to 
reformat the entire partition, loosing all your data, etc.

So I did a quick test with QEMU as outlined below, trying to simply let 9p 
server "eat" EEXIST errors in such cases, but then I realized that most of the 
time it would not even come that far, as Linux client would first send a 
'Twalk' request to check whether target symlink entry already exists, and as 
it gets a positive response from 9p server (again, due to case-insensitivity) 
client would stop right there without even trying to send a 'Tsymlink' 
request.

So maybe it's better to handle case-insensitivity entirely on client side? 
I've read that some generic "case fold" code has landed in the Linux kernel 
recently that might do the trick?

Should 9p server give a hint to 9p client that it's a case-insensitive fs? And 
if yes, once per entire exported fs or rather for each directory (as there 
might be submounts on host)?

[1] https://lore.kernel.org/all/20220408171013.912436-1-bmeng.cn@gmail.com/
[2] https://wiki.qemu.org/Documentation/9p_root_fs

---
 hw/9pfs/9p-local.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d42ce6d8b8..d6cb45c758 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -39,6 +39,10 @@
 #endif
 #endif
 #include <sys/ioctl.h>
+#ifdef CONFIG_DARWIN
+#include <glib.h>
+#include <glib/gprintf.h>
+#endif
 
 #ifndef XFS_SUPER_MAGIC
 #define XFS_SUPER_MAGIC  0x58465342
@@ -57,6 +61,18 @@ typedef struct {
     int mountfd;
 } LocalData;
 
+#ifdef CONFIG_DARWIN
+
+/* Compare strings case-insensitive (assuming UTF-8 encoding). */
+static int p9_stricmp(const char *a, const char *b)
+{
+    g_autofree gchar *cia = g_utf8_casefold(a, -1);
+    g_autofree gchar *cib = g_utf8_casefold(b, -1);
+    return g_utf8_collate(cia, cib);
+}
+
+#endif
+
 int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
                         mode_t mode)
 {
@@ -931,6 +947,25 @@ static int local_symlink(FsContext *fs_ctx, const char 
*oldpath,
                fs_ctx->export_flags & V9FS_SM_NONE) {
         err = symlinkat(oldpath, dirfd, name);
         if (err) {
+#if CONFIG_DARWIN
+            if (errno == EEXIST) {
+                printf("  -> symlinkat(oldpath='%s', dirfd=%d, name='%s') = 
EEXIST\n", oldpath, dirfd, name);
+            }
+            if (errno == EEXIST &&
+                strcmp(oldpath, name) && !p9_stricmp(oldpath, name))
+            {
+                struct stat st1, st2;
+                const int cur_errno = errno;
+                if (!fstatat(dirfd, oldpath, &st1, AT_SYMLINK_NOFOLLOW) &&
+                    !fstatat(dirfd, name, &st2, AT_SYMLINK_NOFOLLOW) &&
+                    st1.st_dev == st2.st_dev && st1.st_ino == st2.st_ino)
+                {
+                    printf("  -> iCASE SAME\n");
+                    err = 0;
+                }
+                errno = cur_errno;
+            }
+#endif
             goto out;
         }
         err = fchownat(dirfd, name, credp->fc_uid, credp->fc_gid,
@@ -983,6 +1018,25 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
 
     ret = linkat(odirfd, oname, ndirfd, name, 0);
     if (ret < 0) {
+#if CONFIG_DARWIN
+        if (errno == EEXIST) {
+            printf("  -> linkat(odirfd=%d, oname='%s', ndirfd=%d, name='%s') 
= EEXIST\n", odirfd, oname, ndirfd, name);
+        }
+        if (errno == EEXIST &&
+            strcmp(oname, name) && !p9_stricmp(oname, name))
+        {
+            struct stat st1, st2;
+            const int cur_errno = errno;
+            if (!fstatat(odirfd, oname, &st1, AT_SYMLINK_NOFOLLOW) &&
+                !fstatat(ndirfd, name, &st2, AT_SYMLINK_NOFOLLOW) &&
+                st1.st_dev == st2.st_dev && st1.st_ino == st2.st_ino)
+            {
+                printf("  -> iCASE SAME\n");
+                ret = 0;
+            }
+            errno = cur_errno;
+        }
+#endif
         goto out_close;
     }
 
-- 
2.32.0 (Apple Git-132)





