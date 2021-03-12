Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF954339804
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 21:10:13 +0100 (CET)
Received: from localhost ([::1]:50802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKo6u-0000jM-QY
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 15:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKo4n-0007ky-BY; Fri, 12 Mar 2021 15:08:01 -0500
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:42658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKo4l-0005Zr-KC; Fri, 12 Mar 2021 15:08:01 -0500
Received: by mail-qk1-x729.google.com with SMTP id z190so25628925qka.9;
 Fri, 12 Mar 2021 12:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLOLgIRjpS3Q69hBryUtdykb4swdd9INECJB0dRgMv0=;
 b=hCFiZ7zSe4aYkMdJz4kU2JWfLJsbNdYxf1p+Q8q91xotmWTAqdJlDmzjn2i1/Ghin0
 jkXZAXXsa04v3AxzR2K2aEYHdNK3wAdZmqVDxBeciLOq9aJCkB+qKcwhCINxf0wONYRA
 8TJZZbW2pxOnRcUZWGT2FP4USUhhpEojCsnqf++y7qvNi1ZqEUsBSvDhAAp6kN9KcVuL
 2L57ROEclyOUvKwbQ2DIBCnJYKgHryWVUFj+oeCkPwO6pLOiiTCONfNgl2xiOdT2731x
 J/yPG4Y30RgOAf/b2oNvbbwAQVK3H4VnQL0TfUywdjah9Yn76CfoPcn6t4bwccCFiAYz
 FXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rLOLgIRjpS3Q69hBryUtdykb4swdd9INECJB0dRgMv0=;
 b=CWPCap9ZYGDwm2cYgIVv7TPQgvK2FFdaL1ng3v/on69WZfNba3lyeAow5wQ+PVZavt
 h2O2sFn4rOs9b5WRnVkl1J9x7xP7Q/gryy8vE6z0H4RTGploiDckcm15c4XlkIU2c3CR
 YJ82eMzFl2mMLGP0e1gfBWm58Q/WcF2hTweah4lHfuaEywD54uJzpJvLl4lXgqeVZ36h
 35fX4We3TylYaX9PQNKRWpQGpbDaHT7hM6A4cWd0YMfwDwprFqPWFEXmyIQ0LvtILfws
 t5r/Zs1eDuz4uMirDt+DQSRPm6SgwpovhwmKsp0Ct87Bn1wFz6mVpMWScERWvwOmxoVU
 /c7w==
X-Gm-Message-State: AOAM532AX+4pXk2gptacqyh5aaugP41YiJIRMqdwQ7ba+iyv6qg3n/fM
 hHhDRzvVctHJmEPnZ0Xce7jMLx/rlro=
X-Google-Smtp-Source: ABdhPJxgHE3oQjeoOXzpo+Wou++ASq1ir4NiMlJrw0Aymn68n9WtOnNUCao0x5jDFkKlg+qL51WGqA==
X-Received: by 2002:a37:c16:: with SMTP id 22mr14373233qkm.84.1615579678248;
 Fri, 12 Mar 2021 12:07:58 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id j24sm5074126qka.67.2021.03.12.12.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 12:07:57 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] qapi/qdev.json: add DEVICE_NOT_DELETED event
Date: Fri, 12 Mar 2021 17:07:37 -0300
Message-Id: <20210312200740.815014-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312200740.815014-1-danielhb413@gmail.com>
References: <20210312200740.815014-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x729.google.com
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

This new event informs QAPI listeners that a previously issued
'device_del' command failed to delete the device from the machine.

Note that no assertion can be made about the failure reason. The goal of
this event is to inform management that QEMU is not able to assess
whether the hotunplug is taking too long to complete or failed in the
guest and, as result, the device is not removed from QOM. When receiving
this event, users/management must check inside the guest to verify the
result of the hotunplug operation.

This scenario happens with architectures where the guest does not have
an official way to report the hotunplug error back to the hypervisor,
such as PowerPC and the pseries machine type.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 qapi/qdev.json | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..df9a1b9e67 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -124,3 +124,31 @@
 ##
 { 'event': 'DEVICE_DELETED',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @DEVICE_NOT_DELETED:
+#
+# Emitted whenever the device removal process expired and the device
+# still exists in QOM. This indicates that the guest took too long
+# to acknowlege the device removal, and we can not be sure of whether
+# the process will be completed in the guest later on or a guest
+# side error occurred.
+#
+# It is not safe to reuse the specified device ID.
+#
+# @device: device name
+#
+# @path: device path
+#
+# Since: 6.0
+#
+# Example:
+#
+# <- { "event": "DEVICE_NOT_DELETED",
+#      "data": { "device": "core1",
+#                "path": "/machine/peripheral/core1" },
+#      "timestamp": { "seconds": 1615570254, "microseconds": 573986 } }
+#
+##
+{ 'event': 'DEVICE_NOT_DELETED',
+  'data': { '*device': 'str', 'path': 'str' } }
\ No newline at end of file
-- 
2.29.2


