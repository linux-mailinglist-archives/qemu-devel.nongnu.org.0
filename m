Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E484004C5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:21:06 +0200 (CEST)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDoH-00055x-Vr
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHt-0001Va-B3
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHq-0002UI-C0
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=it+7i8x5aVGP9xuuZWqfll4PZf3Q881QXfej9qMTW/k=;
 b=Ifpz6SSO8JxLowU6ibb0GQEgWD8BGS1Bth4Ryp0V49wLcP1BuK2bMZTsxQndUMsOTo9Oj6
 BUtq0aJhBUCGhZLJ4G6U1gvTTNxRAqRW/rg9UkivSVRWEnQdKgz6Zd0nvQj5xQpmHSRulc
 PquQXq9/4+dLaDR6cTBXQfLbJElp86k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-E19ZSwr2NcKawKAqz_ipCA-1; Fri, 03 Sep 2021 13:47:32 -0400
X-MC-Unique: E19ZSwr2NcKawKAqz_ipCA-1
Received: by mail-wm1-f71.google.com with SMTP id
 x125-20020a1c3183000000b002e73f079eefso75301wmx.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=it+7i8x5aVGP9xuuZWqfll4PZf3Q881QXfej9qMTW/k=;
 b=aTISgbvdYWiSMt20os/ldJPVoLLn/MmabnJZ8hOpi8mTDaDP6f+YZ7CekjBa+s4gOP
 lupcN2WfDGaUZV03blvxDQfRlnCzgWCyeoiKNzyDjoilvlbWnjCknkdISiXXMt60fTT+
 hFX1h/4wNMceZd6P5lqk+DbYRnc3tR77mGrHbdb0pwC9U2OD0qba99qyz3I673QpHCuu
 pWM79ITO2TIi5Nv4HdAb90mb4teU3gU66Z6SgQr4ZYgZOfbPwvZpYsQdT+JooLXN/9dY
 PVoH2BMQcyltfO+v7OvBIuXWwC0SM9ojnQVFs15EW2AEi8sxXAtw6GBvhEXt1Tp8xEFd
 DH4g==
X-Gm-Message-State: AOAM531/v1XkTd5QaVJ1GgZSdtmW5PysY2UTVHhcB2NTliyTTP3mcErH
 78bFIYx0eHwwwFR+a1oPhJglnHbXDaLLzbnc03lstSMiXkgW3EqvVcw0fw4N5hrHPrm+fF4cy91
 u44KyvgiIf+/D6/2+iJj4r4cl9qRtS9w8CTm+ZS23YFvPCCqdRze/hWWFP00vWT1z
X-Received: by 2002:adf:f450:: with SMTP id f16mr269933wrp.35.1630691250969;
 Fri, 03 Sep 2021 10:47:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybv2eyeSDcUMYEIFCnP06h4rCsw/xM1mfj1o9vEr7ztaug+XnUoBDltoXWUHscUxldqPLKyA==
X-Received: by 2002:adf:f450:: with SMTP id f16mr269892wrp.35.1630691250692;
 Fri, 03 Sep 2021 10:47:30 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id b12sm6141814wrx.72.2021.09.03.10.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:47:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/28] target/ppc: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:08 +0200
Message-Id: <20210903174510.751630-27-philmd@redhat.com>
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
 target/ppc/mmu-hash64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 19832c4b46f..bc6f8748acb 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -1122,7 +1122,7 @@ void ppc_hash64_init(PowerPCCPU *cpu)
         return;
     }
 
-    cpu->hash64_opts = g_memdup(pcc->hash64_opts, sizeof(*cpu->hash64_opts));
+    cpu->hash64_opts = g_memdup2(pcc->hash64_opts, sizeof(*cpu->hash64_opts));
 }
 
 void ppc_hash64_finalize(PowerPCCPU *cpu)
-- 
2.31.1


