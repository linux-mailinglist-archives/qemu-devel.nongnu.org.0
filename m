Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013BE6EDD1D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:49:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDO6-0001Rv-UB; Tue, 25 Apr 2023 03:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNd-0000xO-Uu
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNO-0006q9-78
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQ3CXFb4EAO35V6poQk6L8RCvBgf3V6gIrpzx+cWSv8=;
 b=gssg/ThThpn6LnCFhtXpezJHYIFBYWLzolSv5aFrTKpKvuHub5D/lIe+/Rjdg1troXAlgd
 Y5E2puTeFg96wAMZeqP+JvTXLhOQheZl8FlwUp3E6fuUKxVLX91yoh1AhuVkofoQFVtEet
 YYNBhAGVlg6sQ9CfT3AnLdP5ISJKeKY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-YEQomauVMD6Bphb1uE-C4w-1; Tue, 25 Apr 2023 03:46:11 -0400
X-MC-Unique: YEQomauVMD6Bphb1uE-C4w-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f250e9e090so6443055e9.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408768; x=1685000768;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RQ3CXFb4EAO35V6poQk6L8RCvBgf3V6gIrpzx+cWSv8=;
 b=aYZL+1E8iX4RY0HFAVDHUKghV4sL/8pVuxLIntbww15cRmAuX4Gg9rp0jo5Z7Gx8Wo
 vCe5IDrZFza1Tpqsvb8ROQCMcT6xyqokBuTkJ2KJ4wd8nle7vV5MjF/OxVqcVrN+DUsF
 Pq83vV8MNEjms1LTj0UUayqSd4hwYkMyT1w1WDwz4S5VDkhuZDlLZAkhgMvndduyLcgz
 DuubtjRMUaVbp9AIrXZ9pX6iw3FYuie00Ndrdjync+3nw000VbLeZuZ/X/DSt5wVuP2j
 oCawsOxkmhz3C7e0JCAo7u/3ofNtoR4Wf9gvNMFEW9w4DL7AnXDi2lz3Hb2ciFLjAU21
 HABg==
X-Gm-Message-State: AAQBX9fIpSAVj3860HW2nRvZrwOef4ZRl6O724lh4cZ1ckEKlnFkaWkx
 /y//F1IAqzbv/mfsf6Sab3FUdgFkHyAKOyy9CbowZ0dacBEnPVu8Bp3PxRYxqP0JeNzcFBeCCWm
 1RuslHXqXCL0dISIniyYDqIETKm8kxe8yRrv2NhTQfOKUIfcS+rSKVFfNg02/+VmQzkWr
X-Received: by 2002:a05:600c:3657:b0:3f1:72ec:400d with SMTP id
 y23-20020a05600c365700b003f172ec400dmr9117390wmq.33.1682408768790; 
 Tue, 25 Apr 2023 00:46:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350YOrxBRrr3rWfQUmHPeRanvl7QF0auam70BidQVCy+CTE+iV9JM8YgSK6gEuU9byKLuWu9hfg==
X-Received: by 2002:a05:600c:3657:b0:3f1:72ec:400d with SMTP id
 y23-20020a05600c365700b003f172ec400dmr9117361wmq.33.1682408768366; 
 Tue, 25 Apr 2023 00:46:08 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 e22-20020a5d5956000000b003012030a0c6sm12451911wri.18.2023.04.25.00.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:46:07 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:46:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 21/31] MAINTAINERS: Add =?utf-8?Q?Eu?=
 =?utf-8?Q?genio_P=C3=A9rez?= as vhost-shadow-virtqueue reviewer
Message-ID: <2b6fc0b859a1b8a5bc2a48c56e8cb595748b7c3f.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Eugenio Pérez <eperezma@redhat.com>

I'd like to be notified on SVQ patches and review them.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230331150410.2627214-1-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e365a7a47e..5e2d4b2c2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2075,6 +2075,10 @@ F: backends/vhost-user.c
 F: include/sysemu/vhost-user-backend.h
 F: subprojects/libvhost-user/
 
+vhost-shadow-virtqueue
+R: Eugenio Pérez <eperezma@redhat.com>
+F: hw/virtio/vhost-shadow-virtqueue.*
+
 virtio
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
-- 
MST


