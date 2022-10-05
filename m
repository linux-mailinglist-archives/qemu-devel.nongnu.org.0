Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E015F5892
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 18:47:31 +0200 (CEST)
Received: from localhost ([::1]:42864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7YQ-00007F-Om
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 12:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og794-0007P1-0l
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:18 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:52517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og78x-0002o9-FU
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:17 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MKsax-1ouC9U14Pt-00LD6d; Wed, 05 Oct 2022 18:21:05 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v10 08/17] net: stream: Don't ignore EINVAL on netdev socket
 connection
Date: Wed,  5 Oct 2022 18:20:42 +0200
Message-Id: <20221005162051.1120041-9-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005162051.1120041-1-lvivier@redhat.com>
References: <20221005162051.1120041-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DcdpaHZPyNUV4Su1+5cQn/Ctr2ur1utRwPQ+zSn0E3Iov4JH213
 SI6d+Nrrt6ubRco4tVYqfN6nF1gkC+f1qBtCW39W1k9MOt33y8u+iNb0QjCbBSj5JkSP/2E
 LJqvZSVDJ6rWWHvFHzv4KD/yXP6qjtf66S4qrig3yWZxv9M/QVCgedNXiBUBrobHLfr/JPS
 BsDo1BL2dktUxyx2S4jTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0RgsTViv1IE=:9nkI0ECJ7gG5Iymb9xeIyI
 bhz3KafHPWdyQXw9d1QgfZdMw66tRGbJAb5cA83umezWn+DVGg69t5LbVWJKO2M9xDT9gBYzK
 lRQL9kGgh5QTMAK7JreTBgjYXCxOifsgetOnXKaT45ZOUs6hwlsB+tMVnFtXEOfKMxNx1qLs+
 bXE1pM8o5g2CGsUXlgKCRx4MCSG+z5vXvBcoULWP7Mu2Y3RkhRTRjOqnIHFRNA4moF3lM92NM
 aYMfNakyODzWUIU/QL+KksFAyKXTvEqtmHseMHW02/Uq3Qx7uadCpybOrnGHN/9kgIgu/unBc
 NYQsQaGxQ6xCohcsUC0JyUvybbq8/ao1kgNMwxCCBcDkF4Ju1fsHMVEAKaPxyazz7+0emSAM0
 BHGsIYBPr2AiEpkb5YyvmnrarTDL71neNMl22ePoKLmVr82sxVvp1CCLBB3RsbG6t5fpyXSf2
 GMtm+G4+Fpz364v71lMrRrideyQc8bSfGV44fkBoikPQLzSZGcA1SJ9pD+NSU21OsEhYy8yQ8
 N8wFAizslMtt0jWrFFoB64GjFbULVMwcu4tyz4/Gd1uNb+9RF4LPNUF34weVbSbogQnkaGQzH
 oujzr1N12PO4eWhkPQtUoNkQWq7o9AzVrl3Hb2xBbQ4S3B/chTaIJ9ggX4IxVZ6KSNJXBep4g
 h2kD7teLIqetXjGd8zpRFqJhaev7xpfXbP1Fiu03C6CcxSoC6g7MaVbFdBeVcN/8JZ7gSXiHS
 Zu/B8G9ebEs+VyWi10G50dKUfDtPB8qJT80dZ36u22U1C5hKMp1VPHUGyObtQocB2k0OZFuJe
 nrNfI3A
Received-SPF: permerror client-ip=212.227.17.13;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
index 37965eb74e1a..26e485438718 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -360,8 +360,7 @@ static int net_stream_client_init(NetClientState *peer,
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


