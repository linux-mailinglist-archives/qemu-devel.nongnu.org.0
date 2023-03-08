Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E596AFBFE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:16:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiM5-0003bw-LH; Tue, 07 Mar 2023 20:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLj-0002xZ-V5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLi-0001dZ-Dl
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0l1LaAqsmg29CKo7QKOuWkd4tPIVmOJ6o7QVmDHx8A=;
 b=dogR+0MLCvd4ucvniaop49GLJwiXUMRSZhWz3nkZJhBexdmo+RNjo17/rtv627pISLCeDi
 BScmonX6EGPfvUOFD+++Hc5msqti6HwgZxx7iB9DhK6YqZeM4Xz+Cj2hXRnNhU6W4UeXOH
 8IpPUf1UXG07HjjqX7j/PLbiItzHpQw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-Nr-a9BmpMnqL1wZEnr3MyQ-1; Tue, 07 Mar 2023 20:12:08 -0500
X-MC-Unique: Nr-a9BmpMnqL1wZEnr3MyQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso21181462edu.17
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237927;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I0l1LaAqsmg29CKo7QKOuWkd4tPIVmOJ6o7QVmDHx8A=;
 b=7/10ul02Eu/TMHDseGykdEr7vZBTQcf1D3kf0N2j5TNtTxjsNt94Da3BO3uZduX49n
 xPDDrr7vd7I1Jd3syoGXN61Fd/P6EB+AMESEU8nnSMnWtWZnC4JklEfcsqod/31kl2Th
 TswkgT3YxNcoQK5NP+uosZ9us5aH76HeF/K3lXHYYYVMX9ojUCVCcqgYpfD1LrB3mKhH
 ze9C6dv49bIMxLo4T7cjwWUWgbahx5N+xHgAHJTMWVwoIlIvAPcaNTCUpxmHm8+K4KJ3
 R1i8jWYqwg6erRBuo9nKsTRMVRZnB9koAO5plNd+r+kcg1U2K9IqkzdYx3dhpWhDfAkJ
 GoBQ==
X-Gm-Message-State: AO0yUKWuTwuY6AHAs8GssnL3Uo0glbzZY1QTW1r68mWt1+g+zkf61bbq
 tZj96+NoR/0yS9ync/d4q8rxnZOHZRzL7gyV53tuxIMgtKnqDCDv0liCR4ea1HmkH8QVRaKG6LA
 ddIHo1NH9WkoZxvptv2tolhMw0T3v+o1TDxll8xwdo5rE098pdfVAcpiEr6M1f4U4iWCM
X-Received: by 2002:a17:907:1b1e:b0:8b2:8876:2a11 with SMTP id
 mp30-20020a1709071b1e00b008b288762a11mr22862295ejc.28.1678237927119; 
 Tue, 07 Mar 2023 17:12:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9pZkIzuRTjIuuF5fpW3igiVa95nBp11UC9MP9RD+PSjDb8BG0eFfruwcRxSqUwiANzBsQ5xA==
X-Received: by 2002:a17:907:1b1e:b0:8b2:8876:2a11 with SMTP id
 mp30-20020a1709071b1e00b008b288762a11mr22862278ejc.28.1678237926922; 
 Tue, 07 Mar 2023 17:12:06 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090685c200b008dcaf24bf77sm6730399ejy.36.2023.03.07.17.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:06 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Lei Yang <leiyang@redhat.com>
Subject: [PULL 25/73] vdpa net: allow VHOST_F_LOG_ALL
Message-ID: <609ab4c3ed8d6b6a4d94930fb9185412b2ba0d0c.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

From: Eugenio Pérez <eperezma@redhat.com>

Since some actions move to the start function instead of init, the
device features may not be the parent vdpa device's, but the one
returned by vhost backend.  If transition to SVQ is supported, the vhost
backend will return _F_LOG_ALL to signal the device is migratable.

Add VHOST_F_LOG_ALL.  HW dirty page tracking can be added on top of this
change if the device supports it in the future.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230303172445.1089785-14-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1089c35959..99904a0da7 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -101,6 +101,8 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_MQ) |
     BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
     BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
+    /* VHOST_F_LOG_ALL is exposed by SVQ */
+    BIT_ULL(VHOST_F_LOG_ALL) |
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
     BIT_ULL(VIRTIO_NET_F_STANDBY);
 
-- 
MST


