Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AD1597411
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:23:21 +0200 (CEST)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLpA-000341-71
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLgw-0007zI-GV
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:14:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLgu-0001Qy-L9
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660752887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlFScFbd6bA9xQKNfgYlcaL7eylrZChQGwf+YKV00bU=;
 b=jAkyFJBUXzEpN26MBWwJh6LSiAdsYZ7GQCoEVIylLUNw8zignhWj/Jui869vX5G7qjlxPu
 VXX02SjxIRkHwno7F8rBNvM1G/E2q4Ump9cCL2ZohncMSJuRywCwtmoAXerMkmxl3/yZwD
 zbOVdPueRHmZPqMXrAiIA20M4PDdB6Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-BVGuruKvNHuOyivTz1szHg-1; Wed, 17 Aug 2022 12:14:46 -0400
X-MC-Unique: BVGuruKvNHuOyivTz1szHg-1
Received: by mail-wm1-f70.google.com with SMTP id
 b16-20020a05600c4e1000b003a5a47762c3so6475757wmq.9
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=rlFScFbd6bA9xQKNfgYlcaL7eylrZChQGwf+YKV00bU=;
 b=QLHtx5diusUFyHR3ZtYyYpNEKBOoZUEIE0Oa/EzIfS8DC+DU4waRTaEUWBiNhYhM22
 uEerYg4Ck55YDXsbEjT7fDCMtglQnT5F2Wf8X9Z3FX6wdCoOgilrQha6KrCyrnTDOIqB
 rzjcFWGqDSZPYuXhm7OJuM08QyMaYm82n6vxlIq+XX11CVlEZiINXVcYsAhL3XUCdr6s
 0aiflBxuJGnU8JoOKF8YJdiYnSU31vrA95gyApYn2odAMtEWxvissMsojIxAXNe0QEtN
 IDOqWJO1W6DeUFAX8zcKq5Igv/igwOhNV9dDQUYAI2nLfUGJXbApt8XqOm5YYd829mJ5
 F45g==
X-Gm-Message-State: ACgBeo3RouYDJ9c4WUJFd7onrYjcYGQyruz9tmnQgJ2LqH40yaSaJECE
 JvGPPf0dHG3AOU31dtAqlyPTo8ruzlnYkBtaMQio1ug/9L3DWinEYAe3eXhh6bgGYTS33kdPYFl
 4Ujd/WiWR+P/NlQbjj83c44hH4WvGx2PPbNzIA4+e2q0IvzJj9IZfSprbyog1
X-Received: by 2002:a05:6000:1092:b0:21f:13e7:3cc with SMTP id
 y18-20020a056000109200b0021f13e703ccmr15590631wrw.671.1660752885412; 
 Wed, 17 Aug 2022 09:14:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7LutJxEFlt5KN5ty4uYMHCBmtji3k36LxzSrSHZJQZ3xxmrNMGKqSCI1GsWup/atgLolt39A==
X-Received: by 2002:a05:6000:1092:b0:21f:13e7:3cc with SMTP id
 y18-20020a056000109200b0021f13e703ccmr15590613wrw.671.1660752885168; 
 Wed, 17 Aug 2022 09:14:45 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b003a5f2cc2f1dsm2537184wmq.42.2022.08.17.09.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:14:44 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:14:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 04/10] hw/virtio: fix vhost_user_read tracepoint
Message-ID: <20220817161342.240674-5-mst@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817161342.240674-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

As reads happen in the callback we were never seeing them. We only
really care about the header so move the tracepoint to when the header
is complete.

Fixes: 6ca6d8ee9d (hw/virtio: add vhost_user_[read|write] trace points)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220728135503.1060062-5-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 75b8df21a4..bd24741be8 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -295,6 +295,8 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
         return -EPROTO;
     }
 
+    trace_vhost_user_read(msg->hdr.request, msg->hdr.flags);
+
     return 0;
 }
 
@@ -544,8 +546,6 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
         }
     }
 
-    trace_vhost_user_read(msg.hdr.request, msg.hdr.flags);
-
     return 0;
 }
 
-- 
MST


