Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330514D1FE1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:15:41 +0100 (CET)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReN2-0001ZI-8V
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:15:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLC-0007ns-1n
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:13:46 -0500
Received: from [2607:f8b0:4864:20::102c] (port=38635
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReL9-0001xh-QK
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:13:45 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so2907429pjb.3
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mngovjRSiYjohvkaQ4UwaJSG4aKU+/4fbHtkzgX0ZKM=;
 b=Vtax2/SEej9MbGFIx0KhvHIfhyxGQ9xAz/ANfR/GNDOBVVEAhLoNo+uTMG4wg1J9+q
 9cKYpfqRt6im8qmL9imbBbLLuUhp5OlghgIMoRdh0ZR7s503QiAY+j52f0R+MFsb4OxY
 X0JOE1aNywYIIVadKp+Iyw5C/IJ4EnTCKTj9ea5ZOV9xbdctekByKCU3UfdEEctiN+Bj
 21LRbB7RK+Pou6FGctEb6kKPZhzmw+ummtGIMFDixXEIY/rsasrT7XenPjnmBjmkJMSU
 RnzLAJJasuF9m+uBARDGsuDM896FHxMkQ0Q+Pe/wRYp5ugQ6xAP5Bfd9gVTIulBCCjLr
 jqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mngovjRSiYjohvkaQ4UwaJSG4aKU+/4fbHtkzgX0ZKM=;
 b=5qQOiWH0OgRRhycmlhdP+0em6RwVrp/kwAt51m7FEK0VOeoa+c2HBU+tLtl1fxaeMH
 X/mVzAY1HsH0sT49oZzNeP4ee/d1eE5TkAVn6UkVbQyxVAYaj2ERo6Y1qHRrWhWlZUP1
 RjrvI7nFgDTmfWssNzdfgl+L+uJVc1opOiw4+6BAzFthd+Wfs31mHXVw+nCdmeOFpD2t
 OO8PLmYrBt4DTv0R6wv5fTpXXHMZ4qaN0Zyxm/VPbgcwLLBl98e4qw4j84HxuGwBhW2v
 F6uUFaAshSwrmaiqYtqVKF2ZXKth/jF9483PSUfFo1OkPwEOJPcmsJ3c31fjDH640qHU
 zPOQ==
X-Gm-Message-State: AOAM531Agb4mJJf/mlCCz30mgvXG5AOh7T1l6Q/vOAV2nFDtDRZA84Z2
 wgmHxieEhrfeiRXxu/N5IeLEmnRVDxI=
X-Google-Smtp-Source: ABdhPJy4cn2D1TUrKCu98o+G5a+RTH52cnfRn2YjUdJrwBMa05MYhOy5osXg4yggtTVrZHZVtU8agg==
X-Received: by 2002:a17:90b:8d6:b0:1bd:3596:e97e with SMTP id
 ds22-20020a17090b08d600b001bd3596e97emr6246885pjb.50.1646763222323; 
 Tue, 08 Mar 2022 10:13:42 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 z23-20020a17090a609700b001bf5a1830f3sm3829425pji.10.2022.03.08.10.13.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Mar 2022 10:13:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] hw/i2c: pmbus: fix error returns and guard against out of
 range accesses
Date: Tue,  8 Mar 2022 19:13:13 +0100
Message-Id: <20220308181320.79400-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
References: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Titus Rwantare <titusr@google.com>, Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Titus Rwantare <titusr@google.com>

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-Id: <20220307200605.4001451-3-titusr@google.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c         | 47 ++++++++++++++++++++++++++++++++---
 include/hw/i2c/pmbus_device.h |  2 ++
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 07a45c99f9..c7ec8e5499 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -149,7 +149,7 @@ static uint8_t pmbus_out_buf_pop(PMBusDevice *pmdev)
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: tried to read from empty buffer",
                       __func__);
-        return 0xFF;
+        return PMBUS_ERR_BYTE;
     }
     uint8_t data = pmdev->out_buf[pmdev->out_buf_len - 1];
     pmdev->out_buf_len--;
@@ -243,18 +243,47 @@ void pmbus_check_limits(PMBusDevice *pmdev)
     }
 }
 
+/* assert the status_cml error upon receipt of malformed command */
+static void pmbus_cml_error(PMBusDevice *pmdev)
+{
+    for (int i = 0; i < pmdev->num_pages; i++) {
+        pmdev->pages[i].status_word |= PMBUS_STATUS_CML;
+        pmdev->pages[i].status_cml |= PB_CML_FAULT_INVALID_CMD;
+    }
+}
+
 static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 {
     PMBusDevice *pmdev = PMBUS_DEVICE(smd);
     PMBusDeviceClass *pmdc = PMBUS_DEVICE_GET_CLASS(pmdev);
-    uint8_t ret = 0xFF;
-    uint8_t index = pmdev->page;
+    uint8_t ret = PMBUS_ERR_BYTE;
+    uint8_t index;
 
     if (pmdev->out_buf_len != 0) {
         ret = pmbus_out_buf_pop(pmdev);
         return ret;
     }
 
+    /*
+     * Reading from all pages will return the value from page 0,
+     * this is unspecified behaviour in general.
+     */
+    if (pmdev->page == PB_ALL_PAGES) {
+        index = 0;
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: tried to read from all pages\n",
+                      __func__);
+        pmbus_cml_error(pmdev);
+    } else if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: page %d is out of range\n",
+                      __func__, pmdev->page);
+        pmbus_cml_error(pmdev);
+        return PMBUS_ERR_BYTE;
+    } else {
+        index = pmdev->page;
+    }
+
     switch (pmdev->code) {
     case PMBUS_PAGE:
         pmbus_send8(pmdev, pmdev->page);
@@ -1019,7 +1048,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
 
     if (len == 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func__);
-        return -1;
+        return PMBUS_ERR_BYTE;
     }
 
     if (!pmdev->pages) { /* allocate memory for pages on first use */
@@ -1038,6 +1067,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         pmdev->page = pmbus_receive8(pmdev);
         return 0;
     }
+
     /* loop through all the pages when 0xFF is received */
     if (pmdev->page == PB_ALL_PAGES) {
         for (int i = 0; i < pmdev->num_pages; i++) {
@@ -1048,6 +1078,15 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         return 0;
     }
 
+    if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: page %u is out of range\n",
+                        __func__, pmdev->page);
+        pmdev->page = 0; /* undefined behaviour - reset to page 0 */
+        pmbus_cml_error(pmdev);
+        return PMBUS_ERR_BYTE;
+    }
+
     index = pmdev->page;
 
     switch (pmdev->code) {
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 72c0483149..bab4526734 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -228,6 +228,8 @@ enum pmbus_registers {
 #define PB_MAX_PAGES            0x1F
 #define PB_ALL_PAGES            0xFF
 
+#define PMBUS_ERR_BYTE          0xFF
+
 #define TYPE_PMBUS_DEVICE "pmbus-device"
 OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
                     PMBUS_DEVICE)
-- 
2.34.1


