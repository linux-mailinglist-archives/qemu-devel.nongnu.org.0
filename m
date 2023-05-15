Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9E8702F23
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:01:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYks-00083I-VB; Mon, 15 May 2023 10:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pyYkn-00082z-Vy
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:00:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pyYkl-0006xr-Sa
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684159242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s4UDkO3Kdy5NCRIXg9Om8yA7mbqwupVdh0F2UuY1x8M=;
 b=RwjIZ2X6BYKf4b9gHPXKvjbCmeui6hCqJbig0dSTYBkLgbuBfvefsAttA5B5VFOEVGbIbL
 DnWoaUbSIWsPSgAwArOlVgBulzOIu5FDBDDiI66HWcFYQZnnUQgXLUb/M4NuU9WGg7/b02
 bLC6WjFJ4jvO2YgWSbmLgxnHjyIw6tM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-V4-WAw0YPImyWmSZf6WvIw-1; Mon, 15 May 2023 10:00:40 -0400
X-MC-Unique: V4-WAw0YPImyWmSZf6WvIw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-969c378d138so826035666b.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684159238; x=1686751238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s4UDkO3Kdy5NCRIXg9Om8yA7mbqwupVdh0F2UuY1x8M=;
 b=OBTJ/cHsHT2Cw8bvej3i8UmdylB1gaFGVndbTMlgGOZ0XtS05hWP5tSOWI56EAxR3r
 PI9753/h5PKWE/v16vpbRB4mbtrKF6dZ7La3JbSzdTujEiNphnxj6RnI63YNA3PsUpCY
 /JKNRk7NDdYPzV1g78GadPHMZUKVmbs6CCLpZTH38pePUCHp5w7YMlJUFRe9o6EyNt+3
 qlABUYT9hn1n6e2YK2Tt4ttjNiDBXE9lTRzwAfchkVINvZFU6OkE67oO/23+ouaI9DEr
 6hZdIjRvpqp76apGyfjUVEfXpF1v2Rj8yknJ0bVjSlDusDfTtXqmxscPnaRzKxNG/OJo
 eH9A==
X-Gm-Message-State: AC+VfDydp1/edrBHp/KaI08OkDc665RXwwoWsksmyHGcAjoxEoQ+UGDL
 l2SLjNp696BbPFCDA1JXAUEQubozVh6hkE1izcp5eI2Ew+AFtdfF0MtgYloplnIQXnqn5blvLf1
 Yg0sER3Hi9HxBdbMF6rhcYVHKDumcBAHF/KmgxhmVMPzl1plnhabROos6qQUNG3vDX0rcCgLOn9
 w=
X-Received: by 2002:a17:907:6e9e:b0:95f:1e0d:8e01 with SMTP id
 sh30-20020a1709076e9e00b0095f1e0d8e01mr39293775ejc.13.1684159238679; 
 Mon, 15 May 2023 07:00:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/4Q8DPdh0b2OboM4stqVNHbodVYzUVURoG1EUry9gKC47pUQg/i7KamxUrX3CLxAV1Kn6mg==
X-Received: by 2002:a17:907:6e9e:b0:95f:1e0d:8e01 with SMTP id
 sh30-20020a1709076e9e00b0095f1e0d8e01mr39293730ejc.13.1684159238241; 
 Mon, 15 May 2023 07:00:38 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a1709073a8300b009666523d52dsm9635403ejc.156.2023.05.15.07.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:00:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH] coverity: the definitive COMPONENTS.md update
Date: Mon, 15 May 2023 16:00:36 +0200
Message-Id: <20230515140036.383046-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The ordering here tries to be logical and matches the one in the
website.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/COMPONENTS.md | 45 +++++++++++++++++++----------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 7c48e0f1d215..883da95aff22 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -24,6 +24,9 @@ hppa
 i386
   ~ (/qemu)?((/include)?/hw/i386/.*|/target/i386/.*|/hw/intc/[^/]*apic[^/]*\.c)
 
+loongarch
+  ~ (/qemu)?((/include)?/hw/(loongarch/.*|.*/loongarch.*)|/target/loongarch/.*)
+
 m68k
   ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*|(/include)?/hw/nubus/.*)
 
