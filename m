Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC843FFF52
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:41:29 +0200 (CEST)
Received: from localhost ([::1]:51282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7ZY-0004cz-Jc
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74a-0000du-3Q
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74X-00020H-2N
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0triH/V2nmMAjnP2t96Jm0J8HMx9Dls9aYUNoC2xTc=;
 b=VKEXeGhx8qlYuyTw21/F7tdL9egVYD3Olt3IBKBoTrlevOYCyWRgQC1yUdCfuV6M0aGR80
 XrYEEed3gHR8J1odD0O/NlmIOu1Kb79LMRuEGW0o865E86f8yWvWoKObj1MAZ0yJqYf8u8
 oi5GroRLg2Q4GB34uOWgA6XepfiCg+Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-Q-do4jjVMbKGbjEkTPSTCg-1; Fri, 03 Sep 2021 07:09:23 -0400
X-MC-Unique: Q-do4jjVMbKGbjEkTPSTCg-1
Received: by mail-wr1-f72.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so1459298wrv.16
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n0triH/V2nmMAjnP2t96Jm0J8HMx9Dls9aYUNoC2xTc=;
 b=JwcHPZS9f3u3UvzzzazIdp9MBvdOzpIkMwtwy43xb/r8xaBMUJUeVYWwYapUxXkeiG
 rP0Qn47BoHl8ealYDd3/aWWyDjyKspQlqrYfYJlLC5qo9U7hh+33YZUz0QCQj0dT2AUG
 6p1HubbOoBZbJq7x0ldsBcTv1hwjlrM0ZAfxp71vQAJY2IZWxnYUwkttgJQBk/Psj5mf
 Xd1l40scWhQXIttaUFy8b1GsoaTXN/zgKapZZeQBWyp905734WC2B/ceiEwJrI0KB8f8
 ZemVJqClOHX6H7J7bu4XkZn8+RzcyEAzs1dpwRDWhdeIj+XSmRQp8oWoFL9kM6XHm6+g
 kZ+g==
X-Gm-Message-State: AOAM533ysh0ojNVACyIZPmZ/Zt54tX9rf/CItogG/+g883zN2ntApnht
 hEM5gmuTjCrNhx3Np9tr586RfTEtwtYSCitDtcTJWnOj1CbrcK4xmn1N87+Vno09FIBhYBzNZNS
 qRk5s1TPAmPUPviLBnGlxPpIX9n9C8J6HRWxtf4cPxJyG+DV/dltosi5J8C1wQ4Uc
X-Received: by 2002:a05:6000:34e:: with SMTP id
 e14mr3400077wre.401.1630667361904; 
 Fri, 03 Sep 2021 04:09:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygD1LHKrazXWd2ti6h3NF8Ii1KKU0zYPFqQVcCVwcY1zpr1xnUywyPoJmcGRu+BhfGJLIRwQ==
X-Received: by 2002:a05:6000:34e:: with SMTP id
 e14mr3400010wre.401.1630667361655; 
 Fri, 03 Sep 2021 04:09:21 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 r25sm4622504wra.12.2021.09.03.04.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:09:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/28] tests/qtest: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:58 +0200
Message-Id: <20210903110702.588291-25-philmd@redhat.com>
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
 tests/qtest/libqos/ahci.c   | 6 +++---
 tests/qtest/libqos/qgraph.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
index fba3e7a954e..8ef1bda7c1c 100644
--- a/tests/qtest/libqos/ahci.c
+++ b/tests/qtest/libqos/ahci.c
@@ -639,8 +639,8 @@ void ahci_exec(AHCIQState *ahci, uint8_t port,
     AHCIOpts *opts;
     uint64_t buffer_in;
 
-    opts = g_memdup((opts_in == NULL ? &default_opts : opts_in),
-                    sizeof(AHCIOpts));
+    opts = g_memdup2_qemu((opts_in == NULL ? &default_opts : opts_in),
+                          sizeof(AHCIOpts));
 
     buffer_in = opts->buffer;
 
@@ -860,7 +860,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
     g_assert(!props->ncq || props->lba48);
 
     /* Defaults and book-keeping */
-    cmd->props = g_memdup(props, sizeof(AHCICommandProp));
+    cmd->props = g_memdup2_qemu(props, sizeof(AHCICommandProp));
     cmd->name = command_name;
     cmd->xbytes = props->size;
     cmd->prd_size = 4096;
diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index d1dc4919305..c2e7719bed9 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -93,7 +93,7 @@ static void add_edge(const char *source, const char *dest,
     edge->type = type;
     edge->dest = g_strdup(dest);
     edge->edge_name = g_strdup(opts->edge_name ?: dest);
-    edge->arg = g_memdup(opts->arg, opts->size_arg);
+    edge->arg = g_memdup2_qemu(opts->arg, opts->size_arg);
 
     edge->before_cmd_line =
         opts->before_cmd_line ? g_strconcat(" ", opts->before_cmd_line, NULL) : NULL;
-- 
2.31.1


