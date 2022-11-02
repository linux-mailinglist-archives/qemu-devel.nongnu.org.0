Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A4F61682F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:16:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGL1-0002Yp-8o; Wed, 02 Nov 2022 12:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKy-0002PY-Tf
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKu-0003Pv-Oi
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c/cLew8bMa1wxPGKcVwPToMwd5hFO5px9x2lp9qcZKA=;
 b=F6cPmL2re0ozxtV6dmvjhNdo7G/XOPKJfck+8ilMdHs3sbEr0NaJXODDcNUJCMcLMB2FB7
 IqkNBdpKAm/1pY0nqbG3cvJHB7BL6eg52sKrqXghvY4Xm7IxNC5yPnLsvHXj/6h8kx3vmr
 VL7xV2ubKmpb8jOvLFSGL+I1QSTCeOI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-I0yuX75qN9mjMDNvSxfQuQ-1; Wed, 02 Nov 2022 12:11:23 -0400
X-MC-Unique: I0yuX75qN9mjMDNvSxfQuQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso8095941wmb.4
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/cLew8bMa1wxPGKcVwPToMwd5hFO5px9x2lp9qcZKA=;
 b=Q9Xjxm5LCXckS4Ux43ZyuLxYWafYRTBXDkNUXOmR4tn/LYmDKmVGy67oQbE2usNOlo
 ZcuS9ZWh2TJpgFXxuOzDq4cQ+cxr+syXKRghXFU65rr3dc5L2c9bCTWAkD7nfwGmA5vR
 JN0qBr3sQ6Uj60PeUPKN9AVnNN3NMn0uJNDouB/hNKxXgXGNrc64xMKc1bLAkL7bb5Kl
 jRP64nbZHUh4J8CXsOnGbb91AGtPo4VYrlY5yfFkyHzwxPHV6paslLERod1Kl7AGsDLd
 RBicle2lauvFl6VFlUr/1uuKenBWFFN6J0InHa80dgcFrXY8JEZNpoyOUgXMCgrKdjny
 CEmg==
X-Gm-Message-State: ACrzQf0+/jHfiR9gsPVy3aqPsMjax3u84vBoovRcuwqDK1cpiMAsgL5V
 qAu2RXP0hBhmnph/nxPCwVLsqZ+ffZOgngXJn9lGYIr0zQXizCqUW2rPY05sB/z8mDJMPUy3I3L
 HJwSvB4VSGy8m48K2J1VsBWbVRA+DuDyLcu/sWF/1CVdgjHoVK9+8P+yXuPSr
X-Received: by 2002:a05:6000:42:b0:236:6c52:bc22 with SMTP id
 k2-20020a056000004200b002366c52bc22mr16006557wrx.692.1667405482346; 
 Wed, 02 Nov 2022 09:11:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6qVDtBqQUktczMWRnzwYbFL5KRSQKdCL2lUtSRnRFftHzdJoIJMq18BGmqOzr15Fz/kDMyFw==
X-Received: by 2002:a05:6000:42:b0:236:6c52:bc22 with SMTP id
 k2-20020a056000004200b002366c52bc22mr16006523wrx.692.1667405482060; 
 Wed, 02 Nov 2022 09:11:22 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003cf7055c014sm2755262wmb.1.2022.11.02.09.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:21 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Christian A. Ehrhardt" <lk@c--e.de>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-stable@nongnu.org,
 Eric DeVolder <eric.devolder@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 63/82] hw/acpi/erst.c: Fix memory handling issues
Message-ID: <20221102160336.616599-64-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Christian A. Ehrhardt" <lk@c--e.de>

- Fix memset argument order: The second argument is
  the value, the length goes last.
- Fix an integer overflow reported by Alexander Bulekov.

Both issues allow the guest to overrun the host buffer
allocated for the ERST memory device.

Cc: Eric DeVolder <eric.devolder@oracle.com
Cc: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-stable@nongnu.org
Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
Message-Id: <20221024154233.1043347-1-lk@c--e.de>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1268
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/erst.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index df856b2669..aefcc03ad6 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -635,7 +635,7 @@ static unsigned read_erst_record(ERSTDeviceState *s)
         if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
             rc = STATUS_FAILED;
         }
-        if ((s->record_offset + record_length) > exchange_length) {
+        if (record_length > exchange_length - s->record_offset) {
             rc = STATUS_FAILED;
         }
         /* If all is ok, copy the record to the exchange buffer */
@@ -684,7 +684,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
     if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
         return STATUS_FAILED;
     }
-    if ((s->record_offset + record_length) > exchange_length) {
+    if (record_length > exchange_length - s->record_offset) {
         return STATUS_FAILED;
     }
 
@@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
     if (nvram) {
         /* Write the record into the slot */
         memcpy(nvram, exchange, record_length);
-        memset(nvram + record_length, exchange_length - record_length, 0xFF);
+        memset(nvram + record_length, 0xFF, exchange_length - record_length);
         /* If a new record, increment the record_count */
         if (!record_found) {
             uint32_t record_count;
-- 
MST


