Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7004334DC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:38:28 +0200 (CEST)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnRr-0001BR-In
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAp-0000LN-Be
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAW-0002Hp-41
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YfMqludtVxGe6ZQMypK2Vw2Q7PYFz1rFSXdv5+28mU=;
 b=jM+1v9CtWetwxn3PY0O5PM+jM0yRdiaRwgLa9GwkVJ5I4aoBcTMCRpzp1MIS7RVx00kVVu
 7CWemCw6v9sf4CLiW+tuEai9F8PfDj+p+g7esCUAeP59mLet2cHBfqyJS7NV3SUvMJZX40
 1xR2beQu98DqcfOjl0Vfr8RxR/HtymY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-7Jw9fA7qOvubl44icMGXIQ-1; Tue, 19 Oct 2021 07:20:30 -0400
X-MC-Unique: 7Jw9fA7qOvubl44icMGXIQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 s12-20020a50dacc000000b003dbf7a78e88so14235976edj.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2YfMqludtVxGe6ZQMypK2Vw2Q7PYFz1rFSXdv5+28mU=;
 b=p2MXl1hfrsD0YmceQQvK2omS+SlYe1oyvLVpqEHUN6gYy2UAWhklw9TdTvynnAKGGa
 dW+3E12Fr7bw9o9WDYXclDR1HFN8nZa1AqfTMple0SBAW1PCmKnUsXo0vw/6+PVk81XV
 NMLSoBEydT85TGWGTXt2/l0h9TiOwR/t3NXgW/kkSzF196TaokK37yiJlwilmHMul4Dj
 J07A0Jmk/ENuAg6pOy7U4Ck+uOwBde6F3MnT5V8LK1kNodPofKRWIJ/gBk18bK7XBhjS
 5N92MUeIjh97PLfR2MI4zgUEFPW8C5UCT2hD07lj3IhRxYEhaiI8dVMwWqWqkDqV01LF
 hr4Q==
X-Gm-Message-State: AOAM530zmC3lNfB+Kd5urjbmK0b+b3Th/UKwucvrKNFP3mR1p1gHsp5c
 worSDuQzjRtLUIAhhabowOuLFUV7g1msmROgKveez+xYtVd6H7SROUift2LrkaLATG+px1B2MYW
 gZiABSEH8dp7rgcZ9Khw9EY7gW0kQwCudDmyOsXaGFwCcoMv8ENzHlSMOzpVJ
X-Received: by 2002:a17:906:eb86:: with SMTP id
 mh6mr37791589ejb.141.1634642428489; 
 Tue, 19 Oct 2021 04:20:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgI8WK+MVtgTnPilS76zNUChZFMp30RVIW+D5zqVJKEhU9SZc3yAFXGLvFWUZS7x+7z9geoQ==
X-Received: by 2002:a17:906:eb86:: with SMTP id
 mh6mr37791539ejb.141.1634642428040; 
 Tue, 19 Oct 2021 04:20:28 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id nd36sm10355069ejc.17.2021.10.19.04.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:27 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/29] vdpa: Skip protected ram IOMMU mappings
Message-ID: <20211019111923.679826-17-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


