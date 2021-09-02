Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A33FF1DE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:55:44 +0200 (CEST)
Received: from localhost ([::1]:40024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLq07-0001TN-UB
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvX-0001v0-DJ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvV-0000PU-PS
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630601457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfztDw0T+IxqiSXV2YqDwUKK0y6/AeZln0/z1gPaV7s=;
 b=SO/TRkzX4zfm+LHbj6So0EjAAQF96/MqXl4jXMXmdt4LiC3MPX6eN28XaZDNReZpIzghf4
 Z8SwDOF21Lti7U/6XOXiaDSWv060yheovdr4yxv8VVV+d/1tcFpm6izFbupIjcMNZp0ZD8
 OumJAhgKrT/xazbqd6KfcBD9xJBsv94=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-DWnRze0hOEWp_9ED-Ys6ZQ-1; Thu, 02 Sep 2021 12:50:56 -0400
X-MC-Unique: DWnRze0hOEWp_9ED-Ys6ZQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 102-20020adf82ef000000b001576e345169so753095wrc.7
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 09:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZfztDw0T+IxqiSXV2YqDwUKK0y6/AeZln0/z1gPaV7s=;
 b=d9iuk6JrqM5cvE2kVx4noSQ6xs2uM9J4ULlmzhBM5ups7/vXN6c6WJF17/4Snrpx3G
 NAj90TEzMYFFaI4O4fVMuL/e2qWna6sg770JzZcNxJRojb0TRvxIlN7KTmZ9hniO3mjO
 Cm1jmsFNirYzXVVeINr03KXNMHv3ym0lxRHVNLeJSwjYmWy9uUVPcDvUaZVspKcoisg8
 cTfOWx4GCcdz9lh/IDpZyY2KbH28Jp44xxbiazYOSFkTGZUlxnEZBafvid90C82tO5UW
 GQnqpuES3p4ihtU43zOt4cMuL/3hOlw3tuQFD2ZyDXga42+aL1mT6IbUb44xnTGklIm+
 i4jg==
X-Gm-Message-State: AOAM533a19Uy5NbOUXYMJqdGE1rWzNr3k1NlXxvbOSAoN5nwaEn6OZDW
 Np1cujdZ7lH/y/B9GTxBXzCF/L2XGF2ItfTLGsyHZlpDiCLhHTcHGFiCy3ioCUexIIXEwVnIhkI
 dYmKJJpm/OZqa0ChelB9LsKqFLmbFnB7Xvz+h3EP0hS53omnRvzIJbuE8KaezTQ95
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr4206766wmz.98.1630601454803; 
 Thu, 02 Sep 2021 09:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzd3LRNbsJqd5qvimCtL2xxLJh/vNZ6XFLyopyhIFapV8NKMbi7jX4inkmwlQeFGpGDgL0Zg==
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr4206730wmz.98.1630601454395; 
 Thu, 02 Sep 2021 09:50:54 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 a12sm2207407wmm.42.2021.09.02.09.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:50:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] hw/virtio: Remove NULL check in
 virtio_free_region_cache()
Date: Thu,  2 Sep 2021 18:50:37 +0200
Message-Id: <20210902165039.432786-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902165039.432786-1-philmd@redhat.com>
References: <20210902165039.432786-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio_free_region_cache() is called within call_rcu(),
always with a non-NULL argument. Ensure new code keep it
that way by replacing the NULL check by an assertion.
Add a comment this function is called within call_rcu().

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Worth mentioning the left-over from c611c76417f?
("virtio: add MemoryListener to cache ring translations")
---
 hw/virtio/virtio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b37344bb5e1..97f60017466 100644
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


