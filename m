Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC25FBBF1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:17:27 +0200 (CEST)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiLgs-0000wK-PL
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVz-0006PS-10
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:18 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:52933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oiLVw-0003l6-6L
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:06:10 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MwfrG-1p6tmY3H2o-00y7x8; Tue, 11 Oct 2022 22:05:57 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v11 08/17] net: stream: Don't ignore EINVAL on netdev socket
 connection
Date: Tue, 11 Oct 2022 22:05:30 +0200
Message-Id: <20221011200539.1486809-9-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011200539.1486809-1-lvivier@redhat.com>
References: <20221011200539.1486809-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hsXLS+idoNRuKDGwDRk5k6KJvjvwEodY2MyHrLAIA+6jzR3kbMo
 YyGSQ6QSZsQ0Y1Q60v7RcYI5u2aR0VecKnTza8nTft0FolUWPbc5ieffcOQE+Lba/08VqGO
 YoyNRcZjmjrLl/7WpLEbLKT2+KJgIAxW4eOJean9QgLqyv1mqbYYmEaqRBBRQyCbTKlr6jX
 oFqfndp3YTa2SJ0n2r2Vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:44cApntTpF4=:uuFvEBLvztbGc76J9T6Y0x
 n4jZ/h2QXLOnV991KjsKN3na46udr4Xj6KC6iRba1cHIk3Y+z8mSzKlWRJ8v4Ybo+ptU6pH8Z
 qAV26xLr900crAaAB7p6HP1u3Ydp1fhoFKZoMLNRkCEmwVstb0PdeRmMs+62XXwkU3huzqZyQ
 PWl6pKYRyy8k8XYQlTxgzZXHeXJAoZrxqWaqh3h37km94Zm6L3v5+nzjItMrAfkqrN6sxOHyf
 +pIw65mqnXuz6+32+TceHcujYazPsdP9fZhlyaWl6D1tJS19/a1XzL0ShjTp6RCX5U4SqITKG
 pXoQPX5JcRM2ezxZa8vx/CQ5/g88eQr9uDRTTI2KifVokhCs71+4KoD9xigISSGPOkGM6P1dD
 IHGPpCP6E6bOh0Opss3fRv09QEqKweUSNEDzLPLQHq+kasqDLsaYQ2/bir2xAgoz8BOOm2kdd
 oIRjLAxTHc+OQHKC10exX7Du7J84Z2EfF6dOGjgQl0Wt8Rt3pLJ/2O0hwNY4ZOpeTjOYGNEQB
 c0SRaN+j7cxEIdP3XrrPsgl81e6d73LWmQw4poLO+MyPxtA8tk6/pfnbIhXFzrjS+QDPW6XR2
 I3o6goKppnDWj6i7iRab5KbdZuAR+NFcD7bdJ/r3DtDHK3TnXC+BjOHl8xJ/GqueUTIIhgaWm
 BIyDBO0im1M6oNGiD9cPYjFCOdnenXb4oE+dLoUG6bqQDhIdoP6d8/mbUc0px1rUiRsd1p1uY
 2uEOBuJSfgTdnlJlpSD/o89FXfBykvRVleieb3es8dLVZaF1A7LXrIdd8L+287FFc0Rjt1/fc
 qooeXv7
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


