Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875732D9C4B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:17:31 +0100 (CET)
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqXS-0006TW-Im
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEi-00085N-TH; Mon, 14 Dec 2020 10:58:08 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEb-0001TX-D9; Mon, 14 Dec 2020 10:58:08 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MIdaF-1krv9b190P-00EfCk; Mon, 14 Dec 2020 16:57:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/19] elf2dmp/pdb: Plug memleak in pdb_init_from_file
Date: Mon, 14 Dec 2020 16:57:25 +0100
Message-Id: <20201214155733.207430-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:spLQwwA7LagXLll9BNNWryX/92vE+OvP2KVXM5sehnSTSkoBBCG
 vtzrz4mXtqstfQVkSlBSmh7jVl4lMAJ/CjTjG3LJ1HKORxPfc9U+zT+Hl3cv2Xl0FboNQ/O
 S8kMOgvSLolOfBzFznya/YWBm/vveOjV2qkjy2O57nC8CkgqVVi34b9jvrfPT3YQhczmoVd
 ErLi/0HxP2bZ4jEkgPJYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aHhxv+F5UdU=:YP/iHiyI3wo1xBc1ny4SXd
 5Op4samjG8xWWZAgAzxOa+qGVP06QFz751nKFxCGMzwbpwuL1db1L3x1NiKa64DwIKjDwdaqS
 DnCClFuBpYfmtKmUq4ibA8DRXycl3mscjG3JZ7kV0YQLdZ2JxE7e3WnFbsmuNsMVEjeQxszM1
 wBssFfCzQLSxqdcYLB8qGMpwHZfx9JxtF2b3Ot0gB5kChOPE8jno5poJGlk1alchT1vuA9Za8
 CF5mSxjNfXjopgfUQal3cFeFBmwr3jq0L4FcisPeQOhhlY5re0f/tiFMZaut4DHAjj/lMGVHt
 8OqQHIl4Eshqo8y5aheyJMOczMaWX8DOIE+w00tM+gj881kefX1W77DHsfvGmDkK1y9227Nhj
 Ik2vpWie5qCumqK4WvJ0dUOIJqUcUArVmhbBsIbGYOpa+0tnZBgrt790971kbamlIERhzsQIJ
 CxVQOlSuGQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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

Missing g_error_free in pdb_init_from_file() error path. Fix that.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201023061218.2080844-5-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 contrib/elf2dmp/pdb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/elf2dmp/pdb.c b/contrib/elf2dmp/pdb.c
index a5bd40c99dca..b3a65470680d 100644
--- a/contrib/elf2dmp/pdb.c
+++ b/contrib/elf2dmp/pdb.c
@@ -285,6 +285,7 @@ int pdb_init_from_file(const char *name, struct pdb_reader *reader)
     reader->gmf = g_mapped_file_new(name, TRUE, &gerr);
     if (gerr) {
         eprintf("Failed to map PDB file \'%s\'\n", name);
+        g_error_free(gerr);
         return 1;
     }
 
-- 
2.29.2


