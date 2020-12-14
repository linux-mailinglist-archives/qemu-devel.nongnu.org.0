Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B302D9C4E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:19:24 +0100 (CET)
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqZH-00018L-Oa
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEj-00086M-DT; Mon, 14 Dec 2020 10:58:09 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:54421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEd-0001Tk-85; Mon, 14 Dec 2020 10:58:09 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N4i7l-1k4t0W0EB5-011fGC; Mon, 14 Dec 2020 16:57:47 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/19] block/file-posix: fix a possible undefined behavior
Date: Mon, 14 Dec 2020 16:57:26 +0100
Message-Id: <20201214155733.207430-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qLDPQrEQtWG2Dg8c4z8b4jPx7wioZRQYyfh02lniGNRyZgW6mcH
 yhMzXtwahF9OUjwU9OMfdyrh4hmSD2pnjckaIx0kDeS8plhW4OPaQJJmXCCBJ9p2c625S6j
 hb7CAJq8hMjzsthFFp78RH7aKlmfwCy0BWXtM1pWc0OSuhiBqxK5HkUX0OemwtvmD63H1fL
 HCGKR3AnaIwPCkUPRbHFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3mjSvXPmnhs=:NPP9GK/c2W8/WX3hkIKezS
 cDOIlq2Ng7CrvMIsf4AQtoLGzRzJ0edp5v0rhpiEWWrTmELQ/2O7IBnJWuBik8QPNKucnHsvT
 gixjUh6YRgFMhFVwETcuDkLXJv2Upp9PTxxTCVCxUQ9XbGV3HoaNWjCevKOyxRgo6V4Gtkwe7
 n710NQgNL7FxranOuJK8o5K9h+Bst5aBys6Ly9tPcTXanSIX7BmZwkd6lU49ucggCY9LOrrSG
 cQBFWsQlkcEts2TjGEJTBgu9wCYne+NTI0reoss4/fnAg0Za7y+tekXHNCp+en2gNnnkDoqRI
 +ssJFxsUKFtKdQsDgRllRf+eRYn/yWgyNrHaKHvfXW9ZIIPIB2e8/PBSAPObYOdWbCoLOn6oY
 do4DarAO0QerLAGWDBSNtgfkIkg3xbmuMiEN7/D80X3qPcAC6C5A67sPDNL4cTIRI8EPeQ93p
 Ywz04Wcu7Q==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

local_err is not initialized to NULL, it will cause a assert error as below:
qemu/util/error.c:59: error_setv: Assertion `*errp == NULL' failed.

Fixes: c6447510690
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Message-Id: <20201023061218.2080844-8-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 83e2cc55306c..9804681d5c44 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2111,7 +2111,7 @@ static void raw_aio_attach_aio_context(BlockDriverState *bs,
 #endif
 #ifdef CONFIG_LINUX_IO_URING
     if (s->use_linux_io_uring) {
-        Error *local_err;
+        Error *local_err = NULL;
         if (!aio_setup_linux_io_uring(new_context, &local_err)) {
             error_reportf_err(local_err, "Unable to use linux io_uring, "
                                          "falling back to thread pool: ");
-- 
2.29.2


