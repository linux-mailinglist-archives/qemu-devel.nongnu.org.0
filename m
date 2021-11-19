Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3063456D46
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:29:08 +0100 (CET)
Received: from localhost ([::1]:40684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo18l-0002dZ-MH
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:29:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mo166-0000z8-EL
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mo164-00016p-HD
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637317580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZnsIxDJfxVC4Whf+bLr3CZwu5K/BN1hucIFa96vdynw=;
 b=D2saLfEFxsNoVgTiAlmqqBN4OWYb4YAcA4LQrpxcWm6tk4PS1ROtn26vFUxolC6hiaOK/0
 ktquQoBv6nMHMv0JMSvYX7zFfLdEZatIURl/K0I9/BZQlmTMylpDRMFdaFp5A01/KtNtGd
 jT6HbhzpJlwl71npnsEH/4h4WAB1SLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-ipAJ8fh_P5aKdP-H-oC9iw-1; Fri, 19 Nov 2021 05:26:16 -0500
X-MC-Unique: ipAJ8fh_P5aKdP-H-oC9iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CE991808318;
 Fri, 19 Nov 2021 10:26:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 527BA1970E;
 Fri, 19 Nov 2021 10:25:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-6.2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP
 device instead of IF_NONE
Date: Fri, 19 Nov 2021 11:25:49 +0100
Message-Id: <20211119102549.217755-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Configuring a drive with "if=none" is meant for creation of a backend
only, it should not get automatically assigned to a device frontend.
Use "if=pflash" for the One-Time-Programmable device instead (like
it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).

Since the old way of configuring the device has already been published
with the previous QEMU versions, we cannot remove this immediately, but
have to deprecate it and support it for at least two more releases.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 6 ++++++
 hw/misc/sifive_u_otp.c    | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index c03fcf951f..ff7488cb63 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -192,6 +192,12 @@ as short-form boolean values, and passed to plugins as ``arg_name=on``.
 However, short-form booleans are deprecated and full explicit ``arg_name=on``
 form is preferred.
 
+``-drive if=none`` for the sifive_u OTP device (since 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Using ``-drive if=none`` to configure the OTP device of the sifive_u
+RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 18aa0bd55d..cf6098ff2c 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -209,7 +209,14 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
                           TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 
-    dinfo = drive_get_next(IF_NONE);
+    dinfo = drive_get_next(IF_PFLASH);
+    if (!dinfo) {
+        dinfo = drive_get_next(IF_NONE);
+        if (dinfo) {
+            warn_report("using \"-drive if=none\" for the OTP is deprecated, "
+                        "use \"-drive if=pflash\" instead.");
+        }
+    }
     if (dinfo) {
         int ret;
         uint64_t perm;
-- 
2.27.0


