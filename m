Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B305F58A5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 18:55:12 +0200 (CEST)
Received: from localhost ([::1]:54552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og7fr-0006GH-6H
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 12:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og795-0007R0-FO
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:19 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:57205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og790-0002oe-Ky
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:21:18 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLA6m-1oyKTy0ViU-00ICAS; Wed, 05 Oct 2022 18:21:04 +0200
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
Subject: [PATCH v10 07/17] net: socket: Don't ignore EINVAL on netdev socket
 connection
Date: Wed,  5 Oct 2022 18:20:41 +0200
Message-Id: <20221005162051.1120041-8-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005162051.1120041-1-lvivier@redhat.com>
References: <20221005162051.1120041-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FDJZof5MsbvXVo3Wv9lPKjTdT2JOJurWHTnVoaBaLKmfGQm9sGQ
 3JQcoG/jqbY6k+wlmltLDmba+NDtptdo2rJviixE9xVrJVFRm1kl6IDyhLS509eO1aRqKCO
 mCS2x8nvSmaCRGNQy6+h+ptzrO+2UyVZ+N7E4orOCTasE1Qwi30c566ua62GuFWAd1dC1jG
 53iGi/oRZseHr/W//2shg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d1JOKwi9sEU=:2nFwCY/Lg3xJYH61F+96cT
 214rqbYZNjDoHUbAccWwU3/S2FjTTku3qPxnrwe75smF9QuR0h7dQicqxI2u06k7HhGwb7V05
 5z1jeJ1YPesZ2I5rWdnvalrCCz63bsV4DZ94NwgGskfr/io4Pn+2cGKwreBaaWSP5LvH7nzya
 wDbBsOYW425bA1nD15t7AjtWWnCIFsg5G9VuTClzQy5fXS34xWKJFDgVLx+OFDwTjUAn152U2
 zGsCEaMn5lx6Ph+u2H3S/BoMWCc+iifmBbgnxewW4o2wsiqC0ScXyyB4RGoOJYHVIyvaGkjxm
 Gbe5ATZ26bdmPkOc5bESIFLqhVEmE2CAAYVASf3NVwFTcsBvMsbYMGmh2oveDaMjuExybOe7x
 aov4Kj0O+ja6atPKt0VzYKzg19L9ZAm5dS/q9/+rLx7QA+lwv2oDamsSGs27F6jfUAJVALRvd
 WDJVmqjnbdnv46aGT59JgFuwM4DcIlNUgY+LZM+FoY5QtPC/0UvRDT5Vrl+QWf4c4CA/xw+E3
 WGkRwWBDvHtBfAvpLJTrDiO2BXUtBYAnaKILlYfxSrhYT1q7VMO/AfQgw9/sYVpZXk52EC1YP
 EcTrWRYIqM0Dod6aGdEHyukP9ywpcnoJrFmKvY1ozIZaYOp9qQQAuts2WwsrzUu/lJkmCEFJb
 tTZ9aYiSuWSPlKe1vPcZY+/hqVVSRbl2UNZZJ004E6tvp5vrvtZYEiBg/Yg6Wfa40H7JUjSF5
 o0vzDRPqHHIjMIO3Dut4msloSYByE9WkbOUnkxbfGssXBbKHLd+Ry32wkkeDsIYkI7C9p7Qcm
 cTYNv4K
Received-SPF: permerror client-ip=212.227.17.10;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

Other errors are treated as failure by net_socket_connect_init(),
but if connect() returns EINVAL, we'll fail silently. Remove the
related exception.

Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 net/socket.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index ade1ecf38b87..4944bb70d580 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -577,8 +577,7 @@ static int net_socket_connect_init(NetClientState *peer,
             if (errno == EINTR || errno == EWOULDBLOCK) {
                 /* continue */
             } else if (errno == EINPROGRESS ||
-                       errno == EALREADY ||
-                       errno == EINVAL) {
+                       errno == EALREADY) {
                 break;
             } else {
                 error_setg_errno(errp, errno, "can't connect socket");
-- 
2.37.3


