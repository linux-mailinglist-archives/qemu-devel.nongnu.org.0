Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF006068C8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 21:22:01 +0200 (CEST)
Received: from localhost ([::1]:54146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZGh-00085X-OD
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:23:43 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYtH-0006i1-Bp
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNH-0004o5-1p
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:28 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNF-0006z7-4s
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:26 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MgARS-1pKK672cfe-00hbnZ; Thu, 20 Oct 2022 18:26:13 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v13 07/17] net: socket: Don't ignore EINVAL on netdev socket
 connection
Date: Thu, 20 Oct 2022 18:25:48 +0200
Message-Id: <20221020162558.123284-8-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jVbH98dBD8KCQu3CflYYf2WHK6IxNZTn8SOKftQzM6rYbMt841f
 umYZfb7DOiy9WszJBh5jO14Kod8PpmW/LMWjAEhTG9s8N6WLoQOySO0cu8lrpfGZnjoMBNZ
 lRicfqi3QkfVzU8bONwOtd3cm8/J59uUX5+ddhDbODqQUvcOCI4/mZ1ldMR3H3UUvvzvisa
 jlIz6tChZQAVypz1IeUiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YM+4D1cBfxQ=:vycxjoJM7Ia1VeW2HyVOwH
 W6QgqHlOPjLlQWc8GajF3WmkpK3wnG3PkcSsmO1pCdWI7MIBwRFpM+hDgfJ7QbmU1cNVu3fqz
 5WAVsO3WNCiyTjpqXHvwAz9WqZ9GB5oNhyrOBa/p1JgVeH5DLksoWrawAtAS/d1iZpPPm4yTF
 Yd4wxkIT0Y5xdeSJ1qwjBzLF3TiVRndY40YJJimxZB+HxWoW3Egoddz7wJQNilm1aWbC6R12C
 GhqRbJMOBcFj251iMF8WaEkaWKtCMMoPQqlJ5GIbpJq9SX4FDlorLY5aGtue5AAWUwCU9F1II
 POwt2p/JgYq1EuJNaFow7n8gORROcXJspu0b9LYb9e/vajQmijkn5uXEaY5+f8v56ydt2u8XL
 iVXJnRY6vb1Sl5SCgnB4pQIhT0mAeQ+eQ8VDpcmKqGhjuw3LaDLwSX2Qvz5pVyDFju8YNhwDQ
 yLEwFBtcOSTcQlVf4T2GjQzjI5DvDxbzL/qUrM8N2VTAarbgGJD6glMvfQlxFmLNz4TdbUZWX
 yZ9OxdjH9R9ghYt3h52qycfhePeEf5xMYnqirW+JnJD3bpeolBWFuNGslSXGmdu9wwuFlnnI+
 S4C9U5knh7kT4zVbY+Y4AzouZLUgBIOeFeSaYTWtwNPQaX0ZtTTh+NpqCJCEG0MZlwnIjaZ8N
 T6FHzCK2zK+GA7aDJacjGwmgUpFxAWiSiHI/SGUqoenK/NjeQGxakyAiJIq+6joel7NGAHKPP
 3E4zR0vkp2VIKsr6zVUL30GaLRYmUrYcYnxcAgwC6Fy3eNa9815fvBpOnz4wgJUwHXQdTQoNk
 +BKz8NR
Received-SPF: permerror client-ip=212.227.126.135;
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


