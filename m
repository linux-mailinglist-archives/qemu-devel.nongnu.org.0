Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CB2681B43
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:20:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadF-00034Z-RQ; Mon, 30 Jan 2023 15:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMad1-0002hv-9u
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacz-0006tM-R7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XDBWJ9mEW9j0WY2a9bhXD9UTpCWsWPuWI1DDeEf3M6Q=;
 b=P5CDbHtp99I6/U4Uy47eBNvIv3Rp/n1BQJrHGZ0DK5BMPlCS837n7prjS9Z6tNeTqiqd+u
 ZYjDW5PEqsMAItV+jrcVr0TYEsZ9Y6ZWH0nw5AdGYuhtzMDZDfO27/ukULxfyruv3+4fiT
 xZIpMYXfKEeRQoQMSIEm511Cbqg67WY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-qIj6oUjDPgyxF6qIrLRpNg-1; Mon, 30 Jan 2023 15:19:03 -0500
X-MC-Unique: qIj6oUjDPgyxF6qIrLRpNg-1
Received: by mail-ed1-f70.google.com with SMTP id
 o21-20020aa7dd55000000b004a245f58006so2751737edw.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XDBWJ9mEW9j0WY2a9bhXD9UTpCWsWPuWI1DDeEf3M6Q=;
 b=JkG+gdUNoz3FCInXtOF33YPrnOptfhOOSc3sdDrs5/g4AaC9bbx79Kt/XTSd580RQ8
 gl2y3GoshunVjnbj6buM3qqdzXwsPS1BLJZAog1qlOpFfganDNkip+3WvQ4R+rrO+RYr
 Xl7DPSofk0bvXnBlrrbS0IbfrNSsTm+b/We2fGbSTI8BRhSEVeT7UlV3+sOAEdE3hn2B
 z1qLY4Yr4KXPggnajlZdQovKI3njCRD3wmyhbQdD4vYoeKtOoX6/pk0SBOB8olZ2FUuG
 HeCj5wbdyPsRoN8Cm5U4YjgPZo2cOt6we9Im3J74rZaPOg8TjvzpccjXdomtwOU0IyWp
 Q36A==
X-Gm-Message-State: AFqh2ko8I30aKQHbbWJmvA7Sq6koh7860icNp1sj3YJIwWj4fW5tTw/z
 feODCPgDUL9Bf9bqxKJdSwHxStoRVCQjgwRaBOENBIGbMt7df/3+VlIxGLXuXx+P0N4axwU2lJR
 BTp8tcCKievYrzY6QrsK9F/lll/wAubKpRieGXjxq7LXh3GASyrafvd6MgycI
X-Received: by 2002:a17:907:d38a:b0:86e:c9e2:6313 with SMTP id
 vh10-20020a170907d38a00b0086ec9e26313mr58990103ejc.32.1675109926195; 
 Mon, 30 Jan 2023 12:18:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv1lM3+dCWiZKu8OVJTWSFg0Z51oPfdC2aQ1pYxrbJKSykj6ov+icEWRCVNPD7ej5CsTL4D2Q==
X-Received: by 2002:a17:907:d38a:b0:86e:c9e2:6313 with SMTP id
 vh10-20020a170907d38a00b0086ec9e26313mr58990081ejc.32.1675109925981; 
 Mon, 30 Jan 2023 12:18:45 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 lf9-20020a170906ae4900b007ae32daf4b9sm7341782ejb.106.2023.01.30.12.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:18:45 -0800 (PST)
Date: Mon, 30 Jan 2023 15:18:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 01/56] shpc: disallow unplug when power indicator is blinking
Message-ID: <20230130201810.11518-2-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Pressing attention button has special meaning when power indicator is
blinking. Better just not do it.

For example, trying to remove device immediately after hotplug leads to
both commands succeded but device not actually unrealized.

Same thing for PCIE hotplug was done in
  81124b3c7a5dae "pcie: add power indicator blink check"

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20221116214458.82090-1-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/shpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index e71f3a7483..fca7f6691a 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -568,6 +568,13 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 
     state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
     led = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
+
+    if (led == SHPC_LED_BLINK) {
+        error_setg(errp, "Hot-unplug failed: "
+                   "guest is busy (power indicator blinking)");
+        return;
+    }
+
     if (state == SHPC_STATE_DISABLED && led == SHPC_LED_OFF) {
         shpc_free_devices_in_slot(shpc, slot);
         shpc_set_status(shpc, slot, 1, SHPC_SLOT_STATUS_MRL_OPEN);
-- 
MST


