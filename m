Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB14548633C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:54:24 +0100 (CET)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QPX-00059L-Vd
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:54:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDb-0007qb-EG
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:05 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:37273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDS-0004kG-Sf
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:01 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mz9d5-1m9l5q0PQZ-00wHS5; Thu, 06
 Jan 2022 11:41:49 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/27] linux-user/syscall.c: fix missed flag for shared memory
 in open_self_maps
Date: Thu,  6 Jan 2022 11:41:26 +0100
Message-Id: <20220106104137.732883-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rc82XZCseiQhpRjWWvL1cUo+kyozYgxeHPpDt/35jsOh0VLl8od
 E+Kg8XOcYpUvTrk4cmT/kIH6owN+pvknzdfdf8aDBykPJmm8Ui+GBDpYlH8t7XLL6D1uJnj
 YlhkIH16dj+roOtMHtmdYqY6WrQFhR3L2d0K87PIGhN/zcxXnORg+dpfkbWanppxE5EaVTY
 Q9eTu52W/RpRl52NQs0Mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:D7dgpBHsxWQ=:jCZciblkHUlvAz5ug+1fO/
 xOTv3uq21qbwA64Ekdk7ElnzZHY1NzQ3M1Lt14v2pEoeJQTaLvn+Qijb8P+VtHWXGK3ODZqSQ
 PrQjjjf9GyhdW0N7spigtT/II3Ws8DC1AUxWD87RtRMCKw1cDPLaPWQ/iKDwtIukKxomrbwsG
 595BOGW20Wvy7FN/WNx3AkvUAo4uWXuDx5Lq7l1bWUqgJ+At+GQ9cHrKnYUPk8f/AJ3xTwO4Y
 7f/7h4m90BtwLvcOAohMXq9NiMHi8hvXG4uQhuqSQuUp5csn/vHXQ2aOJrc9ksA3C8uCoP9vT
 mYMI1jj+6vephHpSOsxj4RQDsLcFq/cadXuUjDlAYWDflOHruBn/7hz9Y7N1y78eV5JI2vV/g
 1Rapbfa2DkKVidd27LsntNpqD2eibStaGjN4dLg0v1hYQPE752X4eGiVjAozsLAxLtfgD3cJj
 lKzA+ezQmfCG42byGvFQuIqYZaJHyWV6MSJTkb1zZoCGRtTaddnsFgavimCh5jVMoVGIvoUsI
 yg4ZRc8Cr6gLmNWlUdaV8Mja0xVRvlftmNwriNJeG+8VOxNNakUlTTQtiMkrRy7cV20BGMd7f
 uS2prKnUGZalv3LHuvNQr5NBN7gNKYQhk8ilzMmQX6Q4+DaxE38CX4rdnK/qdcRq9+YPjLbwY
 0+OA28QPgIUPTJ3bcnqhkC2R08dDuJ610pot9wIcx5tHZBwm5K3Hf7Mgqyf1z4DKeWKQ=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Andrey Kazmin <a.kazmin@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Kazmin <a.kazmin@partner.samsung.com>

The possible variants for region type in /proc/self/maps are either
private "p" or shared "s". In the current implementation,
we mark shared regions as "-". It could break memory mapping parsers
such as included into ASan/HWASan sanitizers.

Fixes: 01ef6b9e4e4e ("linux-user: factor out reading of /proc/self/maps")
Signed-off-by: Andrey Kazmin <a.kazmin@partner.samsung.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211227125048.22610-1-a.kazmin@partner.samsung.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 01cd59cdce53..3160d77154b5 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8045,7 +8045,7 @@ static int open_self_maps(void *cpu_env, int fd)
                             (flags & PAGE_READ) ? 'r' : '-',
                             (flags & PAGE_WRITE_ORG) ? 'w' : '-',
                             (flags & PAGE_EXEC) ? 'x' : '-',
-                            e->is_priv ? 'p' : '-',
+                            e->is_priv ? 'p' : 's',
                             (uint64_t) e->offset, e->dev, e->inode);
             if (path) {
                 dprintf(fd, "%*s%s\n", 73 - count, "", path);
-- 
2.33.1


