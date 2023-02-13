Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB58694C5E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:21:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZO-0004bZ-RH; Mon, 13 Feb 2023 11:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZK-0004Yy-LA; Mon, 13 Feb 2023 11:20:42 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZI-0007vf-Ud; Mon, 13 Feb 2023 11:20:42 -0500
Received: by mail-ej1-x62c.google.com with SMTP id sa10so33142022ejc.9;
 Mon, 13 Feb 2023 08:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LA6ZuoQya0s6wnCk3SNGbAuFteCxPNtvbIq0Ce0nCis=;
 b=fpi81r6lO0aPQKZyDnnujb8NR5LjJPehL2ydzeCEWXtwQtHs960vXIgiP1hp2Y9XFk
 6sH9vzDo2xVoWo3tVAKizXECqtTj0kjFwFP0HzkBsk0ioi3sv29w9KL/Mdvxk+M37ng5
 TY2TFRm1ieRZzU5BNCcYMfsbbC/De5zCCoCqzn6eMjVGe1Z/ixf2ty2xFn+pWJDt880N
 smIe2a4kGVX+vVyEbSgVhtngeDQBMLWNYquVNQ30TrtuU9I/NcyLOI77rO4jb4hjaVB+
 NO0cg6YBZQ7EsghMz4HiUmogDsmuKNRRCp4dvEchRqfVEt7a23fcq3BjZ/BHAWZXlHfi
 24tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LA6ZuoQya0s6wnCk3SNGbAuFteCxPNtvbIq0Ce0nCis=;
 b=f+aiSFXfQG7KkW9VNbQCN62Dy8sVpkzbPuLq1ig9eFaz5BuhhgM/YVzkQ5WjNs7A5U
 fgpfbdUXVp3ZgKTRPRymfIvRpcmNcQM/T7fz8oEdve+pTgWWKRZhy5m4TyGJBxS3R0Mq
 L9G09W0DhbA9Ceh3VSv97+QeM++bWrfggFwZo4R786HxCyuRPRa7uElRduSkRgjXvG83
 TN3/JCsTfoKMr7OTdeMgeV9YJOnc2xIXZ1Fxy+OPOA2lC//VouwPmjVFQ6uPh8RhyUmj
 lvullJAe80XbO7obtyd6LrvCgTUoLcJT+zvuXnnko4Npqc0IaqhhEWo+5O/ntIF2Pgz0
 yM6g==
X-Gm-Message-State: AO0yUKVZoyGSF0nU4er61sIGWpTDl+xdqmfeu1CMZV4mZdU5bdxXndon
 CJQmJeRkoDmT9Z4gYp9+33NhkiFb39I=
X-Google-Smtp-Source: AK7set/hsnCwjIv3/vfC4uDnZQaMZzjFmuAE7AUzxF0TMMkX/cd8HPtevVB3J65hL6ldVao3e0pq6g==
X-Received: by 2002:a17:906:3885:b0:884:d5a3:8725 with SMTP id
 q5-20020a170906388500b00884d5a38725mr25596695ejd.55.1676305238901; 
 Mon, 13 Feb 2023 08:20:38 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm6979952ejl.211.2023.02.13.08.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:20:38 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 2/9] hw/pci-host/q35: Inline sysbus_add_io()
Date: Mon, 13 Feb 2023 17:19:57 +0100
Message-Id: <20230213162004.2797-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213162004.2797-1-shentey@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

sysbus_add_io() just wraps memory_region_add_subregion() while also
obscuring where the memory is attached. So use
memory_region_add_subregion() directly and attach it to the existing
memory region s->mch.address_space_io which is set as an alias to
get_system_io() by the q35 machine.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/pci-host/q35.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 26390863d6..fa05844319 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -50,10 +50,12 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
     Q35PCIHost *s = Q35_HOST_DEVICE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
+    memory_region_add_subregion(s->mch.address_space_io,
+                                MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, 4);
 
-    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
+    memory_region_add_subregion(s->mch.address_space_io,
+                                MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
     sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, 4);
 
     /* register q35 0xcf8 port as coalesced pio */
-- 
2.39.1


