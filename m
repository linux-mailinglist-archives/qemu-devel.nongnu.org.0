Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC7607442
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:39:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloUx-00046m-K9
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:39:28 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo2b-0003uI-OP
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2I-0003MD-4t
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:53 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2F-0001Zs-GO
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:09:49 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N9d91-1p9EXc3FBd-015cJh; Fri, 21 Oct 2022 11:09:38 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v14 08/17] net: stream: Don't ignore EINVAL on netdev socket
 connection
Date: Fri, 21 Oct 2022 11:09:13 +0200
Message-Id: <20221021090922.170074-9-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021090922.170074-1-lvivier@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B8MiZnq3mijX2C60eMitMUnHfhjAsmiSOOLIMe8CGzGcyXH8Amn
 R6kmli/R29qVZGFwW99SSIIHnpIJSCUUtm3YMS7x1N49hx7YaIIR+TucE17slkVtkbbuqak
 3L8Tq+Hp1uQVUAmPvXgxl5HsqB5f8GVHQOiUJKQmaUpo6ftUkNYfPzFaEbWDnNWYD6xp/k0
 V0XP7hgAHtmYUEkdRF2mw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1qn1Ptr2aeU=:x2FfOD5n7oRGv2YOTnEI0V
 UT9fLRdX2EJk4NczaChet0yCQWq+P+BbdoV2S0xQ1+04VmTVjt4Lk4i0JIf6RPEfkh5f/aFHc
 UtymMMuvcy+OLtF31Pj+E1W0QhicSiY7XrS2kzTuLZLrY8SLo/7QHX6qLNQ2rZ3RuRZ2wqOwH
 gDPkpLkTZ3vDIvk598vomL8O1JjWKdAIQLcK3kXOnpNfYYwzWO4mxzTMohMKGTzv+o3uQlLlf
 SVjL2fs3Fc/EGtKsND3cOOVq6Fihtrq7PuofITaZrsxwsUVqKH5ZjmfpeGTnP3JxLAqUfFOuD
 5M+986X7hmvdMMLWzDFRNL/GBtzg9uhNYEvN27tXviwzoLsSdgGMu5HxVQVCG7EQVzrE9dx+3
 8vloEszKyHwFlPFdrR7I2CP8i2LmWUn2S5klGmmyA63IaQElXwJuiusYcvj4NxE5AZ2a6sp1D
 66j/Dv9hyYbCR1h+ybOLewTNmoxYTiXHZtzsoMRvfPLtL3On9ZKMkyKltTOETH0kWjgGXC/4G
 U64Bp2P7ag/jGOyrCgkOLeo+5nFkBYhHEbQvkBN4Ii0ezjQUP9mz2m3GclYxU8Dh/DIXgZBwK
 ulI0n6FwRzDn5b9QSU8F/iEhhEhv+wNvK2Bl+i4x8LM603qkVz7HDe4wIvDIqziBVaJligIbW
 Cs2ybbI7bb419EM15aGZ6AOH6aE/5mEXf08kUakPsoPceYHVf0O4V8xFAgRRcp8srZy5Zpi2w
 LzJmQVots76Ir2ay+qhRkyT0fWAj+Nk9HLhSxqjGycYKq/r9mwFcBJujEwQSS4p/W5HdGtezI
 fMS0jZ+
Received-SPF: permerror client-ip=212.227.17.13;
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/stream.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/stream.c b/net/stream.c
index 0a7e84749a3f..e4388fe7e45c 100644
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


