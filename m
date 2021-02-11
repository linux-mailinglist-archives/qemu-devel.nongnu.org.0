Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04079318CC4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:58:18 +0100 (CET)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACU5-0004ER-2U
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAC2s-0004CK-8M
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 08:30:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAC2q-0003xo-Cc
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 08:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613050207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZLSxsDaC68a8VLJ5/p55dCqnJ+rUSp0X3QepOh4w9+w=;
 b=YiKiEQQy1Mr35ZRCEg+CfK1bEvyJWfvVDDC4gmyke0c7ccmd/21nc2ycqaxnn3aXtm+SYY
 mnFuQtWL8WhinM3hywefCrSMpmFrVhuSd8wTZMrFfdPKVwhr2OCQXZ225B9CvAfd7hzfFM
 qGQTVd6zwd/9ymJW3AE5LRN+cw2Lx4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-16IVXu6iNoaXyH3pF0IcoQ-1; Thu, 11 Feb 2021 08:30:04 -0500
X-MC-Unique: 16IVXu6iNoaXyH3pF0IcoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AA3580404F;
 Thu, 11 Feb 2021 13:30:03 +0000 (UTC)
Received: from thuth.com (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E80E2BFE7;
 Thu, 11 Feb 2021 13:30:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Subject: [PATCH] linux-user/syscall: Silence warning from the undefined
 behavior sanitizer
Date: Thu, 11 Feb 2021 14:29:59 +0100
Message-Id: <20210211132959.574168-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling QEMU with -fsanitize=undefined, there is a warning when
running "make check-tcg":

  TEST    linux-test on m68k
../linux-user/syscall.c:10499:34: runtime error: member access within
 misaligned address 0x00008006df3c for type 'struct linux_dirent64',
 which requires 8 byte alignment
0x00008006df3c: note: pointer points here
  00 00 00 00 68 03 28 00  00 00 00 00 5b 96 3e e4  61 4b 05 26 18 00 04 2e  00 00 00 00 da 3f 18 00
              ^

It's likely not an issue in reality, since I assume that on hosts where
the alignment really matters (like sparc64), the Linux kernel likely
adds the right padding. Anyway, let's use the stw_p() / stq_p() accessor
helpers here to silence the warning and thus to allow to compile the code
with -fsanitize=undefined, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 linux-user/syscall.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 34760779c8..50de535ade 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10491,20 +10491,22 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 return -TARGET_EFAULT;
             ret = get_errno(sys_getdents64(arg1, dirp, count));
             if (!is_error(ret)) {
-                struct linux_dirent64 *de;
+                char *de;
                 int len = ret;
                 int reclen;
-                de = dirp;
+                de = (char *)dirp;
+                #define de64(x) offsetof(struct linux_dirent64, x)
                 while (len > 0) {
-                    reclen = de->d_reclen;
+                    reclen = lduw_he_p(de + de64(d_reclen));
                     if (reclen > len)
                         break;
-                    de->d_reclen = tswap16(reclen);
-                    tswap64s((uint64_t *)&de->d_ino);
-                    tswap64s((uint64_t *)&de->d_off);
-                    de = (struct linux_dirent64 *)((char *)de + reclen);
+                    stw_p(de + de64(d_reclen), reclen);
+                    stq_p(de + de64(d_ino), ldq_he_p(de + de64(d_ino)));
+                    stq_p(de + de64(d_off), ldq_he_p(de + de64(d_off)));
+                    de += reclen;
                     len -= reclen;
                 }
+                #undef de64
             }
             unlock_user(dirp, arg2, ret);
         }
-- 
2.27.0


