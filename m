Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0752920C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:05:00 +0200 (CEST)
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhtj-0000jF-Ll
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhg4-0004Tn-AF
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhg0-0006Ft-TP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFG9Wcb2I+Dwof4JoAiK8doNzqoFhr25ibITD6Homqo=;
 b=HnMrbc2JsujZ4OjS3CSv8fzczQ0lPxRWENYRM442NNqUPojxYao67+wOBn7I2ZfWF05T7l
 6dSb1gDhp0In/85iSELiQ1Mz3nykCks9O2diCvi7R7gPXQleWKX6A1s/WvCpnanrsm7e38
 XNGTm5IDlpfODbCXNNyutkjZdZJqeRo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-M9b4V1UcMumY-1eMiqANqw-1; Mon, 16 May 2022 16:50:47 -0400
X-MC-Unique: M9b4V1UcMumY-1eMiqANqw-1
Received: by mail-ed1-f69.google.com with SMTP id
 n12-20020aa7c44c000000b0042ab2159b3eso2538918edr.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IFG9Wcb2I+Dwof4JoAiK8doNzqoFhr25ibITD6Homqo=;
 b=N07FlbkpoXXbKW2o0hCt1UqnBmBlCp84qGgglIsiXbfCaL3LUvF8g7BEVFGGBIk13R
 UluPHE3B/XlJplABtOVOvAKt2JmyqI+hdFTtJ8im0TxmYmCLJh8iPhKOudvGwJr31ypq
 DlUP4qR8fbEROO8qVtavAQx9pm7vr269EfOOs6X0FauXMhF4s727u+eF4orq+R1iTv1m
 WDDGUEtVdIcALPBFpSv8jleTrFMenJ5lihpSysPEajLos3IMoOdlshw7R6ejtRIRwBkw
 H14HfWeFPHcAmkdCCfdSfwjAtS6w/t/iW1V91+enk2gDeU+vwm7o1MKXDtudk3lPFzRj
 mGXw==
X-Gm-Message-State: AOAM530j7+aFau2NyI+tOOTaTi0Fb6x/A2YKOHxRDipirq92LZ1Yp8iW
 FOZnFHYR1ewMRC7CZJb2q9J56XAq80GE5ifp/xWmqHg5tZ1E4r1eBbNeeZr1kINVSKaLyzW5KBU
 djkfiEefrKTXXhme12UyIEfOlbgSVvIsrBYqHyLtP8RWT5wcq9LnFtfuoZh4L
X-Received: by 2002:a17:907:6d1b:b0:6f5:30c9:7c84 with SMTP id
 sa27-20020a1709076d1b00b006f530c97c84mr16669455ejc.107.1652734245612; 
 Mon, 16 May 2022 13:50:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydvzpOOWOAlAEA5+/6wAixgbXBy+DMjHR94TvBixVi8T4qO9Li5yC3Fkmscoon89lEfBFQ7g==
X-Received: by 2002:a17:907:6d1b:b0:6f5:30c9:7c84 with SMTP id
 sa27-20020a1709076d1b00b006f530c97c84mr16669437ejc.107.1652734245374; 
 Mon, 16 May 2022 13:50:45 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 z4-20020a17090674c400b006f3ef214e14sm159407ejl.122.2022.05.16.13.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:44 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 11/86] hw/cxl/device: Timestamp implementation (8.2.9.3)
Message-ID: <20220516204913.542894-12-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ben Widawsky <ben.widawsky@intel.com>

Errata F4 to CXL 2.0 clarified the meaning of the timer as the
sum of the value set with the timestamp set command and the number
of nano seconds since it was last set.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-10-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_device.h |  6 ++++++
 hw/cxl/cxl-mailbox-utils.c  | 42 +++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 954205653e..797a22ddb4 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -111,6 +111,12 @@ typedef struct cxl_device_state {
         size_t cel_size;
     };
 
+    struct {
+        bool set;
+        uint64_t last_set;
+        uint64_t host_set;
+    } timestamp;
+
     /* memory region for persistent memory, HDM */
     uint64_t pmem_size;
 } CXLDeviceState;
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index fb1f53f48e..4584aa31f7 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -44,6 +44,9 @@ enum {
         #define CLEAR_RECORDS   0x1
         #define GET_INTERRUPT_POLICY   0x2
         #define SET_INTERRUPT_POLICY   0x3
+    TIMESTAMP   = 0x03,
+        #define GET           0x0
+        #define SET           0x1
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -106,9 +109,46 @@ DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
 DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
 DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
 
+/* 8.2.9.3.1 */
+static ret_code cmd_timestamp_get(struct cxl_cmd *cmd,
+                                  CXLDeviceState *cxl_dstate,
+                                  uint16_t *len)
+{
+    uint64_t time, delta;
+    uint64_t final_time = 0;
+
+    if (cxl_dstate->timestamp.set) {
+        /* First find the delta from the last time the host set the time. */
+        time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        delta = time - cxl_dstate->timestamp.last_set;
+        final_time = cxl_dstate->timestamp.host_set + delta;
+    }
+
+    /* Then adjust the actual time */
+    stq_le_p(cmd->payload, final_time);
+    *len = 8;
+
+    return CXL_MBOX_SUCCESS;
+}
+
+/* 8.2.9.3.2 */
+static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
+                                  CXLDeviceState *cxl_dstate,
+                                  uint16_t *len)
+{
+    cxl_dstate->timestamp.set = true;
+    cxl_dstate->timestamp.last_set = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+    cxl_dstate->timestamp.host_set = le64_to_cpu(*(uint64_t *)cmd->payload);
+
+    *len = 0;
+    return CXL_MBOX_SUCCESS;
+}
+
 static QemuUUID cel_uuid;
 
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
+#define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
 
 static struct cxl_cmd cxl_cmd_set[256][256] = {
@@ -120,6 +160,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
         cmd_events_get_interrupt_policy, 0, 0 },
     [EVENTS][SET_INTERRUPT_POLICY] = { "EVENTS_SET_INTERRUPT_POLICY",
         cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
+    [TIMESTAMP][GET] = { "TIMESTAMP_GET", cmd_timestamp_get, 0, 0 },
+    [TIMESTAMP][SET] = { "TIMESTAMP_SET", cmd_timestamp_set, 8, IMMEDIATE_POLICY_CHANGE },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
-- 
MST


