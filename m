Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298213F8D11
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:30:57 +0200 (CEST)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJDM-0003Kf-7b
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJ9m-00065g-Jt
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJ9l-0007RY-27
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629998832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDBZg389G66cuuXg1cBtciC2SPgn2cHOhDyJJyO+H/o=;
 b=hFIT9Z21/C0brBsPFrjPF9B9oteA8KUwxGK6VNC3R7nE0gMK57X8LeXuoILVDzL+ricB03
 T8bSiVwPm0R0oOeoOCQ1cwOgjQ7+qC/QHEpy6AP/5J1ix/o3c8n0xAxCIat/L4nY2eZu6x
 pst5383L3sMXZH4+wqTyEGxorSKNCvw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-e2xJz4alOUCjfOsF6f2zLQ-1; Thu, 26 Aug 2021 13:27:11 -0400
X-MC-Unique: e2xJz4alOUCjfOsF6f2zLQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so1066809wri.17
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDBZg389G66cuuXg1cBtciC2SPgn2cHOhDyJJyO+H/o=;
 b=svYjLJEhr62Qu2Aonje0pAOTjzo76ba3zDAh/s8ddWneC4rYoQ/nmcsas/PeJnHMUO
 i5XSkFfYMGXVW6jEP5aZRu/cvLQ4rbHT2OGkBKbF+ppjaMUWkiQ3BeJy1TVowX29nJRw
 EmOGs1lek8hxowFIYdAT09ZZti8DbN1M++Fq48Bl7Mclc1vSgSzlScDq1NMj88XEt6r7
 AND54C+//jmJ0gZgt6KXBW48UKDI25zuGpFLE438Fn5VkVhZSloRlcFv3x5bhMBC1R46
 T8Eej7BDLSpFs2+AcaDYK9dbQORuB3cgAZUU+gStIDCAlQN1wcDom2gXFqFyMMRuGrrH
 5aDA==
X-Gm-Message-State: AOAM531hiP4TR9d24+clDOBB9/DtaqaTdgIHCvduITJz6WvHdGFv39pi
 QuU3QjkepNMQIif66c1yL6p/3oz73RZpKN+1277mBG4wQKIiKubmtTSNpXlS7umEi7JS67f2b98
 zWe3U4kJvqppnavWrC28WkJIPkk1diDDbiycnyR4N9iHULHDyaVc1eRFB/V1tm/xY
X-Received: by 2002:a7b:c92b:: with SMTP id h11mr4831153wml.62.1629998829541; 
 Thu, 26 Aug 2021 10:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR0d2R747B2ykwsUpswHtUeBjMLaGGar4KOKo5H4tP6yWonqaC+Xx2wx0tbFSZjG34mFrQ7Q==
X-Received: by 2002:a7b:c92b:: with SMTP id h11mr4831127wml.62.1629998829257; 
 Thu, 26 Aug 2021 10:27:09 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 x21sm2244941wmi.15.2021.08.26.10.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:27:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/virtio: Remove NULL check in virtio_free_region_cache()
Date: Thu, 26 Aug 2021 19:26:57 +0200
Message-Id: <20210826172658.2116840-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826172658.2116840-1-philmd@redhat.com>
References: <20210826172658.2116840-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio_free_region_cache() is called within call_rcu(),
always with a non-NULL argument. Ensure new code keep it
that way by replacing the NULL check by an assertion.
Add a comment this function is called within call_rcu().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index a5214bca612..3a1f6c520cb 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -133,12 +133,10 @@ struct VirtQueue
     QLIST_ENTRY(VirtQueue) node;
 };
 
+/* Called within call_rcu().  */
 static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
 {
-    if (!caches) {
-        return;
-    }
-
+    assert(caches != NULL);
     address_space_cache_destroy(&caches->desc);
     address_space_cache_destroy(&caches->avail);
     address_space_cache_destroy(&caches->used);
-- 
2.31.1


