Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A542A38D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:43:00 +0200 (CEST)
Received: from localhost ([::1]:33316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGBP-0003lX-KS
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFia-0000DD-7V
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:13 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiY-0007UQ-Ey
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:11 -0400
Received: by mail-ed1-x534.google.com with SMTP id p13so80331276edw.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MRlmiVmXcuYc6Mg34B85p0pvcJ3Zect+95dIoEbvMUQ=;
 b=GQ1w31Ugp9XiIZtWK6GPGigiH+sg597Kjnhb2mjCYP8FVs5mnq5MCFTL3LbU8APZfe
 Hss1eG7hBrx36IOCOZqEiMR+aN0NrkU3ja306xw/lecC9hkyncj9B+7i4mueHGLmXHa7
 7HSiHW0c6+Upd1Nhl3Q44zAF/II2JwvcAPxHmfcEk/CABBmc3j1+1nQOJzhhi4GcvKq/
 T7D44wtsvmGshU/a+dBvq/eIqd8uKnk6kENBORXf9qMW4vXgDOsvYTgIHoptKsUfPDYl
 o/NC+b08DOygyS8zuGy3UdiEq3nUDaioPJu606KA8svy4aDFpPx3afzMiiGBTE4sGi0t
 0QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MRlmiVmXcuYc6Mg34B85p0pvcJ3Zect+95dIoEbvMUQ=;
 b=OpOFUK1X8iTcHsvOHCK3RQ2shxtEsQ9/8FgPD2EHLeFWLZ8MlDHJCM239cOQWWR/Ug
 I+V9XzX4zrbj5DLWVNhlCl+TUqWdLEzUDGaITfHJTgqrbBq2vC+o6S7K5AgcOVb5upkV
 ChVT0dkE1H7ro1WNwwfUDm8afb1Qs07h40nrBRrLlnxSvjgn0+Vehs58QWF+iUYG2+fL
 HheWdCf6p1Hlr9Su9k8sASmQ8bg7vwVvwQo4cAaM+G2dR1mxFE8LAU8ffJwxRLy9jIfI
 KdRdSXyjMS6XEx5VEM6NaZeIkNtPzbXl2b9uhWtrSI6cKvo2BWclcxjJHW/UsCBVKPfS
 hvkQ==
X-Gm-Message-State: AOAM5322AY7xutH9MAhFphtguc0O4CLG4tzl9Hv3dd4HjhZMjVmSuyeS
 bZIHobz8WicYsNjZJ2KlsPplDkNLH4Q=
X-Google-Smtp-Source: ABdhPJyjZ1ZBWwBcqCg/iCImwY6WuAPk0JJELY5Q1h08S9VFLxNI7WxFwbJAx6oCSvTqMFFNI+Gfpg==
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr10028630edb.158.1634037189191; 
 Tue, 12 Oct 2021 04:13:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/24] kconfig: split CONFIG_SPARSE_MEM from fuzzing
Date: Tue, 12 Oct 2021 13:12:44 +0200
Message-Id: <20211012111302.246627-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alexander Oleinik <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass CONFIG_FUZZ via host_kconfig, and use it to select the
sparse-mem device.

Cc: Alexander Oleinik <alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index c0c5b7b9da..5c8a919cfb 100644
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



