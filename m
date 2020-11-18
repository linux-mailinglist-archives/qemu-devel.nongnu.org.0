Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576802B795D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:50:11 +0100 (CET)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJAI-0001Tk-BK
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyY-00025M-Ak
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyW-0005VK-B6
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WfdfLJ+ZbjNx1xgyxW1tL91idQG0uPVSDz63aaYX6og=;
 b=YUBShOZH7bSYLKLafoBOVV3nG/teB9WV+pXMperBOLnIH69FFqCE8e6cpoionJtZtegO37
 5GEIkC278fP7v4R5QRej8SA0RaxYVmbHF36K4wWcS0qR1e1cIgyOJHoebqx8iEbOMEydd4
 dqD8003D0W55Zy4NckzQTtnJrtGlF0U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-5B5BqBeiMMCASo4_LDoqzA-1; Wed, 18 Nov 2020 03:37:58 -0500
X-MC-Unique: 5B5BqBeiMMCASo4_LDoqzA-1
Received: by mail-wm1-f69.google.com with SMTP id a130so2359156wmf.0
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WfdfLJ+ZbjNx1xgyxW1tL91idQG0uPVSDz63aaYX6og=;
 b=bA9N6MGkoNcHaHyn+e7XBbMnHFk4aq20h2d6UDi3ol4wY2bLPo9HZPKe78KzsVL8nl
 Wt2owu9Nn9e81vDeN+PSpLZSQRnRjnjNwjQCFQS/Fr3T1oOdCw1eA/nc6TpZdr65GA81
 DokRFDCrmT6hG6i0WTcQ2U/OV0aVRuuHwC9LmMVZHu2Ui3vXm7jPfQsd1kktmbS8u+VK
 11lILtvUtNAfQa/Uj3rbkb69YLbTAjlIwkfrnz5qiMaLUhR/HKY6cPZtPLg29BtjMf6z
 X8vwtUNB87CFhc0AGyrGD7N0adhF3vZnTnTxyw5PYkBKrtswpwjhtu7xfl/fV4etre37
 rtkg==
X-Gm-Message-State: AOAM531uHPvXv7GfCseq1c/fmR5vEADzfbiifKVYFw+uoBXb0p2PSHun
 qV2Bcqg4XtADjOISlxJkhqGhScuhXI67q7Bmq32WnVqSi6yhkIVRY8k7WETsw80Xu1p4c/NxgoP
 rUZU+AUcOuG+SrLHEevtkEznmQ5sD8KIXSWcwtBO0Mq49sS8wSEWnm5bx0vNNQSPRNkI=
X-Received: by 2002:a5d:448b:: with SMTP id j11mr3559304wrq.236.1605688676706; 
 Wed, 18 Nov 2020 00:37:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyG5S3IkfQAdeF8R+YpH2klvBlFpOY7YuqwKu6mRL/wtaT+PGW03rwtXVaD02ge/q3h+YZpLQ==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr3559286wrq.236.1605688676530; 
 Wed, 18 Nov 2020 00:37:56 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id u8sm2538025wmg.6.2020.11.18.00.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:37:55 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/27] failover: primary bus is only used once,
 and where it is set
Date: Wed, 18 Nov 2020 09:37:25 +0100
Message-Id: <20201118083748.1328-5-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just remove the struct member.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/virtio/virtio-net.h | 1 -
 hw/net/virtio-net.c            | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index f4852ac27b..c8da637d40 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -205,7 +205,6 @@ struct VirtIONet {
     QemuOpts *primary_device_opts;
     QDict *primary_device_dict;
     DeviceState *primary_dev;
-    BusState *primary_bus;
     char *primary_device_id;
     char *standby_id;
     bool primary_should_be_hidden;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index a0fa63e7cb..786d313330 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -804,7 +804,6 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
             qemu_opts_del(n->primary_device_opts);
         }
         if (n->primary_dev) {
-            n->primary_bus = n->primary_dev->parent_bus;
             if (err) {
                 qdev_unplug(n->primary_dev, &err);
                 qdev_set_id(n->primary_dev, "");
@@ -3118,6 +3117,7 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
     Error *err = NULL;
     HotplugHandler *hotplug_ctrl;
     PCIDevice *pdev = PCI_DEVICE(n->primary_dev);
+    BusState *primary_bus;
 
     if (!pdev->partially_hotplugged) {
         return true;
@@ -3130,12 +3130,12 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
             return false;
         }
     }
-    n->primary_bus = n->primary_dev->parent_bus;
-    if (!n->primary_bus) {
+    primary_bus = n->primary_dev->parent_bus;
+    if (!primary_bus) {
         error_setg(errp, "virtio_net: couldn't find primary bus");
         return false;
     }
-    qdev_set_parent_bus(n->primary_dev, n->primary_bus, &error_abort);
+    qdev_set_parent_bus(n->primary_dev, primary_bus, &error_abort);
     qatomic_set(&n->primary_should_be_hidden, false);
     if (!qemu_opt_set_bool(n->primary_device_opts,
                            "partially_hotplugged", true, errp)) {
-- 
2.26.2


