Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6570952F44E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 22:15:45 +0200 (CEST)
Received: from localhost ([::1]:40300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns92G-0006QY-BI
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 16:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ns90l-0005hd-RK
 for qemu-devel@nongnu.org; Fri, 20 May 2022 16:14:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ns90i-0006YB-Eh
 for qemu-devel@nongnu.org; Fri, 20 May 2022 16:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653077646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hv4TBjDgZgVIw4bVtHgacGcH7ts65+Xa3Cfhq+P55Dw=;
 b=ilDKSh5oBJeILVwrMiySxHBeBx1gubp4XASC3mRsLTPXCd3u0mZnuYyDL1uAbBSHM1v6AY
 NMgqjNS4aakocqdH+4ynSkQe9KCq0opmZ8ej5R6lIbQtbY1FKqSg2pn5mmXRt/TsfwkbFb
 ABknictEu/gTXFTbCKW0qsAfjfU0tdo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-UqjlKvCzMkW18JIxG1fHMw-1; Fri, 20 May 2022 16:14:05 -0400
X-MC-Unique: UqjlKvCzMkW18JIxG1fHMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6AF71C04B64;
 Fri, 20 May 2022 20:14:04 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B9792166B25;
 Fri, 20 May 2022 20:14:02 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH] qga-win32: Add support for NVME but type
Date: Fri, 20 May 2022 23:14:01 +0300
Message-Id: <20220520201401.706630-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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



