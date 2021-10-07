Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638F4425A4F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 20:04:25 +0200 (CEST)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXkl-0007o5-Cj
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 14:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYXd5-0004m6-TF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYXd3-0005ak-U8
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633629385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFn0xNqcF4MW7EjeaR5NNHmbJXwfQwjP26b2fQszn/g=;
 b=XcJv8HQ5tt3ZCHicpZrefsIclIqfVCm9lYwB3EtdBdDoXua5Y6u9WrDzL25Xp/Ip/VMOLl
 QdWFufeMJsQSzVP6me5ggM3cpzEffUWsUYYlZA5aSCd7rJcJzCwTuoeCuA9TnZOh9OdSLR
 aBUDAMUcGBDwPn4DGyoPibnzrhJJ+aU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-y69AtVXWN9-YYFvKr99xTQ-1; Thu, 07 Oct 2021 13:56:24 -0400
X-MC-Unique: y69AtVXWN9-YYFvKr99xTQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so5344011wrh.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qFn0xNqcF4MW7EjeaR5NNHmbJXwfQwjP26b2fQszn/g=;
 b=AdqMGrL0kjdvOC8IZSSmF8+dISJ5xpICpzARb2Kqpv8DkobhsAywioH42jSEkUbXwd
 xGo34rOhcYhlC5YPxdauGtiRGaqiovbbaYhkEAH2kmd9v77Ptlcr7oAQ1IsT1fRrT6GG
 HcGJdSJrwLl1BHRBTgnDLcy7ZOJ/IVPcTJapdxgIRWZC7eC1VSavZA0OBAm6V/FEUtRh
 d51w3wxbaNFEct9KuLt3uoAT+bsMS64Cofsm85YU6diKkRRS3NYSHTRx8MVu9cQPPeEL
 dYK+ys2dgp92kQK7gMmua/i9NASJYIxx563EFmilVNV8NctVHIea4L6pXNflD8aQF+nM
 DmNA==
X-Gm-Message-State: AOAM5320SwX+YAuP3lNndgMevJKDgbjsTTF3xfTWcLrdQSa0owa8Rz8E
 OrDraGR/kxMXHpqdeZp8s3D9QvVQ/cvCS90sXLDaqS72c6m8e71KcX8XGSxnmJSbyFj4Eh/+r9H
 XLs1GNDsn4E3TsQJsb5aQg+KdWbfb49buHANgX3++n2g7uMHZNozea62Oy1W0LRqy
X-Received: by 2002:adf:b604:: with SMTP id f4mr7415414wre.111.1633629383019; 
 Thu, 07 Oct 2021 10:56:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsCgOKSOfVA5bYVGnzUD3VFt7UdhAr3owYWMSntVmvv12DVuG8ibbpRXDKOxXWQ9eNoMzd6A==
X-Received: by 2002:adf:b604:: with SMTP id f4mr7415390wre.111.1633629382835; 
 Thu, 07 Oct 2021 10:56:22 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f3sm9051190wmb.12.2021.10.07.10.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:56:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] hw/i386/sgx: Have sgx_epc_get_section() return a boolean
Date: Thu,  7 Oct 2021 19:56:10 +0200
Message-Id: <20211007175612.496366-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007175612.496366-1-philmd@redhat.com>
References: <20211007175612.496366-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/i386/sgx-epc.h | 2 +-
 hw/i386/sgx-stub.c        | 2 +-
 hw/i386/sgx.c             | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 65a68ca753a..a6a65be854f 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -55,7 +55,7 @@ typedef struct SGXEPCState {
     int nr_sections;
 } SGXEPCState;
 
-int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
+bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
 
 static inline uint64_t sgx_epc_above_4g_end(SGXEPCState *sgx_epc)
 {
diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
index 3be9f5ca32c..45c473119ef 100644
--- a/hw/i386/sgx-stub.c
+++ b/hw/i386/sgx-stub.c
@@ -20,7 +20,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     memset(&pcms->sgx_epc, 0, sizeof(SGXEPCState));
 }
 
-int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
+bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
 {
     g_assert_not_reached();
 }
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index e481e9358f1..29724ff8f08 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -115,13 +115,13 @@ SGXInfo *sgx_get_info(Error **errp)
     return info;
 }
 
-int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
+bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     SGXEPCDevice *epc;
 
     if (pcms->sgx_epc.size == 0 || pcms->sgx_epc.nr_sections <= section_nr) {
-        return 1;
+        return true;
     }
 
     epc = pcms->sgx_epc.sections[section_nr];
@@ -129,7 +129,7 @@ int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
     *addr = epc->addr;
     *size = memory_device_get_region_size(MEMORY_DEVICE(epc), &error_fatal);
 
-    return 0;
+    return false;
 }
 
 void pc_machine_init_sgx_epc(PCMachineState *pcms)
-- 
2.31.1


