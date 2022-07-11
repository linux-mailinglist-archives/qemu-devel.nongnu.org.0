Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C756FCC2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:47:58 +0200 (CEST)
Received: from localhost ([::1]:53348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAq1F-0005d4-Mi
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oApy8-0002Yy-R2
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:44:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oApy7-0006Z1-Cf
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657532682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/nrSDNX4Qb9g5XbQSVFpY3J9MHci+/nAHcRadAykjg=;
 b=KzXfQs4d9Wd3ngb6aEEHf37k7GfTF2frWaGm2dN3oDTVbUqM8hbq8DOGp+9a+lW62J/h2d
 TkFyQVN2//t7/3DHchKsjzWr9WT2cRia3NSUErWnw0QXPwRq8iXhCEunnxOZ8bQZEsuBYs
 o5CIYnKYI+E6cCePjcW0g6S3Z5E5tM4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-yTs1NysoPgaiIngRckzpBw-1; Mon, 11 Jul 2022 05:44:41 -0400
X-MC-Unique: yTs1NysoPgaiIngRckzpBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D02A738217E0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 09:44:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FD23C28118;
 Mon, 11 Jul 2022 09:44:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 09B021800620; Mon, 11 Jul 2022 11:44:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/2] usb: document pcap (aka usb traffic capture)
Date: Mon, 11 Jul 2022 11:44:37 +0200
Message-Id: <20220711094437.3995927-3-kraxel@redhat.com>
In-Reply-To: <20220711094437.3995927-1-kraxel@redhat.com>
References: <20220711094437.3995927-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/system/devices/usb.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index 18e7c8b4d716..f39a88f080ff 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -382,3 +382,15 @@ What works best pretty much depends on the behavior of the specific
 usb device at hand, so it's a trial-and-error game.  If the default
 doesn't work, try another option and see whenever the situation
 improves.
+
+record usb transfers
+^^^^^^^^^^^^^^^^^^^^
+
+All usb devices have support for recording the usb traffic.  This can
+be enabled using the ``pcap=<file>`` property, for example:
+
+``-device usb-mouse,pcap=mouse.pcap``
+
+The pcap files are compatible with the linux kernels usbmon.  Many
+tools, including ``wireshark``, can decode and inspect these trace
+files.
-- 
2.36.1


