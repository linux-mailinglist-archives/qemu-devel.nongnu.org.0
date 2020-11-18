Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AEC2B7908
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:47:21 +0100 (CET)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ7Y-0004xB-Gh
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyn-0002gt-AT
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyl-0005a0-IR
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWWvwSfBU5P/TS6vJ44helDiyjf0Zls6DtnpmzRfbkQ=;
 b=ecTAlKU/nSg60MzxlyHmdk7smUaAAjPsav5MFthCXCPnjUv+xJNLy1CaiAcK8/CprfCYha
 nJQnGNwD39VFiTxRAnm4TO0WzCpKLqXopFWLM2BskMvV+FA91lFsb+gcis6V7YUwWQe2Fz
 xFVyuCQlJPVnYiN1qhN0ZBqyiqnZMEM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-P9tbHqf6MGeCIxAsdyfXLA-1; Wed, 18 Nov 2020 03:38:13 -0500
X-MC-Unique: P9tbHqf6MGeCIxAsdyfXLA-1
Received: by mail-wr1-f71.google.com with SMTP id l5so620095wrn.18
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWWvwSfBU5P/TS6vJ44helDiyjf0Zls6DtnpmzRfbkQ=;
 b=QFg+861JOWRwUxkLJz8WJgT6U5CxdGpUbA3gq0lG/wnnuaQKuY1vkrDo1D4sV9z+On
 TLx8qNIxBFy6NlKS4Ct/nkb34lZAgLFERZvNz2M8gdytz6dgKLwZWCCmL7BOoByuWqfu
 XbVWztKD7IIkqpbJVb2LMQXWGJtUwNA6j13R8D7Vgi1BmBh4a4dzYjX7IehDqdOXT9iB
 Hp1DCiTG6z1VtenGIeGVsEH07xV3sADZtcrs00CpUd/HufrXIV97qnSVAHQ7SLFbfBHY
 AWsn2xHR02TcqWAr9wtccWGUXvw+ADK3GWUP/F+kObWZBDntEMjHq03ZhE8PgeC1pLlN
 YMcA==
X-Gm-Message-State: AOAM531UBARXnqE14TBANVvJ0L7jX1h5s60+nU3Es2TRL32IBowRqQ2A
 oxa3VfY4De5Lpfl8TROWXy4ux9sZhqx3oETDrlbOwGD/2tgw9zWkjMsGqlCoCTmWkbfoi41i89H
 N4jHjTMwycO6zwnkWJlm68Dr81Nz0zW4BF5ucGtmovMXUdHU4fHzk7Wsj+Cui6vu8nDc=
X-Received: by 2002:adf:a551:: with SMTP id j17mr3956081wrb.217.1605688691885; 
 Wed, 18 Nov 2020 00:38:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMPFKdNaF22wCpI45mo6QIpQpvY4A4kQsUScfandFHBOlcAq5GYhI3jzmTpRpoyEmQ0Dj7gg==
X-Received: by 2002:adf:a551:: with SMTP id j17mr3956055wrb.217.1605688691659; 
 Wed, 18 Nov 2020 00:38:11 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id p12sm31541971wrw.28.2020.11.18.00.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:11 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/27] failover: simplify virtio_net_find_primary()
Date: Wed, 18 Nov 2020 09:37:35 +0100
Message-Id: <20201118083748.1328-15-quintela@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

a - is_my_primary() never sets one error
b - If we return 1, primary_device_id is always set

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 70fa372c08..881907d1bd 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -828,24 +828,12 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
 
 static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
 {
-    DeviceState *dev = NULL;
     Error *err = NULL;
 
-    if (qemu_opts_foreach(qemu_find_opts("device"),
-                          is_my_primary, n, &err)) {
-        if (err) {
-            error_propagate(errp, err);
-            return NULL;
-        }
-        if (n->primary_device_id) {
-            dev = qdev_find_recursive(sysbus_get_default(),
-                                      n->primary_device_id);
-        } else {
-            error_setg(errp, "Primary device id not found");
-            return NULL;
-        }
+    if (!qemu_opts_foreach(qemu_find_opts("device"), is_my_primary, n, &err)) {
+        return NULL;
     }
-    return dev;
+    return qdev_find_recursive(sysbus_get_default(), n->primary_device_id);
 }
 
 static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
-- 
2.26.2


