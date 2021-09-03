Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD333FFEC4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:13:16 +0200 (CEST)
Received: from localhost ([::1]:38808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM78F-0007hC-HT
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72w-0005U6-GA
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72t-0000R4-0E
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vyN09QcPG+VDBDsPFQVE2hfeE/VYAwQywY+WfYVVI7k=;
 b=fZqZNun+zNtXeoksX6tHw8kpKKGJuqvfH/m/uATVizBNPydrSfBdyVvByR3FX/2kkfh6sT
 avNpxln1ai9+mE3iOtMt05FKbpcDPVWv4j13wSNn8rmzoU+TGf51iF7opc+2YO06G57cP6
 02LdDM8dNlgHj0AVy/BrCHAMjJt4DD4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-iDuKfvsVPriCZ4FLvHR_tw-1; Fri, 03 Sep 2021 07:07:41 -0400
X-MC-Unique: iDuKfvsVPriCZ4FLvHR_tw-1
Received: by mail-wm1-f70.google.com with SMTP id
 x125-20020a1c3183000000b002e73f079eefso2541721wmx.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyN09QcPG+VDBDsPFQVE2hfeE/VYAwQywY+WfYVVI7k=;
 b=dXw/Tvx4ECsx3pXXbI2MhCKr7ehkTKvHcAgzh5bBiSVGI3p/f80icKOiFbLhrc072S
 8p7YoyOE7fyaLWXlcBdIRWAZYsvZf0MAtSrLrBaf6f1LThPZ+xEFIPiOXvTJ/S12o6qK
 p+ci/iWRqrG0qbY0Zk3V9Hh3rHXG7cflEmYpbSxVC8lTHuGEhW7N6l+G8rDj+gi7Llx6
 OT6a/TaRpzgtwMHK0sN/0Mha2oJiMI5e2qZ2lkSnFNvUwR4gIdDQakBCaD2B41U8n59n
 1sxTMcyWjoo3zhxhOZj3qCPVu2OLACt5yhrww2y9p5UBlfd2LVdycUZztmse9IN+/r5C
 HP8g==
X-Gm-Message-State: AOAM5310XD0UOEQQ5Im6Im/PJFYCo8fPsfEun3jb0Ds60W+r/XQHbCVA
 gJW0eeuR7ORD3xaHxRQ6GHDc+BbvlgrxVQ+6IsXcxuTK5MXn0tNHGkZYUJM1NsdqnXCoFeS8ifp
 ZxJcutA6na64YzO8CIBxIGckGp0d2TedCbY1557UbZyAVICJDZcyzqeUg2RryPalI
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr3584634wrm.198.1630667259977; 
 Fri, 03 Sep 2021 04:07:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTXAcCGMILiN6BBKbtvJurMFFvfI5fIWlIBSfIhCVNo+ciUFdo+9M1Slhc1REyU+6QphSpBA==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr3584577wrm.198.1630667259732; 
 Fri, 03 Sep 2021 04:07:39 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f3sm3966844wmj.28.2021.09.03.04.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:07:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/28] softmmu: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:40 +0200
Message-Id: <20210903110702.588291-7-philmd@redhat.com>
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
 softmmu/memory.c | 2 +-
 softmmu/vl.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4df..838a274b627 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1140,7 +1140,7 @@ static char *memory_region_escape_name(const char *name)
         bytes += memory_region_need_escape(*p) ? 4 : 1;
     }
     if (bytes == p - name) {
-       return g_memdup(name, bytes + 1);
+        return g_memdup2_qemu(name, bytes + 1);
     }
 
     escaped = g_malloc(bytes + 1);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea05bb39c50..a136ef0bfb6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1154,7 +1154,7 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
     }
     if (nonempty_str(str)) {
         size = strlen(str); /* NUL terminator NOT included in fw_cfg blob */
-        buf = g_memdup(str, size);
+        buf = g_memdup2_qemu(str, size);
     } else if (nonempty_str(gen_id)) {
         if (!fw_cfg_add_from_generator(fw_cfg, name, gen_id, errp)) {
             return -1;
-- 
2.31.1


