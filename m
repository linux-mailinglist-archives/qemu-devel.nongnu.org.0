Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3842D7D29
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:42:05 +0100 (CET)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmQd-00024l-Ij
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlvB-0004K1-PX
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluc-0002Is-PS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+5lURr3H1iosGWhxxAwmPhxO97vAel5aKpCHk+8XmM=;
 b=BwlKbsPHjVBMU+QTcrz5q1vEafkNmlQY8suW0G6KG+JyCuqthTZlwiXAvtXDXV7bdFQzhX
 FNAoFi2ylorvv3Ligg866KqrNzqKocSqwnp0bLcEoYifPUtZFwVWTeLxe/Tk85U3gi3lEh
 NntrB0F9blQzSlgvwZXJv9iPQ0vD1hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-cGCguWtBNXadWnOhByVNDg-1; Fri, 11 Dec 2020 12:08:55 -0500
X-MC-Unique: cGCguWtBNXadWnOhByVNDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9482800D55;
 Fri, 11 Dec 2020 17:08:54 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B911E5D6A8;
 Fri, 11 Dec 2020 17:08:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 27/34] can-host: Fix crash when 'canbus' property is not set
Date: Fri, 11 Dec 2020 18:08:05 +0100
Message-Id: <20201211170812.228643-28-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Providing the 'if' property, but not 'canbus' segfaults like this:

 #0  0x0000555555b0f14d in can_bus_insert_client (bus=0x0, client=0x555556aa9af0) at ../net/can/can_core.c:88
 #1  0x00005555559c3803 in can_host_connect (ch=0x555556aa9ac0, errp=0x7fffffffd568) at ../net/can/can_host.c:62
 #2  0x00005555559c386a in can_host_complete (uc=0x555556aa9ac0, errp=0x7fffffffd568) at ../net/can/can_host.c:72
 #3  0x0000555555d52de9 in user_creatable_complete (uc=0x555556aa9ac0, errp=0x7fffffffd5c8) at ../qom/object_interfaces.c:23

Add the missing NULL check.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201130105615.21799-5-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 net/can/can_host.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/can/can_host.c b/net/can/can_host.c
index be4547d913..ba7f163d0a 100644
--- a/net/can/can_host.c
+++ b/net/can/can_host.c
@@ -53,6 +53,11 @@ static void can_host_connect(CanHostState *ch, Error **errp)
     CanHostClass *chc = CAN_HOST_GET_CLASS(ch);
     Error *local_err = NULL;
 
+    if (ch->bus == NULL) {
+        error_setg(errp, "'canbus' property not set");
+        return;
+    }
+
     chc->connect(ch, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.29.2


