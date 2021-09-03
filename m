Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A268D4004AB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:12:09 +0200 (CEST)
Received: from localhost ([::1]:39594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDfb-0000Cp-Ge
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHD-00011v-SR
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHA-0001ti-NB
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzFMsSs1nd+aiUV96h1dpanaGme0JuJTgHaVGdLrH2M=;
 b=EWaxzTNbATESbdFqP75y4riFOexBMt7MlUBiac+n5dFsJjzeVc75RSmM2u3slZ2DjDT4Fj
 KwARGyvxtSrFVHP1m29t99XpxGDdkRZeg7D5M1aTyPCk8b+I3SLjzuKizj5qXcg0o0Mc/9
 I0878V59DeSEDbyyHP/NrYoHyI57rLs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-rRBr7VoWNO24CfxRyGkP7Q-1; Fri, 03 Sep 2021 13:46:51 -0400
X-MC-Unique: rRBr7VoWNO24CfxRyGkP7Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 102-20020adf82ef000000b001576e345169so1816342wrc.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rzFMsSs1nd+aiUV96h1dpanaGme0JuJTgHaVGdLrH2M=;
 b=oq6aBzdIe5COYwdGgpGg5mzGY7qIQ1FpX9ulWTk54cLtZEY9btBs1eV5UKW2FmM3K/
 O3oKNtY1UDeQ6SNuScWLRkKR0Ps8iKbjAuMZlYsW0Ogs0yzGpqIdsmNg5YCrACdHtIE4
 W6ohJ6LWeqIQPI+bCoJAUuM76tbsegq/vyi5ADjTQueG4bmLEyq3imYvRRhARHnpK+vC
 ljmMxjeiChkbhSdvAP5a7WYwu1eGc2/ABT4O4XQSeZbpmtRdZTY+oRjlGGSydCQomvzc
 lHMwuzwMmnEoM9sp/BMzKuMuoD3bB1OxAx63NAG1JAEcH2eaMt6Ami89KUFXw/12N3xV
 OvMQ==
X-Gm-Message-State: AOAM532H4y5LeZ7kiP7e5/j4sh6Pv3zxHyKG0DIY0oTMlBVCwHTX+5W0
 ZnkY5RcfpNcU1oSE3JUyxrOZSavCEERuIAYGvYEbHcMUSsnBEBj3uylbK2s3ceM85LDGVwfbX4D
 fxPoG18fM3UYPRXj61Nv6xFv9ndu5qDjLDl8K9AKBoouYXzzh/hQ6FPVg6FYtIRKR
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr315735wrr.2.1630691209822;
 Fri, 03 Sep 2021 10:46:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUeS2utKm7+sLyvF4dr62IvkjabZJK0eWLwuqoxhDWx0EvBXgWXpAZJZYfs9inrIRcTWvO3g==
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr315703wrr.2.1630691209642;
 Fri, 03 Sep 2021 10:46:49 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id f20sm23207wml.38.2021.09.03.10.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/28] hw/vfio/pci: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:00 +0200
Message-Id: <20210903174510.751630-19-philmd@redhat.com>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 hw/vfio/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8a23b..f7d0ef8cc61 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2040,7 +2040,7 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
      * physical device, we cache the config space to avoid overwriting
      * the original config space when we parse the extended capabilities.
      */
-    config = g_memdup(pdev->config, vdev->config_size);
+    config = g_memdup2(pdev->config, vdev->config_size);
 
     /*
      * Extended capabilities are chained with each pointing to the next, so we
-- 
2.31.1


