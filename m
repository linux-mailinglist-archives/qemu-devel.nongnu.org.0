Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0C400D41
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:59:13 +0200 (CEST)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdgu-0007B8-CK
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdNP-0002rC-Ex
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:39:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdNN-0002bV-TY
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yIKxpWcU56OqvhkLWqT8KFXeISWeq1cxadhweZ1jVpE=;
 b=bCylt6pkYt1zr4qhg8uahVSOrAvRJ12a7AAMClqd9rC2LmhZsfCBXZlm7Dp7C+tR3zndAy
 yIemgbvCbZdf4addIUqm/HOw/HtQwPppgdOHxhSJje+beuX9Sisjt+1oaQZAPKFX25Yf3t
 CAV1UaBT1oX59vmRWxDXH+EAEtPNjeo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-L7o2qHxcOwiRcHVxNa4qQA-1; Sat, 04 Sep 2021 17:36:21 -0400
X-MC-Unique: L7o2qHxcOwiRcHVxNa4qQA-1
Received: by mail-ed1-f72.google.com with SMTP id
 b15-20020a05640202cf00b003cd5efcd633so1506539edx.9
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yIKxpWcU56OqvhkLWqT8KFXeISWeq1cxadhweZ1jVpE=;
 b=U8DPaj990CneSnm36iLBklJ2OQtkccc0JJlRdJMeO4Mz3Goz39NjUUXShBK/RNcH3C
 yVojy5Ej6sDs2dZRkD7NWGYzGkNwyANFYwrGczt7qKDFYDsV+d2jBu5wel4/bi9+8B5u
 8QXejGGhrBGi6/mSSvpnMV1//O6ByBmgOXAk8ABkyQHrjibIVRq87g0KMg+yzDby+gt+
 aGwLSGrJeWgt1iEOTJZRj2UqdMA9au594r5qD53aHQ7Xjk6/Q4CTmBQAYSaLq7C4hlEQ
 KH3Xc6d7Ixdzxc9reSYlHGwkjmCZBwKh7vIzAh4fVpECG+4Mb+mYVAeRwK6mcBNoXOmH
 dd9w==
X-Gm-Message-State: AOAM530KZk8LHYkNYc2Xa0p66eBnUwVforhzWs7rONuDdp9+RPr5UnFO
 xbN0n9wHwScmPFBojPyLn62Eq0i/5ibPa77XkpJ/aFMHAcHIE85inmnzdelFKYunK7qOO5OvKtX
 RztoESf/NJlL1cRaN2BBEN96JTe0ElV7hol9ekoT5bpKrT/J2bvgNSHz8shY5
X-Received: by 2002:a17:906:c05a:: with SMTP id
 bm26mr5884893ejb.498.1630791380408; 
 Sat, 04 Sep 2021 14:36:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEUIMeYFQt+8syoq9RN3R3S+F9Em4X02SywKKnahKk3nIlT5Qjh5hGwZIcTTS7vIPYXNbGaQ==
X-Received: by 2002:a17:906:c05a:: with SMTP id
 bm26mr5884884ejb.498.1630791380237; 
 Sat, 04 Sep 2021 14:36:20 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id f10sm1537816ejc.51.2021.09.04.14.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:19 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/35] vhost-user: add missing space in error message
Message-ID: <20210904213506.486886-9-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alyssa Ross <hi@alyssa.is>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alyssa Ross <hi@alyssa.is>

This would previously give error messages like

> Received unexpected msg type.Expected 0 received 1

Signed-off-by: Alyssa Ross <hi@alyssa.is>
Message-Id: <20210806143926.315725-1-hi@alyssa.is>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index a4eb6cde7e..360d9bc040 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -429,7 +429,7 @@ static int process_message_reply(struct vhost_dev *dev,
     }
 
     if (msg_reply.hdr.request != msg->hdr.request) {
-        error_report("Received unexpected msg type."
+        error_report("Received unexpected msg type. "
                      "Expected %d received %d",
                      msg->hdr.request, msg_reply.hdr.request);
         return -1;
-- 
MST


