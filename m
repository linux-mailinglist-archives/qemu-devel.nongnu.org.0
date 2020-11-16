Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE4A2B4249
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:12:46 +0100 (CET)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecRB-0003cN-Ga
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kecPG-0001zL-Uf
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:10:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kecPE-000285-Ao
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605525043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRtS9CFihx0y6pwEeWEAj5qdTSME9+UquJ7AP5d8s0s=;
 b=fKp/wEvMRnuWD/aR5C8cI0ePkui7RAl+AL/PRIEOxl8Ds0zoVzmpgOG72B45RDla+KJC9w
 gqWWxuwchxHd82UBpCaKIYeznVvlc5x6UFiMchNYNLH/nwGK5zaN7FRWxrAt8lPFUjfUpF
 prDwI6R4oKhSe7HZyHY8/8EIxtRwE3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-0cwzP2Y0PkOOhStmU3a8dA-1; Mon, 16 Nov 2020 06:10:41 -0500
X-MC-Unique: 0cwzP2Y0PkOOhStmU3a8dA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9290186DD25
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 11:10:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45E726EF57;
 Mon, 16 Nov 2020 11:10:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 46FF09D92; Mon, 16 Nov 2020 12:10:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] usb-storage: use bool for removable property
Date: Mon, 16 Nov 2020 12:10:33 +0100
Message-Id: <20201116111036.12820-4-kraxel@redhat.com>
In-Reply-To: <20201116111036.12820-1-kraxel@redhat.com>
References: <20201116111036.12820-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20201105134112.25119-4-kraxel@redhat.com
---
 hw/usb/dev-storage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index d5cc6137443c..360e8ca8f2bd 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -56,7 +56,7 @@ struct MSDState {
     USBPacket *packet;
     /* usb-storage only */
     BlockConf conf;
-    uint32_t removable;
+    bool removable;
     bool commandlog;
     SCSIDevice *scsi_dev;
 };
@@ -682,7 +682,7 @@ static const VMStateDescription vmstate_usb_msd = {
 static Property msd_properties[] = {
     DEFINE_BLOCK_PROPERTIES(MSDState, conf),
     DEFINE_BLOCK_ERROR_PROPERTIES(MSDState, conf),
-    DEFINE_PROP_BIT("removable", MSDState, removable, 0, false),
+    DEFINE_PROP_BOOL("removable", MSDState, removable, false),
     DEFINE_PROP_BOOL("commandlog", MSDState, commandlog, false),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.27.0


