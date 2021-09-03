Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6786400486
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:07:32 +0200 (CEST)
Received: from localhost ([::1]:50190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDb9-0004kT-Vn
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHX-0001Kc-E4
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHV-0002CH-E3
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1D5rERJEHNGMGGp+1t4xLb9P3Gyvmnka2+4rie4dvUA=;
 b=F8e5Y4v0O/4vGo3Gg+vjCHieMmcLsY5dBAYjv/PYdpnEivwBizTH5R+LNyUxhrpMfqdoU0
 wDNIRmcIS6BUX521fZqy793IBe5YgiHkRjKssCM1B4bmLp/MZ30GsodGOTBx0pT0tdm7xW
 VAVDsdjwle/JgKgpYkXqPySveOcNAp0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-7EbkpVAbNoSo6RyTiLLjfQ-1; Fri, 03 Sep 2021 13:47:12 -0400
X-MC-Unique: 7EbkpVAbNoSo6RyTiLLjfQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso1802291wrn.19
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1D5rERJEHNGMGGp+1t4xLb9P3Gyvmnka2+4rie4dvUA=;
 b=nABf/IUT8OxdfkFDkziX1PT3KDxRzvHymlpft0Qtz1qccKQMaXSZpsOtmlbeTqD4t+
 TmQl29GjuezX+LZFNKDFjrgItU4nBxLbgWQEeK3kTeV063nQiNBgfp+OKrUGR9b/LI8v
 aTwsqr7ZvMZzj23zL7HcLYjntRgOfD5pCxFklzCIjCL8E+UQWh8t2waby4EesmU43kE0
 DuSMaH4bCiM3kDOBaJBkVuiadqsnCIP4m4N5Bt3A5dMxNq/PXpjGiX9yKRaiwdJAQCO6
 9oFToOkfUjvj68P7hNW+iaLkvPDgtxMlFx8v6c9tLwplnxZbFPc3lNOJGb4UOtOlqj9B
 za7w==
X-Gm-Message-State: AOAM5337SDgOKFtn58EGyesHyn1lhNRneBsnC8OtzPUshYKaiSqbrDWp
 83DiRzwWjrtoKCleH+0x65ghLZTiSqLjG8ZS2qWjweSMQvuOGG8XWA6qA5THJHULxretmd+pAuY
 l/SNLxiXQW63eMyI82HBZw1lgywwdPvFeRmfspVLbSB/a9fJObr/ii6qq0qdgsZrM
X-Received: by 2002:a1c:91:: with SMTP id 139mr42817wma.116.1630691230575;
 Fri, 03 Sep 2021 10:47:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJJYv71G+zPp4R3Pb5U4pxnt7BGxZ5OmK6RHqxGPfGkQtJikx/HJs13cZRgL0t1NZzNuz5+w==
X-Received: by 2002:a1c:91:: with SMTP id 139mr42779wma.116.1630691230386;
 Fri, 03 Sep 2021 10:47:10 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d24sm25941wmb.35.2021.09.03.10.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:47:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 22/28] linux-user: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:04 +0200
Message-Id: <20210903174510.751630-23-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
do_open_by_handle_at() doesn't check:

    size + sizeof(struct file_handle) < 4GiB
---
 linux-user/syscall.c | 2 +-
 linux-user/uaccess.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2df..d3701007cb3 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7665,7 +7665,7 @@ static abi_long do_open_by_handle_at(abi_long mount_fd, abi_long handle,
         return -TARGET_EFAULT;
     }
 
-    fh = g_memdup(target_fh, total_size);
+    fh = g_memdup2(target_fh, total_size);
     fh->handle_bytes = size;
     fh->handle_type = tswap32(target_fh->handle_type);
 
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 6a5b029607c..49eddbf4a4d 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -15,7 +15,7 @@ void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy)
     host_addr = g2h_untagged(guest_addr);
 #ifdef DEBUG_REMAP
     if (copy) {
-        host_addr = g_memdup(host_addr, len);
+        host_addr = g_memdup2(host_addr, len);
     } else {
         host_addr = g_malloc0(len);
     }
-- 
2.31.1


