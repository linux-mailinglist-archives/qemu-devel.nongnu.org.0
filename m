Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4BD2D9C02
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:11:10 +0100 (CET)
Received: from localhost ([::1]:45448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqRJ-000708-LH
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEi-00084o-Km; Mon, 14 Dec 2020 10:58:08 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:60141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEZ-0001TV-O3; Mon, 14 Dec 2020 10:58:08 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MZTua-1ka79W1VGY-00WTIv; Mon, 14 Dec 2020 16:57:48 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/19] blockdev: Fix a memleak in drive_backup_prepare()
Date: Mon, 14 Dec 2020 16:57:27 +0100
Message-Id: <20201214155733.207430-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:735+zZjV7Kg4dys7SHq0LOXjYZoOFfqX/1cVH3mOYk/haK2LGKb
 Th8U6fcsWdlRLgXmtv1T60/d7Srcj+0kFXNA6R+1ST6eIWA+g0AVy4Y3128i+CeYAE70pjB
 21wf6MP/ruvpsfcNzwy3TNtKiVIutCF7s2sZlMt8gjn/PexMhAbwSeM2DQeGBxRNZGUtsST
 lc3xAghxKEsu6Afh6tIFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ru3d2tFhvI8=:Q63Rp7jrB3UF+FXiXgUYVz
 yY/DkpNF7ifQYBE4UWU5rFn0KoVC/l9cxXCbidNFg8EoWmALQtjyLL4J0FXJ2Xj78XReeeOmX
 SEoErDpuE+jz0BAujXjjvMVITqrGxKXNlDykMvNzG+fc3j6IuCeT88UUjuae4wrmjHxgbuAZW
 gIevbxJXIXs1CZppw0V8Z94JY6XJkBXJfsoYXkBBP95USKBb7gv1skKdHMtUk2rDju5OT3vHW
 jOIVK2JZLs97KTRA6Kdu0k6+uJ+HxIri7Mza4uL0lWkcwY1wcnc0WlHumBUM00+9Br1BxwOWI
 GIzqy5LJ3IkYml/CttP7a2WQcvfaH+Tx2YGkd+dS2hS0qlvzvosXDh6gUhGjrPMODC7cEF3lC
 QVFwUK4Kyi30liDpVjcFaLcxbOu2GNATDW5N0EDXDg1yxu8WE3mUqUS8blJy19dUE7MOasupW
 KjShUm/gig==
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
Cc: Kevin Wolf <kwolf@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Pan Nengyuan <pannengyuan@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

'local_err' seems forgot to propagate in error path, it'll cause
a memleak. Fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Message-Id: <20201023061218.2080844-7-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 blockdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/blockdev.c b/blockdev.c
index 412354b4b6ac..2431448c5d41 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1827,6 +1827,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     if (set_backing_hd) {
         bdrv_set_backing_hd(target_bs, source, &local_err);
         if (local_err) {
+            error_propagate(errp, local_err);
             goto unref;
         }
     }
-- 
2.29.2


