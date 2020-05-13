Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087751D1091
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:05:34 +0200 (CEST)
Received: from localhost ([::1]:37580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpCf-0007uF-24
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1jYp8K-0003Fg-LC
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:01:04 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:36918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1jYp8I-0001kJ-Pn
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:01:04 -0400
Received: by mail-lf1-x12f.google.com with SMTP id 8so10525664lfp.4
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FvdUmJu1ZvFL9YANH7ScK+J3XoxuyKoXoc1BE6ql+7E=;
 b=aVo8G9g4Xn/rPdV0N1DvZY5j6NMI6c5S/cnRTkvQBpj3GpotZzHmQHE3SWlZTHK69g
 Fa8G0M3gqaaNzycPE+eDLFSTk2/1wTibHlutZMklWZBvd5VYK8jjXT1YNXkcD234VyDK
 gx6SGBdS6oWPM1+Web5+sd1JCL/Nzt1STB29uFce1GXdA/Vpzfb0UcIOJZqlyG+rn0Cs
 VFj2J6/apTAFJ1+3L0ZWr+bdW3uCsk7M01oVtA1/Q5ESZQ/0O56K78JRBAntzhlSgra/
 LjTx9Y5xqwwZ0uNIJ1NrA1gWg6T57v4FrpFLcWxxa8j8mp7O4VmnCoZKqRwLcXhsA0KR
 FNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FvdUmJu1ZvFL9YANH7ScK+J3XoxuyKoXoc1BE6ql+7E=;
 b=KF4pADj2m3ni/eNUtMlWbadyEyes95SvRA8UX/0d4IJsy0Q9rODQJyaNEQFXS+vhNr
 Hfj6la3folX191qjjhbgdSVVK1W3ZOu2TITegXWpckUH9Pzncj+O0MRTbMmDsECg6nrt
 uSIOAobp22z3WA4Ybttx58tCrAWtAXrs/isDg/CYr5p7duzKywX/9V6Z+zxPGdZQCFpc
 jPgFcqqdwP7qvUHCrXWuDQV515f1e4nh1UK1oh61fN/jV0gQpZA+ZBMziRzYWDMQ2shX
 v3Pwx/dkv7yAuww75HXFM+jGKZpn7mCF1MPqee5b84MPBebxAGX4ZYrxyNfktdTh0c5J
 LEyQ==
X-Gm-Message-State: AOAM531U/oTq3vJuJZWkzfQM4pf9HSitfhyC1u0MW1Tan5kG6gOt1Pzk
 Trgrj2xPGGHtjQe/RQdabTPcW47frAG5SQ==
X-Google-Smtp-Source: ABdhPJybbzg72bheTIIOPEw10mzXa7GDxesRIkSaGPohzc35q0TdFZ/qkgIyY2ok+pn4yJcyHHa4EA==
X-Received: by 2002:a05:6512:2027:: with SMTP id
 s7mr17179065lfs.39.1589367658893; 
 Wed, 13 May 2020 04:00:58 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id x11sm15734897lfe.6.2020.05.13.04.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 04:00:58 -0700 (PDT)
From: andrew@daynix.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] e1000e: Added ICR clearing by corresponding IMS bit.
Date: Wed, 13 May 2020 14:28:52 +0300
Message-Id: <20200513112852.1464626-2-andrew@daynix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513112852.1464626-1-andrew@daynix.com>
References: <20200513112852.1464626-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12f;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: jasowang@redhat.com, dmitry.fleytman@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1707441
Added ICR clearing if there is IMS bit - according to the note by
section 13.3.27 of the 8257X developers manual.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/net/e1000e_core.c | 9 +++++++++
 hw/net/trace-events  | 1 +
 2 files changed, 10 insertions(+)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index d5676871fa..302e99ff46 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2624,6 +2624,15 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
         e1000e_clear_ims_bits(core, core->mac[IAM]);
     }
 
+    /*
+     * PCIe* GbE Controllers Open Source Software Developer's Manual
+     * 13.3.27 Interrupt Cause Read Register
+     */
+    if (core->mac[ICR] & core->mac[IMS]) {
+        trace_e1000e_irq_icr_clear_icr_bit_ims(core->mac[ICR], core->mac[IMS]);
+        core->mac[ICR] = 0;
+    }
+
     trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
     e1000e_update_interrupt_state(core);
     return ret;
diff --git a/hw/net/trace-events b/hw/net/trace-events
index e18f883cfd..46e40fcfa9 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -237,6 +237,7 @@ e1000e_irq_icr_read_entry(uint32_t icr) "Starting ICR read. Current ICR: 0x%x"
 e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR: 0x%x"
 e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero IMS"
 e1000e_irq_icr_clear_iame(void) "Clearing ICR on read due to IAME"
+e1000e_irq_icr_clear_icr_bit_ims(uint32_t icr, uint32_t ims) "Clearing ICR on read due corresponding IMS bit: 0x%x & 0x%x"
 e1000e_irq_iam_clear_eiame(uint32_t iam, uint32_t cause) "Clearing IMS due to EIAME, IAM: 0x%X, cause: 0x%X"
 e1000e_irq_icr_clear_eiac(uint32_t icr, uint32_t eiac) "Clearing ICR bits due to EIAC, ICR: 0x%X, EIAC: 0x%X"
 e1000e_irq_ims_clear_set_imc(uint32_t val) "Clearing IMS bits due to IMC write 0x%x"
-- 
2.26.2


