Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603923F0CAB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:24:09 +0200 (CEST)
Received: from localhost ([::1]:49190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS6a-0006nn-Bw
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mGRTA-0002Fh-3I
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:43:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mGRT8-0007Zt-JW
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629315802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTxYsdQgG6JOcUELqB0QiB8wIJX8I+i741hrNBaimoA=;
 b=OQHH9TEusDTT5M2lxJDCsBVdnTc37AcPEZt6wZfOqayOWQ22Xoh37x+9RSIH0OaswIcV7v
 3xjQPtcxEBSbH+r2AIhEy1fOqiR3yFN/wxZ4+i7nV6+MQxzCj6DgX5z3Y3SjjTcTC0MD/T
 U/9E/tA+xP0yyZnx6X/eT1P7HPyRLAE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-mBkiJzPoPnWIW1TQdLHOBA-1; Wed, 18 Aug 2021 15:43:21 -0400
X-MC-Unique: mBkiJzPoPnWIW1TQdLHOBA-1
Received: by mail-qt1-f198.google.com with SMTP id
 o22-20020ac872d60000b029029817302575so1467008qtp.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTxYsdQgG6JOcUELqB0QiB8wIJX8I+i741hrNBaimoA=;
 b=TSU4YgURfCP58P+P1swfjHxtjtLLiRu7JDA1o0h4ErG7f41qQD8dUuuSlP+tlY+rqd
 WkRYrwC9SKzo5lEl+Fsq03Ifs5THPk50XmgeHQ+/gRBvBjRBgXasrIl+xr63IKv0mU4Y
 yX16H614UKiw+nMXiddjIjeE8R5N7tfPuGPIDfH5b8f/GsF0bYa29BzKwVL9fLacyGOO
 Ck2RyYYRltHFk69kqHWPbqsmX7KifO1fVYkkKWttrKh5jSUqGkuZMBWgdNui0j8Xn6sM
 qocaP79zl2u3Ca2nWFDxvmbd4c7JxKLr4r6B/wLeHnT3P2OcXJHo9mlOUaU/xffsAfAJ
 KBNA==
X-Gm-Message-State: AOAM5314dk5gEWo34rZxNSzG20NivXQf6oZ0Y8NptyUpedV+kncx8YPU
 m+1FV5RjiXc8apbXZdRSJRMCGDaGmZFBLDJLZRd9E+7SiZZVs6HGHax5iXgr7G4qyuLiB95qZ9M
 PaQpFr5e83EwFYKM5TrMavYHUfX4zIgqQXtS0ihPoEb/h5ZrWa/LP1wnY2oFbkrOG
X-Received: by 2002:a37:66d1:: with SMTP id
 a200mr10855110qkc.440.1629315798442; 
 Wed, 18 Aug 2021 12:43:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxp8XMlxzVOA3srZ9ILhBA6rFUw144C7qTzgaztk9fowyn+G8to8fbq+sjebZzoF25LSXL8w==
X-Received: by 2002:a37:66d1:: with SMTP id
 a200mr10855082qkc.440.1629315798209; 
 Wed, 18 Aug 2021 12:43:18 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id j185sm437905qkf.28.2021.08.18.12.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:43:17 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] qdev: Export qdev_get_device_class()
Date: Wed, 18 Aug 2021 15:43:16 -0400
Message-Id: <20210818194316.110942-1-peterx@redhat.com>
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

It'll be used outside the current source file.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/monitor/qdev.h | 2 ++
 softmmu/qdev-monitor.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index eaa947d73a..a783ad35b9 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -2,12 +2,14 @@
 #define MONITOR_QDEV_H
 
 /*** monitor commands ***/
+#include "hw/qdev-core.h"
 
 void hmp_info_qtree(Monitor *mon, const QDict *qdict);
 void hmp_info_qdm(Monitor *mon, const QDict *qdict);
 void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
 
 int qdev_device_help(QemuOpts *opts);
+DeviceClass *qdev_get_device_class(const char **driver, Error **errp);
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
 void qdev_set_id(DeviceState *dev, const char *id);
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 8602164082..610745467c 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -220,7 +220,7 @@ static const char *find_typename_by_alias(const char *alias)
     return NULL;
 }
 
-static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
+DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
 {
     ObjectClass *oc;
     DeviceClass *dc;
-- 
2.31.1


