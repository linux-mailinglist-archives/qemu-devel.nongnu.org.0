Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3281B3AF729
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 23:05:27 +0200 (CEST)
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvR6k-0002Ch-7k
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 17:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lvR3w-0007um-6t; Mon, 21 Jun 2021 17:02:32 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:42760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lvR3s-0002xY-PY; Mon, 21 Jun 2021 17:02:31 -0400
Received: by mail-qt1-x836.google.com with SMTP id x21so5368573qtq.9;
 Mon, 21 Jun 2021 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LOHBVen3dDzv072rrb1Vrey4bocf8ygK5rZdUcAyRg8=;
 b=rHgROPgPqNnbGOF2pOhnJKKTWMwDXVqr8fjZQeYwp4iFCG/fGliZW8AR5hKTscgz4Y
 vacbmjPgwzfg7SRYvi4is3D3SedSYmqpnsBbJ6oq1mPX2gwd+hu2cIeXH+UQMXX87+WH
 daMYVUa5T7smZjzHhBeLdMY+C0S5AAGK+T89RowSA8DggPWfi9g4p4fOYOYi/phQL50s
 /QuW6sp669D9tI8TdR7OypJIPIcfDszY3Seps7DJNHBof09Iczvvv4oh/bgfFhd37P1m
 cwSHCz0G2bcB4N3RkHLDlq6ARlvB1Xw74nCu7JZiV8mhhXtZPsmxGKwh4g1oj7sIAuTg
 5jPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LOHBVen3dDzv072rrb1Vrey4bocf8ygK5rZdUcAyRg8=;
 b=SVEncmqNXqezkI2WfAZ/T7fd3DGqfGMC9txBWe0y0m4Z+UFa4LUkwkLcdKy7ahFqhk
 vnNj6HpKuihOlyDYkpbx74e+f0sWIm6DGzhLsbXDQRLi0uGJd+1FKiBKqJdJddCzP1p9
 f4J63qRrVr8NGPyHybnAYZ5fjX/pvLjqlrPSHnCKHGaMmc4gMoqd0JvQvgi+aXgpHhTL
 P6SxWxAAl1BsP8FisIj6cBOpphZx1Xv03Rdxv7bWJJsZdSaISL+q82wmTVJYtm6D6mg4
 kOZvD8ym+/Qg4OdGEGx2GHQa9orN2IUnJRz8dg92Cexua0bSWVPk4Gyd5NmO2ssvLheM
 XFdg==
X-Gm-Message-State: AOAM532YRTLZOGr8UkVT4nkVP2CsIOxAXZ9+0+1DyiywvXMGiRljOVVy
 lmFdAtiY9WxQUnj1pffPHjIrL2OJo7I=
X-Google-Smtp-Source: ABdhPJzNPqbcxtD7/QCLSn19Rmj+VCbIzKWS95DleUw5nYZCDvv4GT+O6L4n9CvB9I08+svsdPifJQ==
X-Received: by 2002:ac8:5dc7:: with SMTP id e7mr453758qtx.219.1624309347216;
 Mon, 21 Jun 2021 14:02:27 -0700 (PDT)
Received: from localhost.localdomain ([191.19.29.157])
 by smtp.gmail.com with ESMTPSA id b8sm187035qtr.77.2021.06.21.14.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 14:02:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
Date: Mon, 21 Jun 2021 17:59:05 -0300
Message-Id: <20210621205907.244841-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621205907.244841-1-danielhb413@gmail.com>
References: <20210621205907.244841-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x836.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, armbru@redhat.com,
 groug@kaod.org, qemu-ppc@nongnu.org, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At this moment we only provide one event to report a hotunplug error,
MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
machine is now able to report unplug errors for other device types, such
	as CPUs.

	Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
	create a generic DEVICE_UNPLUG_ERROR event that can be used by all
	unplug errors in the future.

	With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.

	Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
	---
	 docs/system/deprecated.rst | 10 ++++++++++
	 qapi/machine.json          |  6 +++++-
	 qapi/qdev.json             | 27 ++++++++++++++++++++++++++-
	 3 files changed, 41 insertions(+), 2 deletions(-)

	diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
	index e2e0090878..c8200d99d4 100644
	--- a/docs/system/deprecated.rst
	+++ b/docs/system/deprecated.rst
	@@ -192,6 +192,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
	 (the ISA has never been upstreamed to a compiler toolchain). Therefore
	 this CPU is also deprecated.
	 
	+
	+QEMU API (QAPI) events
	+----------------------
	+
	+``MEM_UNPLUG_ERROR`` (since 6.1)
	+''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	+
	+Use the more generic event ``DEVICE_UNPLUG_ERROR`` instead.
	+
	+
	 System emulator machines
	 ------------------------
	 
	diff --git a/qapi/machine.json b/qapi/machine.json
	index e4d0f9b24f..91dc520734 100644
	--- a/qapi/machine.json
	+++ b/qapi/machine.json
	@@ -1271,6 +1271,9 @@
	 #
	 # @msg: Informative message
	 #
	+# Features:
	+# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_ERROR instead.
	+#
	 # Since: 2.4
	 #
	 # Example:
	@@ -1283,4 +1286,5 @@
	 #
	 ##
	 { 'event': 'MEM_UNPLUG_ERROR',
	-  'data': { 'device': 'str', 'msg': 'str' } }
	+  'data': { 'device': 'str', 'msg': 'str' },
	+  'features': ['deprecated'] }
	diff --git a/qapi/qdev.json b/qapi/qdev.json
	index b83178220b..349d7439fa 100644
	--- a/qapi/qdev.json
	+++ b/qapi/qdev.json
	@@ -84,7 +84,9 @@
	 #        This command merely requests that the guest begin the hot removal
	 #        process.  Completion of the device removal process is signaled with a
	 #        DEVICE_DELETED event. Guest reset will automatically complete removal
	-#        for all devices.
	+#        for all devices. If an error in the hot removal process is detected,
	+#        the device will not be removed and a DEVICE_UNPLUG_ERROR event is
	+#        sent.
	 #
	 # Since: 0.14
	 #
	@@ -124,3 +126,26 @@
	 ##
	 { 'event': 'DEVICE_DELETED',
	   'data': { '*device': 'str', 'path': 'str' } }
	+
	+##
	+# @DEVICE_UNPLUG_ERROR:
	+#
	+# Emitted when a device hot unplug error occurs.
	+#
	+# @device: device name
	+#
	+# @msg: Informative message
	+#
	+# Since: 6.1
	+#
	+# Example:
	+#
	+# <- { "event": "DEVICE_UNPLUG_ERROR"
	+#      "data": { "device": "dimm1",
	+#                "msg": "Memory hotunplug rejected by the guest for device dimm1"
	+#      },
	+#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
	+#
	+##
	+{ 'event': 'DEVICE_UNPLUG_ERROR',
	+  'data': { 'device': 'str', 'msg': 'str' } }
	-- 
	2.31.1


