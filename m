Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4FE605B9A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 11:58:15 +0200 (CEST)
Received: from localhost ([::1]:45012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSJZ-0000vR-Qy
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:58:13 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRqy-0004RD-QX
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfb-0002kx-RC
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:16:56 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:53927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfZ-0005IX-4T
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:16:55 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mqrs9-1pOv8d47e5-00mok3; Thu, 20 Oct 2022 11:16:43 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v12 07/17] net: socket: Don't ignore EINVAL on netdev socket
 connection
Date: Thu, 20 Oct 2022 11:16:14 +0200
Message-Id: <20221020091624.48368-8-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020091624.48368-1-lvivier@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pTG9mgQH3OneQJT9lW8xR+6jyWFloNcXokaNuuau/BeQMn6894i
 QvLR9uWEG6mcjv8jh1WeG1Wk8Uk05xDnFHRgtDphQALVaQ4GEIer3NLtBRjIsQ5v8BP9UZm
 6EIngEz80lfi3mRLNnzz6kcZD2jMQzS2Q7SKlOTxy0woczVUAJRrDtix8t6TJ7UnvYuW7bP
 WlH7sRJV8IwOy+5xFCtUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QgXbyh6xtH0=:cEThxxYGl8M0XF54eH8+EJ
 1bz8h1K66qwNDz3xfDjEBZ0Q+FQoTUiFO4lcNsMNjTXuwyt9s/qAT7gyekUfyoNx2tAUMFEBf
 E5OMrbzY5poJCPUxshsWAzZKXaHzZ33Q5LWyrgziInxZp6fiDWra2nn+rDNJlfvW88oKjlqqN
 jUsF4k+xdpN26WVqsYBOAcyA5VFCv54jiW4M8vyDS+KE9Cg0bbndTXMbBR0QyezAhJ+jDp+dG
 Y6YEjUdMI6RCjh8Xf/Nx/+onlTQpAkFqDRLoS816DA3CacEHCzJmkIjd1u10f9CKFiHXPo8ge
 2h0CA+gSTL7A602YNk0f+X+A196U3kwK8RMuKFNVf0Gpj+QBMtaDoUKIEBpOAO43yZqVtZV87
 +T6w+wFOj/1EEs9dKugz1bpR6Geu20UtbRHOIxAsi4eRe0T4xseJ36tsn9Bj5usIJFbGd5Lgy
 jwtf1mAF+YdIV+eXEpGUtOuuGN35tvYaerZtRjgJ0VwucCHTcAJqH1W88M7bMUCNfrmg99HVV
 hXY6tszD5cHSb24h6qxkdHGZ7aPz/wV4QpfSgJwzKQG3mdKHhz1OrV8EgDaMMUlrKdvhx3c7O
 IVrxOhKo10TtzYxWzmWvfZmrZoUTjgStAi+BaCjPZUOihqeYaRlwm8BuPh60Zfz0FwIUrvXBy
 nMhIzdj8Ohjn+mwJj+rHu7jyG23Z1u3k7kIUuqIEFQAKIExePShcAwyvu8ioczMK2RF8x6Ug1
 O43q3X7za6ZBoLqAqtPzkcdSdly+o1XEdfLBw1FFe1Z4PzuA9B5pAXgAjyc3jPwXvmWwILCPr
 q59iu+2
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

Other errors are treated as failure by net_socket_connect_init(),
but if connect() returns EINVAL, we'll fail silently. Remove the
related exception.

Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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


