Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1570E450A33
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:53:45 +0100 (CET)
Received: from localhost ([::1]:48766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfEm-0005ro-6z
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:53:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0r-0004QJ-4e
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:39:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0p-0005Ju-DU
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qDeMUO8cCwmSZf/Y30wJkd3TeMNmCM7Xml57tT+2eS8=;
 b=ZBTLgcrSnTO202aN6G60cwtDAFpXZArQEztEehKEz9MnudE97VzHZilDMlD+jlEWC0/h17
 +pxUWwdU450DQrWJOQQ4GaAl66zQ9/JcgDsZFUWUtnfuft/ZXXPauRhU8GM+ulzuOMRmPD
 dZrDcXFwVAaIk8UYYmH8RIl+HRmwd8o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-JUPsn30rMr2AqPsax2s4vQ-1; Mon, 15 Nov 2021 11:39:17 -0500
X-MC-Unique: JUPsn30rMr2AqPsax2s4vQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 q17-20020aa7da91000000b003e7c0641b9cso2913975eds.12
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qDeMUO8cCwmSZf/Y30wJkd3TeMNmCM7Xml57tT+2eS8=;
 b=ZuqHW9JiBpklbZ06zvljxPVVANirTWqHRBK2cpLBqjw/ioaSaZAumV/kkcpfkpV2/O
 6K06RmAvHREhGnX9A/hhbBP2sxBgzMsPFOKMNB1Ksu/mVQgnZ5SqJdFQI3cUqECBhhXv
 d4dUqRyLPZrd9YRqVz8N3bki3otW75s86y8+ReRm0KT+dWYKfZ8VYuZHCSHw85AV0uId
 3wDa2tXdi+Sx0GONazs/fg3t54YpD8U23n+i3XpQ/mEe2sja20uHE2U25+08uOUb0/1k
 mBRF7Bp19gNrq6WmLzya7JriSdCg9UNxOj/X0Hu9w9787YoVKMaO2FJraOU2oNUIoSPt
 RScA==
X-Gm-Message-State: AOAM531PnYsyse36KRmnZwJq97muQ8G4Nolrub6+bZA8KYacdPKRQoCP
 JF9pjInn/z1y4RBXQefH6Sr1MFZoUQ+4LZbsy+RQ1xyeoPsVCw1C1ye/Ug8DLjc3yOjqBaXE1uk
 r8kuBYkF4Q75N5CJqrU7+sCZmtBOIDn8O6b5rKw7z6g12ta2ZUdG2AoMpt8jq
X-Received: by 2002:aa7:c9ce:: with SMTP id i14mr50426edt.300.1636994355880;
 Mon, 15 Nov 2021 08:39:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfGGQfFf7R51ncSaABNSQ6K6tjy1pOJXmHEz3v2ekhkWkSmNlc+qV2mkheIF9Zv8zDK6iFvw==
X-Received: by 2002:aa7:c9ce:: with SMTP id i14mr50386edt.300.1636994355721;
 Mon, 15 Nov 2021 08:39:15 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id hc16sm6979112ejc.12.2021.11.15.08.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:39:15 -0800 (PST)
Date: Mon, 15 Nov 2021 11:39:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] pcie: expire pending delete
Message-ID: <20211115163607.177432-21-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Add an expire time for pending delete, once the time is over allow
pressing the attention button again.

This makes pcie hotplug behave more like acpi hotplug, where one can
try sending an 'device_del' monitor command again in case the guest
didn't respond to the first attempt.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20211111130859.1171890-7-kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/qdev-core.h | 1 +
 hw/pci/pcie.c          | 2 ++
 softmmu/qdev-monitor.c | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 72622bd337..20d3066595 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -181,6 +181,7 @@ struct DeviceState {
     char *canonical_path;
     bool realized;
     bool pending_deleted_event;
+    int64_t pending_deleted_expires_ms;
     QDict *opts;
     int hotplugged;
     bool allow_unplug_during_migration;
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index a930ac738a..c5ed266337 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -548,6 +548,8 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
     }
 
     dev->pending_deleted_event = true;
+    dev->pending_deleted_expires_ms =
+        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
 
     /* In case user cancel the operation of multi-function hot-add,
      * remove the function that is unexposed to guest individually,
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 588a62b88d..5925f1ae5f 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -943,7 +943,9 @@ void qmp_device_del(const char *id, Error **errp)
 {
     DeviceState *dev = find_device_state(id, errp);
     if (dev != NULL) {
-        if (dev->pending_deleted_event) {
+        if (dev->pending_deleted_event &&
+            (dev->pending_deleted_expires_ms == 0 ||
+             dev->pending_deleted_expires_ms > qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL))) {
             error_setg(errp, "Device %s is already in the "
                              "process of unplug", id);
             return;
-- 
MST


