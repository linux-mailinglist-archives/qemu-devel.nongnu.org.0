Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8CB380E30
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:29:32 +0200 (CEST)
Received: from localhost ([::1]:46662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhagu-0004J6-0C
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIX-00061G-DV
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIV-0005GT-Sc
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muRWUMoRmGNLLUr4R0cDQy4brPQQprA4VAlV1bSDdDE=;
 b=a74PPExgDSdV0qHA6OvHDMb8Sg0q73rl+mnVC7MI6+mAuqBfioiI8V+OF72xmSdKRr+Hrt
 YX6QmGWzP/XS92ZYOtNve95ej189kU12doEYcM5UhEzeIjsPrzmuLN81TttJk+nhi9VpIh
 FTaFT1YdBl7LO+XmKer14G3F4eIN0oI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405--RoVs2S3PdSKtDE4LfX-TQ-1; Fri, 14 May 2021 12:04:17 -0400
X-MC-Unique: -RoVs2S3PdSKtDE4LfX-TQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r15-20020a05600c35cfb029017373d9f318so17014wmq.4
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=muRWUMoRmGNLLUr4R0cDQy4brPQQprA4VAlV1bSDdDE=;
 b=tMQLsBcUA2pOTr1iKlCQZOGj8Ek++tFbGelu/z5ADYXMGD9ILLekXZJZYG7hX/5CK6
 SLrYZBL7ZdrunehK7Lgngf0HGO79Kdcq1HRbIcZTn79pBH7qSd6ZtjzXC0mA3oDLk1wU
 sc4EN2jacl8TbUjhUNyQb07KqGBv34HhQAgS65rkOT128H1s5UcZxDudn/vk9d6q28qn
 itKVNEmihdF5ako9TReS312eVB1q7mxCytV/GlwI8JQu4/pnBA6/4BYB4xESCR8f6s9E
 9BVyPSj3Zo0p+MEOvQigcM8g3zsu7Rylh7QG7r9faluIKZcZ1YYQH1g0HsYEdZ4cLCxw
 UhBg==
X-Gm-Message-State: AOAM530B1km9o3l0rhbcgQW6uspwaQlYLRa+dNRk8CbJrC2+hN39+DLB
 qXPQPsXPx42SwPSXmiMxNVRMXL1JhnxeMBNbtFtqkZu6WfaC93pAuTqZkyOBnFNXCuMrX0VK536
 hiP43Fbuy9XqzZg0ltpIidGb2lR3UERyu+BRbzrTBHPf8Zdtvh8RwqOIWo+vZ
X-Received: by 2002:a5d:4a87:: with SMTP id o7mr59854571wrq.102.1621008255872; 
 Fri, 14 May 2021 09:04:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnZtZrcuiZQkXccRIifTHrmgoovMzdJPrMk6lpTRoxCPguhJFRFQ6vDKoBLEuv3zZLImcy5w==
X-Received: by 2002:a5d:4a87:: with SMTP id o7mr59854548wrq.102.1621008255662; 
 Fri, 14 May 2021 09:04:15 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id b17sm6983138wrt.71.2021.05.14.09.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:15 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/16] hw/virtio: Pass virtio_feature_get_config_size() a
 const argument
Message-ID: <20210514160245.91918-4-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The VirtIOFeature structure isn't modified, mark it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210511104157.2880306-2-philmd@redhat.com>
---
 include/hw/virtio/virtio.h | 2 +-
 hw/virtio/virtio.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a6a8..8bab9cfb75 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -43,7 +43,7 @@ typedef struct VirtIOFeature {
     size_t end;
 } VirtIOFeature;
 
-size_t virtio_feature_get_config_size(VirtIOFeature *features,
+size_t virtio_feature_get_config_size(const VirtIOFeature *features,
                                       uint64_t host_features);
 
 typedef struct VirtQueue VirtQueue;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 07f4e60b30..564ca63246 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2982,7 +2982,7 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
     return ret;
 }
 
-size_t virtio_feature_get_config_size(VirtIOFeature *feature_sizes,
+size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
                                       uint64_t host_features)
 {
     size_t config_size = 0;
-- 
MST


