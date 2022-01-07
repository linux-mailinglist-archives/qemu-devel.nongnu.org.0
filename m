Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A753848779B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:29:13 +0100 (CET)
Received: from localhost ([::1]:41370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5oMq-0006X2-QM
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:29:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n45-0001cO-Bo
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n43-0002Yu-7i
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tDeLlyz26ezikC22VaRSSlTH90Iv9SaCxPq3k3DQzw4=;
 b=R0d+nZp37Wi0s1dLjcYnXExqHnP0vdihgsZIUcxSOCbnPv/QaEW4GyrnUnijKb0TY28VlN
 vJofsoEMFW11QbgJxngf4d23Q+M4zbPO5Qrit+WnkO1gebITQMyqKdm6vKMGBSz+blf9zZ
 sjl32xxJlYLFkyx3oYparKF4FRgMXNE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-J7GSJ0RIPMSXwFh9iJ-i3w-1; Fri, 07 Jan 2022 06:05:41 -0500
X-MC-Unique: J7GSJ0RIPMSXwFh9iJ-i3w-1
Received: by mail-wm1-f70.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso511082wmz.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tDeLlyz26ezikC22VaRSSlTH90Iv9SaCxPq3k3DQzw4=;
 b=KYz4WK1X1BlYXvda++ml/Z8kDf6IBzIqcuMYmM6PsaWc715i7kFqDFverluTjEeFX8
 ath/6JgNtc2Ktn5wWaxbq7vq+vmWjVnb8JqrZxx7qT//FezWfU2Ccf1v7BYEV9YsWFMs
 4pcRh5KdrfghiDLEaQphc0pXqa4D2pepDE3UEPGQEpgGrC5vBiH46tGiYF76WUU5XWE9
 El02+ashw13aofmyVw03rowubJB/Gav/683wVLneFjJ25tVA42S/Pw4uCYHN4rrqxHv/
 aczMfVa9NE8sGbZZnmmSh31IANlji6skGY1B6d+A9R+8qZQSA9e4H4eJCQn/8zVCivJK
 yZWQ==
X-Gm-Message-State: AOAM532URS4WPSD8ba5n3T6MGmf34cNeCN8wei8rjbKtDXVEezvI29Px
 lre7eECnL0pa12mp7CBZpHdw7iiLumKrJDZZ8y+K9uiJldnuBnmsHqj6eN+uQmXnnAguHjolFaN
 CWqYnrJYztVyVhOJpvv0l/UcoE3pCf+nJ9nKrLq2LGiIWgLYhNQjFD/P8Z57t
X-Received: by 2002:a05:600c:a03:: with SMTP id
 z3mr10557108wmp.73.1641553539989; 
 Fri, 07 Jan 2022 03:05:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7I7JqCvhYoMnBK+kDRXNWNY9dQjqSHvu7i4ZfkA9oq3AQ7ONCou0aq7Q7XOQM4fBWRdRQRg==
X-Received: by 2002:a05:600c:a03:: with SMTP id
 z3mr10557085wmp.73.1641553539741; 
 Fri, 07 Jan 2022 03:05:39 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id c8sm4591904wmq.34.2022.01.07.03.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:39 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 51/55] hw/scsi/vhost-scsi: don't double close vhostfd on
 error
Message-ID: <20220107102526.39238-52-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

vhost_dev_init calls vhost_dev_cleanup on error, which closes vhostfd,
don't double close it.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Message-Id: <20211129132358.1110372-2-d-tatianin@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/scsi/vhost-scsi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index efb3e14d9e..778f43e4c1 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -222,6 +222,11 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     ret = vhost_dev_init(&vsc->dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
     if (ret < 0) {
+        /*
+         * vhost_dev_init calls vhost_dev_cleanup on error, which closes
+         * vhostfd, don't double close it.
+         */
+        vhostfd = -1;
         goto free_vqs;
     }
 
@@ -242,7 +247,9 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     error_free(vsc->migration_blocker);
     virtio_scsi_common_unrealize(dev);
  close_fd:
-    close(vhostfd);
+    if (vhostfd >= 0) {
+        close(vhostfd);
+    }
     return;
 }
 
-- 
MST


