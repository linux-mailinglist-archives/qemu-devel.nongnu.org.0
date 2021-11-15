Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC754509E0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:43:49 +0100 (CET)
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf5A-0003VO-H3
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:43:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmez5-00018i-R1
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:37:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmez3-00058c-Me
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ROjPuUrj7hvJIatWsMC+cEH79scJrazKrFIFjUchYM=;
 b=f05aauSINGW0hqJU4124B7433pwESvPa6M6NQDbsD+vXrKmwXGZRctFJf/4RNgXdp6GXlY
 6UlrQdjH6bk1oKUOSWL7cywn2H9TX+6fXFCOPiS6cTUb2oUSN/kFtjV9PCnyD5e8dScljq
 2A7i3r1fr42euzThcUC5QpxtTV99pA8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-ltOFkXTOMpCGbqIpvrNLZg-1; Mon, 15 Nov 2021 11:37:27 -0500
X-MC-Unique: ltOFkXTOMpCGbqIpvrNLZg-1
Received: by mail-ed1-f69.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so14480218edl.17
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1ROjPuUrj7hvJIatWsMC+cEH79scJrazKrFIFjUchYM=;
 b=Vpyr6ArrNgylaPRhTgom5GoLUv3VkhjMQ7YEIASLm+oE1TCbdth3G/GvnySy/6q2O/
 4OXGCN4UWh5kO1d7Cydj78ranNBX/plriNA+AmKnn0zvuPFw8TXiQNGhh6sm4Zf2Vb2t
 MfUdB0hlz4uwUbm21gDvcX7bn+t7fZVoVXurQ+qph2dv0sTdFTgRHmBXorjfhyDp8Jai
 3FpU1Ghi6q6uTti0qja0K8jim3nJR06Q4F+4W1LAXBr7/tVOIgKZ4KlU/pMBMYjPXDex
 lPL+tdlsrllJ1U1q5ZIAYtBIcLXKnigQuFGWf+yYVerVhkrmTzze7PfHv8f9hlBPZ3Wd
 48BA==
X-Gm-Message-State: AOAM532F0meeIuqVMnqqQ0GSN1a2az38Dt3sfuvJQmjNBA0/QdE9djog
 qd7IZiSOaHo2XQ6aqO5QAaEZ3Adu6SEGHlzkQsE6i3JMjLYc1GVNLX9IkbS0IEU+ojZbBOpDdxC
 KKDLnK07s4arwAtqhkaJUZ8XD6AOrZPyoLrG03Oi1sNcBNjaIwbcPYqRSmaa1
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr39228edf.250.1636994245925; 
 Mon, 15 Nov 2021 08:37:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/hGddhanJPICGPpvt61e8ncu29H1Fb5uaP99rPMw6dEiNDnstjeF9EeC3O/HJt6LAAtvgfQ==
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr39172edf.250.1636994245645; 
 Mon, 15 Nov 2021 08:37:25 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id z25sm6549486ejd.80.2021.11.15.08.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:37:25 -0800 (PST)
Date: Mon, 15 Nov 2021 11:37:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/20] net/vhost-vdpa: fix memory leak in
 vhost_vdpa_get_max_queue_pairs()
Message-ID: <20211115163607.177432-2-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Use g_autofree to ensure that `config` is freed when
vhost_vdpa_get_max_queue_pairs() returns.

Reported-by: Coverity (CID 1465228: RESOURCE_LEAK)
Fixes: 402378407d ("vhost-vdpa: multiqueue support")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20211102155157.241034-1-sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 49ab322511..373b706b90 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -214,7 +214,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
 {
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
-    struct vhost_vdpa_config *config;
+    g_autofree struct vhost_vdpa_config *config = NULL;
     __virtio16 *max_queue_pairs;
     uint64_t features;
     int ret;
-- 
MST


