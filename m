Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D182D3306
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:15:11 +0100 (CET)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjOA-0005gT-L3
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminI-0007TO-1V
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminG-0005mr-C3
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j9H1uI5lMJn6lpI26L/tMaP17cyPrnspRPrI7rHkTu4=;
 b=btuXVKGKTT5tTIhpuqDk+KROMLEkKWilV+FY6m28DdlgLzcDNPoEwfYIUtvUAZ5WeROCS0
 IZqLaNN4R25qEnHEKFgZ17rPGocE4TCn2wyF2Up474PbNqINzPqEQcwxLYtpTflitdj2Wf
 335QLHsFkkxdINQahKjEIHbbc0Z8vbA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-E-L2k4DZMlKRd8geu0v1EA-1; Tue, 08 Dec 2020 14:36:58 -0500
X-MC-Unique: E-L2k4DZMlKRd8geu0v1EA-1
Received: by mail-wr1-f72.google.com with SMTP id o17so40019wra.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j9H1uI5lMJn6lpI26L/tMaP17cyPrnspRPrI7rHkTu4=;
 b=JVWDWXRLy7Xi9WX+Od3tzSZh2HZMDMQ9/z8YBWk37XuoHomlyrvfo76ClbfxeSGlKk
 MjB/e5X7ZL11uLzF7IQzaANbKS0ko/cv64wJ0QHGFA1O+d74JMCpca2bbSDOBjpSbGC7
 WnAzm8y7WlpSPDQzxA3PWtvwFRl/G4Yfmc1fGMb1YZmenxGj7QVOsntYWPzViJpTTksJ
 HZTliuBMtGDbEttNs7BdP1EPYfCGTbZ6UQ3kWgpEOMF1GQg/eGEHL5YmY4GIs/9V4jut
 Gv9SfH88g4MFALRSL3k4lfyIdiLvRHArFhRyX35yNrzu2oxY5LXQiGxvi8cjG5bF7mP5
 WG+w==
X-Gm-Message-State: AOAM530noKIspcMCojnSkVkfMNnIWhT50wREki1DUaXFvih46AizJZvs
 1vUypIbibcokZE68DPyVQMK3dt0Fzey5lyacWB1GtcWleWaboXMOfm4lvr1UaZWp4i6jaI8fyAZ
 BNISLMpxewoeT+e3ehRIfV7irMeDgHNzWblozjfrBv86PgNJ/Vn8w9ry48KZ5
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr27395491wrp.242.1607456217246; 
 Tue, 08 Dec 2020 11:36:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxb10xaa7/6KvL/OSLL68eU0jY3E1ivEwAfif3kwDujivIcs0OP+EcrQyqqANf++ochGBquIg==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr27395468wrp.242.1607456217081; 
 Tue, 08 Dec 2020 11:36:57 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id h20sm5163944wmb.29.2020.12.08.11.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:36:56 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 52/66] contrib/vhost-user-blk: avoid g_return_val_if() input
 validation
Message-ID: <20201208193307.646726-53-mst@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Do not validate input with g_return_val_if(). This API is intended for
checking programming errors and is compiled out with -DG_DISABLE_CHECKS.

Use an explicit if statement for input validation so it cannot
accidentally be compiled out.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201118091644.199527-2-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-blk/vhost-user-blk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index 6abd7835a8..d14b2896bf 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -403,7 +403,9 @@ vub_get_config(VuDev *vu_dev, uint8_t *config, uint32_t len)
     VugDev *gdev;
     VubDev *vdev_blk;
 
-    g_return_val_if_fail(len <= sizeof(struct virtio_blk_config), -1);
+    if (len > sizeof(struct virtio_blk_config)) {
+        return -1;
+    }
 
     gdev = container_of(vu_dev, VugDev, parent);
     vdev_blk = container_of(gdev, VubDev, parent);
-- 
MST


