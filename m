Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CDA620386
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:14:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAyg-0004Ch-1q; Mon, 07 Nov 2022 17:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAya-000489-Fm
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAyM-0005cQ-7M
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c/cLew8bMa1wxPGKcVwPToMwd5hFO5px9x2lp9qcZKA=;
 b=OwRk6iMzRz32ymlX0yyLhpEMCiGKpVbZY42xkL8S1vOZ7Y0qd15bNmNZJAvHPEDvaxH+i5
 lCgbPmBDyVGIwyGjLwxosmV5N31ruVAaaGtdsaOdbsCkGe2jKDLOu4lZtKO5+4LLRkdRug
 jXBnCEE4dKsptgKdDlnLes4nyVb6rZk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-Nm94GXkoNiutd8M1HeJQUA-1; Mon, 07 Nov 2022 17:52:04 -0500
X-MC-Unique: Nm94GXkoNiutd8M1HeJQUA-1
Received: by mail-qv1-f71.google.com with SMTP id
 ng1-20020a0562143bc100b004bb706b3a27so8654404qvb.20
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/cLew8bMa1wxPGKcVwPToMwd5hFO5px9x2lp9qcZKA=;
 b=2oCzrjvoqF3CMPJ/XIkFNNAGsOC4qNVoTzhclULy1hEd/GJFLxkGu5HhHUZrFkOxJr
 I6XmNhB2kKuoGzqgLadG5Qyzp9P6qjQvZxdILjxpsKOrDZVjp+axKtn8mOTSAHz7Nbpu
 ueBirn7hG+nCf6tuX4RH4XxZ81ckRBhvjhoEqKy7iLOdR0vLpYa6T2gsBqd4vN4pPj2k
 HbMAD8rlcEVSp1M956Kbm3MbUNWkAnCbUDKjjKqG2dckRB6BMVgfMtRc7Ngyy2jK+Ukz
 lRUla2A8O0Gmuf4TgUlbiMzM6PqZA9OyM2mWcb3vHpfbkuW/diB7Ys0eINPyiX1n8Qtz
 l2Gg==
X-Gm-Message-State: ACrzQf08aLRL1PKKETwrMr/yQV+sTdygos1Oo2f/Pf372o8IVpEP0D2z
 LAmFGDSdDk6v3A8MjE2IgjHJaliiZZN3DYZechctpDc3xHMu8F5lgDQWli1i/9huY0AcxQiXcUj
 iILOtgR9jwARX5iqyCawZ6LxUoC9YW43bsEMcCGLIUaOZi4yzJJYkEbJLuzME
X-Received: by 2002:a05:622a:1347:b0:3a5:7f7a:9d9d with SMTP id
 w7-20020a05622a134700b003a57f7a9d9dmr9169099qtk.119.1667861523662; 
 Mon, 07 Nov 2022 14:52:03 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4qcKbe9LCWUkgpyzziUn/1t2fnBywbpDN0kKQXeCdMwZ9WKsLJwq4MZFV9mHiNgSKKsOlQDw==
X-Received: by 2002:a05:622a:1347:b0:3a5:7f7a:9d9d with SMTP id
 w7-20020a05622a134700b003a57f7a9d9dmr9169077qtk.119.1667861523353; 
 Mon, 07 Nov 2022 14:52:03 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 s15-20020a05620a254f00b006fa617ac616sm8004297qko.49.2022.11.07.14.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:52:02 -0800 (PST)
Date: Mon, 7 Nov 2022 17:51:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Christian A. Ehrhardt" <lk@c--e.de>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-stable@nongnu.org,
 Eric DeVolder <eric.devolder@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 55/83] hw/acpi/erst.c: Fix memory handling issues
Message-ID: <20221107224600.934080-56-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


