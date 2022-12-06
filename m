Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF2E644C76
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 20:25:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2dY5-0007uv-0Q; Tue, 06 Dec 2022 14:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p2dXz-0007ud-SW; Tue, 06 Dec 2022 14:24:07 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p2dXv-00052u-Cw; Tue, 06 Dec 2022 14:24:07 -0500
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id AEBB25F58E;
 Tue,  6 Dec 2022 22:23:51 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b491::1:20])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bNd0J10QCiE1-QBspPmb5; Tue, 06 Dec 2022 22:23:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1670354631; bh=O+t0DzQBDIRFjteKA8ZVji5cWeBe/gnnf53ejIaoJ3A=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=IA3t+hy0PnnT+SS6qwgq0oxyWSJS8ryDCkVKiYDfR2CjqpXgmsKeUBkMW2Zf8r1nA
 P9PyIZLBa/wRryXXF9Kavl1oopybcBwa1FmNDkrBLwZwo8mFOCIrpPC35FWYqTLDl1
 WKspO5wsnQRi+3s1qZQu6TSq7koR941pb3VVW0/k=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	qemu-trivial@nongnu.org,
	vsementsov@yandex-team.ru
Subject: [PATCH for-8.0] ui/vnc: fix bad address parsing
Date: Tue,  6 Dec 2022 22:23:34 +0300
Message-Id: <20221206192334.65012-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

IF addrstr == "[" and websocket is true, hostlen becomes 0 and we try
to access addrstr[hostlen-1] which is bad idea.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 ui/vnc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 88f55cbf3c..8830bfe382 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3765,7 +3765,7 @@ static int vnc_display_get_address(const char *addrstr,
 
         addr->type = SOCKET_ADDRESS_TYPE_INET;
         inet = &addr->u.inet;
-        if (addrstr[0] == '[' && addrstr[hostlen - 1] == ']') {
+        if (hostlen >= 2 && addrstr[0] == '[' && addrstr[hostlen - 1] == ']') {
             inet->host = g_strndup(addrstr + 1, hostlen - 2);
         } else {
             inet->host = g_strndup(addrstr, hostlen);
-- 
2.34.1


