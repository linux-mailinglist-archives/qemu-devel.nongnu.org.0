Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5BC38AAA4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:14:56 +0200 (CEST)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgdj-00083N-Oq
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgZN-0000pc-7m
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:10:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgZJ-0004tt-1h
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621509020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEIK0+f8xAhENSUO1Wsp9GXIhMyGmKAMVfEhOA0o4Xo=;
 b=IIMtm31G01fbJRopAxbhH7p8buMyEOQZHrhosTd9GPQ1zoZJj29q+ElTscOu+fYZQXFCeP
 cCl13pTg9uN85T91tbKsfNH1vwBsRCorUhu6sUzY/fNG8K/97bdp8bGGcVdQ5DiXJtCPTE
 PX/176Az6F3ucQ9cRO5I8Jj3XQEDGr8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-Fp4JHnprOZamwN8lYhcukQ-1; Thu, 20 May 2021 07:10:17 -0400
X-MC-Unique: Fp4JHnprOZamwN8lYhcukQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u203-20020a1cddd40000b029016dbb86d796so2199564wmg.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SEIK0+f8xAhENSUO1Wsp9GXIhMyGmKAMVfEhOA0o4Xo=;
 b=Ir3Wwx8rZm0lclAV7RDTTvWN9cifmD3c40TE4hh1enz39PyMZAKO3pwXO6wyQ78ulH
 dVVcbXhep6oycvrbj17aHUd41a/OFLLUih2O1i48cvaXPSmbSH3d4yXZy4pDkj5ezjdK
 L5Tuud2+029v7Hu98OimU6oWXKrYrAVmyAZ/kUlGHNjTk7RgUD9QqwGhM+4QlbDk2fQu
 H/e0gK8OklpD+D1IrhAi//XfKNjruwByCXYR94wGZeq8ygDed80iK/RpfnscQTSyTGI8
 pKR/LibBCcEfNZZEwF+CHHAK+yOfP6+Egrwo1f+cORzGEkCf/8b2bkrqzyXDS65wMphT
 zJ+g==
X-Gm-Message-State: AOAM531Byx+t3Umcek1qmLBl12w9mPWJGIEGF5eiBwwU93dFo5vwjgpo
 Fy6YMx18Ybgo3wZiz615gpZY5XIFQ1Y+EOV4mX+fHyUzumI2/oWvxOuol2NNxXHnThq/AE2nFqZ
 Zmtg5LkXeqNu/v2ZOxt0l5Y28BpWSvGsnqzpf0cWnMtlQ2jA6LcRt7OTTzw1Zwi0i
X-Received: by 2002:adf:e608:: with SMTP id p8mr3801845wrm.162.1621509015623; 
 Thu, 20 May 2021 04:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgOa3Tel7oAr+U0C0L/KLNS+VyKeVlMa8TYcIL1vcCGh34R3TMJnS/Xhv4kOqefrqVE7VApA==
X-Received: by 2002:adf:e608:: with SMTP id p8mr3801817wrm.162.1621509015405; 
 Thu, 20 May 2021 04:10:15 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id l3sm2331270wmh.2.2021.05.20.04.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:10:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/12] hw/virtio: Display error if vring flag field is not
 aligned
Date: Thu, 20 May 2021 13:09:19 +0200
Message-Id: <20210520110919.2483190-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520110919.2483190-1-philmd@redhat.com>
References: <20210520110919.2483190-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the virtio spec [*] the vring is aligned, so the 'flag' field
is also 16-bit aligned. If it is not, this is a guest error, and
we'd rather report any malicious activity.

Enforce the transaction alignment by setting the 'aligned' attribute
and log unaligned addresses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 1b8bc194ce1..f19d12fc71e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -291,15 +291,24 @@ static inline bool vring_avail_flags(VirtQueue *vq, uint16_t *val)
 {
     VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
     hwaddr pa = offsetof(VRingAvail, flags);
+    MemTxAttrs attrs = { .aligned = 1 };
+    MemTxResult res;
 
     if (!caches) {
         *val = 0;
         return true;
     }
 
-    *val = virtio_lduw_phys_cached_with_attrs(vq->vdev, &caches->avail, pa);
+    *val = virtio_lduw_phys_cached_with_attrs(vq->vdev, &caches->avail,
+                                              pa, attrs, &res);
+    if (res == MEMTX_UNALIGNED_ERROR) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "virtio: vring flag address 0x%" HWADDR_PRIX " "
+                      "is not aligned\n", pa);
+        return false;
+    }
 
-    return true;
+    return res == MEMTX_OK;
 }
 
 /* Called within rcu_read_lock().  */
-- 
2.26.3


