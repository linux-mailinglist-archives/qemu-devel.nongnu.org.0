Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F62B78FB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:44:49 +0100 (CET)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ56-0001SP-7s
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyi-0002Vb-O6
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyg-0005YI-VE
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JGMosYZm4Pd7viaXatygVdYP6fY/otp+/zbPBrEozA=;
 b=Hx0US+cCSrIEU4l9s+g+UE450JbvFhV1po0bGX2e8c6V+GxkB+CRYCH4ENpmq+T8ILSC3I
 wJ8du6otDVDagB1AHAZhHFjPQ4aXh+0pJ9Nmb54FN5w4gYDGjQjTP6C056zuOV0eQQcBLy
 0YRJsju7Bqow4HWTp8BwZAsFU2JHs/k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-Bu32On-8OhytL63ASJbtjg-1; Wed, 18 Nov 2020 03:38:08 -0500
X-MC-Unique: Bu32On-8OhytL63ASJbtjg-1
Received: by mail-wm1-f70.google.com with SMTP id u9so568959wmb.2
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/JGMosYZm4Pd7viaXatygVdYP6fY/otp+/zbPBrEozA=;
 b=rN3Pnt3c6FcWUbY+ApkcbzfqaarLB76wrqDXYpKp0HGBxNFThCpUIRiIFBzEud3dfj
 E7pBCXxXs+F1Jh6qYXT4MSXoV6EeUgQg7paiANWqC4Qu1ukKCJ/OGqd84mdM+NM/mUj9
 HU++MKygwheMJ4/eCEIJ7OHzjwArlPKOHXjs0ScWSD93TQO7WryqjzVYoKtturKiwYrK
 4JMQRXW+8uu2uMs++GHotN3bqr33KQzgwAZXMZhqo6Jtn7suv5oJoRMevjcCpOaceb7J
 qbGxjX6N/o2lSvRkcwG7P+ThIGicI5YYcoCw0kt5DRa0LWVJsbbHCeI+IF8IMSsD8rsy
 pcgA==
X-Gm-Message-State: AOAM53196Wz2UHNZf8+/snbdWtmZIELk5Fp67qCDXpJTY8PyW9hDPvPF
 r/ui4hsNSOj89T7bE8kBQqJMTq0nLT0SpLcufR3ij5/tmoOAQpZNBDyIbJ1e/guEdPWRL57i931
 YDA++xxzKRbV03r6xZ886b/MBtZHYWvHVFESJnHEhgdVEW2eP8MucYIBOD6xIKpdv7AI=
X-Received: by 2002:a1c:7318:: with SMTP id d24mr3311660wmb.39.1605688687433; 
 Wed, 18 Nov 2020 00:38:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMgkqkBJXFrrHlmm1p/1DWormI0cuLS+/HqpXQUIOtqC/EVsUd+Jr2eddU+W1t70AE4Qf92A==
X-Received: by 2002:a1c:7318:: with SMTP id d24mr3311636wmb.39.1605688687269; 
 Wed, 18 Nov 2020 00:38:07 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id d3sm31414174wre.91.2020.11.18.00.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/27] failover: remove standby_id variable
Date: Wed, 18 Nov 2020 09:37:32 +0100
Message-Id: <20201118083748.1328-12-quintela@redhat.com>
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

We can calculate it, and we only use it once anyways.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 -
 hw/net/virtio-net.c            | 11 +++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 7159e6c0a0..a055f39dd6 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -205,7 +205,6 @@ struct VirtIONet {
     QDict *primary_device_dict;
     DeviceState *primary_dev;
     char *primary_device_id;
-    char *standby_id;
     /* primary failover device is hidden*/
     bool failover_primary_hidden;
     bool failover;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 2a99b0e0f6..953d5c2bc8 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3181,23 +3181,19 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
     bool match_found = false;
     bool hide = false;
+    const char *standby_id;
 
     if (!device_opts) {
         return -1;
     }
     n->primary_device_dict = qemu_opts_to_qdict(device_opts,
                                                 n->primary_device_dict);
-    if (n->primary_device_dict) {
-        g_free(n->standby_id);
-        n->standby_id = g_strdup(qdict_get_try_str(n->primary_device_dict,
-                                                   "failover_pair_id"));
-    }
-    if (g_strcmp0(n->standby_id, n->netclient_name) == 0) {
+    standby_id = qemu_opt_get(device_opts, "failover_pair_id");
+    if (g_strcmp0(standby_id, n->netclient_name) == 0) {
         match_found = true;
     } else {
         match_found = false;
         hide = false;
-        g_free(n->standby_id);
         n->primary_device_dict = NULL;
         goto out;
     }
@@ -3400,7 +3396,6 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     if (n->failover) {
         device_listener_unregister(&n->primary_listener);
         g_free(n->primary_device_id);
-        g_free(n->standby_id);
         qobject_unref(n->primary_device_dict);
         n->primary_device_dict = NULL;
     }
-- 
2.26.2


