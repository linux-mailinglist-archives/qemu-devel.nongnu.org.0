Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3105B685D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:08:14 +0200 (CEST)
Received: from localhost ([::1]:49912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY01l-0001fI-FL
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzg2-0000gJ-Kt
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:48 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:43303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oXzft-0004D6-Bt
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:45:46 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MA4ja-1oRv3R2sck-00BbjI; Tue, 13 Sep 2022 08:40:11 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: [PATCH v8 06/14] net: stream: Don't ignore EINVAL on netdev socket
 connection
Date: Tue, 13 Sep 2022 08:39:52 +0200
Message-Id: <20220913064000.79353-7-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dTO7M4SfI+uJ/6/VfUvFP4vFTsJ6xQp9Ru4Fz2Zu6fkUORDxX+e
 oHIc8LfTNJcB+Jc2QF8m/mNG2XYRr9MWPBdMvdXeXZJyS8TMnITx6Sa7tmiYF9NehAQgpqi
 OgRTjz4bd3LmbWRxHoAtmGH5tZN7b0icfU199D46TKaAd+kmfkdZ0OtYWUujOwPQ0W3kpem
 b2ppBmvyRH77H9bk4pVmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g6H8OFPgpgQ=:2vDzU7UvW6KJxGrnq7ndJT
 r/4KqTZ8L7qU6FR/gFONoolrSbctns5pc/Dr50ZF1POh6CCSgIwvh6UuTuSY0SGHjPqoPzp4X
 qcSeWfZhDjZYmGrwCLXrUqSeDCVebsY8eW1aF9/ljyFqWTW8yXgQCqeONGEEclc2c+w9076cf
 mlJfjn/WeUNg/uYrbMYoWsatT+U4BNBm9GJaXt9m1lCfgfVyVbt3+T3hzttGKiYZfG3RSSmby
 VmucWTVJa6Ogx9RBC9ePqSmlNdOsj25S5x30uYubNBp2jRf2mqnMazYlfygnWobcl66NesbtL
 W2ImwxUnT1oeKndm9laYe2rrTqDvXxhPOCpd9XNr4aav/5SUkc6Xtw5BnFkvng+zY24zbqS5b
 5Xey1WH36+whI/hG8yBRCraaRtvJG2ODqwCsB5AD/qv0ipXL4gym8QZTL6BWMVwQtgsY+nd7z
 wLRhNbxqdgfRLtdIGOrmLNIVRBr4lIdWig3WnIYqPcR6fulN5HKCE9mTd2WV9etmjspc5+MRm
 HUaDDlaVLSa1BGwBo9Y6lqgCMxsZLZqSVFQRSJBgQtzNcVNWmiXPrQJVuIW3wgGWoQ7ZP4eVT
 +P9oZa6XnhkD6ifyLSeAn/AGFQawbTkmj6x2poOCVOQypLkODwIXn4tyQMgvdImSYdsrX8ViE
 IVqOh2bVKxEb8lnYeTgMHeXhhSqM6NqMYG55k3lbMgyHKIy41p6oKy95cXrMWBmYZeLDbKYSc
 zDKCHRib10ZVvt3hyXPL5dJhkKzQ5lGBRoAKuCRt4P8Lt7jzQ3Fo6cGu7xpmT5njkHYLBb6Sl
 4GhE8Pc
Received-SPF: permerror client-ip=212.227.126.135;
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
2.37.3


