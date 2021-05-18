Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F60388015
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:58:18 +0200 (CEST)
Received: from localhost ([::1]:37308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4v3-00026H-Ag
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cc-0003Wj-Tv
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cW-0000Tt-Qa
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTy8laNpOEvZ5nwMb6BJ8len0GRaZyxbwD2wWuJLiMU=;
 b=UZ+TqCqQKLGlUiOSRgvJwMEWRgAggjPL1Oi/0gvOaoRkB1+xdO9A/tJtuNsZfYe2S/292T
 y+IVv7LJc76qq7B5DunqXhJlGXIsL14Nj2dWNgawn3x2Wz0VWetasgURO0J7SPcSXB5G0A
 zpsRFpdyUe0BR8CSFkCx9FvH9hw/AGE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-UW2vwp00MZaVpxbhJLV6Rg-1; Tue, 18 May 2021 14:39:05 -0400
X-MC-Unique: UW2vwp00MZaVpxbhJLV6Rg-1
Received: by mail-ej1-f72.google.com with SMTP id
 c11-20020a170906170bb02903bbefa04cd1so2773045eje.8
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YTy8laNpOEvZ5nwMb6BJ8len0GRaZyxbwD2wWuJLiMU=;
 b=dXTngsUF5aPyoLPpaBTqWS5uo+4v7WIq9sAaihyo9m+pxaer/onVLCagClkMHj9KN3
 v9JdPB8GBNXosex63VzBI72cTw/AZvovRmFmvMfmIjdIU+qK8dJphjPS/TNY3+D8Mf87
 Nx+o80VHXIbjYqaV51/rn3UtXpqKzf1Wb3yTIZFocMUYqyV1eQsz5W4Z0I5oeQwL9esJ
 ZkyMRjyLaJZbo1M7luzyefShhOCv7v6/2wr5/pDt3+n2eCig0fswcPTQt9/GVosIdMIO
 Niw78Ex7UNBNRUVhXs3su1xT7t946YQmnuuzl4EOZPwF5SvMXAMeSyxJJqGohlCXEfCz
 ACBg==
X-Gm-Message-State: AOAM5327CRMJiAzXYHzM88ix8Z//7PcxFS1Kuf9k2d938tabuTXTQNgz
 zmLXPE4lW3b5FxNuzbMgemuNhc9UL4toyd/CidwVmTTE1mAJ7Fd1cRmsWnxFeUCyIgo/gVFFbcC
 GBgQ3tUJykNjM5I5WKEXAMPGIGSx/1DekAbPlsxH9innA1rhczPxN2HkInyTpFRpa
X-Received: by 2002:aa7:de1a:: with SMTP id h26mr8579046edv.240.1621363143509; 
 Tue, 18 May 2021 11:39:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzewI5q9w4LIUHMUMfEoaVDnvZb3rhKtib+QlWRVX3MXnOn4+YpREw+F3uNlY8D0WfXStwvRg==
X-Received: by 2002:aa7:de1a:: with SMTP id h26mr8579019edv.240.1621363143290; 
 Tue, 18 May 2021 11:39:03 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id by20sm10484219ejc.74.2021.05.18.11.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:39:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 25/25] hw/virtio: Optimize accesses on vring aligned
 pointers
Date: Tue, 18 May 2021 20:36:55 +0200
Message-Id: <20210518183655.1711377-26-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By the virtio spec [*] the vring is aligned, so the 'idx' and 'flag'
fields are also 16-bit aligned. Therefore we can use the load/store
*aligned* API to set the value.

[*] https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html#x1-430008

Reported-by: Bibo Mao <maobibo@loongson.cn>
Inspired-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e02544b2df7..ebee9c4e643 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -296,7 +296,7 @@ static inline uint16_t vring_avail_flags(VirtQueue *vq)
         return 0;
     }
 
-    return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
+    return virtio_lduw_phys_cached_aligned(vq->vdev, &caches->avail, pa);
 }
 
 /* Called within rcu_read_lock().  */
@@ -309,7 +309,8 @@ static inline uint16_t vring_avail_idx(VirtQueue *vq)
         return 0;
     }
 
-    vq->shadow_avail_idx = virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
+    vq->shadow_avail_idx = virtio_lduw_phys_cached_aligned(vq->vdev,
+                                                           &caches->avail, pa);
     return vq->shadow_avail_idx;
 }
 
@@ -359,7 +360,7 @@ static uint16_t vring_used_idx(VirtQueue *vq)
         return 0;
     }
 
-    return virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
+    return virtio_lduw_phys_cached_aligned(vq->vdev, &caches->used, pa);
 }
 
 /* Called within rcu_read_lock().  */
@@ -369,7 +370,7 @@ static inline void vring_used_idx_set(VirtQueue *vq, uint16_t val)
     hwaddr pa = offsetof(VRingUsed, idx);
 
     if (caches) {
-        virtio_stw_phys_cached(vq->vdev, &caches->used, pa, val);
+        virtio_stw_phys_cached_aligned(vq->vdev, &caches->used, pa, val);
         address_space_cache_invalidate(&caches->used, pa, sizeof(val));
     }
 
@@ -388,8 +389,8 @@ static inline void vring_used_flags_set_bit(VirtQueue *vq, int mask)
         return;
     }
 
-    flags = virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
-    virtio_stw_phys_cached(vdev, &caches->used, pa, flags | mask);
+    flags = virtio_lduw_phys_cached_aligned(vq->vdev, &caches->used, pa);
+    virtio_stw_phys_cached_aligned(vdev, &caches->used, pa, flags | mask);
     address_space_cache_invalidate(&caches->used, pa, sizeof(flags));
 }
 
-- 
2.26.3


