Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D181939442B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 16:23:58 +0200 (CEST)
Received: from localhost ([::1]:37404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmdP3-0005Gb-U7
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 10:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmdNO-0003qt-KE
 for qemu-devel@nongnu.org; Fri, 28 May 2021 10:22:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmdNL-0001nI-JR
 for qemu-devel@nongnu.org; Fri, 28 May 2021 10:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622211730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CJJnb/9LohL+6En9kA/oSnMYQrdF0TbGdKM6ZAV+UBM=;
 b=EXycgrE0JaDJFxbj6Xa2kJBm4yO6HGJK9hNdOZ+td3QDayI1kZo+Al69xyHVogyVV1j4EK
 S82Ad4CAckI/RBSfqdx6qtY1bnSzyf5AlJCAImSW6+C2xe2WpCmWYXJr07PzYuercYPVAb
 7yoglg+TvM0XOYim6rcHJT5Ux/PnslY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-Y5mQ-EVaMdiKB6QFdtlytg-1; Fri, 28 May 2021 10:22:08 -0400
X-MC-Unique: Y5mQ-EVaMdiKB6QFdtlytg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A120425D1;
 Fri, 28 May 2021 14:22:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 202F0E16F;
 Fri, 28 May 2021 14:22:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B79EB18003AF; Fri, 28 May 2021 16:22:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] hw/input/hid: Add support for keys of jp106 keyboard.
Date: Fri, 28 May 2021 16:22:00 +0200
Message-Id: <20210528142202.2154592-2-kraxel@redhat.com>
In-Reply-To: <20210528142202.2154592-1-kraxel@redhat.com>
References: <20210528142202.2154592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Katsuhiro Ueno <uenobk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Katsuhiro Ueno <uenobk@gmail.com>

Add support for the following keys: KATAKANAHIRAGANA, HENKAN, MUHENKAN,
RO, and YEN.  Before this commit, these keys did not work as expected
when a jp106 keyboard was connected to the guest as a usb-kbd device.

Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
Message-Id: <CA+pCdY3iG+pKKQqEVknnWF-W0wK36S4U1jxPvxmGAPp6FFvz1Q@mail.gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/input/hid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/hid.c b/hw/input/hid.c
index e1d2e4608374..8aab0521f405 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -51,8 +51,8 @@ static const uint8_t hid_usage_keys[0x100] = {
     0x45, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e,
     0xe8, 0xe9, 0x71, 0x72, 0x73, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-    0x00, 0x00, 0x00, 0x00, 0x00, 0xe3, 0xe7, 0x65,
+    0x88, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x8a, 0x00, 0x8b, 0x00, 0x89, 0xe7, 0x65,
 
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-- 
2.31.1


