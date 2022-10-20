Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF28C605C16
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 12:20:27 +0200 (CEST)
Received: from localhost ([::1]:54864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olSf2-0004q0-Ee
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:20:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olRr6-0004al-9M
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 05:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfo-00030n-Dc
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:17:08 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olRfj-0005KR-3u
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 05:17:08 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MmU9R-1pTLD20nab-00iR1r; Thu, 20 Oct 2022 11:16:53 +0200
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
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v12 14/17] qemu-sockets: update socket_uri() and
 socket_parse() to be consistent
Date: Thu, 20 Oct 2022 11:16:21 +0200
Message-Id: <20221020091624.48368-15-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020091624.48368-1-lvivier@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rgQCLcousDQDsUdXn8fcuqm3KbUI1+2RE9s9PEwzwWrmGpqhygC
 3TlT+Sgui69Z5zdVGUmlkHebz655PARcfVLCQ/KvJEF81vLg7ztPLeAyc+WiE9vFXS0Ke0U
 PWSKrmFtb1sQriugP6Y0KoWgRM4S5ww0x2CgGWgTupbKNBlwUgwN03mZMn4TadLr3binuh1
 Neq97H3AsJvziSz/O8A6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:f+KlwZEvwhI=:YFlSb1mVepcSfLdVtXLjJd
 xYOMfbFe0SPN90rPR57+qWoX7L+dJbuElF5/3uZmcdMz1dLTXHA4thKT5jdBQUHV+7/kNVTbj
 CECDYJOJrNbzlr5jsub/ckAPfQj+Lp33Qn7KXEmgTBuCONfO1cr22Px7TAIP1WSqCx16c7lU7
 /+1+peF7EcpmMtowx2ryWupqKPVHTdxqk3rjq6WVSld59oDyX8ubdA7zr24hVLDYMPi065gcl
 d2z7wpSrFYQp1lq8S/r7cWRGgOaG7+vrSh4987vK9SGF5OvRfcnu2RbYvhTRBM3U9guKhrfdA
 5FgZ7qKoBDid6yGStQdODyCqGsr8iY4w7v0J/n13QXFw1HqRUuh61cjzqv+LCEFja7N0gB57q
 +mOlD7Dfvm+i3ilBm0pteTMRiGnJ64nYHWxlRpnEi3cTE9xNdq+w9+Q+q+NQqA37nk9cBFgDG
 rHbpvAovyOrLMuSJWCTRQdA2z5U5PAg9dM6mKlbs1URIykDggJEAsE9Ogk1WDRcMldr84t2qz
 sBAHckLdtk/qSTIyP5mECRUfIQunkRRI7pBqnoJO7ABf8gg51k8NWKAM+LYDkNk6B6Ya/0kY0
 Vm7B7elbXlLTOxBoL4aXPT82VsT7YNe4jj3zomv1Si4XODkq5AI8KFyd3lB72aB4SUTiAZcQA
 +6qOIQKU1VFcqyRqKGXTVZVyXRkXD5ul/Rhx6KhTUZ552yndYKLZt8GDpSOdAJqy2VX3SlAaP
 UKNEJKwHALAD4ylJDXXyH2A6UyYYKldPMz0Cv9mAjDf6MXJdKZ4T3HOR5wNbuBpEZg6YS0Bie
 IvmwhDa
Received-SPF: permerror client-ip=212.227.126.134;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

To be consistent with socket_uri(), add 'tcp:' prefix for inet type in
socket_parse(), by default socket_parse() use tcp when no prefix is
provided (format is host:port).

In socket_uri(), use 'vsock:' prefix for vsock type rather than 'tcp:'
because it makes a vsock address look like an inet address with CID
misinterpreted as host.
Goes back to commit 9aca82ba31 "migration: Create socket-address parameter"

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 util/qemu-sockets.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 9f6f655fd526..a9926af714c4 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1090,7 +1090,7 @@ char *socket_uri(SocketAddress *addr)
     case SOCKET_ADDRESS_TYPE_FD:
         return g_strdup_printf("fd:%s", addr->u.fd.str);
     case SOCKET_ADDRESS_TYPE_VSOCK:
-        return g_strdup_printf("tcp:%s:%s",
+        return g_strdup_printf("vsock:%s:%s",
                                addr->u.vsock.cid,
                                addr->u.vsock.port);
     default:
@@ -1124,6 +1124,11 @@ SocketAddress *socket_parse(const char *str, Error **errp)
         if (vsock_parse(&addr->u.vsock, str + strlen("vsock:"), errp)) {
             goto fail;
         }
+    } else if (strstart(str, "tcp:", NULL)) {
+        addr->type = SOCKET_ADDRESS_TYPE_INET;
+        if (inet_parse(&addr->u.inet, str + strlen("tcp:"), errp)) {
+            goto fail;
+        }
     } else {
         addr->type = SOCKET_ADDRESS_TYPE_INET;
         if (inet_parse(&addr->u.inet, str, errp)) {
-- 
2.37.3


