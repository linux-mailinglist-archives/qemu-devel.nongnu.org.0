Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632606A7CA0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:28:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFq-0002iK-0G; Thu, 02 Mar 2023 03:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFS-0002Ex-1H
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFQ-0002B0-6Q
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zjerUZt8B5fT3PtlV+vANrfuJpkyirv+ZgJLhS/Hnw=;
 b=ahp9JQCGD7pvqKz5hS6ArsSdnXNEDEe8g8TlTmUV3acmMzUc+uDRSR60ZnrKwq+zohBGUr
 t77jJxzjJ7OBvHca0AWHddGPph1SVZJ6yUGcBfAC6yZkX9guto8LRKku0NGn61gfOXbfYy
 n6UzSHc9dDD4RmTzqxwTeoTtGAWcfTY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-PTKf2_uUPKeNIR4WNJN6aA-1; Thu, 02 Mar 2023 03:25:06 -0500
X-MC-Unique: PTKf2_uUPKeNIR4WNJN6aA-1
Received: by mail-wr1-f71.google.com with SMTP id
 bh3-20020a05600005c300b002c70d6e2014so3054356wrb.10
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745504;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2zjerUZt8B5fT3PtlV+vANrfuJpkyirv+ZgJLhS/Hnw=;
 b=2OCgiCZf7llmVB/bS4pCQlaSLeiLAMckbQI8sve9aHCuMn4yxVPzOMDug6JdxFU62a
 rh+rZ130+u3yjVQ+kfLAC/HUdmTwz/DbmEmrSYceoHvzP3BekB+JkF5GrPAeEdl+QVXe
 IPt7wTGPK37bk0qzhTCZhqqzqW9/vNAYInsylput/hv8D2JC6MpT1zy2XLo9ZY8VLwCO
 O0G2KI9T9huSnFj5p5VtB+awCEhP8wM7Ny0ezklk3wr7HgubkV6CCVpaZjpQ2cPI+sZr
 ZeDSwStHx9Oc+Z3jep8QNN0eq4Ow97XQ1Oa4uoWVQWk+zivsACInvyLN7Vz/yQUKajBV
 VfCg==
X-Gm-Message-State: AO0yUKXRJEwIinK2CueaNqvlxKK0ZGEBpJXy3enhyM40e7tvMOo3I2eD
 LmLLT2pVmICaRUfHlCD6HkM0yi2wv9CojkSvixrBdSGNG1SyGlMNoTmhRcyI/uToIsXERMPtwxO
 jyQ27T24xncGCKAA8ssYWtfx4N/jEVi7m8c/Dt0r2xmAeJ9/DT5s/BooMnNPKAy2jRA==
X-Received: by 2002:a05:600c:92a:b0:3ea:c100:e974 with SMTP id
 m42-20020a05600c092a00b003eac100e974mr7734175wmp.26.1677745504754; 
 Thu, 02 Mar 2023 00:25:04 -0800 (PST)
X-Google-Smtp-Source: AK7set9a9Xnd8c/SsJqLPgwexWfPxlCzd/RzIkQpuWEhwgY5bpUWyxbR9VoJgPhvga4TVwz/mRg5lg==
X-Received: by 2002:a05:600c:92a:b0:3ea:c100:e974 with SMTP id
 m42-20020a05600c092a00b003eac100e974mr7734159wmp.26.1677745504539; 
 Thu, 02 Mar 2023 00:25:04 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 he11-20020a05600c540b00b003daf7721bb3sm2198394wmb.12.2023.03.02.00.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:04 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 10/53] backends/vhost-user: remove the ioeventfd check
Message-ID: <20230302082343.560446-11-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Alex Bennée <alex.bennee@linaro.org>

While ioeventfds are needed for good performance with KVM guests it
should not be a gating requirement. We can run vhost-user backends using
simulated ioeventfds or inband signalling.

With this change I can run:

  $QEMU $OPTS \
    -display gtk,gl=on \
    -device vhost-user-gpu-pci,chardev=vhgpu \
    -chardev socket,id=vhgpu,path=vhgpu.sock

with:

  ./contrib/vhost-user-gpu/vhost-user-gpu \
    -s vhgpu.sock \
    -v

and at least see things start-up - although the display gets rotated by
180 degrees. Once lightdm takes over we never make it to the login
prompt and just get a blank screen.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20221202132231.1048669-1-alex.bennee@linaro.org>

Message-Id: <20230130124728.175610-1-alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 backends/vhost-user.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/backends/vhost-user.c b/backends/vhost-user.c
index 0596223ac4..94c6a82d52 100644
--- a/backends/vhost-user.c
+++ b/backends/vhost-user.c
@@ -20,12 +20,6 @@
 #include "io/channel-command.h"
 #include "hw/virtio/virtio-bus.h"
 
-static bool
-ioeventfd_enabled(void)
-{
-    return kvm_enabled() && kvm_eventfds_enabled();
-}
-
 int
 vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
                             unsigned nvqs, Error **errp)
@@ -34,11 +28,6 @@ vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
 
     assert(!b->vdev && vdev);
 
-    if (!ioeventfd_enabled()) {
-        error_setg(errp, "vhost initialization failed: requires kvm");
-        return -1;
-    }
-
     if (!vhost_user_init(&b->vhost_user, &b->chr, errp)) {
         return -1;
     }
-- 
MST


