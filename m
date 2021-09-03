Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B072340047A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:03:13 +0200 (CEST)
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDWy-0005IW-Oc
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGm-0000Az-Oc
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGk-0001Wq-TS
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lubK1L7hm9+FJXOL2oDyFlScplW+khcKViFJMmufcU=;
 b=ZL+6px4G8lKzIc6a54g09cKBpPuNFTp4Ez7FxEeOGPiQMx5kdbXzHUfHT5UcMY4TGTdNEa
 sOqJogTMbm8OFAVPNxrqYCVx6YoqjEzkDGJHjuyc9Oy8dENrTAAU/RurBqhUlWQ2k7EtEn
 ubMv9iu34TX6gDZgkifFhAb7WEz6jlk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-3B8A3xOIM4ywdxmTCdmSzw-1; Fri, 03 Sep 2021 13:46:25 -0400
X-MC-Unique: 3B8A3xOIM4ywdxmTCdmSzw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q14-20020a5d574e000000b00157b0978ddeso1819489wrw.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lubK1L7hm9+FJXOL2oDyFlScplW+khcKViFJMmufcU=;
 b=cR8S2+qzUZSUfYPoiiDtcnuxqjGvSN27CkzwWrAY1CX7kJjUbIm7PH9m/R5WxZnQnl
 jctaNvw4f52guDqdBUQv1mxA7OqWAmbw4YVOZBSpaXtE65ro7vVWAdRUvx25KJqtlvj7
 uKEaS34S9zGORLzFuT90nsvXV8obyqeu9zdVqv2u0+qKVzHDoIFsUDFbZgu3yjSoijEB
 pIZX1kA19iLcQsKcO+Wqzf3Btdc675hqQHOmsu89rq5jAaBX/EyLCQo2EEApPOz1MoEH
 +Wm0ux1nrKwTExdCmvsIpiAuMXuSZqqN/VcxiCmwT/PPQgW++HBPlrK0nPSQOlivYQgX
 6ooQ==
X-Gm-Message-State: AOAM533WYlm4hPgMx75siWXOfEoA2Cg0FVwBIBbYNaee0C3dwWtOTxyj
 lF0XKuVOwjdFgh8MaN6mlTe5jppS6Hf/F6OBhO51DXclXaD1L2qREWtnwEcCACru0GnQq9VSK+X
 dScKRnEiM+wqvNGuSo4qmViZ7UZV2stC1OXJy+46ExB+Zt2vKX5lKPJ1yNO4uicEm
X-Received: by 2002:a05:600c:1c91:: with SMTP id
 k17mr44535wms.84.1630691183855; 
 Fri, 03 Sep 2021 10:46:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7efRsKiaGHm4B8cGDCNnjrYmsWc2OJkxfNG6okEx1O5HHSjlY3xT/vlyw0IawdBf4LktvPA==
X-Received: by 2002:a05:600c:1c91:: with SMTP id
 k17mr44498wms.84.1630691183579; 
 Fri, 03 Sep 2021 10:46:23 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id v21sm5588100wra.92.2021.09.03.10.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/28] hw/net/eepro100: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:55 +0200
Message-Id: <20210903174510.751630-14-philmd@redhat.com>
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
 hw/net/eepro100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 16e95ef9cc9..a4e67f69752 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1872,7 +1872,7 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 
     qemu_register_reset(nic_reset, s);
 
-    s->vmstate = g_memdup(&vmstate_eepro100, sizeof(vmstate_eepro100));
+    s->vmstate = g_memdup2(&vmstate_eepro100, sizeof(vmstate_eepro100));
     s->vmstate->name = qemu_get_queue(s->nic)->model;
     vmstate_register(VMSTATE_IF(&pci_dev->qdev), VMSTATE_INSTANCE_ID_ANY,
                      s->vmstate, s);
-- 
2.31.1


