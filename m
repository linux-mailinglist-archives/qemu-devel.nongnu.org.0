Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716513BE04D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:36:16 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vXz-0006XU-G3
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m0vVU-0004mx-KB; Tue, 06 Jul 2021 20:33:40 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m0vVS-0001PF-P6; Tue, 06 Jul 2021 20:33:40 -0400
Received: by mail-pf1-x42a.google.com with SMTP id d12so630151pfj.2;
 Tue, 06 Jul 2021 17:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nTJFZwW5vyFCs62BJSu4TQwetq1pKuyftiRFQ5EI70o=;
 b=LY1nc7baCcE6K6UWwfqkaacD83dUctYvIB1ezfD8zY7E3YR7qNlAUOX4kda1fsKYXA
 eY9A2F9+iJ5/Ozm+5d1uzaLb9dTgpcwzmh9awAOfU9vtqHPGWFZPbfd7AHtlVwiTUgM+
 xho61awwtJsZShDxaj3ya0fg+nl5RpJDELubti6yRi+6R+5lDY8vjdxw1cu0xlF9sbRY
 lw6M9LDWWbIdr8VWzU+k+JlnHuP9VYWKcQMSNbPemucsrunhAYHOUmxIA4JjBllTCmGX
 /dYiFpFA9j8PwugM84su+gOPoSD56tujk852EU700ht+FYfI0KDJyT4Was2ydVYKKA9d
 lA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nTJFZwW5vyFCs62BJSu4TQwetq1pKuyftiRFQ5EI70o=;
 b=aaYtWd+jyjiklECaGzq1vecetu15p3R5Uer4+kGtRods4ktEJbn9TVz5V0C8PKOTuf
 j/ulu62Q3LP3C56R1vTRqBzq+Sj8D2/iyOTpcSZjeMW/Ebtc7OtmGyT2MMQIVGPkOo0/
 X+J8wtNwa9+QqitKqCMg/+Bi4a8H/DApV/9xdWtQRQ0JRixqDj6RM6T6SyqwSusB/8N1
 4e7OYY2A/j4gVD2q1W0C7+IR6+grA0hw+VP/Gqqqo9E9vkjWwWYCSCgXtOa2rQdXf2Rr
 pv6G8jUn3mtzumPCRjEJb1NUPqNBXUcJ2ajRHfK2rBrnoVST24TA0R3PY4h+Uc1BEjwR
 cNLw==
X-Gm-Message-State: AOAM530JRsNl+LUi3hRwqrbusgmz3OLj6qyFIK8/TWm6hWRn4I6g9YTG
 U7x6zsEJC62cf9IeIpJ7AsEkYYw29f4JWw==
X-Google-Smtp-Source: ABdhPJxhnvd7lg/jQcQ6Wo6Tau5kyyMzyJGRB67d1Jl4jtOetSG1GzT6sv5B0TOhPvQwn/U0JK2VIA==
X-Received: by 2002:a62:1447:0:b029:31d:15fa:a309 with SMTP id
 68-20020a6214470000b029031d15faa309mr15865680pfu.71.1625618015483; 
 Tue, 06 Jul 2021 17:33:35 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:7611:b123:7cbc:3065:30b1])
 by smtp.gmail.com with ESMTPSA id co12sm4004871pjb.33.2021.07.06.17.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 17:33:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
Date: Tue,  6 Jul 2021 21:33:12 -0300
Message-Id: <20210707003314.37110-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707003314.37110-1-danielhb413@gmail.com>
References: <20210707003314.37110-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x42a.google.com
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

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/system/deprecated.rst | 10 ++++++++++
 qapi/machine.json          |  6 +++++-
 qapi/qdev.json             | 27 ++++++++++++++++++++++++++-
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 70e08baff6..ca6c7f9d43 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -204,6 +204,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
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
index c3210ee1fb..a595c753d2 100644
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
@@ -1283,7 +1286,8 @@
 #
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
-  'data': { 'device': 'str', 'msg': 'str' } }
+  'data': { 'device': 'str', 'msg': 'str' },
+  'features': ['deprecated'] }
 
 ##
 # @SMPConfiguration:
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


