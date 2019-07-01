Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C692C2160A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 11:11:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRYth-0008AF-Vt
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 05:11:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1hRYpb-0004WZ-RB
	for qemu-devel@nongnu.org; Fri, 17 May 2019 05:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1hRYpa-0003mq-Mb
	for qemu-devel@nongnu.org; Fri, 17 May 2019 05:07:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58714)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1hRYpZ-0003kn-Vl
	for qemu-devel@nongnu.org; Fri, 17 May 2019 05:07:10 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1BDA3DE04;
	Fri, 17 May 2019 09:07:08 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-157.pek2.redhat.com
	[10.72.12.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CB7E60BE0;
	Fri, 17 May 2019 09:07:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Fri, 17 May 2019 17:06:56 +0800
Message-Id: <1558084017-15947-4-git-send-email-jasowang@redhat.com>
In-Reply-To: <1558084017-15947-1-git-send-email-jasowang@redhat.com>
References: <1558084017-15947-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 17 May 2019 09:07:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/4] net/slirp: fix the IPv6 prefix length error
 message
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Reword and add a missing parentheses at the end of the
error message.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/slirp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index 95934fb..b34cb29 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -498,7 +498,8 @@ static int net_slirp_init(NetClientState *peer, const=
 char *model,
     }
     if (vprefix6_len < 0 || vprefix6_len > 126) {
         error_setg(errp,
-                   "Invalid prefix provided (prefix len must be in range=
 0-126");
+                   "Invalid IPv6 prefix provided "
+                   "(IPv6 prefix length must be between 0 and 126)");
         return -1;
     }
=20
--=20
2.5.0


