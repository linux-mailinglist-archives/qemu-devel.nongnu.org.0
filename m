Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665BE388016
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:58:42 +0200 (CEST)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4vR-0002qs-GY
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cS-0003QZ-3T
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cP-0000Qj-Sq
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5bc/fLR7X3lBPxXh2gaq/EPG/Hnjmqk5I/R/ixg5NU=;
 b=PlO9uBcsdRqtdJBJkSj6wPWW5ybaOsaqyvYgu7UQ3kuOhDK60vl2Vku/FL96dnNok3Q9yy
 QBHKp29PMwEVz3Zq8C0KUw75IihqsqxKAZVHxpH8OET0zFJ2MGOWyBzZ0n8P0iEUzdJyIm
 Nu+PuGjrsIVsy2kqRIB7GPbieNuHphw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-kYtk7CS7NqyU2F-JIuJbsA-1; Tue, 18 May 2021 14:38:59 -0400
X-MC-Unique: kYtk7CS7NqyU2F-JIuJbsA-1
Received: by mail-ej1-f72.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so877357ejc.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F5bc/fLR7X3lBPxXh2gaq/EPG/Hnjmqk5I/R/ixg5NU=;
 b=PwOJZTWzPVyv8Fg9VboiKZa13wfxRRF8wwBZZVb0xm+iYrf/31v20nUAbEH8ld0AdD
 3BBdgqReVJBx9mi41fJdspHicfG9BpvuOPb7pbdLdHzkNKRg+SGq3GG3k0v6kXWDb+63
 AWOxvdI+a1mWNtyTACNmZsx8GKgil5wsLnS1v/MfsldOCHdT40Zl2e5gViJKkBu78rtB
 CDVua3tOJ8fN8Xb+Rxr/ZErttmgS8LF8ee16afV850fVCucnNVVknReKsbFC0D702M9K
 +FFDNNDXFJOF6NKsMygul2ji/vdVBqnEkjOr7vzMVz0naXFUVDcTf3OVhqHyu1yI+qct
 M5MA==
X-Gm-Message-State: AOAM532tkSZlcV55Ftt0qkK+oJ7sIs62I29hFD7xEwqeKO54GALrSjqG
 hZFXCFlWrmQAekGTJX7QKTXf9IdPrlloDaJsfu1DOGwjoPR4DFEP/+OGirBAA7V48SuWkAJSz+R
 AyPRv14QSPjKinOWR2+vif9KK5pclf7y9YRNN6aVKg4vSx+yrvqxBoB3qI4RgywMA
X-Received: by 2002:a17:906:a84e:: with SMTP id
 dx14mr7342977ejb.220.1621363138429; 
 Tue, 18 May 2021 11:38:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUTZdzy85UcK5H0rImGDWfRk2nVcwF4b1HLgbSJFPlecoiwU8vAYSzL/WE4QBrgOza/mkmiQ==
X-Received: by 2002:a17:906:a84e:: with SMTP id
 dx14mr7342949ejb.220.1621363138172; 
 Tue, 18 May 2021 11:38:58 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id e6sm1738171ejd.31.2021.05.18.11.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 24/25] hw/virtio: Add methods for aligned pointer access
Date: Tue, 18 May 2021 20:36:54 +0200
Message-Id: <20210518183655.1711377-25-philmd@redhat.com>
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

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio-access.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index ae66bbd74f9..5b20f004e12 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -66,6 +66,16 @@ static inline rtype virtio_ld ## size ## _phys_cached(VirtIODevice *vdev,\
         return ld ## size ## _be_phys_cached(cache, pa);\
     }\
     return ld ## size ## _le_phys_cached(cache, pa);\
+}\
+static inline rtype virtio_ld ## size ## _phys_cached_aligned(\
+                                                      VirtIODevice *vdev,\
+                                                      MemoryRegionCache *cache,\
+                                                      hwaddr pa)\
+{\
+    if (virtio_access_is_big_endian(vdev)) {\
+        return ld ## size ## _be_phys_cached_aligned(cache, pa);\
+    }\
+    return ld ## size ## _le_phys_cached_aligned(cache, pa);\
 }
 
 #define VIRTIO_ST_CONVERT(size, vtype)\
@@ -98,6 +108,17 @@ static inline void virtio_st ## size ## _phys_cached(VirtIODevice *vdev,\
     } else {\
         st ## size ## _le_phys_cached(cache, pa, value);\
     }\
+}\
+static inline void virtio_st ## size ## _phys_cached_aligned(\
+                                                     VirtIODevice *vdev,\
+                                                     MemoryRegionCache *cache,\
+                                                     hwaddr pa, vtype value)\
+{\
+    if (virtio_access_is_big_endian(vdev)) {\
+        st ## size ## _be_phys_cached_aligned(cache, pa, value);\
+    } else {\
+        st ## size ## _le_phys_cached_aligned(cache, pa, value);\
+    }\
 }
 
 #define VIRTIO_LDST_CONVERT(size, rtype, vtype)\
-- 
2.26.3


