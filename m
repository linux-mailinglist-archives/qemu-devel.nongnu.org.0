Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D57961DCA9
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:50:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpy-00005j-MH; Sat, 05 Nov 2022 13:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoO-0007PK-Ah
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoM-0007jr-8r
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c/cLew8bMa1wxPGKcVwPToMwd5hFO5px9x2lp9qcZKA=;
 b=OgGY9Z7K7WdF0/ZXGAjql4M0dcTycb33nKkvL228f+UlYlFv7GHj8/dQb0TL+d/3OwYymo
 t8aI4nbL+gbl5AmqUOFg1nXa37U5tN2zgTJuSOHyOnSadeZfzkThCRSDITMQXwbD3H75Ho
 X5bY1GKGSOQIlTCqFOR8fBVl5xs6j+o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-c50AWllIPYWfQm8FoXdQBg-1; Sat, 05 Nov 2022 13:18:24 -0400
X-MC-Unique: c50AWllIPYWfQm8FoXdQBg-1
Received: by mail-wm1-f69.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso6007359wmk.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/cLew8bMa1wxPGKcVwPToMwd5hFO5px9x2lp9qcZKA=;
 b=Ve5N+z64yIVThYO568mqEM1D2SGbZLD4rEfNef8RMlK8sQ5Z9Tt6MRfEybcU/5httC
 L0BRRmspz/l8MzKOYFItMgStvfXsuqamIKnzVX9NdtfhyDtKfvqyx/cMTJ4oTnRICQFf
 eOYcGiGgbXwNEYPn3KJJxzBbGdfUSTzParszP0w+ms5WqHHFfl4dqlvgCh8d6TU5rKhP
 wAfDTpSt/omhejANXpXhw7cBJjZoomNvjscL78ZhdeqX76xrGjGaUjv5KQB9WYdDQnE7
 6lR5s4lVeYoJY2OfZLJTZlKeP58/zn+e3LHSc+59nVHuq+nuqqhJgBaPbcAsL2imiJGy
 /KXQ==
X-Gm-Message-State: ACrzQf3cGjqCWS9ONV6F+XY4uuWtymNpgo+DjcMOFpGE0p9o0NSw54gM
 zih63r0UKYnnBpOlqDgA1rF5daAkd8otomr0IXGh+40DFU3+irQuODIiRw0AERUdKNxdxRz2GYM
 ZM2C04QcogI7Uk0QGl4R9oaAkDaFvdcUmqgPRL4bJrU8liymWBEdWKeqLPJ50
X-Received: by 2002:a5d:6408:0:b0:236:a69f:f3ef with SMTP id
 z8-20020a5d6408000000b00236a69ff3efmr26413465wru.176.1667668703272; 
 Sat, 05 Nov 2022 10:18:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6PyLndrBrbOKwdPSb8hoSUZqPpbwDNNKnnZbdDAwfzDQDMWhRCzluGssot5NdNtz1lH3gJJA==
X-Received: by 2002:a5d:6408:0:b0:236:a69f:f3ef with SMTP id
 z8-20020a5d6408000000b00236a69ff3efmr26413447wru.176.1667668702951; 
 Sat, 05 Nov 2022 10:18:22 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 c2-20020a5d4f02000000b002366553eca7sm2553760wru.83.2022.11.05.10.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:22 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Christian A. Ehrhardt" <lk@c--e.de>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-stable@nongnu.org,
 Eric DeVolder <eric.devolder@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 60/81] hw/acpi/erst.c: Fix memory handling issues
Message-ID: <20221105171116.432921-61-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


