Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0B64004A9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:12:04 +0200 (CEST)
Received: from localhost ([::1]:39210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDfX-0008P4-KN
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHk-0001P1-10
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHh-0002LB-6q
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfBgU8tXBhRtj+0DsLha9N1gD6ohGgwq/9K/iXISLUs=;
 b=NkOypPddGVL624tO6W65wIrMl/rmTmUViikmVCHHPvWXdbbohm0Sp9+w3uos3V1z+QRcMq
 ZgPqZqFEuQL2+FKuBPe2qXCoyphQ9+pSEHQVioRasvPqQJPipd/mSkzf9GqUi29BJvHdrm
 qKja2RikYKl146ajP/QwF5kU8yF+HrY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-2hD8PajvMCun3l7ygiFc4g-1; Fri, 03 Sep 2021 13:47:22 -0400
X-MC-Unique: 2hD8PajvMCun3l7ygiFc4g-1
Received: by mail-wm1-f71.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so2142464wmp.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HfBgU8tXBhRtj+0DsLha9N1gD6ohGgwq/9K/iXISLUs=;
 b=FAxg+C8uMvp4MtKyoDlE6tmfQRpuHJBam6ebhXfbb/uLHz9W71xQ1adAi1sNtOFkD8
 5P8VAdLwFJo1zg75z+zXsEer0UUbwiniAfotH/tosnW3WjeNhDko3sOne/fQAinQFZGQ
 jlnLBFSbWs/lh67+VuGLRtCbSMSm2tiub63chKLklQZPnAjrBIsxCvPs/mei3kZLK0bk
 AbILnI+vh/7OE1AI7rBmTyAtANNgj2fQLxlsg1TJhPfN6ey5nmbOU+Z3K6bBl7UbzFei
 bt4CeRvmhycrZZNXwZZxAgkEifsyBulmBK3cbp/YIy5TCbgR8ApjT4wx8mjfk+hcX/bZ
 sXWw==
X-Gm-Message-State: AOAM531nzEovK1Jt/Zs1D3DVpqU46tx7bcvFSciSqYXCtFIwBtOcfu/B
 IYUto7W1EVZncCPEx3LhkzZbeWzDDSnhNsSpnRB5vpEJfFC6btU/Zs5y3LD+TwbJ4qmPtGX0YFa
 TSZBAxHF/2cUdovYuq0o2cz8bHNPUQrhUKHS4QRSOMbANdWW+9sdlVH1XwqiuH/6M
X-Received: by 2002:a1c:202:: with SMTP id 2mr41005wmc.122.1630691240998;
 Fri, 03 Sep 2021 10:47:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMs/PNrg4oydY+FJfacdcvMKH3UGlm4Oxp7CQHpTUjCRFpxUEYkzL86VHtd72hJ35d4steCQ==
X-Received: by 2002:a1c:202:: with SMTP id 2mr40964wmc.122.1630691240736;
 Fri, 03 Sep 2021 10:47:20 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id b4sm5373991wrp.33.2021.09.03.10.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:47:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/28] tests/qtest: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:06 +0200
Message-Id: <20210903174510.751630-25-philmd@redhat.com>
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
 tests/qtest/libqos/ahci.c   | 6 +++---
 tests/qtest/libqos/qgraph.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
index fba3e7a954e..eaa2096512e 100644
--- a/tests/qtest/libqos/ahci.c
+++ b/tests/qtest/libqos/ahci.c
@@ -639,8 +639,8 @@ void ahci_exec(AHCIQState *ahci, uint8_t port,
     AHCIOpts *opts;
     uint64_t buffer_in;
 
-    opts = g_memdup((opts_in == NULL ? &default_opts : opts_in),
-                    sizeof(AHCIOpts));
+    opts = g_memdup2((opts_in == NULL ? &default_opts : opts_in),
+                     sizeof(AHCIOpts));
 
     buffer_in = opts->buffer;
 
@@ -860,7 +860,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
     g_assert(!props->ncq || props->lba48);
 
     /* Defaults and book-keeping */
-    cmd->props = g_memdup(props, sizeof(AHCICommandProp));
+    cmd->props = g_memdup2(props, sizeof(AHCICommandProp));
     cmd->name = command_name;
     cmd->xbytes = props->size;
     cmd->prd_size = 4096;
diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index d1dc4919305..109ff04e1e8 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -93,7 +93,7 @@ static void add_edge(const char *source, const char *dest,
     edge->type = type;
     edge->dest = g_strdup(dest);
     edge->edge_name = g_strdup(opts->edge_name ?: dest);
-    edge->arg = g_memdup(opts->arg, opts->size_arg);
+    edge->arg = g_memdup2(opts->arg, opts->size_arg);
 
     edge->before_cmd_line =
         opts->before_cmd_line ? g_strconcat(" ", opts->before_cmd_line, NULL) : NULL;
-- 
2.31.1


