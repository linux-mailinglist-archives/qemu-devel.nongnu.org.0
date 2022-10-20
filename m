Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB859605B1C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 11:29:26 +0200 (CEST)
Received: from localhost ([::1]:38004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRrf-0005jP-7A
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:29:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRr0-0004UT-Qh
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfd-0002qG-Kt
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:16:57 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:35259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfb-0005JL-Qw
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:16:57 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N9MlI-1p8lpY1kgO-015Jb0; Thu, 20 Oct 2022 11:16:44 +0200
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
Subject: [PATCH v12 08/17] net: stream: Don't ignore EINVAL on netdev socket
 connection
Date: Thu, 20 Oct 2022 11:16:15 +0200
Message-Id: <20221020091624.48368-9-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020091624.48368-1-lvivier@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rAowcpovUx7VZ1182aMugTyHfqst2uG2cFQ5qzJT9yB3oYFUnAT
 CWbhDc5VvbyU5SN1HObxq+zbVD4kHfvYytcZMATeukaALOIRJRZaYr21CzchiTbx3J7xQOQ
 GMcBCVfpQ3YpaQPlGDRscahcM+ldA5VmZkGtGINwDglcPDB3B/zFjw21+xDj0iIRm+KRQWh
 R+l90FLVGfvfvnaoJPMKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T32DJ/xxkVY=:EQMZ+yfhGZk2VN7S22yqgh
 nYCFS4LjhklSHZIim+p2fv0N/Cef/OvIhT+WkH/5jZhaLuzibvnaEtGLu+G7KqG1lv4KgHmcm
 aB66i5zFLXB1KrrjOHGui2d4nfFtvZjLKwyschy8Wdn3MZ2XsJ4fBAYDqzIuPjNTRBv2zjoue
 pYiZITLtjEFv09gjZXTr5FzcFUtTzB3vDPIsX87EN5pKhYX2gAU42j44LO8Bc9g17oc/QAMhm
 RlgLbKocTfpXWNpqA4A53C73YWU9nR+ce7Cqcm9nXqY2+15N6z5YNTvo610hvnHQZXDsxkMTH
 MzeYBuqqR1wgz/2WhSk1CJavDQCnXe0iz7n7agjh4lUAebK7HFIFW1f/U5nsM/uBklzP9GDrE
 VVE7MrKvr+eyEUNytrdr0QEdmg63NLodzw7nmkkVqT4cmr3z4a8z6zCG22kw1Lp8Csy1p4pXR
 rV4sEcFv3JamjxjFIS/Q2y1x45rpCX3l/ncXeBjbfLrUjv6I7jZ2sopfvaY2tt4MIRadsdPDr
 nN4ecJ3nYydXKIFtS/0S8wQI6zquVo83soydFxJMa1xeB9Iv/C9ftSgtMbkJ3szeG3uY6fv2y
 wh4Ttmh1m9gD/gAGOgHkXCjZoieKuz8VCxq+LM2U5Sfv+nJjjL2kPXgUc3HNNLbrh99poXfWN
 J+ufOq6BSTgJA4P9vnwDKZEwKxBWS6UUbwM/Hb/MaawrZpLTCSIgEl3sNT+S8pfGxEAyfTTCl
 xpKLCEiGMjQq5Zs7MDRUI2+QWhG2Q0T92yP0bybsQjbONI48zu6BxStrBsI9QUQK6zocntv9u
 tOWM3pO
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


