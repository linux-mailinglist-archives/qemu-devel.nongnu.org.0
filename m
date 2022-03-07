Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD71F4D06A0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:35:46 +0100 (CET)
Received: from localhost ([::1]:44300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRICv-0000Ma-Pe
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:35:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI46-0006HW-EB
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI44-0006uH-Oi
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646677596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3XMaTsJ7o4sZ4rzQijJHTrmx1yhi5q7NI+Gf0YRP2Sk=;
 b=bArZi6iR/+XJ2m/SyOZn6ZthtcglSfO3rnu9rna/5ZyntMQ3Xdlg+sfXjkakDQIQgG9zVi
 GNsIoymhqQXYMOv+mn+jXCJXmpzobcldVY5SNV2J7uA8MOseEHOgER3WMzNmrlzE/GQXUp
 Mpcy+Hz3reHeE1c0VGSW080N4AdPaFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-FJJJvceBOui2XjZravT4Vg-1; Mon, 07 Mar 2022 13:26:27 -0500
X-MC-Unique: FJJJvceBOui2XjZravT4Vg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30A071091DA2;
 Mon,  7 Mar 2022 18:26:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA51C804DB;
 Mon,  7 Mar 2022 18:26:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] tests/avocado: Cancel BootLinux tests in case there is no
 free port
Date: Mon,  7 Mar 2022 19:26:07 +0100
Message-Id: <20220307182609.94466-6-thuth@redhat.com>
In-Reply-To: <20220307182609.94466-1-thuth@redhat.com>
References: <20220307182609.94466-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The BootLinux tests are currently failing with an ugly python
stack trace on my RHEL8 system since they cannot get a free port
(likely due to the firewall settings on my system). Let's properly
check the return value of find_free_port() instead and cancel the
test gracefully if it cannot get a free port.

Message-Id: <20220228114325.818294-1-thuth@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 75063c0c30..9b056b5ce5 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -603,6 +603,8 @@ def prepare_cloudinit(self, ssh_pubkey=None):
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
             self.phone_home_port = network.find_free_port()
+            if not self.phone_home_port:
+                self.cancel('Failed to get a free port')
             pubkey_content = None
             if ssh_pubkey:
                 with open(ssh_pubkey) as pubkey:
-- 
2.27.0


