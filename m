Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25A933980F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 21:13:21 +0100 (CET)
Received: from localhost ([::1]:56806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKo9w-0003DV-OS
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 15:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKo4p-0007nx-OW; Fri, 12 Mar 2021 15:08:03 -0500
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:40686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKo4o-0005cH-2z; Fri, 12 Mar 2021 15:08:03 -0500
Received: by mail-qk1-x72c.google.com with SMTP id l132so25662832qke.7;
 Fri, 12 Mar 2021 12:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tjkiypVj/VONiqsfJbI2gXY78Zz9NiDgUTTpy2xzkdQ=;
 b=UxHgn4fvnDZOyq0w6XLP/NKRzSWyG+Z5Cx8AJepugOSKV0fQpDGymqb+vjfwMmgDRP
 XlClKVQNxyPi4KSOdmaQsUSR/2vSlj8N6LpA1CVScx7GkrwwE79LCyiAHpdnVN9DIBDD
 wSLnepS72haf4Dd4/SDmH+hnqSSO3qmGINC3pHifppsYBGg5GljgnbKXIyeWmgjbnh7o
 mWhWgS/o7ze+f5Rd0iw2plnZWBJM9vlVQiNZEbqPd7/A3FTDrxDRUazSu7mgBaYbNsnV
 KL5Xycm8vPn7P58gUzu6Hoya0VnqFLoXOQuB2inZsu7zqKSvX/ohJcvYrdbVcXMQFpYy
 HCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tjkiypVj/VONiqsfJbI2gXY78Zz9NiDgUTTpy2xzkdQ=;
 b=Q6f/dFtHPtnj7dvNinmSqSRQR0Jnyk4fjMWDUBg5VPMT397OKUjqQYtNYIXmrFJtqZ
 TITLxxLiJecqzRWoz0WQxpP2fpMHOnrs6dUWuTgCAsWgyJaOLEAhyOAWYyNzlrn0D+Fp
 H48aIjGxPsn3hs27uTpQEoDrNIExQ0xuJd6guZJeG0OZHCmX2EdOQg4TzB75P1Z+RAl7
 VqVDfuAK9mabsoL8PUGNecNTfU2tgFvh7z4bLTImshWMj+vohDCKV7Kq090ZeJKpeC7n
 5DPTRkxMVQWe0qwI5xavEPpjbDuJBJM1i6+XAjpxrniQoPI++hjNTgrqPUkPO0UoV9CH
 LY8A==
X-Gm-Message-State: AOAM533sjpsX+rwc9Unu+HNOy2SAYE0B/lRb0vaYWj2rK2J0Zo0/Xwuu
 vDj6WJ7pdun1LufXVrkGN+6tkdvfoPA=
X-Google-Smtp-Source: ABdhPJwaDUTF+e/3viEUSUQvJCeaM1YjP9jA1YEbQ5yBD5Qroax6S97LOE5D8CyOW31QBt6WtVJhOw==
X-Received: by 2002:a05:620a:1323:: with SMTP id
 p3mr14080163qkj.175.1615579680519; 
 Fri, 12 Mar 2021 12:08:00 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id j24sm5074126qka.67.2021.03.12.12.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 12:08:00 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] spapr_drc.c: send DEVICE_NOT_DELETED event on unplug
 timeout
Date: Fri, 12 Mar 2021 17:07:38 -0300
Message-Id: <20210312200740.815014-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312200740.815014-1-danielhb413@gmail.com>
References: <20210312200740.815014-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The newly added DEVICE_NOT_DELETED QAPI event is adequate to be
sent when the hotunplug timeout expires, letting users know that
something happened inside the guest and the pseries machine didn't
delete the device from QOM.

After this patch, if an user try to hotunplug the last online CPU of
the guest, the "DEIVCE_NOT_DELETED" event will be issued when the
hotunplug timeout for 'core1' is expired:

{"execute": "device_del", "arguments": {"id": "core1"} }
{"return": {}}

{"execute": "device_del", "arguments": {"id": "core1"} }
{"error": {"class": "GenericError",
           "desc": "core-id 1 unplug is still pending, 12 seconds timeout remaining"}}

{"execute": "device_del", "arguments": {"id": "core1"} }
{"error": {"class": "GenericError",
           "desc": "core-id 1 unplug is still pending, 5 seconds timeout remaining"}}

{"timestamp": {"seconds": 1615570254, "microseconds": 573986},
  "event": "DEVICE_NOT_DELETED",
  "data": {"device": "core1", "path": "/machine/peripheral/core1"}}

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 8a71b03800..14f39cec71 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qnull.h"
+#include "qapi/qapi-events-qdev.h"
 #include "cpu.h"
 #include "qemu/cutils.h"
 #include "hw/ppc/spapr_drc.h"
@@ -529,9 +530,16 @@ static const VMStateDescription vmstate_spapr_drc = {
 static void drc_unplug_timeout_cb(void *opaque)
 {
     SpaprDrc *drc = opaque;
+    DeviceState *dev = drc->dev;
 
     if (drc->unplug_requested) {
         drc->unplug_requested = false;
+
+        if (dev) {
+            qapi_event_send_device_not_deleted(!!dev->id,
+                                               dev->id,
+                                               dev->canonical_path);
+        }
     }
 }
 
-- 
2.29.2


