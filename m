Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EEB3F0C61
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:04:20 +0200 (CEST)
Received: from localhost ([::1]:57202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRnK-0007oh-Hh
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mGRSE-0007tO-N8
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mGRSD-00073Y-4M
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629315744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56KQolnKGhiF1X+C5PY8YNpm/K8e5udbyrIkFGZ9ayw=;
 b=SzQVXgKgO00UAqe0RGf+WkY6f44WjAyln89nWnjFRbH5Zz7o8usGV9kIlW78AisLee0Eoi
 0yZ6RphWdyHzROLSVNFtF//jXogQZ7CrCJUQRweGUsrUkVnnJ0L7JfXbjBV1LFveQG+L9z
 r5MTH42ike2E7F6gTz/wJ5WLsOIjQuk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-8RJVJO5aMxe1MKU3GM7lkA-1; Wed, 18 Aug 2021 15:42:23 -0400
X-MC-Unique: 8RJVJO5aMxe1MKU3GM7lkA-1
Received: by mail-qv1-f71.google.com with SMTP id
 f10-20020a0ccc8a0000b02903521ac3b9d7so2915403qvl.15
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=56KQolnKGhiF1X+C5PY8YNpm/K8e5udbyrIkFGZ9ayw=;
 b=Vha984P9L9oidjJlwZPjsNMTFSW7phAvgIxvih+gaGTaLUAf5+aYLqEcvSseNpLuiP
 ziCtvxOUSdH2UlUHFJIMQmMTOGKQbLsTObHOkcVN3lh4x8KYcajK96kDi9PNvcivkTLu
 2pQX/2MT2OVz/baDlmlhVQpkoDXvmok0xC/Z6p+VC886Zxf8XS+GpAu8nMK2XYy9ibWW
 o4GWlhIfjMUoVYVmlsH33yF3CsaojyEL/UTcKaoZNAUoLENOBx3hFmpq8VnwYsY4N/vM
 nxqNyJzvpPRqqo6VbkfkEjWHno13JZR15UUrLRdz2LA8o5w7+fSeyDrVy+VDsjmoA0hv
 UZxw==
X-Gm-Message-State: AOAM531EqhAccziamVAhCnfe190RCCUQTfCoH7v/E15iYStmIRIZKZB7
 zJmjzdgut89+HJtfb1iNeQLEgvOH8ICxcn+Iim9CVv+akSkcKX7hi8nV6PF7BdtS2vaWCAejZm0
 5RU2Q3XGHv9j60XsChoM8DhYmcPYmdI6f74Se+SXvir5qdDeFG2ApqdY2qJiepda0
X-Received: by 2002:a0c:be8e:: with SMTP id n14mr10562051qvi.16.1629315741667; 
 Wed, 18 Aug 2021 12:42:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhde8yPF6N71nrn82egvrOCufhMvZbHj+IR6201SHmIb+NlLdoyv6vLTOdgPsefjNrx/GUXA==
X-Received: by 2002:a0c:be8e:: with SMTP id n14mr10562023qvi.16.1629315741430; 
 Wed, 18 Aug 2021 12:42:21 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id y185sm419779qkb.36.2021.08.18.12.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:42:20 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] qdev-monitor: Trace qdev creation
Date: Wed, 18 Aug 2021 15:42:14 -0400
Message-Id: <20210818194217.110451-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818194217.110451-1-peterx@redhat.com>
References: <20210818194217.110451-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 peterx@redhat.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a tracepoint for creations of qdev.  This can be used to see what devices
are created under the hood, along with the ordering of their creation.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/qdev-monitor.c | 2 ++
 softmmu/trace-events   | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 721dec2d82..8602164082 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -40,6 +40,7 @@
 #include "qemu/cutils.h"
 #include "hw/qdev-properties.h"
 #include "hw/clock.h"
+#include "trace.h"
 
 /*
  * Aliases were a bad idea from the start.  Let's keep them
@@ -674,6 +675,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         dev->opts = NULL;
         goto err_del_dev;
     }
+    trace_qdev_device_add(driver, qemu_opts_id(opts));
     return dev;
 
 err_del_dev:
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 7b278590a0..fad85e9d5c 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -29,3 +29,6 @@ runstate_set(int current_state, const char *current_state_str, int new_state, co
 system_wakeup_request(int reason) "reason=%d"
 qemu_system_shutdown_request(int reason) "reason=%d"
 qemu_system_powerdown_request(void) ""
+
+# qdev-monitor.c
+qdev_device_add(const char *driver, const char *id) "driver '%s' id '%s'"
-- 
2.31.1


