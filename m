Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CAE5ADA60
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 22:45:26 +0200 (CEST)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVIyD-0001FE-Fl
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 16:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oVIwo-00087j-EM
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oVIwk-0007Xh-EZ
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662410633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7fpYBjqvol9brkWwCpmEHRs0UL23HHBLAFtYFzWhwIU=;
 b=baraXIX8pOy5fPsIBWn/K9sJn8TaFOEn6g/nfMD8xxhXLBzYMG9hCuETcwZNNvfCoUC9cy
 mcZHx4fUCyeB3AGsTHPFcB6VzdNfTZl5MY09JLDmyZsx/4k7USwugHcXNGaiX6r1SvbKwG
 KEgfHzUgxghu2CIqpaooS9wSk++Z+jg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-a3dDsnqMNTysM2vwPrZMhA-1; Mon, 05 Sep 2022 16:43:52 -0400
X-MC-Unique: a3dDsnqMNTysM2vwPrZMhA-1
Received: by mail-ed1-f71.google.com with SMTP id
 t13-20020a056402524d00b0043db1fbefdeso6283041edd.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 13:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=7fpYBjqvol9brkWwCpmEHRs0UL23HHBLAFtYFzWhwIU=;
 b=XmQmqy+qWW8aBAXwXakKIKL3X+3VuAo9l1N3VJbYdvo7RhzitCLHRgflOq5XOJfCXe
 bdm9dMw9J8IYuBktwHUHg6/hf8FzXAbSiIHY5dC6g7ntuuBeVYH4fc5DOzGg3wxWZHo/
 b/+d3oc1BBynoqU/xofjBVVvR6JoGD1rwjouZLwQdLg7W0Vl81XZuS3lbUqDiot3yWOF
 fETxdQl0ZJsqP1Jn4kNbw/gAXf23inteKiKORHFxKAM7CF4ykmUCzaWRRPQMftaU+Lz9
 C4nHLgzw66PIFFV1OYgpzSPQIL3tkWBd7TYZhWQEgj6XU1BIfcKLDyCBKsANdGnwu/Gr
 KZ4A==
X-Gm-Message-State: ACgBeo0dal0qE3abRot+3wnd7OCBCTdmllK3+x7kvT3m9hiH8j3mymTz
 valaeD/Ogvc7RhErI1OLgVQkwyp6D00O8TdRICr+hsS6pMvSEaI2Nz3H+WrbF0PqAF9BrnZAAhm
 iVS7EZawtrRMLzh96+ASQJraneeJInYpwjnLBOVSg35JdtYXO8UUaVsXdiSo1hQX05rA=
X-Received: by 2002:a17:906:5a42:b0:73d:b160:af0d with SMTP id
 my2-20020a1709065a4200b0073db160af0dmr37071877ejc.164.1662410630729; 
 Mon, 05 Sep 2022 13:43:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6BjztZAg2+9/5DGmpSiyc+ZRnKnHkVUnSBljrbwQLW2/TEpVZqzD9mbNRRGkTpB1imrggWtg==
X-Received: by 2002:a17:906:5a42:b0:73d:b160:af0d with SMTP id
 my2-20020a1709065a4200b0073db160af0dmr37071865ejc.164.1662410630381; 
 Mon, 05 Sep 2022 13:43:50 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 qt14-20020a170906ecee00b00728f6d4d0d7sm5534560ejb.67.2022.09.05.13.43.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:43:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] smbios: sanitize type from external type before checking
 have_fields_bitmap
Date: Mon,  5 Sep 2022 22:43:49 +0200
Message-Id: <20220905204349.102405-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

test_bit uses header->type as an offset; if the file incorrectly specifies a
type greater than 127, smbios_entry_add will read and write garbage.

To fix this, just pass the smbios data through, assuming the user knows what
to do.  Reported by Coverity as CID 1487255.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/smbios/smbios.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 60349ee402..4c9f664830 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1205,13 +1205,15 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             return;
         }
 
-        if (test_bit(header->type, have_fields_bitmap)) {
-            error_setg(errp,
-                       "can't load type %d struct, fields already specified!",
-                       header->type);
-            return;
+        if (header->type <= SMBIOS_MAX_TYPE) {
+            if (test_bit(header->type, have_fields_bitmap)) {
+                error_setg(errp,
+                           "can't load type %d struct, fields already specified!",
+                           header->type);
+                return;
+            }
+            set_bit(header->type, have_binfile_bitmap);
         }
-        set_bit(header->type, have_binfile_bitmap);
 
         if (header->type == 4) {
             smbios_type4_count++;
-- 
2.37.2


