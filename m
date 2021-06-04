Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD239C105
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:06:24 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpG5H-0007In-B5
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lpG3C-0005Bj-2N; Fri, 04 Jun 2021 16:04:14 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:33769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lpG3A-0000Qx-0l; Fri, 04 Jun 2021 16:04:13 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id 5so5613863qvk.0;
 Fri, 04 Jun 2021 13:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A0fEYqYijgmXe2Xcovc9mpgjPFbwuu7scsqLtKvxj5A=;
 b=brPulBsaSfnPKERT8adhepBjWsHHFK8eGGzko4i71gE1Pu8hg/j2R/PheOqwnYNDva
 iQbSdEi64D2sLK183QCz1n48DXlvIb0f2qo9cFPv7NiDuAHHWNiWOvghckyYo3RUKiq8
 yzQ/q0kZo2V2ko+GUvja1DezlJNjWYmlKBcNTefIjFd6s95bMyTkgThk7ncAXMHSEznL
 VXX5oCzhOrpQejG7LkZ6ObOuYR+9pGCbglrsmXx63ceERfZEQXZ+wsbYb1qVGWBvygmd
 fWnUfVz49bE7LTY9Wj8xyAxBQdQUiPKbBLN+4sBwNLNBsDspO7JDIVskJR4O2Om0nzrL
 ZpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A0fEYqYijgmXe2Xcovc9mpgjPFbwuu7scsqLtKvxj5A=;
 b=pOJXiL6sTXyixQUGMpE61TNOqgYJzfP9h63ztaLbHLL/IO6mvYIN+rXENdCUdt3/LC
 /oLRoPmg39R15fa/HtKasEXP+MHAqjfHU0L4Ggmj9N1y9N1fbM/lF9lxSUo5zTz8APr0
 VwX3v3zEXhRLaiX4YQueDeEJDRA6rccav6fOQicbDXLXRnmodPcCkvCfBAVNXyCUv2HT
 19E10EbamCa4vBf0gkF+AVukUL/yh1pFOhT5vKlVyMevyNWer/RB+ZKBkPv5S3vJ1txq
 AjQv7r/PqRXsX6GVjtOCib5CSYkZ8W3cRENSrH/KdcoxqTTiGrxJ37cHkOapb/oiDWlc
 9tUQ==
X-Gm-Message-State: AOAM532E+xZgbTou7ukKwPs13qGQXNGjig3xiw4BDnexXpy7k5TfBy9i
 pfX3ZD0GgkvrgFq1gyFY7IKOzzdFU7V9XQ==
X-Google-Smtp-Source: ABdhPJxyArMo6RKkhOmc1lvf0Td6EuJFO1DxEymLRHqsUHpbEAV0G+8Zva+QthaNa2nQgq7aJA8WJA==
X-Received: by 2002:a0c:d409:: with SMTP id t9mr6525197qvh.18.1622837050515;
 Fri, 04 Jun 2021 13:04:10 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:b390:9cad:b272:426b:6a0])
 by smtp.gmail.com with ESMTPSA id
 f19sm4765011qkg.70.2021.06.04.13.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:04:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI event
Date: Fri,  4 Jun 2021 17:03:52 -0300
Message-Id: <20210604200353.1206897-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604200353.1206897-1-danielhb413@gmail.com>
References: <20210604200353.1206897-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2f.google.com
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At this moment we only provide one event to report a hotunplug error,
MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
machine is now able to report unplug errors for other device types, such
as CPUs.

Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
create a generic DEVICE_UNPLUG_ERROR event that can be used by all
unplug errors in the future.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 qapi/machine.json | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/qapi/machine.json b/qapi/machine.json
index 58a9c86b36..f0c7e56be0 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1274,3 +1274,26 @@
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' } }
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


