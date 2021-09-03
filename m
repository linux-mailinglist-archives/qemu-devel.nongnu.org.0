Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E923FFEF2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:21:49 +0200 (CEST)
Received: from localhost ([::1]:56960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7GW-0003R5-8H
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73q-0007K3-A4
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73n-0001Pd-KQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EzShw/2xTdEPPWeNVs4kSs4t7kGgMmp/B6AgbgiX3Ec=;
 b=jEfAYhgDvqjHnyQH1ge2icy6Ap1XH5HgSIVGQeidbmEu7+IYiQJ0ujB/8C+Wm7GLW41CKT
 kkRE2HSRjz3Ast5s+5f929NAv1CiXpxMBjP86glLKBV91Iznxfy3JOeOH5v+3eRXHw3Qbb
 1pa99PFhSQUYHyklNg4FkUZJwrap5e0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-Kr3mjOFAMmSLFJSJJ6MxnQ-1; Fri, 03 Sep 2021 07:08:37 -0400
X-MC-Unique: Kr3mjOFAMmSLFJSJJ6MxnQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so1766907wme.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EzShw/2xTdEPPWeNVs4kSs4t7kGgMmp/B6AgbgiX3Ec=;
 b=NLy7W9+3xj1iP7gMtN/NXVwnqyWVzBSFcNBuboJqvpuVPppWnihJZ49sATzdDx4GFn
 rYC37MmcL0TxMBYt+Yhy8xCr8ZRbg7Gmo2jYf0pAazr6VAylTHZG9lo0Db7dHeiJaRD1
 c5KtXYdJ/aqCj5P0ZIVk52svfykMRqEzv6gS5OLHskMYdJYIkR95Qja3ndi+5h/ZXTSH
 V92iQ5tvvtZ0IGaHZsYqaytOlFVkzu5mY7Qc18NX/FV46Ymahs5MwSsP8797cBb3BFlx
 VdWI17T6YIdoC7DpOyVJwNI7M3ZnnAmvdHyDtrVMgULIuaDwtcI+LlzNtzhcEcfhUU1I
 WxaA==
X-Gm-Message-State: AOAM531cEuoivIGIDEBmKV+2xMTOTFCVxI41VANqKla2V33q9xwHneh0
 6aUQc7Q31cuKtjd6qF3th6qZ/gUtQW0SWon8FYepRvI7I/G5SeTr1MElHdqwZ0y+p8YlkY+/1Qg
 f5HmMlh6AbgD0ofq9rY4iN+VoHqEOsZQpM9TXujFCg526HhqzTo1MS0XK3cy/mO3D
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr3395779wrw.333.1630667316348; 
 Fri, 03 Sep 2021 04:08:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr0apXucGqUcpjJT9otdfT31A80MSNUrFt2Om2OTvUQfQWLMSjkVr2uNK1Wh00u5HzgpymFw==
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr3395724wrw.333.1630667316143; 
 Fri, 03 Sep 2021 04:08:36 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 s1sm4548992wrs.53.2021.09.03.04.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/28] hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:50 +0200
Message-Id: <20210903110702.588291-17-philmd@redhat.com>
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
 hw/ppc/spapr_pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7430bd63142..79c0e8d4f98 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2201,10 +2201,10 @@ static int spapr_pci_post_load(void *opaque, int version_id)
     int i;
 
     for (i = 0; i < sphb->msi_devs_num; ++i) {
-        key = g_memdup(&sphb->msi_devs[i].key,
-                       sizeof(sphb->msi_devs[i].key));
-        value = g_memdup(&sphb->msi_devs[i].value,
-                         sizeof(sphb->msi_devs[i].value));
+        key = g_memdup2_qemu(&sphb->msi_devs[i].key,
+                             sizeof(sphb->msi_devs[i].key));
+        value = g_memdup2_qemu(&sphb->msi_devs[i].value,
+                               sizeof(sphb->msi_devs[i].value));
         g_hash_table_insert(sphb->msi, key, value);
     }
     g_free(sphb->msi_devs);
-- 
2.31.1


