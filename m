Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D742BBC2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:37:14 +0200 (CEST)
Received: from localhost ([::1]:38260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maahF-0001Dl-3s
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaF3-0002cc-5G
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:06 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEw-00060h-54
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:02 -0400
Received: by mail-ed1-x52e.google.com with SMTP id y12so7311333eda.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vKFmsuwtEO4oTw2mau37Wrts+wYFtIMjBXD7rlwLojc=;
 b=pP8CTXibWoir+5FrMD4m8pZVrRwrIEEoAnKXk83I4Zd5kn4KEwCX05Isv6wvFQ9xsc
 EebyRKop+9wT3Rbth1PK2jz5daE0FcYB+FZTtSpamiTpiJLILxwbk+tR+UQ1QHwc77ed
 2XpKnHRUAstZ2PMtclg0J35g7yVQhtzixjHD9TGTRiKUw9XCZ1bNVqRTqNporgnHXt/8
 atryd2AzDfcPATtGx9Af8OZfnP7F/UXWppEnIpxmJmADWBBjgNc5ZJvS/wNStr2S346Q
 OsIXhakPfMTLV8aiHnQruNQLL1nk4pdg3hN3juf1wKmkUOd4rekHkSO9Syz+BGUNGEc/
 GbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vKFmsuwtEO4oTw2mau37Wrts+wYFtIMjBXD7rlwLojc=;
 b=7H7unQBtc0P3ZFPKNqUVxk/VZVEv/K1pqfPcNyHgktAXvX3Gp5U0iZlpoY4oX+LLw2
 ozpXQuYfODIWYGY8xBG3gFoEqagSqJUPF9LZ6oix9nbMRmYAH4uNWFH3aS/V2eeLjSm1
 EVPs6hAIkSIeQWAxxah5dd8Ki4iuEUaH13YjdKwsjDntEYwDXE81S3LL2rLFa5NMMEcX
 URXLaWhkVfFVeIzCmzEDX5G3Dwg1FJ+VZbFdYVdWk22eXRkyPIgHba/aF4ANYTcUAM1p
 gQ1sOekOTtMGPKFl/IEUWTm3hCnal1aWnEZL8Rje4dQX2N6d8fM/MC1WXjp+r1NNeTpx
 I98w==
X-Gm-Message-State: AOAM533HOncw6twNk+yfu4+ipNBlMDw/jhgcHmbYhUpOYq1240JZ0dF0
 HWdVO04MvbtXpDnYRZBNZ9CtWI1pz0g=
X-Google-Smtp-Source: ABdhPJy7ncYHvSpS+DcCdLCSO/FoWp8krjaTOL4Qc299hLkXD4hRujZzEXOehA+Qa7DFrQErbBV3TA==
X-Received: by 2002:a17:906:2757:: with SMTP id
 a23mr24505819ejd.230.1634116076724; 
 Wed, 13 Oct 2021 02:07:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/40] target/i386/sev: Use local variable for
 kvm_sev_launch_measure
Date: Wed, 13 Oct 2021 11:07:27 +0200
Message-Id: <20211013090728.309365-40-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Dov Murik <dovmurik@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

The struct kvm_sev_launch_measure has a constant and small size, and
therefore we can use a regular local variable for it instead of
allocating and freeing heap memory for it.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20211011173026.2454294-3-dovmurik@linux.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 0062566c71..eede07f11d 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -729,7 +729,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     SevGuestState *sev = sev_guest;
     int ret, error;
     g_autofree guchar *data = NULL;
-    g_autofree struct kvm_sev_launch_measure *measurement = NULL;
+    struct kvm_sev_launch_measure measurement = {};
 
     if (!sev_check_state(sev, SEV_STATE_LAUNCH_UPDATE)) {
         return;
@@ -743,23 +743,21 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
         }
     }
 
-    measurement = g_new0(struct kvm_sev_launch_measure, 1);
-
     /* query the measurement blob length */
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_MEASURE,
-                    measurement, &error);
-    if (!measurement->len) {
+                    &measurement, &error);
+    if (!measurement.len) {
         error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
                      __func__, ret, error, fw_error_to_str(errno));
         return;
     }
 
-    data = g_new0(guchar, measurement->len);
-    measurement->uaddr = (unsigned long)data;
+    data = g_new0(guchar, measurement.len);
+    measurement.uaddr = (unsigned long)data;
 
     /* get the measurement blob */
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_MEASURE,
-                    measurement, &error);
+                    &measurement, &error);
     if (ret) {
         error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
                      __func__, ret, error, fw_error_to_str(errno));
@@ -769,7 +767,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     sev_set_guest_state(sev, SEV_STATE_LAUNCH_SECRET);
 
     /* encode the measurement value and emit the event */
-    sev->measurement = g_base64_encode(data, measurement->len);
+    sev->measurement = g_base64_encode(data, measurement.len);
     trace_kvm_sev_launch_measurement(sev->measurement);
 }
 
-- 
2.31.1



