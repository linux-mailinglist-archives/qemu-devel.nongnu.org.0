Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5596431B9A4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:49:38 +0100 (CET)
Received: from localhost ([::1]:53396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdJp-0006ap-9O
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFr-00041e-7E
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:31 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:57407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFn-0000fq-VS
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:30 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MPGNn-1lWk4u1ZK1-00PfAD; Mon, 15 Feb 2021 13:45:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] linux-user: fix O_NONBLOCK usage for hppa target
Date: Mon, 15 Feb 2021 13:45:11 +0100
Message-Id: <20210215124519.720265-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EzY8OY8vIkdi38FGaibpVXauhPAkY8FXX1qRSMW5bzIFnAm3Z8G
 gepABBiP9Kd0rh/qVVYFkkgS38E7GYDpAJGU+6N8HH8V8Db2JMF5HnvfXksnnCakHAyJasL
 /6r0vd/YLY5+Vr4y+S+4e6jRe+80YpDoocqJ60n1u1Q0I3myMFJdbGKa3pFsClclK1gydpZ
 HWodlhbuEeWdtBHMoh6Kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X1g62lQpgh8=:n1uLvePFhm0QV8/Fn9aCwn
 qlAjWjTj86hG66WTk9SDKv+v70rONI8nQT15vTzcsGoq9HOH8AeAjxqgFNAs8RVOSCIP9en3h
 p03VhHbu8AM7Nn+qcRRxP22R+gzNY/SBEUwGFw+aQm5BDFJHopF3mUD1TuSMAO2WX6mXjqQrm
 PzN+oIu6IwNGb1+LjxLOCFjEJKxwgJ+KIL9i3o/n6RxA+ZYzrzsLPSI/0ApAp7Zn+1kHy3gNR
 Rt4d4m99pfRWSDwaFLIDiuUYBvyxLcWi/nd0ivOVvx5qVo6TDF5efxi5+vU5Mziah3L7vYI7N
 G1+OTpdpP66ffXvPjsb1teP+GnacLALLC+fNeHk8PydRx1FtOw/H0CsmR+3+urAxteSsCFNln
 yqMHkU9fS2hbsJZOYnvQufklfCMuWB3urKE6UpMwWtsQ4jPszIvngSweiTTjD
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

Historically the parisc linux port tried to be compatible with HP-UX
userspace and as such defined the O_NONBLOCK constant to 0200004 to
emulate separate NDELAY & NONBLOCK values.

Since parisc was the only Linux platform which had two bits set, this
produced various userspace issues. Finally it was decided to drop the
(never completed) HP-UX compatibilty, which is why O_NONBLOCK was
changed upstream to only have one bit set in future with this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75ae04206a4d0e4f541c1d692b7febd1c0fdb814

This patch simply adjusts the value for qemu-user too.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210201220551.GA8015@ls3530.fritz.box>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/target_fcntl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
index 9eaeef9d8e7b..08e3a4fcb0b7 100644
--- a/linux-user/hppa/target_fcntl.h
+++ b/linux-user/hppa/target_fcntl.h
@@ -8,7 +8,7 @@
 #ifndef HPPA_TARGET_FCNTL_H
 #define HPPA_TARGET_FCNTL_H
 
-#define TARGET_O_NONBLOCK    000200004 /* HPUX has separate NDELAY & NONBLOCK */
+#define TARGET_O_NONBLOCK    000200000
 #define TARGET_O_APPEND      000000010
 #define TARGET_O_CREAT       000000400 /* not fcntl */
 #define TARGET_O_EXCL        000002000 /* not fcntl */
-- 
2.29.2


