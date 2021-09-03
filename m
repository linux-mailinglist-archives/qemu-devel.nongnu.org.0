Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E3E3FFEDB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:19:46 +0200 (CEST)
Received: from localhost ([::1]:51994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7EY-0008Hm-1A
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73m-000763-0w
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73W-00011F-HU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Eu7asELFex4yFplfKK/zMZmk6Z93QlAJxAwuUJzsvI=;
 b=D7Yd4U7f8sAv6wB8Wr8KjQ/bE0P1zo5K/6sTjHGdP54z30+geJkrrOHjg+y4zJWb4uTLiv
 +wqR0+ntlTEbs5FkLmrCXNr4b7YUBm6kZlCKcZA/oGnMOixcyMmrxCdGy8EluCNBZiY+7I
 QPXkv1XUdkm+lrxl2WKTiy3bOR7qaVk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-dF8gWug_PlqDrXfcdfwong-1; Fri, 03 Sep 2021 07:08:21 -0400
X-MC-Unique: dF8gWug_PlqDrXfcdfwong-1
Received: by mail-wm1-f69.google.com with SMTP id
 n16-20020a1c7210000000b002ea2ed60dc6so1719559wmc.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Eu7asELFex4yFplfKK/zMZmk6Z93QlAJxAwuUJzsvI=;
 b=IYnj8ZaFh0MgXX/GOJcW3oCD2rDELe10YsUmgW4ssBlKlnQejk6RRkJ8SGE4e0I3hM
 wHJ0SR4pw3PWHuICuE8oDpg3/F8h2YfQhAJ3OLd59RGZsnhJrmBrGHg6eE3+0FBzIRg7
 /ovZc3eVErp8BOqNjHdG7GCwtkVi5mk4Mv00cGLNCtBeASls2u8T+uNBg1qj9qaZ+pWD
 r2qBBb2/vVstk8S6fu68J1yfklwZNCeb9AlUC46uuSvEiPsj7HWApNtkTeeNnde9WAd7
 j8KeoeU6b08llsuE5e8X9E2+1jbfcYvo+ECUiAKfqCSd0bPXHce9bW3p2ilLIdudiEBn
 wq8A==
X-Gm-Message-State: AOAM531KkvS1/eMDaPEtxn3aXFEq53EDWfeCGxWUnuyTb5WZU1Au5DFS
 RD19Q25f+Y+wzgKOmGAXLszTu+l4HVUKBxpUD7X5BuqaRO/Bpg5dx+viyqBJo6PE3XzmmNMsCfc
 EViWepTNUQEdBhQOmBEK5ZZSdB5xwyWthPj8uEiDJo2S5szgNdt77XlUtIp1IdYyt
X-Received: by 2002:a1c:3102:: with SMTP id x2mr7947491wmx.122.1630667299740; 
 Fri, 03 Sep 2021 04:08:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlUaVFt+tJT5LaJ3kyuGO1VaY8TUngaLwcpu0pipKrSkdlOz7rImuHU2SzJPLLISqxx4e5tQ==
X-Received: by 2002:a1c:3102:: with SMTP id x2mr7947440wmx.122.1630667299523; 
 Fri, 03 Sep 2021 04:08:19 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d7sm4401782wrs.39.2021.09.03.04.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/28] hw/net/eepro100: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:47 +0200
Message-Id: <20210903110702.588291-14-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
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

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/eepro100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 16e95ef9cc9..ed2bc54c052 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1872,7 +1872,7 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 
     qemu_register_reset(nic_reset, s);
 
-    s->vmstate = g_memdup(&vmstate_eepro100, sizeof(vmstate_eepro100));
+    s->vmstate = g_memdup2_qemu(&vmstate_eepro100, sizeof(vmstate_eepro100));
     s->vmstate->name = qemu_get_queue(s->nic)->model;
     vmstate_register(VMSTATE_IF(&pci_dev->qdev), VMSTATE_INSTANCE_ID_ANY,
                      s->vmstate, s);
-- 
2.31.1


