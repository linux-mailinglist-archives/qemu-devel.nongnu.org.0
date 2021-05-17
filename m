Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE0E383CC1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:54:54 +0200 (CEST)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiOD-0007l7-LH
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlg-0006kE-Tc
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:05 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:48655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlT-0004Vv-9J
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:04 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MuF4v-1lUcrD1jCv-00uaUe; Mon, 17
 May 2021 20:14:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 38/59] linux-user/s390x: Fix sigcontext sregs value
Date: Mon, 17 May 2021 20:14:03 +0200
Message-Id: <20210517181424.8093-39-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:blckr7dxOt6fnn2c3pCRwPDgp5g7P1ua3NjcL3r8XgPzah913oK
 BNk7o563760D+qv9v8cBEbtNK/s3GFdM0Xogv7y9ofR/nDRtEItR2h0ThkbgWoTXVh7o15F
 Qk8nn2OzaHTng1FR+kXUPdb6cMVUUhYGYh5yb13H842+v8dyeRnpGxNVNwMRhtMId3m7yru
 6Uw9i18vHcXWmOZBswJbg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ge27jKV5ccs=:nJax0jS16w/hYU0/2ZNwr2
 C+FKcejJGgvMHWAvjS37mhWAuTgoDRXPrkUGdQ3AVcZc9WeHfUp72yBpz1pLpUVdXkjRVejoP
 vws5JSqdKLK5r3kw0nX0H4x+gD+XGXqcQjsw5X3cIp6+NR3uHkSnOWrvoeXTouw2HHNztJ5p/
 7EWfdrhYmeA+lSdkhECzevk/PDCOVa6YCgTMUozm7y9yDRWJGFVIoPVCpP55++kNDDEW04R2V
 23OV/tKPbN+2RZXTXu4BNfFPCqRagMwufhj0t7eWScoZjWEsgf8aWcJQC8YkK9efwC+0dguGG
 DI8IqAxMQj3IXP9pW4QTXK+N6IQEHNVf2nvJDirz09ibacbGNeerUBqcAmcijvnG4ft21H8sI
 yEcPkR4rbjk2sg6HrCF8xJi1qZV9m+K/n7xHYX37FSmOMTquVeD+9EbhFmLvM94wx2pQrc02D
 FB8oqoovE6U3nSyA+VY3A0avZcAsTrT+YRWQlNMD0XQLBebUg9yptA5u+hbXbgnKmlZqlixwo
 O+2YIQ6ZQtJR9XE+zM7rnA=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Using the host address of &frame->sregs is incorrect.
We need the guest address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-7-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index dcc6f7bc0274..f8515dd3329b 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -142,7 +142,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     save_sigregs(env, &frame->sregs);
 
-    __put_user((abi_ulong)(unsigned long)&frame->sregs, &frame->sc.sregs);
+    __put_user(frame_addr + offsetof(sigframe, sregs), &frame->sc.sregs);
 
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
-- 
2.31.1


