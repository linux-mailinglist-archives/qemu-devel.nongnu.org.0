Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58E33981D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 21:18:40 +0100 (CET)
Received: from localhost ([::1]:33930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKoF5-00008r-Gk
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 15:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKo4r-0007sk-Uh; Fri, 12 Mar 2021 15:08:05 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:42664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKo4q-0005eU-Bu; Fri, 12 Mar 2021 15:08:05 -0500
Received: by mail-qk1-x72f.google.com with SMTP id z190so25629149qka.9;
 Fri, 12 Mar 2021 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nHzpNXK2Bgd5WqEFdnHbZIvX/mwQqXVui82vjvFUpvU=;
 b=tFSs7pf5o4lsUDyUGibb6mBoUlj/H16VV+Z7HFN5z2R/NzYJxXyUF0+lNMvSjA2H7y
 DcQwziD7uMHjmGzUvgwZDa82/w0Wc13eKt/hnhD4wTLgLyAaBTWC1FWOLf8T/m6xo4Qk
 2kIFzn1T95siFf4hpDwa+JrpR0lMSn+fgBmFk5dop/mLBsgQWyWNh6/7h6Od9abBWoCe
 GsmwjBpGQlIbN5AHqAHAQ/W+EoEbCPx2iuMY4s1ivVuSYq8+FrV6tTH5ZscDVwP9NOAw
 OfyN0B0KazZKe1uf4dGlZMxphbgQF4Wa5CojHa1Lvv6xvpsrU95m6xdMkOgfkrAmqJ1Q
 s5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nHzpNXK2Bgd5WqEFdnHbZIvX/mwQqXVui82vjvFUpvU=;
 b=hNVYckSOCtNiobG1aI2s0eILzFzoN5U8xMmoRIH9Vt6sefKu4UAyFEDEXYprkCAjb/
 xmYAtRG2jFWhKbTqj6ds0YrPXaZUAtcGm2ApfxgG483o5x1pM3JS1bAxmlSbSn6MWfoS
 FVlmI/TSaC3AJuxmbMduOCw7U+hD/OWy3qjZIdWukp+Ag0Xyicz8RxKe6oXeHkLPSD09
 nyh+hJm9jSqVGSrGa+mXZ+g2cC0CclITuHDcpQBp4fAU2XpQGDLooCndB9wRdIycxx1M
 /CeDzlnsLmHyRzkGaGslyxXIwd5r8hiPr4NDq8TsCAXtHI6ws7vwoXivVfNGC2+FkKnn
 vnHw==
X-Gm-Message-State: AOAM533FZ+Tl6hFqII4mqZHx24VzCAy/tXBVV2v1Mpt5yD7UTLCkl96S
 k/5M/MgYAA9QuKWVMRpIX7a2ujEfU4k=
X-Google-Smtp-Source: ABdhPJz/0NPG5KiSVtjN5GDr7H5RVhpiNze17akmvVr6pKiF+RamRvpmFbQnBvsgYWYzqGCQdfdUXg==
X-Received: by 2002:a37:424e:: with SMTP id p75mr14239932qka.341.1615579682927; 
 Fri, 12 Mar 2021 12:08:02 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id j24sm5074126qka.67.2021.03.12.12.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 12:08:02 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] qapi/machine.json: add DEVICE_UNPLUG_ERROR QAPI event
Date: Fri, 12 Mar 2021 17:07:39 -0300
Message-Id: <20210312200740.815014-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312200740.815014-1-danielhb413@gmail.com>
References: <20210312200740.815014-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
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
MEM_UNPLUG_ERROR. There will be other device types that are going to be
throwing unplug errors in the future though.

Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
create a generic DEVICE_UNPLUG_ERROR event that can be used by all
unplug errors in the future.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 qapi/machine.json | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/qapi/machine.json b/qapi/machine.json
index 330189efe3..9b2c93aad3 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1471,3 +1471,26 @@
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
+# Since: 6.0
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
\ No newline at end of file
-- 
2.29.2


