Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E46D13DE
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 02:09:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi2K9-00078m-RT; Thu, 30 Mar 2023 20:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hSQmZAYKCo4B0BCA9y66y3w.u648w4C-vwDw3565y5C.69y@flex--titusr.bounces.google.com>)
 id 1pi2K6-00078E-F2
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:54 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hSQmZAYKCo4B0BCA9y66y3w.u648w4C-vwDw3565y5C.69y@flex--titusr.bounces.google.com>)
 id 1pi2Js-0005ou-57
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:08:51 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 b124-20020a253482000000b00b72947f6a54so20460155yba.14
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 17:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221317;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=g64aGJIyKlA6LYSQVFAep6BH8KUc6VYjHGYJofMi0D8=;
 b=jv6bIVyFcN9YRuB2EPRd0qkj4lOuLlSmW1ZNuW8BxiG/r3dDrhVZpkQ6+8dCnv0N2U
 jh+f+8f76J9YHt6S0YpuukhhGKdiBWvbAbP9RPIvjzhimv3suKnvWICzjp27V47WejWM
 LgOoeQJ8dBA1D3adEuTzUiB7AkHqpT2hZ0Fx2WsNN0AjeVPminAVw6DGV/RKMYgGu1fK
 cnRhIzSz9psE6P+FGnEnRMW6V3fqAC/KR+1eSCADw2LavjCz3BIcFuHk/hKeZGYnGT8a
 CbFoj26fOd9FikjQ72LQxNDXUfTOs0t/PGPIC2ujjWoLMKGzw6H7GhzT1accQL9+BjP2
 1tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221317;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g64aGJIyKlA6LYSQVFAep6BH8KUc6VYjHGYJofMi0D8=;
 b=zAmYwz2NKNoXzMHQcFCC1Vard8X0Zxl8eEqeLGDTrclaymZfkkADr2rJygSsHJmTsU
 vyBH3G+BVCtvTJG2bVE1dezRmMfzJS6mKAQAwRUURRhctr8mkMM/HWcGRzVz8O7G8Mq8
 qBYUin9c0D+CFJ//BYeOlrlH1WJ7y8+a4uP6307nZdzeQjyCRc8M+iFnmZ67Ck0uhF//
 QZl6paq7I38ykNGkcLMz0Xj7szQWd+fvq10zFB2LyskNHKZKdVAeiOw2kInV2WLnxsCJ
 ZUTqVV3zX0dJwy6mjC9KFTU87dLyq/5g98hqsV9Ulw5HRD4YeSZck870ULS3F7w7YsOd
 WR7g==
X-Gm-Message-State: AAQBX9cD/65uKbS2yeOA/TTpvrLo5qXhSdGe8Zy350Ojp+uJtLLyTrZB
 txNDT6MDMv8nJDeR6lO83PFbbNjzttk=
X-Google-Smtp-Source: AKy350bHLkS1EqPZ7C81huTapp2/0e/J7h+dPeclF5IW3hG3QQAFaAvPp+JTL7Lx1G8vz1hMqqiX4QBozto=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:b645:0:b0:545:7164:49aa with SMTP id
 h5-20020a81b645000000b00545716449aamr12657254ywk.1.1680221317044; Thu, 30 Mar
 2023 17:08:37 -0700 (PDT)
Date: Fri, 31 Mar 2023 00:07:52 +0000
In-Reply-To: <20230331000756.1712787-1-titusr@google.com>
Mime-Version: 1.0
References: <20230331000756.1712787-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.423.gd6c402a77b-goog
Message-ID: <20230331000756.1712787-4-titusr@google.com>
Subject: [PATCH 3/7] hw/i2c: pmbus: add fan support
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Stephen Longfield <slongfield@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3hSQmZAYKCo4B0BCA9y66y3w.u648w4C-vwDw3565y5C.69y@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PMBus devices may integrate fans whose operation is configurable
over PMBus. This commit allows the driver to read and write the
fan control registers but does not model the operation of fans.

