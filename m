Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E10A606711
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:32:59 +0200 (CEST)
Received: from localhost ([::1]:51760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZGz-0000bE-H5
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:24:02 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYp2-0004i5-6l
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNH-0004oM-K9
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:28 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:49721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNF-0006zG-TO
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:27 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mw9oq-1p4Jfv0OYe-00s7GR; Thu, 20 Oct 2022 18:26:15 +0200
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
Subject: [PATCH v13 08/17] net: stream: Don't ignore EINVAL on netdev socket
 connection
Date: Thu, 20 Oct 2022 18:25:49 +0200
Message-Id: <20221020162558.123284-9-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XxrtcQGvVT5kyHTbAKyNIawSLaWxCdZcGaIBHcEuVHQrY+j+67N
 NDPqhKxCp4khmrWKRgT3zxMdeFWddfDI11oP1JhK8CTXFIrrA8YCW6smY62ub1KfhPPKKW1
 flwh1UQbXIOXDumHeAi5ncXqwCc+CX4ix2IH7z5MYbSU/fFgiS0oR35IMTLrPsvO/ye0yMs
 GPG9h59XecD2/5+cJCoXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UGXvLUS0gl8=:9xseXkEkbtLGhIWIB9QnSJ
 3DCP+X9eMzSBZXxYu05ngh2aUwopqmsEBt5sae2edQ9N3XDD6GI7W4GZL+uD2e8zticfafGB7
 4bQOqq2BEj52Xq0MzGRJnSPuZf1DnoLwQ72KYFMD7pAm309Wtr0Di+eA31KIBr4cJYJMlhNzK
 D5OCRCS2eJ8Nr3rxZ6a0/lhQLXvfIUlHj8ylEUYebC9wX6AzvmEL+J1oeaGmIZcq6SYrbHbEa
 KpXwwGGYQUR6Vm80u+gVSnxxQ9ArCw9jtpLPm9K7IwtLVtETaipj02Z6goyqsPCQgWHYkOq4U
 YYLixJVzVNMHmFibWh48lSK+kk9GPdOE4jQDB2pq0kRtgbJ4KBGcgg1nrWBRBfb85Q8isfOdT
 fP4VfGPrbtuOU9GFliiGyGCOmH7SencPwYumbdMdOkrwfQkcgcUH76w1xNf0Q8AzBetIfMl/6
 9W3glcvPZVvXQOvlMPzBaan7vKVoiYjq+BZzv1mneUWt56pN7UyKRuZDiZt7Ng6t83ertYA0u
 PFVgQElRgCzP25k8nUGaBOxnFZDajF9Y7CUWcTSseXnSuHvXdyZp95CBUJfW0PUGBV73Vnm2q
 A0XBrljowmZ/ME+pyKj67RBEEL1pjN7Ujvk1h7XFITI5Iyh1hFOJLweRaWL/lWc9vSUaMqqEs
 LlxNq0BwiEXwwMj7CxXZchgSRDo4aljrE+ZeZz9diKhrkCMOj8dMLbgnu/vpkg15xlrpNA15z
 J7/aeirT/U2P1C0B9OFWyPsUHaYFrE3BVhapIaPSPv5kAuWUsMkl0HuS8/0QQ0WDxyM1v01U8
 3CL+6Vg
Received-SPF: permerror client-ip=212.227.126.130;
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


