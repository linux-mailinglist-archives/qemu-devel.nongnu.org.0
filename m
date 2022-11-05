Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A678A61DD25
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 19:17:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orNia-0000Zi-Co; Sat, 05 Nov 2022 14:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orNiY-0000ZX-8Y
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 14:16:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orNiW-0007qZ-O6
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 14:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667672188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xm/UpqJDCgQM8KXC7CHtk7A2yuPbSQwxvC5UgzVHNGc=;
 b=f9alWkhYQP2pQ1JyZcnjx0zK1DDj7+0OFeqWoXpwR+FWcZXa9xwmE5DwPSrzM+pAmBG1fs
 xdvCpntN383HUYx05keLtrE+v4jKF+P1/2haGLbKwmHxyEW0pu0TenUDjBA9CddjnKnKow
 OuNpnhCKvFYlvSmQXBq00rcNRXrlFcs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-TIHGxkM2NMmaMEQNYPusJg-1; Sat, 05 Nov 2022 14:16:26 -0400
X-MC-Unique: TIHGxkM2NMmaMEQNYPusJg-1
Received: by mail-wm1-f70.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso6065729wmk.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 11:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xm/UpqJDCgQM8KXC7CHtk7A2yuPbSQwxvC5UgzVHNGc=;
 b=HjIsZphLXv2yxeJVZYktpYfwOZLlnTYGBtMMqGsXZd32G2ThSYMtn/Vi8KlOVjuKf3
 6Ahv7fS4HLa4UL6N+Vbcgb43TTB5cdx4HhjPeNGYVIG4fDRTKXegDb7k1ZIYTo1eIjO9
 xEFF4TgruzfbVZvzoFRhTOYQxKw4V9PN8CXuuupx7qHekSK68BQOH7Pg/XdgQgT9t74i
 LCTvNrOh6fGLnrl7W/UelUiyaHkyLl3uPXRtu0XDyJJoCausMIB4RWsbtdqpf0T6SWsM
 NxxULItMwPgzt7lguq53/soIjFuCE7z7hUUqsNCRWlgvhOFmlkQGUzCGtJF3Y1zLwNQQ
 RwXw==
X-Gm-Message-State: ACrzQf1bLeZh/FdWc/Zzm4q1G0zRj9nPmufyQRT9i0GqnLEvAMz1/h8v
 1hCfazi6Ateu/JEImn9vvg8gk6L38NUQS0tY6g/jqKZDqrZOvSudRBewbtOCbozUtnVGqkrOBVu
 Zl8yqznfoxMBC8VzpJvolMay3a6F/Ch0cQkSkx+2o+WTCcwQ01UHhbuoGSldR
X-Received: by 2002:a5d:5744:0:b0:236:5c21:177f with SMTP id
 q4-20020a5d5744000000b002365c21177fmr25858880wrw.449.1667672185550; 
 Sat, 05 Nov 2022 11:16:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM41sLZsBjMmxFKsYPPP9xMharPXRR/EpmZy1ZwlR5Dv7GMH8NUM/CYXRt44D10xz56EMsY86A==
X-Received: by 2002:a5d:5744:0:b0:236:5c21:177f with SMTP id
 q4-20020a5d5744000000b002365c21177fmr25858862wrw.449.1667672185254; 
 Sat, 05 Nov 2022 11:16:25 -0700 (PDT)
Received: from redhat.com ([169.150.226.216]) by smtp.gmail.com with ESMTPSA id
 c16-20020a5d5290000000b0022e36c1113fsm2743584wrv.13.2022.11.05.11.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 11:16:24 -0700 (PDT)
Date: Sat, 5 Nov 2022 14:16:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com
Subject: [PATCH RFC 3/3] virtio: revert changes to virtio_device_started
Message-ID: <20221105172453.445049-4-mst@redhat.com>
References: <20221105172453.445049-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105172453.445049-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

virtio core often needs to know whether device is started, this is what
virtio_device_started already did. However, backends want to know
whether virtio is actually running which also depends on whether vm is
running. To address this we moved the check to virtio_device_started,
but this changes virtio core behavior which wasn't intentional.
Now that backends use the new virtio_device_running API,
revert the change to virtio_device_started.

Fixes: 9f6bcfd99f ("hw/virtio: move vm_running check to virtio_device_started")
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 634c24513f..de8d78af12 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -395,10 +395,6 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
         return vdev->started;
     }
 
-    if (!vdev->vm_running) {
-        return false;
-    }
-
     return status & VIRTIO_CONFIG_S_DRIVER_OK;
 }
 
-- 
MST