@@ -36,11 +39,14 @@ mips
 nios2
   ~ (/qemu)?((/include)?/hw/nios2/.*|/target/nios2/.*)
 
+openrisc
+  ~ (/qemu)?((/include)?/hw/openrisc/.*|/target/openrisc/.*)
+
 ppc
   ~ (/qemu)?((/include)?/hw/ppc/.*|/target/ppc/.*|/hw/pci-host/(uninorth.*|dec.*|prep.*|ppc.*)|/hw/misc/macio/.*|(/include)?/hw/.*/(xics|openpic|spapr).*)
 
 riscv
-  ~ (/qemu)?((/include)?/hw/riscv/.*|/target/riscv/.*)
+  ~ (/qemu)?((/include)?/hw/riscv/.*|/target/riscv/.*|/hw/.*/(riscv_|ibex_|sifive_).*)
 
 rx
   ~ (/qemu)?((/include)?/hw/rx/.*|/target/rx/.*)
@@ -54,12 +60,12 @@ sh4
 sparc
   ~ (/qemu)?((/include)?/hw/sparc(64)?.*|/target/sparc/.*|/hw/.*/grlib.*|/hw/display/cg3.c)
 
-tilegx
-  ~ (/qemu)?(/target/tilegx/.*)
-
 tricore
   ~ (/qemu)?((/include)?/hw/tricore/.*|/target/tricore/.*)
 
+xtensa
+  ~ (/qemu)?((/include)?/hw/xtensa/.*|/target/xtensa/.*)
+
 9pfs
   ~ (/qemu)?(/hw/9pfs/.*|/fsdev/.*)
 
@@ -73,7 +79,7 @@ char
   ~ (/qemu)?(/qemu-char\.c|/include/sysemu/char\.h|(/include)?/hw/char/.*)
 
 crypto
-  ~ (/qemu)?((/include)?/crypto/.*|/hw/.*/crypto.*)
+  ~ (/qemu)?((/include)?/crypto/.*|/hw/.*/.*crypto.*|(/include/sysemu|/backends)/cryptodev.*)
 
 disas
   ~ (/qemu)?((/include)?/disas.*)
@@ -100,7 +106,7 @@ net
   ~ (/qemu)?((/include)?(/hw)?/(net|rdma)/.*)
 
 pci
-  ~ (/qemu)?(/hw/pci.*|/include/hw/pci.*)
+  ~ (/qemu)?(/include)?/hw/(cxl/|pci).*
 
 qemu-ga
   ~ (/qemu)?(/qga/.*)
@@ -108,9 +114,6 @@ qemu-ga
 scsi
   ~ (/qemu)?(/scsi/.*|/hw/scsi/.*|/include/hw/scsi/.*)
 
-tcg
-  ~ (/qemu)?(/accel/tcg/.*|/replay/.*|/(.*/)?softmmu.*)
-
 trace
   ~ (/qemu)?(/.*trace.*\.[ch])
 
@@ -126,9 +129,27 @@ user
 util
   ~ (/qemu)?(/util/.*|/include/qemu/.*)
 
+vfio
+  ~ (/qemu)?(/include)?/hw/vfio/.*
+
+virtio
+  ~ (/qemu)?(/include)?/hw/virtio/.*
+
 xen
   ~ (/qemu)?(.*/xen.*)
 
+hvf
+  ~ (/qemu)?(.*/hvf.*)
+
+kvm
+  ~ (/qemu)?(.*/kvm.*)
+
+tcg
+  ~ (/qemu)?(/accel/tcg|/replay|/tcg)/.*
+
+sysemu
+  ~ (/qemu)?(/softmmu/.*|/accel/.*)
+
 (headers)
   ~ (/qemu)?(/include/.*)
 
@@ -137,9 +158,3 @@ testlibs
 
 tests
   ~ (/qemu)?(/tests/.*)
-
-loongarch
-  ~ (/qemu)?((/include)?/hw/(loongarch/.*|.*/loongarch.*)|/target/loongarch/.*)
-
-riscv
-  ~ (/qemu)?((/include)?/hw/riscv/.*|/target/riscv/.*|/hw/.*/(riscv_|ibex_|sifive_).*)
-- 
2.40.1


