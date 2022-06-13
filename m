Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFEF54851A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:22:30 +0200 (CEST)
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0j5R-0001xZ-NR
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0iNc-0001VQ-M7
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0iNb-0002NW-7F
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655120230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TqkIe5B5GmtLHYDEQNksBwY0pKybp1zEh7xnID9ieAU=;
 b=QfY0MnK7wa9kH9dktCPfadVOti0NUJvrgiMytBQB4N3/fLulO2NLbKSpp2DWcdMYn50B7h
 YQX5MpBFuWA6s93+p+aP5DU/xLtDgYQ/9Wq+wRfQqcZYL9yWWCN4x1PZ0tqCiRNUytcSxE
 VAhi0X1GuUqHJ34TDZ7BON8k72orChI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-y95P-MdnMjCHDvW2Dm1Vhw-1; Mon, 13 Jun 2022 07:37:05 -0400
X-MC-Unique: y95P-MdnMjCHDvW2Dm1Vhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0241429AA3B9;
 Mon, 13 Jun 2022 11:37:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C162540C1247;
 Mon, 13 Jun 2022 11:37:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5A37E180093F; Mon, 13 Jun 2022 13:36:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 08/16] docs/system/devices/usb: Add CanoKey to USB devices
 examples
Date: Mon, 13 Jun 2022 13:36:47 +0200
Message-Id: <20220613113655.3693872-9-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YoY6o+QFhzA7VHcZ@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/system/devices/usb.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index afb7d6c2268d..872d9167589b 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -199,6 +199,10 @@ option or the ``device_add`` monitor command. Available devices are:
 ``u2f-{emulated,passthru}``
    Universal Second Factor device
 
+``canokey``
+   An Open-source Secure Key implementing FIDO2, OpenPGP, PIV and more.
+   For more information, see :ref:`canokey`.
+
 Physical port addressing
 ^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.36.1


