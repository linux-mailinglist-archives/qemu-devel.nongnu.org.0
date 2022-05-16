Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E33528298
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:51:09 +0200 (CEST)
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYJg-0003dl-Ij
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5K-0005yi-Jb
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5I-0005An-4E
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVeb92muGpGF+5fS1YTFGba+yxQKZdSBlvAWWWx2YjA=;
 b=ACQmzBDZz1mdx6LDtEQagbu1tipBS6pnddCg2+0kVY4jztYEz9iOOD/9T8Fb9uRZxzBMyR
 Flfc9yYAvz+EaWILi0JFS6OCgU3c0C6WKJ0gOdQkCuBuX9bsAi5wozJRPabbI4LtKN1U84
 XNnp7SXJ0eaUOqDka/T58uJ12no1VHI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-nsR7TaAwNrSZoumz4BCi7Q-1; Mon, 16 May 2022 06:36:14 -0400
X-MC-Unique: nsR7TaAwNrSZoumz4BCi7Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ba21-20020a0560001c1500b0020ca6a45dfcso3798251wrb.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EVeb92muGpGF+5fS1YTFGba+yxQKZdSBlvAWWWx2YjA=;
 b=26I0nWcI3kVneRwsqsbWdSo8ICZvr2NwfHKTr7qAv+ZPiig0JJxSw7oqhF4AJeqIcc
 USBUtQbeo0dyb/PwsHrXaqZo4hOIfpuUzkuRGxmcl+usr5xOwt6tn/tdLVLD4A3HmKJe
 qYwGiCaaim0pgsaNC9gh3qWm93qBbIsbK8842ezAi2sa+baZ4AICj4ejgUBCl4wOCjYr
 7fPWFSTBRlIc5KtfxfivtrDc4lrNpmDkqIW4/Nl/AMl+5mHlrNE/UFlEuTwui+5EdP+p
 u6lwbK6788Ej9KlSYdexgBBsNDtO2W24hTmcAs5XbG729Ar96P2WmmgeJHk5hH+WTz00
 d3qQ==
X-Gm-Message-State: AOAM532Kn7oOSwV9C38/F1r6M6st+qCyR+amlPi3HL/d/0EnWdWB2xxn
 +CSYZlHM9IkGTSbbhw3Spsalb3ynZObB/vfsd+PFRAGI4U2MyCctmuqCUD96Dd+mgxQ5zwRCDrZ
 RQb+eZm22CGpb0oFgClKQ65Cqay6Ed6l0mxkMm5O5+zltw77hf40/eWmc5JDY
X-Received: by 2002:a05:6000:1445:b0:20c:731c:c1d4 with SMTP id
 v5-20020a056000144500b0020c731cc1d4mr13826775wrx.76.1652697372943; 
 Mon, 16 May 2022 03:36:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZj34TMvhQzRePmRA1nsSCS2hZ1j9ul9/lNuTOigviLlLz3yNH9RRJzPWlmt+CKBOTDi6Nmw==
X-Received: by 2002:a05:6000:1445:b0:20c:731c:c1d4 with SMTP id
 v5-20020a056000144500b0020c731cc1d4mr13826759wrx.76.1652697372675; 
 Mon, 16 May 2022 03:36:12 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 o19-20020adfca13000000b0020c5253d8e1sm10975885wrh.45.2022.05.16.03.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:36:12 -0700 (PDT)
Date: Mon, 16 May 2022 06:36:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 10/91] hw/cxl/device: Add cheap EVENTS implementation (8.2.9.1)
Message-ID: <20220516095448.507876-11-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Using the previously implemented stubbed helpers, it is now possible to
easily add the missing, required commands to the implementation.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-9-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-mailbox-utils.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 2557f41f61..fb1f53f48e 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -38,6 +38,14 @@
  *  a register interface that already deals with it.
  */
 
+enum {
+    EVENTS      = 0x01,
+        #define GET_RECORDS   0x0
+        #define CLEAR_RECORDS   0x1
+        #define GET_INTERRUPT_POLICY   0x2
+        #define SET_INTERRUPT_POLICY   0x3
+};
+
 /* 8.2.8.4.5.1 Command Return Codes */
 typedef enum {
     CXL_MBOX_SUCCESS = 0x0,
@@ -93,9 +101,26 @@ struct cxl_cmd {
         return CXL_MBOX_SUCCESS;                                          \
     }
 
+DEFINE_MAILBOX_HANDLER_ZEROED(events_get_records, 0x20);
+DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
+DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
+DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
+
 static QemuUUID cel_uuid;
 
-static struct cxl_cmd cxl_cmd_set[256][256] = {};
+#define IMMEDIATE_CONFIG_CHANGE (1 << 1)
+#define IMMEDIATE_LOG_CHANGE (1 << 4)
+
+static struct cxl_cmd cxl_cmd_set[256][256] = {
+    [EVENTS][GET_RECORDS] = { "EVENTS_GET_RECORDS",
+        cmd_events_get_records, 1, 0 },
+    [EVENTS][CLEAR_RECORDS] = { "EVENTS_CLEAR_RECORDS",
+        cmd_events_clear_records, ~0, IMMEDIATE_LOG_CHANGE },
+    [EVENTS][GET_INTERRUPT_POLICY] = { "EVENTS_GET_INTERRUPT_POLICY",
+        cmd_events_get_interrupt_policy, 0, 0 },
+    [EVENTS][SET_INTERRUPT_POLICY] = { "EVENTS_SET_INTERRUPT_POLICY",
+        cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
+};
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
 {
-- 
MST


