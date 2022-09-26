Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C28B5EB1C2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 22:04:04 +0200 (CEST)
Received: from localhost ([::1]:44350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocuKh-0003RP-Ac
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 16:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8E-0008LE-JY
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:11 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:40729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocu8C-0005wM-RQ
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:51:10 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MZSJa-1ohyc901h8-00WaA5; Mon, 26 Sep 2022 21:50:59 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v9 07/16] net: stream: Don't ignore EINVAL on netdev socket
 connection
Date: Mon, 26 Sep 2022 21:50:39 +0200
Message-Id: <20220926195048.487915-8-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926195048.487915-1-lvivier@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KUZgct6UFAJWwxbosoCT5B/UpuSKq3Ef/rC17vBZN1cczKUEWAU
 nFhS822Tiy6XEs9b1tm40FzwxAvK8lsYGsqCaPagK6A5NGuJYQRx+IcG9liYfwwOx8kRIeM
 nhVrKpi34zInctEjP/gj4eBp8+WD6L08LToNRQZy2BR9Iy+oC1Cn7CY+0mdRkxw6Y3d5ZRq
 2HiUGLHgLMBg60WrkdA1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GArD19hrfp8=:xsQLN0jyXyIswSLoeiNLkl
 b0sMwXIyd8JvYpPHjU7+FlzkIsSHzTEJsylU7OIxSj9kqJ4zYFO2X3hXJhr7ZJKRvOUVvrXAg
 8dd/WIb1DSc6TwuEtbri0+FWLhPA6kOcQRQVYmKeofnFOFRQKpPsNdk/pbUfKDGXch5gtq9g/
 dH6+J/J1ziVTScLyUutx6QEXKniIKB8Lv2J40boXCK8fvC8MT6kGjewoyf2OruFEnn0zSFnnq
 640rBkv3myOauejvvS6HsUCeDPMsna5kGwl7KoVem0vRNZod/NGcH2Q/KJHCeXY2M7oeYHjTr
 DJaZSbvJ4XSaX+hN4+qQU2n8dlNpHgW+FWJPdqlvofmDGzQkdqj6p9uSbj2hnHwW8Q42cZhri
 GbnUIpZfrQ0dQBFP4VR/khGlpVWNazLgwfRcE89wZRP+Z/lByJrR/wk3/nJ5AyJD0zicD47TA
 1MDEBZSv+dnE3siyX/usjlMGwgBJ2R1sYa1kqpGeNF+AbKR97eCuox73WFciFEsAuOZU1In8Z
 P9wheQGBkFSEPh/D4OSMwpAW7Ym4oQrwUKD3fjJrmkpEZuQxxBCpbG9G1sBe9QllvDcRybDUx
 OD8b8TFSXpQh1X7W8lxRNa44/uWI6BFZ1v2JAuZIR4mi4Fl6pFMPv1JHLFgHZowTUtf0nYXO8
 wdMBNkv5Gc6H6FiLB3df12yw56FESq0P5wui0gt4pd1Py8MNPkfl1ByqPew60dw4OIBUSRddP
 A+v+99Kt3lIF08emXEqHrkt3UzGNiXd9L16Q5h3NSjLNlVoRbQ36DGlMAR81CMv6tuzg9Mgym
 cp9/RgI
Received-SPF: permerror client-ip=212.227.126.187;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

From: Stefano Brivio <sbrivio@redhat.com>

Other errors are treated as failure by net_stream_client_init(),
but if connect() returns EINVAL, we'll fail silently. Remove the
related exception.

Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
[lvivier: applied to net/stream.c]
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 net/stream.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index e71c120ac379..3fb899df5d2d 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -363,8 +363,7 @@ static int net_stream_client_init(NetClientState *peer,
                 if (errno == EINTR || errno == EWOULDBLOCK) {
                     /* continue */
                 } else if (errno == EINPROGRESS ||
-                           errno == EALREADY ||
-                           errno == EINVAL) {
+                           errno == EALREADY) {
                     break;
                 } else {
                     error_setg_errno(errp, errno, "can't connect socket");
-- 
2.37.3


