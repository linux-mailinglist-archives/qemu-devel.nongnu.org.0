Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD8757E740
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:19:52 +0200 (CEST)
Received: from localhost ([::1]:60748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyBj-0007po-4j
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExy0-00075R-FS
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:43 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxz-0005Ja-0D
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:40 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MofPt-1ni3zB026z-00p4aL; Fri, 22 Jul 2022 21:04:52 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v7 06/14] net: stream: Don't ignore EINVAL on netdev socket
 connection
Date: Fri, 22 Jul 2022 21:04:34 +0200
Message-Id: <20220722190442.301310-7-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722190442.301310-1-lvivier@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:99Wk36CqkFIlPROD5LHzLuXOhiqq3plOfTiqCz2xrv7hOq62Kge
 oOYfrGQgIyx7DUbcNiO+R8ZNDo+xw1qPUXsZMGjqZKZB1SszB3zO/QlW1UONLKZsGlyKcHk
 RBAEKOCC1GJV3ccr+Jz3h4TMJEvxVlP2ECHMQFFdf1HPzXPsu3jIyzWr2fR7jTZq7ZOIiiD
 G3rDUIqu9Pq9M8Umzk07A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2ws3I3Z6ldg=:sTo8CzQiKwqCw+VDfAluXW
 OYgk5/RrwL5UFF1uUzzfChVQVQshAMDjiCh5PQdalz+LXfWBid4z3NC6/FH1BoZ0c+Dwzld/0
 rWMk15ZujEiZstmHnAriBbPar9NrsPHczmaFayizlsZI8LGxvFBLNk+FkFzcNNj524tpZqfyy
 kl/O3LxMNrwDMKekOIVHdXS0yJgI55ciFbIqRhh4hozB5G7ufztk7UFX6edI4mtlXYL1EhKCc
 /VZ94Ue8eZDlqt/0ms6v3i2kyvrkio3LORzfldFNY9PP0xiyTCG7tGf3EQE0Iyw1BatY1E6vL
 egSOPlFxHre2RXOBYOsB1uDRvYg//pzwWZqJ6i5J7H0XnidOwsw36rKbt/Iu5Scm0Nsh+C3fJ
 NRlwjA4EF+V2tEz+BAN9B6Wt9NKikGqJ7pTrnnIKROj5DN32Recri8PfUVJqW6JbvmZ/bzImi
 RXLJBenR2vP2lThh7y1bEIX/MR8CvPdpkOXq7VAXAB35f4wtj4UqfNY0G8Edaj727jCql1Eg3
 CE2s1ukmO0TGN9w6XG92mNm0tYcQNyLJJPA9GLtho/lB+Pn1m4YsLnSv2iG/je2ulUmTJ/kti
 V2rrXs/bZfpSrowSqHZJbkVDNx7yAD+N8lJ8qCPqSXxPNNhMlm4WlgTWwKlAby7nUSFsxCWI/
 eI0wt+4qFuEzLhPMHEnNhGiYsJqxwvOXOc//NZHaFRVuqkZNl2O5JdVAyMEA/r9+dOycC/SnB
 FPSvsQZKqX47SnjM1djEJFhlL3XCfXgguuTNAQ==
Received-SPF: permerror client-ip=212.227.126.134;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index 0851e90becca..e8afbaca50b6 100644
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
2.37.1


