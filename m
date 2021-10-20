Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5493A434953
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:47:31 +0200 (CEST)
Received: from localhost ([::1]:36068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md986-0005P3-Cb
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8ha-0004Le-8z
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hX-0003Bk-44
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YfMqludtVxGe6ZQMypK2Vw2Q7PYFz1rFSXdv5+28mU=;
 b=ewT7L0B9K4xxtYrMTOvAonHXIM2IPwLHHdeWvBbv8Wi+ZO4hPgyxBLRUy3T8dqOTrKtZYN
 jm74EYxbVY0yXjxb0ABMgSmYl9QRFTwmYAB0fPuPddXxkt2ug0O4hrJCEqKrXZVVWWh1jA
 nzx2JlxFVFM57+7aq3y47OUHu0aj/sk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-VRs5mt77PWmfM07TA2u3-A-1; Wed, 20 Oct 2021 06:20:01 -0400
X-MC-Unique: VRs5mt77PWmfM07TA2u3-A-1
Received: by mail-ed1-f72.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so20523856edl.18
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2YfMqludtVxGe6ZQMypK2Vw2Q7PYFz1rFSXdv5+28mU=;
 b=CJ8Fr+444SOnxea+DT3ZU0qSkRZ3YBToWpOb6JYXiq6kG3lskGqQ51OAPYHFTnX6gL
 meHeNhCs9bE7/9aPM4WsnQrXNfeA+vh4bX/AMu9qU2FJoGfyCSU+Oto/lNYT1wesJVTh
 EOH/e1Y+ehjUsUZMJum+aw2SjRgXw/79fzrEORaGoyty5yQY2zOwABTIhjgWyy16W0gi
 sC5lZ6yUcsOwRx63hjIdrYegdXf3iqDf7WTwabcY4at1uBt/lO/y6v8umUyzgDL7XSte
 2FKyPvS2heBnOEAMutKUpgnzfz9mWM9W9Mr+JVw2HrNfss5E9eUGQytewtSgEgE55gwN
 c/yA==
X-Gm-Message-State: AOAM532FsxPmNHzPdicy9cyVNrWI6U9KiKd0WPO1dYA1RNaYQdVKWaWX
 1GhNu89vDd47Rktmff439w2M4avrCaTOX/xxoKZ4q+bX1nurgMa1GZTWCwVe11Q7M52Bf1301h/
 7ih3ZG1a2n+09p+OJIOqtxjLZ4uW2F4z382lz2thg37iiLONGzM8CTxFX7M/w
X-Received: by 2002:a17:906:eb05:: with SMTP id
 mb5mr46378364ejb.88.1634725199424; 
 Wed, 20 Oct 2021 03:19:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3Io84OnIvAOJ47jcYs3m93WjSsZ1JB4xY/ytCO/PAyWkw/3NRJucdmIVoS1Tzf9HFAaLnZw==
X-Received: by 2002:a17:906:eb05:: with SMTP id
 mb5mr46378334ejb.88.1634725199192; 
 Wed, 20 Oct 2021 03:19:59 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id ke24sm792999ejc.73.2021.10.20.03.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:58 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/44] vdpa: Skip protected ram IOMMU mappings
Message-ID: <20211020101844.988480-17-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Stefano Garzarella <sgarzare@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Following the logic of commit 56918a126ae ("memory: Add RAM_PROTECTED
flag to skip IOMMU mappings") with VFIO, skip memory sections
inaccessible via normal mechanisms, including DMA.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211014141236.923287-2-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 47d7a5a23d..ea1aa71ad8 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -28,6 +28,7 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
+            memory_region_is_protected(section->mr) ||
            /* vhost-vDPA doesn't allow MMIO to be mapped  */
             memory_region_is_ram_device(section->mr) ||
            /*
-- 
MST


