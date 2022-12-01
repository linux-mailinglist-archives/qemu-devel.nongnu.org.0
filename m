Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C4E63EA6B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:40:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0e9k-0007iW-Qq; Thu, 01 Dec 2022 02:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0e9f-0007gp-O6
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:38:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0e9e-0007tV-3R
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669880324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5/7MrH+QtrO6VCSQCLTGZeCpdV+HusT1OZ+wFAoJKk=;
 b=V/5DBSSt9MhybZnPip1aFESUn+Tnj6ayQBpJZuDzypLuHbKBYQJ+UJ4pYaPfdcX+vUn/0j
 EPfgxKd8TyxYBvA8u7e1QCUd+f2yXSWaKNmttsg8D0er1gGHoCS7oVd6vkT+sBkBZbLS+z
 8T+eZNgn5nNRXIG89PE+YFDuNheg/QM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-YA28AxJqNkqJ4CbiuPJ6Dg-1; Thu, 01 Dec 2022 02:38:43 -0500
X-MC-Unique: YA28AxJqNkqJ4CbiuPJ6Dg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c126-20020a1c3584000000b003cfffcf7c1aso2180285wma.0
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5/7MrH+QtrO6VCSQCLTGZeCpdV+HusT1OZ+wFAoJKk=;
 b=UPmaooHc7+xwdihBOS/sIAxe03ZDXLi9E+6VCqnv+2ICN8xs6kiobHc8dzhiLZJIX2
 +rP8MVWY5haeCFJgvD8JlQcal3spzBKrQAYS8v2rdlIEW+ErBVeO81Skuv4YVKLFch/n
 21Yj2ukJ8ULUjRf0QQ5CXuPwevRKy4s/2gXGT1z3U+QuMlHTblPyAi81fRDJYk9/TOSw
 v06/uPAK7wpXpbdXaTU5TZeGtgT/nygJokVPJD9V8TvSwkkx+Om3qwS2AYO6MVcxvOoQ
 7ji2Gmax49rrVYp0O8UvpOFQzy7mCmnCH+2t6Ndc7sNgvsZfXhd0QDvbaj7Lu8T9EhiO
 ipow==
X-Gm-Message-State: ANoB5pltSMCfWpGc97yfaLO20np/DrBu0EwfaVZg0dM7S/oWsmpoLKYN
 szQsQaqRLGaG3myo96OPqQQmQCN2oYxMI8T71qRrjrNdhKT/wcK22qRHlIL95+efqtILogIdey4
 OjrHuxHGZ3AlMlYS9DdfBnjT9Rf2Sc04nNrvcTFvVSTiyxspuwMtzV/fgfh7O
X-Received: by 2002:a05:600c:5127:b0:3cf:a4c4:777e with SMTP id
 o39-20020a05600c512700b003cfa4c4777emr41190359wms.72.1669880321908; 
 Wed, 30 Nov 2022 23:38:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7G6wlgY2AMJFXxqpFt2wu8GN0DsCoXLNHLMY7vjAOmuYGsrE9W0hp50xccdfpSFdw3OPTPzA==
X-Received: by 2002:a05:600c:5127:b0:3cf:a4c4:777e with SMTP id
 o39-20020a05600c512700b003cfa4c4777emr41190334wms.72.1669880321597; 
 Wed, 30 Nov 2022 23:38:41 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 q128-20020a1c4386000000b003c71358a42dsm11088186wma.18.2022.11.30.23.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 23:38:41 -0800 (PST)
Date: Thu, 1 Dec 2022 02:38:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PULL 3/5] hw/virtio: add started_vu status field to vhost-user-gpio
Message-ID: <20221201073725.44585-4-mst@redhat.com>
References: <20221201073725.44585-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201073725.44585-1-mst@redhat.com>
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

From: Alex Bennée <alex.bennee@linaro.org>

As per the fix to vhost-user-blk in f5b22d06fb (vhost: recheck dev
state in the vhost_migration_log routine) we really should track the
connection and starting separately.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221130112439.2527228-4-alex.bennee@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-gpio.h | 10 ++++++++++
 hw/virtio/vhost-user-gpio.c         | 11 ++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/hw/virtio/vhost-user-gpio.h b/include/hw/virtio/vhost-user-gpio.h
index 4fe9aeecc0..a9305c5e6c 100644
--- a/include/hw/virtio/vhost-user-gpio.h
+++ b/include/hw/virtio/vhost-user-gpio.h
@@ -28,7 +28,17 @@ struct VHostUserGPIO {
     VhostUserState vhost_user;
     VirtQueue *command_vq;
     VirtQueue *interrupt_vq;
+    /**
+     * There are at least two steps of initialization of the
+     * vhost-user device. The first is a "connect" step and
+     * second is a "start" step. Make a separation between
+     * those initialization phases by using two fields.
+     *
+     * @connected: see vu_gpio_connect()/vu_gpio_disconnect()
+     * @started_vu: see vu_gpio_start()/vu_gpio_stop()
+     */
     bool connected;
+    bool started_vu;
     /*< public >*/
 };
 
diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 0b40ebd15a..be9be08b4c 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -86,6 +86,7 @@ static int vu_gpio_start(VirtIODevice *vdev)
         error_report("Error starting vhost-user-gpio: %d", ret);
         goto err_guest_notifiers;
     }
+    gpio->started_vu = true;
 
     /*
      * guest_notifier_mask/pending not used yet, so just unmask
@@ -126,16 +127,12 @@ static void vu_gpio_stop(VirtIODevice *vdev)
     struct vhost_dev *vhost_dev = &gpio->vhost_dev;
     int ret;
 
-    if (!k->set_guest_notifiers) {
+    if (!gpio->started_vu) {
         return;
     }
+    gpio->started_vu = false;
 
-    /*
-     * We can call vu_gpio_stop multiple times, for example from
-     * vm_state_notify and the final object finalisation. Check we
-     * aren't already stopped before doing so.
-     */
-    if (!vhost_dev_is_started(vhost_dev)) {
+    if (!k->set_guest_notifiers) {
         return;
     }
 
-- 
MST


