Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30FD3FFF20
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:25:42 +0200 (CEST)
Received: from localhost ([::1]:41932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7KI-0003lz-04
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74j-0000t6-W2
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74i-00026V-45
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGLIaIG1oc/f/hK8LLmc1ZCw3aRo0zL/iFOeAMJ8CLs=;
 b=Qky2GCJAuUP8ghHUYVQd6jR4K6hnU6vn1qZ6GzzY7rMOE3J06M+ZUhPqWzRRff4nuKBXJG
 t5kd5xhWULM0G8j94RwWQoIfVaycj/mD3GiqzCeayUdpwG8wde4XRwm4hjuF6rcZAGZyyC
 AvMJpdAsKbqW+1vGAhxEDy9gmUPmeZQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-02f3_0d8OF2X6zxxFkRkzw-1; Fri, 03 Sep 2021 07:09:34 -0400
X-MC-Unique: 02f3_0d8OF2X6zxxFkRkzw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h15-20020adff18f000000b001574654fbc2so1461184wro.10
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IGLIaIG1oc/f/hK8LLmc1ZCw3aRo0zL/iFOeAMJ8CLs=;
 b=TSbth/HsNEfX1ow0wyMggXa+98eJo26xlYHiByR/29Fmz0kCSaQb+3yQ5fFHqnBpmG
 SykQwiq2UNExcoG9cxUOU9kfxPmB9erzCFy8dG79JqwNSed7LnmS1u1PYxBVyqfkqKtj
 upUdwXBIqSHC0REIxuwH0Rr0L+IuH+UAtALbBVQV0jkRK5N9b6wEHaeE6YEoHwkO4BvC
 t/OFwpQwDoQ3V/IoFtFoXe/Evifg1wanaXGwhSEy4CAg54h4EOBkou0Mk+RYZWylWeZb
 fhP2My+cQJZRj6CYPiwmU1ViWkSa88BG50OfNcRVtbqmQOZQck/Iw8TGmKYcUPWZF7KZ
 DJdw==
X-Gm-Message-State: AOAM5339wuWl+LJ9lxyMKbjTLhpYorq/pwR6MiZ5/a186DMq2JlBqjG8
 5JZMbZWv58gKR8h457Y/neuAqQNOb8ghrE2QsRCnGIjJbf+e7qz89qccR8UmRqCTioTyBBPnQxE
 zSUGaQYK3NM3uo+PAGOtIfV0IOF074kbFE4l43PLua7Q7fQCmOMVeBbg9/hl8HL9m
X-Received: by 2002:adf:fd51:: with SMTP id h17mr3315355wrs.178.1630667372995; 
 Fri, 03 Sep 2021 04:09:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOCmSQ+xc0Q2SgMJRIjaynE2wUiaPQJusQW9eaFrqniAzajXkn5CbXrHEgNUg6VJYO5+nq6Q==
X-Received: by 2002:adf:fd51:: with SMTP id h17mr3315291wrs.178.1630667372803; 
 Fri, 03 Sep 2021 04:09:32 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z19sm4806706wma.0.2021.09.03.04.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:09:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/28] target/ppc: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:07:00 +0200
Message-Id: <20210903110702.588291-27-philmd@redhat.com>
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
 target/ppc/mmu-hash64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 19832c4b46f..2ee6025a406 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -1122,7 +1122,8 @@ void ppc_hash64_init(PowerPCCPU *cpu)
         return;
     }
 
-    cpu->hash64_opts = g_memdup(pcc->hash64_opts, sizeof(*cpu->hash64_opts));
+    cpu->hash64_opts = g_memdup2_qemu(pcc->hash64_opts,
+                                      sizeof(*cpu->hash64_opts));
 }
 
 void ppc_hash64_finalize(PowerPCCPU *cpu)
-- 
2.31.1


