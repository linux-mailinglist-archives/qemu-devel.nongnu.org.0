Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB73A4253ED
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:22:01 +0200 (CEST)
Received: from localhost ([::1]:57548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTLU-0000L3-Ef
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8c-0005TU-1C
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:42 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8Y-0007mz-TT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:41 -0400
Received: by mail-ed1-x52e.google.com with SMTP id i20so7295407edj.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sVXcDCgvpoipTSD644966o8P2yiX+3lqStOLYb7lTDY=;
 b=pwnl+YVxc69x9BIxvWHfBWluMvlnvdDfuXTw8NEpwIDOFAhRvi1V0QOrBcZNCDSHo0
 lDW4m2tYOsZS0k4eQ8JFnhYyKXg+3sS0sS5MetIUCTE+9ysbfkCnlMFlB2+pO+v+41KD
 qDM3UENvnPJbtCnUsJYp+knv/PIx+wRuPf/ofLVukbnbMT3l5SVWTTsywUbfzS+HJRkO
 GJ9VjBeM9/wNjraTntLHh8Bt+ycrZwIb/Cn0nuvDc+hEygosm3Xole5nqO/IgpKgeIqy
 j+iravB+HtEMkUqqeX0AzVnw5HeOC4lkk5UA2ZaMwwrp/WMNdsdbrf08y8FYqStWemC6
 sj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sVXcDCgvpoipTSD644966o8P2yiX+3lqStOLYb7lTDY=;
 b=kzeOlFOz8GWXCKQ/IiKPldlA8OgVDmRsqngvq/dwV1eiztEPY5L2u70xyGXMnQVwlq
 Ux1XRD/UWWS/Ox8fj3ukClniuOlWJ20wVMAYue/5izd/iJR73IXsuk+IoT3LMvdMn87F
 GUACLkJ/Gjpmx2b9ErGkEyCeK/9hAB4yblcQmjYrEptUbRiNgtGCoO5Ux78sYP0CUlhK
 r4rqbXQzqZm5qJzyKDz3oBNXS3cFRIUWdjhCFokKPHBQ95t0G586Dfl28h+Bbg6UA/dd
 BcwriV5uk7Xv2kQFcdt9qJEyOjr1LvissWue8cEqPbhZKKPntYn0sE05E4Fkk1rZYRjr
 RLLg==
X-Gm-Message-State: AOAM532cGw0PFE3cewQA4x4zTywyLE1KU+9IPIT963/rM8EHgutPUQwq
 F2HSCyVkmV6IlLZnrAvzOHSYBtZflls=
X-Google-Smtp-Source: ABdhPJy4AYq/gUd/4W9R9CvHi2WKETs2nEODnBLHz2RnNV2SVqq6KeNSqb3FZbYTgLzuc92qHGlJpw==
X-Received: by 2002:a17:906:7847:: with SMTP id
 p7mr5249475ejm.335.1633612110872; 
 Thu, 07 Oct 2021 06:08:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/24] kconfig: split CONFIG_SPARSE_MEM from fuzzing
Date: Thu,  7 Oct 2021 15:08:11 +0200
Message-Id: <20211007130829.632254-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Alexander Oleinik <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass CONFIG_FUZZ via host_kconfig, and use it to select the
sparse-mem device.

Cc: Alexander Oleinik <alxndr@bu.edu>
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
index 0e9733a833..f03bfff7a1 100644
--- a/meson.build
+++ b/meson.build
@@ -1602,6 +1602,7 @@ endif
 
 have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
+  ('CONFIG_FUZZ' in config_host ? ['CONFIG_FUZZ=y'] : []) + \
   ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
   ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
-- 
2.31.1



