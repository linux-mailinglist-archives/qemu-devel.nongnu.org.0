Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D734037F3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:36:01 +0200 (CEST)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuvw-0002Iu-5s
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS2-0006ue-J3
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:08 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRx-0003BR-Tu
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:05 -0400
Received: by mail-wr1-x429.google.com with SMTP id t18so2485996wrb.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlR1D4KQkZZwbyWUBGj/wMkLtBYfhmaSXWEyYmVKf6s=;
 b=gJIkYG1xIzv3y0cZRaZSnjJyGDHu2SnPdnTjQaPTuf/ODBtgfIuVIN0RcJdUjehpeS
 zOhTElxL0/0E5SRGLOCbZzoWDLAbBSZ8UNhtqyJ8NjJ+jdpVu3PASWv+C8+Q9nXMhQiu
 ahGbOL1nOZyis6MSfzdBb476w4rHifu2/jkm2tRgpQ8wBBws+FI6eTe7KUld0Ghoa8IS
 sPPZiHbxmHAvWXIObvQkQnZ41bJ4kclS6eArCFEbVOBxeaKWLcOV26fwd44YDgQyEvNB
 YJKHGQTZAAIzXp+xGH7CogYY0umyVSKME4kg7kcAT9mU0gMC3tDTAWmskVVFf7jJm5g8
 Ziiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SlR1D4KQkZZwbyWUBGj/wMkLtBYfhmaSXWEyYmVKf6s=;
 b=kwSP5jJV69/AyivVVx8xVaa2SCUSYI4bkLsMYmmVbmtPn6PddgVMOzGEOhoEtQaJQt
 DJHtfUF2jj3s+L4lf1yHC4zmT6QGx6Gm8eN/9OGWxTD50L8Ksg10PU5TVMnQjopZOGY4
 Ner1if7euFisiPsL1OKIGRXluZaQ/72ZwRMry4u6pJdkXS87SEcken3lWfD6rnW3b9xJ
 9J1Hzy/3OIfImyNuQdC3iU0/HSyt5FVyJKNEJrAgoJjUkysCShEbpi5yhiU6o6PHko6k
 p8bXiFeTiFq8VP2sPn3rT8T4d9g6YtKUxm/9EJKqxVppX+YA3dW2rpuV9umKpfBLoYD+
 w7xw==
X-Gm-Message-State: AOAM532UE59GwA2vj3Rewm44qjWaZxNaogt1QmjBHPcmjd0tUpfZXz5l
 rf1V6TH7hAbQe4o1zgMwJsYC4KMUQdI=
X-Google-Smtp-Source: ABdhPJxYIoM3x8/9pehl+nfiSAHoyQ8hXAvrrawVIAazTcR07zFW+VoeQOH7JwrQbLQ51a6QWJD8fQ==
X-Received: by 2002:a5d:51c7:: with SMTP id n7mr2989892wrv.217.1631095500599; 
 Wed, 08 Sep 2021 03:05:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:05:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 34/43] hostmem-epc: Make prealloc consistent with qemu
 cmdline during reset
Date: Wed,  8 Sep 2021 12:04:17 +0200
Message-Id: <20210908100426.264356-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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