Reviewed-by: Stephen Longfield <slongfield@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 176 ++++++++++++++++++++++++++++++++++
 include/hw/i2c/pmbus_device.h |   1 +
 2 files changed, 177 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 02647769cd..bb42e410b4 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -490,6 +490,54 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_FAN_CONFIG_1_2:            /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send8(pmdev, pmdev->pages[index].fan_config_1_2);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_FAN_COMMAND_1:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send16(pmdev, pmdev->pages[index].fan_command_1);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_FAN_COMMAND_2:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send16(pmdev, pmdev->pages[index].fan_command_2);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_FAN_CONFIG_3_4:            /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send8(pmdev, pmdev->pages[index].fan_config_3_4);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_FAN_COMMAND_3:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send16(pmdev, pmdev->pages[index].fan_command_3);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_FAN_COMMAND_4:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send16(pmdev, pmdev->pages[index].fan_command_4);
+        } else {
+            goto passthough;
+        }
+        break;
+
     case PMBUS_VOUT_OV_FAULT_LIMIT:       /* R/W word */
         if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
             pmbus_send16(pmdev, pmdev->pages[index].vout_ov_fault_limit);
@@ -800,6 +848,22 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         pmbus_send8(pmdev, pmdev->pages[index].status_mfr_specific);
         break;
 
+    case PMBUS_STATUS_FANS_1_2:           /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send8(pmdev, pmdev->pages[index].status_fans_1_2);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_STATUS_FANS_3_4:           /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send8(pmdev, pmdev->pages[index].status_fans_3_4);
+        } else {
+            goto passthough;
+        }
+        break;
+
     case PMBUS_READ_EIN:                  /* Read-Only block 5 bytes */
         if (pmdev->pages[index].page_flags & PB_HAS_EIN) {
             pmbus_send(pmdev, pmdev->pages[index].read_ein, 5);
@@ -872,6 +936,54 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_READ_FAN_SPEED_1:          /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_1);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_FAN_SPEED_2:          /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_2);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_FAN_SPEED_3:          /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_3);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_FAN_SPEED_4:          /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_4);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_DUTY_CYCLE:           /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_duty_cycle);
+        } else {
+            goto passthough;
+        }
+        break;
+
+    case PMBUS_READ_FREQUENCY:            /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_frequency);
+        } else {
+            goto passthough;
+        }
+        break;
+
     case PMBUS_READ_POUT:                 /* Read-Only word */
         if (pmdev->pages[index].page_flags & PB_HAS_POUT) {
             pmbus_send16(pmdev, pmdev->pages[index].read_pout);
@@ -1295,6 +1407,54 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         }
         break;
 
+    case PMBUS_FAN_CONFIG_1_2:            /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmdev->pages[index].fan_config_1_2 = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_FAN_COMMAND_1:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmdev->pages[index].fan_command_1 = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_FAN_COMMAND_2:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmdev->pages[index].fan_command_2 = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_FAN_CONFIG_3_4:            /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmdev->pages[index].fan_config_3_4 = pmbus_receive8(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_FAN_COMMAND_3:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmdev->pages[index].fan_command_3 = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_FAN_COMMAND_4:             /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmdev->pages[index].fan_command_4 = pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
     case PMBUS_VOUT_OV_FAULT_LIMIT:       /* R/W word */
         if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
             pmdev->pages[index].vout_ov_fault_limit = pmbus_receive16(pmdev);
@@ -1600,6 +1760,22 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         pmdev->pages[index].status_mfr_specific = pmbus_receive8(pmdev);
         break;
 
+    case PMBUS_STATUS_FANS_1_2:           /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send8(pmdev, pmdev->pages[index].status_fans_1_2);
+        } else {
+            goto passthrough;
+        }
+        break;
+
+    case PMBUS_STATUS_FANS_3_4:           /* R/W byte */
+        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
+            pmbus_send8(pmdev, pmdev->pages[index].status_fans_3_4);
+        } else {
+            goto passthrough;
+        }
+        break;
+
     case PMBUS_PAGE_PLUS_READ:            /* Block Read-only */
     case PMBUS_CAPABILITY:                /* Read-Only byte */
     case PMBUS_COEFFICIENTS:              /* Read-only block 5 bytes */
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 2e95164aa1..ad431bdc7c 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -258,6 +258,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
 #define PB_HAS_TEMP2               BIT_ULL(41)
 #define PB_HAS_TEMP3               BIT_ULL(42)
 #define PB_HAS_TEMP_RATING         BIT_ULL(43)
+#define PB_HAS_FAN                 BIT_ULL(44)
 #define PB_HAS_MFR_INFO            BIT_ULL(50)
 #define PB_HAS_STATUS_MFR_SPECIFIC BIT_ULL(51)
 
-- 
2.40.0.423.gd6c402a77b-goog


