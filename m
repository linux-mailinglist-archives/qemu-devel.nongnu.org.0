Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9FF2D32DB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:58:31 +0100 (CET)
Received: from localhost ([::1]:55600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmj82-0002np-Nf
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilh-0005jr-2T
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmile-0005AH-2q
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iPcVMbbC9/jyi7aveu8uhy5sTDIu0BY2gLP3FrJ8Aig=;
 b=T9lmsDnYibaM4Av6Y/YNIOi4P/POoW1B3KP9fEhD+k19HvgVQGFI+mERzlWSQ6BXmmyw91
 rX2t5blRj6dbUWIE3dEHsfXd7ZGinTffTBCrB615m5dY1nIxJHOcOac0MF4PC3wxM8LwPM
 QP6yf89JLpGDRlKE/Wyl5XsKhXt4m6g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-NNt_o_wOMwm9NdM8b9VtQA-1; Tue, 08 Dec 2020 14:35:17 -0500
X-MC-Unique: NNt_o_wOMwm9NdM8b9VtQA-1
Received: by mail-wr1-f71.google.com with SMTP id m2so6631358wro.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iPcVMbbC9/jyi7aveu8uhy5sTDIu0BY2gLP3FrJ8Aig=;
 b=tJSK+94HZbYI3HcyvQ/yASxzt/6OQG7u9bvomz+//Ji6rj9Jl58St9nFBl4gXdFqPl
 nkmMogl+zu19EcCSCytEsn3nxq1zbR1CHdvWiEXuh4SQliegQv1y+xX2UDpRO28AIjwF
 b8emnbhbEG9T6RfgFGrM032UNyF29DRvObapogGdzTx7q3szdf6wVhKTKbq/U2L7atm5
 IsBcGwsdVgYhXepFJsjPxzmbKK4cQIqE8pIi2CTLwo8mWCzboST5Ve4/jx34DGTR9x1L
 h7SrNPWErpWTEBXjzEIV57vAzivizZ1p9ha3G4K2dIluEC9jKlNRolV6s1kBABjktuLf
 8iyw==
X-Gm-Message-State: AOAM532Wikjc1uOrccLwh997ov8+xBrusBGcQg9v88eo8baSpd1jiK2O
 XIwqc+OP7MaapsXgmK1GbYyw26GssqEQp4SxQac5fuhoJnGmb9YVO+v64nRooijOc2R6kT6qflB
 /YsCNU0PlAI2uqS2lrMWCbgLACTPhRAuWF9/yjaNz5rY2ic2FT4fLwuehl0N0
X-Received: by 2002:a1c:4843:: with SMTP id v64mr5245479wma.186.1607456115865; 
 Tue, 08 Dec 2020 11:35:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwImrhwLQY+gUf4dHV5TSvO65kk5y6Shhoa/+MzGnfEq9Qx5XywU0Eb0OnCrDB9Do49ZMXnLg==
X-Received: by 2002:a1c:4843:: with SMTP id v64mr5245464wma.186.1607456115621; 
 Tue, 08 Dec 2020 11:35:15 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id j15sm17221946wrr.85.2020.12.08.11.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:15 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/66] failover: simplify virtio_net_find_primary()
Message-ID: <20201208193307.646726-30-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

a - is_my_primary() never sets one error
b - If we return 1, primary_device_id is always set

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-15-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


