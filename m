Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2434BD23
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:09:19 +0200 (CEST)
Received: from localhost ([::1]:35204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXyY-00062P-3j
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lQXvp-0004aU-Oo
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:06:29 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:47627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lQXvn-00072f-NR
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:06:29 -0400
Received: from localhost.localdomain ([82.142.14.126]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MBll6-1lL0Xj1lhE-00C8Ld; Sun, 28 Mar 2021 18:06:23 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] linux-user: allow NULL msg in recvfrom
Date: Sun, 28 Mar 2021 18:06:19 +0200
Message-Id: <20210328160619.4015954-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210328160619.4015954-1-laurent@vivier.eu>
References: <20210328160619.4015954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nSU7qInET3MOjEoGbPYr93QEizEe1B+PKXVRNxN47fQ6VoazWOm
 /V6yTUSTHcWhxwDZLLdD9UfCHqUb0B+ZupFDnY3tqJ42325Ds/6zP37/Plae9vbqEDK49gs
 5I1YRef+B7Et9YFbS6b27PS6b2y17P+d/ZZJ8/AOGdfoYpDY7zvjvvBJ73+j6h2VNcZPrT6
 cETGd+fXc+xEEMkGCFbKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nHqJWvHFz6U=:gEC++wB7dAZzNWtTRHEiKc
 6RFVySPSo2HkBWw+vs2fqR0pjs6BDTrGMvxrPDyWemmeKO7HWB8C03UvXX09fVJ26bL0DTGjH
 9CKVyIlBoM2W/esfJ5RfcYp70uj+ZU8yBX+BYSR/7zw7KHT84iZxIXgL7uswG3hsKXA6YyU6c
 +KgVlgGyq4HtSY8cxMMK8pPpEYvZXzuA9i+0Xz7EEUgG+8shwmS6wGE7fvcE+N60zRE4gOR1a
 vyC0RtdQAa9yfu6pOY9beOEvalOTULhZKsx+t779Pt63WiMxw6Cck2Os921x80ZAzrr9XXzTd
 zhIydTgFOZpza9KhuKXJUok0xiHSu4em+dJGe9eZ3YvV3C6J+bwSJ8pX2+i2xexxII1t+AHZs
 l6nhgsv9c0t75o7w7eB+z9k/t3TA6iX3v5Cl86sfUzC40QuQOAOgZlhSIHrIV5YoWAYnxWrQ8
 0Uk1DjXDcwAe8M2rRm2PJngs6bPCb5RVQXC2LWk0rk3Y0Dy5F3sA
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: Zach Reizner <zachr@google.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zach Reizner <zachr@google.com>

The kernel allows a NULL msg in recvfrom so that he size of the next
message may be queried before allocating a correctly sized buffer. This
change allows the syscall translator to pass along the NULL msg pointer
instead of returning early with EFAULT.

Signed-off-by: Zach Reizner <zachr@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <CAFNex=DvFCq=AQf+=19fTfw-T8eZZT=3NnFFm2JMFvVr5QgQyA@mail.gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1e508576c73e..294779c86f4d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3679,9 +3679,14 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
     void *host_msg;
     abi_long ret;
 
-    host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
-    if (!host_msg)
-        return -TARGET_EFAULT;
+    if (!msg) {
+        host_msg = NULL;
+    } else {
+        host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
+        if (!host_msg) {
+            return -TARGET_EFAULT;
+        }
+    }
     if (target_addr) {
         if (get_user_u32(addrlen, target_addrlen)) {
             ret = -TARGET_EFAULT;
-- 
2.30.2


