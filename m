Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C8240047E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:05:14 +0200 (CEST)
Received: from localhost ([::1]:44344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDYv-0000hM-Oi
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDH4-0000la-6m
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDH0-0001jj-9l
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmgDp5DDf2ZYN3DOZIz+XL4zsyjy3fDEm1GYA+/wcf0=;
 b=f/2WtxnzQxHPB9VgehUVrYWuBr+kCuZLQ+fEjFANEo97R1jE7zAnlvM71ViipoTjVDWnIh
 yW0syCTX6Nf2mkEI0tQEo9MS1FH9+hEI8ZWBd+D/KR8O1eNkBgynBMAhVed0Rs6KuMrmaN
 VmikQNzmS9frryu+77Lb82YQJ2V/m/s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-VsdaVgcyNUujRcrGtd6moA-1; Fri, 03 Sep 2021 13:46:40 -0400
X-MC-Unique: VsdaVgcyNUujRcrGtd6moA-1
Received: by mail-wm1-f71.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so2143644wmc.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bmgDp5DDf2ZYN3DOZIz+XL4zsyjy3fDEm1GYA+/wcf0=;
 b=D/1oDAgHeHOgfXXrx8ujSHLOQb4Qa7q3r9tyqfXH5cYYKm24lyn04GooSe1WHyQZBh
 NzFxyhirfbU4ww1ihBlsXmlTO6I/zp7LbSIllJ+6DSprMT5542YB5YdPQ83eCnvRgW2Y
 SvkQiFOogW7DgYHI42R8BwP+EhXXUS+yMF1PmJPl0DMBC3AvTbcf42a8CqyoD8xvNOrw
 FiRrVr2lmflxtcVcMSVI+xLNA0qz+0q0Pr9WXPFEM2+ta7K6auJtQBRUE7YqwwJdxt70
 o7wqZHfrYv38qtu6s5H0c2D5TLjdZDQyIGUjuTcjpcVjA9azh1PZ3upXIJtYOeH0F8fJ
 rc5A==
X-Gm-Message-State: AOAM530kj4K7d4078mdeNIhfGRQC1tZgBIBpWpAmN5xkGEJFghCpdsWK
 ga8G+dMLoYN1quEx0HLHQKflgBeDGeh/CzXhXsD/NrA4NF9ruir113dc3tDyzqc0UPjtsuj/uGf
 hDXbnCMfwR0Uh96KmoI1ymhl2ba5s25hp/DyhSB0wcSxOL3C540EhKGk6AnB3z9d6
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr279765wrw.324.1630691199330;
 Fri, 03 Sep 2021 10:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+ttKzuPIZq+gni0UYRID0f4YHvdMTp6gk8JaYOj2INPtxFbcJQed34V6fveyYjSwmdgWDmQ==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr279735wrw.324.1630691199158;
 Fri, 03 Sep 2021 10:46:39 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id g138sm30217wmg.34.2021.09.03.10.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/28] hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:58 +0200
Message-Id: <20210903174510.751630-17-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 hw/ppc/spapr_pci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7430bd63142..8e36cffab79 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2201,10 +2201,9 @@ static int spapr_pci_post_load(void *opaque, int version_id)
     int i;
 
     for (i = 0; i < sphb->msi_devs_num; ++i) {
-        key = g_memdup(&sphb->msi_devs[i].key,
-                       sizeof(sphb->msi_devs[i].key));
-        value = g_memdup(&sphb->msi_devs[i].value,
-                         sizeof(sphb->msi_devs[i].value));
+        key = g_memdup2(&sphb->msi_devs[i].key, sizeof(sphb->msi_devs[i].key));
+        value = g_memdup2(&sphb->msi_devs[i].value,
+                          sizeof(sphb->msi_devs[i].value));
         g_hash_table_insert(sphb->msi, key, value);
     }
     g_free(sphb->msi_devs);
-- 
2.31.1


