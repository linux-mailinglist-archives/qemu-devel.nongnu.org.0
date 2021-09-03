Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DD340046B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:58:30 +0200 (CEST)
Received: from localhost ([::1]:53862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDSP-00055B-Ih
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGF-0007tY-HT
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGC-0000yV-PL
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YNHli5WAUQfrv0OkZqAsB5uiM9Te0pWSHkWdm+hWGxw=;
 b=Q7sUmmfyrVNPYXJzZ3QVpgCaZwceGRKxu/hlfGt3xOz8ZL3jNrbW6KKoVXnUU3dZHA9Zm8
 hJUyoS4QGsFs1FRTclQ4DHziEpw3MTP9uu29b4rr8y+8s9wjN7c4iA1iAyGNHxDqlyPYZ2
 2nwtMp4W+dGkdxQ3BxqOgWLdPYUVOJo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-zJcHrhPZPsCriNFbsbjXSQ-1; Fri, 03 Sep 2021 13:45:51 -0400
X-MC-Unique: zJcHrhPZPsCriNFbsbjXSQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f17-20020a05600c155100b002f05f30ff03so56806wmg.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YNHli5WAUQfrv0OkZqAsB5uiM9Te0pWSHkWdm+hWGxw=;
 b=sThVopuq1S4IyeGVkuzOPMbX3A6ZQdJCrGGCrHgrnA+UQS6nQr/dg1HaMFAjfIBp85
 0Kfh0PR4TIW2MdNYNcRBtqrMaYUby3DIuqFbeT3nk+zrkmzyCvF4f+yEMiKh9jGhgPU5
 OtAOobLo/us+Xipaj4yNEfHSEqWV3cezBL+VFHSalYsT65JHQHCVp2kL0kuZo5vRselP
 ul/9rIc858gu7S2azSIhaZbPn/ioKxiDXWCmlwNe3Y7CCG34rm58pjzQErnNh3rwMBnW
 eGFKhO3nKfE2c7yRwHGxD6LzNFZkItuO+Ymlywg2m4JmvbQT40BuIYLcl2IzgZJjtGXH
 FY4w==
X-Gm-Message-State: AOAM532w6S44INWgld6YL8pTYMt5ForouWVPUfbN+qkp0ToULzBA/GkT
 h1dR9TCCgGPOOrmFED2Xv/mYicJCvftmKJ1Z+2W+jbPtCjmtVDYWgS6KObpRExNxo1GLIr4K/j7
 Er+8sjWBS87yHsnof/wYhqUJFPFYbDHMrlUBrFMDKsqWTwdeaQszN9hn7MniozHpJ
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr4860wmj.181.1630691149714;
 Fri, 03 Sep 2021 10:45:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6dMuRfFSb91XjZJBaqh19j7JloMfPCOEUTi+KosVOBTNd3SX6rgsgwQZY/JW1/Js37jcXsA==
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr4807wmj.181.1630691149340;
 Fri, 03 Sep 2021 10:45:49 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id w9sm32748wmc.19.2021.09.03.10.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:45:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/28] hw/9pfs: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:49 +0200
Message-Id: <20210903174510.751630-8-philmd@redhat.com>
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
 hw/9pfs/9p-synth.c | 2 +-
 hw/9pfs/9p.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index b38088e0664..d6168c653d2 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -497,7 +497,7 @@ static int synth_name_to_path(FsContext *ctx, V9fsPath *dir_path,
 out:
     /* Copy the node pointer to fid */
     g_free(target->data);
-    target->data = g_memdup(&node, sizeof(void *));
+    target->data = g_memdup2(&node, sizeof(void *));
     target->size = sizeof(void *);
     return 0;
 }
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index c857b313213..a80166fcaff 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -202,7 +202,7 @@ void v9fs_path_copy(V9fsPath *dst, const V9fsPath *src)
 {
     v9fs_path_free(dst);
     dst->size = src->size;
-    dst->data = g_memdup(src->data, src->size);
+    dst->data = g_memdup2(src->data, src->size);
 }
 
 int v9fs_name_to_path(V9fsState *s, V9fsPath *dirpath,
-- 
2.31.1


