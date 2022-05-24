Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F9532E8D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:06:06 +0200 (CEST)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntX2r-000808-D3
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntWhV-0000KB-9K
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntWhT-0005gR-JD
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653407039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4H8GLJDo2U52pmF56IvAp+u8UV5S/Kp4f0P2PXyYMw=;
 b=TLy0GgFfv7FgMjZAVWxDGeEyeNczvu13yw79Rz5oNSG3OFywt3Nv/HU6AQxBE1e1Gkgq10
 TJFFLWr2oQ3pDaAiGeWgVPNHpBSK8OOZb8TV38lLIBzAHIiPGFDyZPh/Oh+nWB/AvkmfT/
 H0RBK3r4Ir+2l2tfZIvmSFPfW7G/Nlg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-gBLNNEnCOTaMGwcACnpSuw-1; Tue, 24 May 2022 11:43:48 -0400
X-MC-Unique: gBLNNEnCOTaMGwcACnpSuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A3831C05AE9;
 Tue, 24 May 2022 15:43:48 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.40.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 729227AD8;
 Tue, 24 May 2022 15:43:47 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH 1/1] qga-win32: Add support for NVME bus type
Date: Tue, 24 May 2022 18:43:44 +0300
Message-Id: <20220524154344.869638-2-kkostiuk@redhat.com>
In-Reply-To: <20220524154344.869638-1-kkostiuk@redhat.com>
References: <20220524154344.869638-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Bus type spaces (Indicates a storage spaces bus) is not
supported, so return it as unknown.

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-win32.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index d56b5fd2a7..5ca2af9173 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -490,6 +490,11 @@ static GuestDiskBusType win2qemu[] = {
 #if (_WIN32_WINNT >= 0x0601)
     [BusTypeVirtual] = GUEST_DISK_BUS_TYPE_VIRTUAL,
     [BusTypeFileBackedVirtual] = GUEST_DISK_BUS_TYPE_FILE_BACKED_VIRTUAL,
+    /*
+     * BusTypeSpaces currently is not suported
+     */
+    [BusTypeSpaces] = GUEST_DISK_BUS_TYPE_UNKNOWN,
+    [BusTypeNvme] = GUEST_DISK_BUS_TYPE_NVME,
 #endif
 };
 
-- 
2.25.1


