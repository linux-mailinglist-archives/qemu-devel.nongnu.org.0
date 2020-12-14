Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C677C2D9BCE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:07:34 +0100 (CET)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqNp-0001ll-Or
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEf-0007xY-Uh; Mon, 14 Dec 2020 10:58:05 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:53107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEW-0001Rf-Oq; Mon, 14 Dec 2020 10:58:05 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MI5cP-1krMvG1fq3-00FDR2; Mon, 14 Dec 2020 16:57:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/19] elf2dmp/qemu_elf: Plug memleak in QEMU_Elf_init
Date: Mon, 14 Dec 2020 16:57:24 +0100
Message-Id: <20201214155733.207430-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PtXP+yICFZb0DJUq14VYTCi8rkarqEddAG8h1oC1sJPCdQT4+ku
 mA7uoZgpXsNbUE/r1QE+uyZzzZRUKY0hSl9O8pbBvzmHXD9gL5I3GkgStMScos6Ll3DcYlr
 wgt8mUPgs3tykIhDjf16CRxSsvDu5CdwjZwlTvVvFZdJh28Obej+VGJiRr6mZxmC0RopiKW
 YodcFpiaQ/n+QGaEgXNyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7yLRA248l1E=:I5kTAPgFvHrEpf+H8y69GG
 OzgBhW54yglq4dQ4slmb15OAjct0D+beLUr+SNvqrHfp9hlUoZCW+E0gYLcEdb9rCl+RatsZH
 thruSszZuRqDvpBUBx+vp+SIkHeh1CbrZ02W05Bub+NFQw05jjnuI67JMxlu+cRMaODtGMz9O
 mNswV6yi/yZeSeBFtRTjhYQgPAh88yaLdQ43eJQrsC6XJ+80z3clJa02u1XS39e8OzKGkjCpM
 4KpIpyjzPRbFGyr9QhF0bw7wuQsh0vEXKkiqGl0Hralqhk02JkMJ+Wg8EnhXF/PzpQAAW1ra0
 CiqbR/tUALmu6Ubyd6OzLwS2byNOKOa/lsIaTJBj6F0dh+e7JrCbDBXsYIzU5S8DQS/XdhsTg
 6jqnjYFIg6/MbhS8uZdg9H+/rzh7eAkUJPg1hXCjw1pRWKQXTOpKpIrpivsdWegYEuYf7U24k
 fVT4TQALNQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: Thomas Huth <thuth@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Pan Nengyuan <pannengyuan@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, Euler Robot <euler.robot@huawei.com>,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

Missing g_error_free in QEMU_Elf_init() error path. Fix that.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201023061218.2080844-4-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 contrib/elf2dmp/qemu_elf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/elf2dmp/qemu_elf.c b/contrib/elf2dmp/qemu_elf.c
index 0db781658628..b601b6d7ba44 100644
--- a/contrib/elf2dmp/qemu_elf.c
+++ b/contrib/elf2dmp/qemu_elf.c
@@ -126,6 +126,7 @@ int QEMU_Elf_init(QEMU_Elf *qe, const char *filename)
     qe->gmf = g_mapped_file_new(filename, TRUE, &gerr);
     if (gerr) {
         eprintf("Failed to map ELF dump file \'%s\'\n", filename);
+        g_error_free(gerr);
         return 1;
     }
 
-- 
2.29.2


