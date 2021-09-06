Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3DC401C46
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:28:44 +0200 (CEST)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEfz-0000vh-2b
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPn-00022I-HX
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPl-00082x-JS
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id q14so9814871wrp.3
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlR1D4KQkZZwbyWUBGj/wMkLtBYfhmaSXWEyYmVKf6s=;
 b=o2lFGMLjPWcJfQVNDe2JAQcghcCefmjaEXZDDyclqrvUZbPMq9nBRPG3769w/1MFZF
 q6nobxSv4YLI6EgzIhh+0q4N+kWvWrMwlUPHLxVn5s+Yco9il32SIpCkWwI2MvlaBC6q
 aZ8sXqNQuIKJHxtItCaZTwK3htX8JyppgQeBOADtSqiW7YE6RnXxQ9I7xRK7b0U6JAVG
 SDx3WFbJ46FTf+3SueNrNg41Gzaze8qUJFPv1Bw+zkolRV7nOWNKYT7YhJlTQl3NpRyq
 +vBKaHzSZDdhj1tKgErMBl12fQ/Ja8SDpoBqWqMTiLo3pypKDucSbWvi7q8PpWfTfgb6
 owGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SlR1D4KQkZZwbyWUBGj/wMkLtBYfhmaSXWEyYmVKf6s=;
 b=PAFB2BtvgHZ6RkjG/nQpzg7vIEheiyCDEMTFYYT8zOdYB3NKzx6kfo1UELPzTxDZ6+
 HitTTxPwwlF3mxJkBYG+MDJj+nDQpAiwdNJP81SNDgJAi0EHr80cEyrK/aYDX8hRK62D
 o4nOLJtcbtWVfrHrWQ7GSirMneYas7pStFpsiq1F74c0jHeP14wM4e8tpyYkNlbWfanO
 cCNTuHUpdyDKyQ5VdMus/AfypGb64XkhPuuRukCNPxW9GUzfpUGBUp3oZUzrKXWTiwJV
 bjae6zR7/Nk6nN7bOm9jxSWJ3b2xpw4jLZvuKScP9UuDzchHZv7PAS2l68Xn+9cfoLn9
 h4hQ==
X-Gm-Message-State: AOAM530y/yeKf4XaOO7gIUNqubi7Itgz/0U2BwKmIaeaCcn8Hq67E83l
 4/7drWbm03tNiHVwJWD21zVgkcACH4U=
X-Google-Smtp-Source: ABdhPJyGUS1CTlWkZy8V4bPYQr4dUTkxWS7TWFcGzGxUzyxicV9F/zaTIkxaVQMXrMc3KuFArITT9A==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr13622511wrm.429.1630933916336; 
 Mon, 06 Sep 2021 06:11:56 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/36] hostmem-epc: Make prealloc consistent with qemu cmdline
 during reset
Date: Mon,  6 Sep 2021 15:10:56 +0200
Message-Id: <20210906131059.55234-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

If qemu cmdline set the prealloc property for sgx epc and VM do the
reset the prealloc property will be different with cmdline settings.
This patch can make sure same prealloc property setting with cmdline.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-26-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/hostmem-epc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index 3bd1535d82..9836358841 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -60,6 +60,8 @@ void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
                               Error **errp)
 {
     MemoryRegion *mr = &backend->mr;
+    void *ptr;
+    uint64_t sz;
 
     mr->enabled = false;
 
@@ -69,6 +71,14 @@ void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
     }
 
     sgx_epc_backend_memory_alloc(backend, errp);
+
+    ptr = memory_region_get_ram_ptr(&backend->mr);
+    sz = memory_region_size(&backend->mr);
+
+    if (backend->prealloc) {
+        os_mem_prealloc(memory_region_get_fd(&backend->mr), ptr, sz,
+                        backend->prealloc_threads, errp);
+    }
 }
 
 static void sgx_epc_backend_instance_init(Object *obj)
-- 
2.31.1



