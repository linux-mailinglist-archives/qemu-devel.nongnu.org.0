Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6E2C82D7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 12:05:30 +0100 (CET)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjgzp-0004oK-9z
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 06:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjgrv-0006mt-Ah
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:57:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjgrq-00065e-QD
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:57:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606733833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MiopA19M66V1TsNJxAYoYD/sSUIfSwppHxitNP43iE=;
 b=Na/lfnNUOzVhDRPfTEEIN+q5Wz6jrpelPsGEvGFobVgWDslVY2tTs+gR6emjyDM3dKcfyk
 9AWJxdgjJRHj34JqNj+Yr//OU9xXgBecq+IJmObltXYjMIJOewXafayRHJ7EFVhb9KBagL
 4/ZYDqWseT2Bw/KuhINlLrvIQUz4h28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-A8fUPBAFNEa_Y4tqCzY9_Q-1; Mon, 30 Nov 2020 05:57:11 -0500
X-MC-Unique: A8fUPBAFNEa_Y4tqCzY9_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C44F1012EA0;
 Mon, 30 Nov 2020 10:57:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A30563BA7;
 Mon, 30 Nov 2020 10:57:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] can-host: Fix crash when 'canbus' property is not set
Date: Mon, 30 Nov 2020 11:56:15 +0100
Message-Id: <20201130105615.21799-5-kwolf@redhat.com>
In-Reply-To: <20201130105615.21799-1-kwolf@redhat.com>
References: <20201130105615.21799-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, jasowang@redhat.com, fnu.vikram@xilinx.com,
 berrange@redhat.com, pisa@cmp.felk.cvut.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Providing the 'if' property, but not 'canbus' segfaults like this:

 #0  0x0000555555b0f14d in can_bus_insert_client (bus=0x0, client=0x555556aa9af0) at ../net/can/can_core.c:88
 #1  0x00005555559c3803 in can_host_connect (ch=0x555556aa9ac0, errp=0x7fffffffd568) at ../net/can/can_host.c:62
 #2  0x00005555559c386a in can_host_complete (uc=0x555556aa9ac0, errp=0x7fffffffd568) at ../net/can/can_host.c:72
 #3  0x0000555555d52de9 in user_creatable_complete (uc=0x555556aa9ac0, errp=0x7fffffffd5c8) at ../qom/object_interfaces.c:23

Add the missing NULL check.

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
2.28.0


