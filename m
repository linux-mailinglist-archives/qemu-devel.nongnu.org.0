Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60377380E45
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:35:29 +0200 (CEST)
Received: from localhost ([::1]:54708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhame-0001oL-CL
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIf-0006PL-IP
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaIc-0005LS-QO
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdi/bwVCvQI3Cf1f57BFvqMqN5Pw6K1/gcXgkNZP0zc=;
 b=On0uLWvEn3lu7T0T25nojhtZocVklwXtheUY1w7tuipi5SVjAspA6ws7xYSRIyR/UbVZ7M
 2/GSZAUjvOEmE4/uGA87sJGYUcdyG5cq0Buj+HlhwQdB9fMgjLqLCWPlKAeGueeP/7hMWB
 TxfpoIsvmSjd/iaJzbm0cvtd1/y4V8w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-SOtroGqVNpqV8OhZao2lrA-1; Fri, 14 May 2021 12:04:23 -0400
X-MC-Unique: SOtroGqVNpqV8OhZao2lrA-1
Received: by mail-wr1-f70.google.com with SMTP id
 1-20020adf93810000b029010fd5ac4ed7so3332641wrp.15
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wdi/bwVCvQI3Cf1f57BFvqMqN5Pw6K1/gcXgkNZP0zc=;
 b=LmXzeJjAILk6H4MOkXTNta5G6J+99tgx89f37IOiFkOKn+HmLyPZI3+8beA6i1A1rd
 0oa2Nj6GFNDdSmNBnnDTtkrs/aAHDc/Ku9OT38EWdD5GdDDMPS2523D5ccCZaH0dz9oi
 3LITISM79GBDYH0HC4Cxkou40/X4bOclQkcJPXWwmPKj6f/ztE/VstEG6y6nSwJrEayG
 BeekzZHFuc8u+1jVpEgXNoUm7lfl2czo6YWVf0cVkz8YeVmvU2TYm3MVLUE9RUJIoW6f
 bE2r7gCH/owkkAKXpNeX8bbLK0RPKGChbTt1sbJQNmxq1/UAtsVSMiNIQ+2EW98ATVvw
 7a5w==
X-Gm-Message-State: AOAM532m6PkErXl4bYi3q013YGUKsfRDtXh6H98/bwdNgGVEfPZZ35cA
 K+ImqImRELoHflIhgcNXXqRroIo8NWJPHU8mCEs37xh2wVPUbri+yGrhX8CFfOS9M+aBTo0K05S
 JgF6ytCM3nl1t4GHzIM+D0PpPX+DWlRHwiG2uCSPFzyH06qFb9uRoV9juP9uU
X-Received: by 2002:a05:6000:52:: with SMTP id
 k18mr1408173wrx.419.1621008261070; 
 Fri, 14 May 2021 09:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy2Vnbg6I+jzwru4GV8tCyp64+qzXfdLUC4LYY1To81Jzz/B75yLouf6nUp/aMf4+ch94Z1w==
X-Received: by 2002:a05:6000:52:: with SMTP id
 k18mr1408147wrx.419.1621008260904; 
 Fri, 14 May 2021 09:04:20 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id c206sm809986wmf.12.2021.05.14.09.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:20 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/16] virtio-net: Constify VirtIOFeature feature_sizes[]
Message-ID: <20210514160245.91918-6-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210511104157.2880306-4-philmd@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 66b9ff4511..6b7e8dd04e 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -89,7 +89,7 @@
                                          VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
                                          VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
 
-static VirtIOFeature feature_sizes[] = {
+static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_NET_F_MAC,
      .end = endof(struct virtio_net_config, mac)},
     {.flags = 1ULL << VIRTIO_NET_F_STATUS,
-- 
MST


