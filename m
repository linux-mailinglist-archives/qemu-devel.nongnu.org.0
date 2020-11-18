Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386DC2B7956
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:49:24 +0100 (CET)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ9X-0008I4-AH
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyy-00038X-5H
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyw-0005eK-Cb
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1R0n35H5sAIJXQAJfTFrPCVAG+M0rxW+OPbeTrYzwsw=;
 b=MiExtPcRwGkNT7ybP0f9YsM0pK07bvpgDthV+LUQLeDaKKUEESfAHhuFy26e8/EAll1I8N
 pZ6HIiVliNkmM2R4WLDDK0e5jQoMvHd9n+eZ1pjYtAXZDyxhoMGrNvEHcrdXS4MgL5Xf5G
 FgATC2onhYOT39ZWtVsZRKuJgad4ltY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-h1EasgwcNueSDIRkIDIRvw-1; Wed, 18 Nov 2020 03:38:23 -0500
X-MC-Unique: h1EasgwcNueSDIRkIDIRvw-1
Received: by mail-wm1-f72.google.com with SMTP id e15so565810wme.4
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1R0n35H5sAIJXQAJfTFrPCVAG+M0rxW+OPbeTrYzwsw=;
 b=dhM2i+krr3fntBmAjO2y9xTOTg+Xtw2L+Gm6iYQ3UAHxLky981L5BhcJa1bna4tJwl
 Rn4bN1K4RJ7dyidETZnVEq8jEGxVMH9kjtBNyHdRGtBy3g+ZwdduHwn6ntAW7bfwqO7C
 FN5FJKEqpJU+U86C1CykEqJ+wXvb5VfopD7unJbhD5+FZE3bRGD6XXblx8HjqM3CdQZZ
 x02Zf95Q14I1SjRc/gDURN46h1ZUOTgps/8iUUufZU92COUkyGyIrLFzYWxhzr/r1DiF
 3SZp+3CxEBMVt/d0dk+lfZHYDaecwsPvUhjUqOjCK/Zb/D/LrllHrsxQLS/tASZfgLY3
 WxVA==
X-Gm-Message-State: AOAM530Flo5wEFrkfbTfQo5kLlHb9pj76zkwb8de4Upf/OGtMegvLSty
 iPIp4jqYQjtTl5nBzh0O92SYEJZYF+DdanCnNctJhlg6p1fF6PQODBuEIJfAR89G4A7bdx5ENMe
 3VKSKdaVIMlfj9yEGcTClU7rn77HLOssyhRlkoY/3gfsTeZb6GLq81Mxw6482bj1Pubo=
X-Received: by 2002:adf:f347:: with SMTP id e7mr3514988wrp.183.1605688702359; 
 Wed, 18 Nov 2020 00:38:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIj5enEtMFRi9/Nx7fcwGjwlsYuJvb+dDUSSq+biM1PlI3KS7hxs1oas5Ck8WaKGztqlWv7A==
X-Received: by 2002:adf:f347:: with SMTP id e7mr3514969wrp.183.1605688702186; 
 Wed, 18 Nov 2020 00:38:22 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id a18sm2369776wme.18.2020.11.18.00.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:21 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/27] failover: make sure that id always exist
Date: Wed, 18 Nov 2020 09:37:42 +0100
Message-Id: <20201118083748.1328-22-quintela@redhat.com>
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

We check that it exist at device creation time, so we don't have to
check anywhere else.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c    | 3 ---
 softmmu/qdev-monitor.c | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index ff82f1017d..c708c03cf6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3173,9 +3173,6 @@ static bool failover_hide_primary_device(DeviceListener *listener,
     hide = qatomic_read(&n->failover_primary_hidden);
     g_free(n->primary_device_id);
     n->primary_device_id = g_strdup(device_opts->id);
-    if (!n->primary_device_id) {
-        warn_report("primary_device_id not set");
-    }
     return hide;
 }
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0e10f0466f..301089eaea 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -613,6 +613,10 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     }
 
     if (qemu_opt_get(opts, "failover_pair_id")) {
+        if (!opts->id) {
+            error_setg(errp, "Device with failover_pair_id don't have id");
+            return NULL;
+        }
         if (qdev_should_hide_device(opts)) {
             if (bus && !qbus_is_hotpluggable(bus)) {
                 error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
-- 
2.26.2


