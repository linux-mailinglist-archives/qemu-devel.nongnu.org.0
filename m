Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A065C42DF4B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:40:17 +0200 (CEST)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3mC-0001DG-On
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c5-0003OT-Ke
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:49 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c3-0000Z5-Vk
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:49 -0400
Received: by mail-ed1-x52f.google.com with SMTP id z20so26711290edc.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4r8ruIMiMACId6+oi2EXdJJ3oxJ3e4Hahu0xkzRBXf8=;
 b=XGlD6//24MSwYI7Wy/kGzyVYELQq+UjXljSTaHpvOPsleS/M+XHu2T/wriVDFU6B9S
 F1VLPoV/bWf7hmM43iekFuXBltyPjB81EVsjzuXcgpTUoKctgd5Klh4BlJY8P9pPKnv1
 WZKBl9PZdfxB1RxGUSdXg3JlkVhOd/F0uENiqg89FMmnbeRB1v+uVhWQm+nDVdeKzEQr
 XN5ae63CJGPJA13lwP9s+f0NoSlMDajuPt1RTkGirdaTsROP0L1e9HvRAiTFaGrcU7T1
 vqzedBqoWV2yvba+WsU9Cdj99VGppQHYhVtjHPeG9E/k/dsq18OyfPgqdibMJrCkRcK0
 7GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4r8ruIMiMACId6+oi2EXdJJ3oxJ3e4Hahu0xkzRBXf8=;
 b=p+YVI5SqeLOZYzqh6boX9zzxUDqtXcRMIAtXKTRWYrIR6MNPLEzhZ5aFnGovkvXfRE
 trbqNp/T2ZgGB/WMEOFHBlWNa9DEkxd+Hd+6cQwWip+OSbyXBJ1IIhO7HlSNm0oiyQO9
 4s2AMw3PIGVJuTZKsrtnkobs7ErhEk/AYz6y8pdddB8haMTg/Y7WSER78k6UK8tnjJgV
 MjMHQpJ3eTW8sV96Vu6E/WSs3AkG81IN+4flbgA1vPfxRMNYSZ0yK990KJtjZcssG/Nf
 yPwnSX3/PjR/K001tOhdMDVEEdeMlJxDSJRbU5I98c233IOih6QLyLRmmSmWSRmURryd
 Mkzw==
X-Gm-Message-State: AOAM5306ZHn54S6H3jUMt2ql15FWGveuzs2hXDexssZwq5FpJOPEuLRB
 wFJE//APF8iNATUANvhuib1edxvpOTg=
X-Google-Smtp-Source: ABdhPJxyJEM4lgUrCCQ8A/Kj+jZ2U5mPy0JVDuS+hwRm6K7Xisi33g71LujsF544NnxmPntRhbGpJw==
X-Received: by 2002:a17:907:208c:: with SMTP id
 pv12mr5215497ejb.314.1634228986662; 
 Thu, 14 Oct 2021 09:29:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/26] kconfig: split CONFIG_SPARSE_MEM from fuzzing
Date: Thu, 14 Oct 2021 18:29:18 +0200
Message-Id: <20211014162938.430211-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Alexander Oleinik <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass CONFIG_FUZZ via host_kconfig, and use it to select the
sparse-mem device.

Cc: Alexander Oleinik <alxndr@bu.edu>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20211007130829.632254-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Kconfig.host       | 4 ++++
 hw/mem/Kconfig     | 3 +++
 hw/mem/meson.build | 2 +-
 meson.build        | 1 +
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Kconfig.host b/Kconfig.host
index 24255ef441..60b9c07b5e 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -41,3 +41,7 @@ config PVRDMA
 config MULTIPROCESS_ALLOWED
     bool
     imply MULTIPROCESS
+
+config FUZZ
+    bool
+    select SPARSE_MEM
diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
index 8b19fdc49f..03dbb3c7df 100644
--- a/hw/mem/Kconfig
+++ b/hw/mem/Kconfig
@@ -8,3 +8,6 @@ config MEM_DEVICE
 config NVDIMM
     bool
     select MEM_DEVICE
+
+config SPARSE_MEM
+    bool
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 3c8fdef9f9..82f86d117e 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -6,4 +6,4 @@ mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
 
-softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
+softmmu_ss.add(when: 'CONFIG_SPARSE_MEM', if_true: files('sparse-mem.c'))
diff --git a/meson.build b/meson.build
index 0b9ebf9bfb..4a584760aa 100644
--- a/meson.build
+++ b/meson.build
@@ -1599,6 +1599,7 @@ endif
 
 have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
+  ('CONFIG_FUZZ' in config_host ? ['CONFIG_FUZZ=y'] : []) + \
   ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
   ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
-- 
2.31.1



