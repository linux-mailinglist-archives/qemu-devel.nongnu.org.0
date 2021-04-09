Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FCB359593
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:35:39 +0200 (CEST)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkjy-000649-Rw
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZF-0004c1-Tk; Fri, 09 Apr 2021 02:24:36 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZD-0001Z5-JF; Fri, 09 Apr 2021 02:24:32 -0400
Received: by mail-ed1-x534.google.com with SMTP id r22so5166168edq.9;
 Thu, 08 Apr 2021 23:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1QJK5YsqEWkcz1+zXEQOYzQ3PdzprOwAmBARKtOH8jU=;
 b=SFfzj4vFkxKHFw7I2WM5bwbS612EFrpySvYmokQA6PhgvkhyNBRVwSRzN/yal9TlTh
 haAU0c18LOjMWa2lHdIcpYxkQ+zDwjf1Nw+UHhLlQqd9VdNzl32rLZLQm+eO8TErD/FA
 7OWnuwUQZLo/7eGDwh/SC0ncctEgyqYmS5pNJS+95fZpk+s8P6YFveOur5ad5bSTng4u
 HarUk8pCRZ0kxu7uY9tv2VXDgnldftzu4OxSJ4aKB19wAo04Cs+8AELq22FwCPK09azB
 TafJrTsukB66R1l2yVOvzAPXdV8qNPg475aBxle+1uozY/TwBearXLLuInTT89cd8vk1
 oV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1QJK5YsqEWkcz1+zXEQOYzQ3PdzprOwAmBARKtOH8jU=;
 b=s27+TfqMXYD+P3fDQm/7/eFMSg/5kjWPlc46Y2fcj4xlnlKbyb8z4ytGV6Wt0KK4+V
 MJHmbtnnyXolnH+5muGzIx/u2MM/IWEaFEylv7H/VGppsBix6Jt08+DH69rhhCir0u9F
 7Y7ZDvdO5vKrxlGOqcottqxPwYmQcgzAXoKI7PFDLyZCX2OB1Oc6F4UTwGxgCOhO/yFb
 FQ8OgIzNzcRL7Dtm9K2vs/l8CQnQYjVkyIFoBGrwwkHU7NCvsuxXEbBBZ6MsWfPldGQJ
 BN0iLLh9LTL+ba3ToQ//PDdNU8Tgnq8ZK9YyrjWs7FwncRB55KC0AC91dlcaHJCUSApQ
 zfAg==
X-Gm-Message-State: AOAM531F/B5JbHWlKdbY6uv5+PkGxIBEW75ZdnDiM4jCUSjwbnDWLecX
 hcn+EUnSXxLuK7xFl7MmZ/WETumRljVhTQ==
X-Google-Smtp-Source: ABdhPJznfibeaFD5ex6/UkoMzabT/fJR93l2LnzgcBxyv2MHxV51NWXNqFBqnC7pvpoUSASRUfCG/w==
X-Received: by 2002:a05:6402:35cd:: with SMTP id
 z13mr16107830edc.21.1617949469778; 
 Thu, 08 Apr 2021 23:24:29 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id t7sm820410edq.42.2021.04.08.23.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 5/9] hw/core/qdev-clock: Add qdev_ground_clock()
 helper
Date: Fri,  9 Apr 2021 08:23:57 +0200
Message-Id: <20210409062401.2350436-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clocks are rarely left unconnected, but rather connected to ground
plane to avoid noise. When representing the clock tree, we want to
see such ground clock. As we might reuse this clock on various
boards, introduce the qdev_ground_clock() which return a singleton
ground clock.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-clock.h |  9 +++++++++
 hw/core/qdev-clock.c    | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
index ffa0f7ba09e..2f2d2da6cd6 100644
--- a/include/hw/qdev-clock.h
+++ b/include/hw/qdev-clock.h
@@ -161,4 +161,13 @@ typedef struct ClockPortInitElem ClockPortInitArray[];
  */
 void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks);
 
+/**
+ * qdev_ground_clock:
+ * @returns: a pointer to the ground clock
+ *
+ * Get the special 'ground' clock. This clock can be used as input
+ * (unclocked) or output.
+ */
+Clock *qdev_ground_clock(void);
+
 #endif /* QDEV_CLOCK_H */
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index 117f4c6ea4a..a46384a84b7 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -210,3 +210,14 @@ void qdev_connect_clock_in(DeviceState *dev, const char *name, Clock *source)
     assert(!dev->realized);
     clock_set_source(qdev_get_clock_in(dev, name), source);
 }
+
+Clock *qdev_ground_clock(void)
+{
+    static Clock *gnd_clk;
+
+    if (!gnd_clk) {
+        gnd_clk = clock_new(qdev_get_machine(), "gnd");
+    }
+
+    return gnd_clk;
+}
-- 
2.26.3


