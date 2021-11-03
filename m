Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3627C444477
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:15:55 +0100 (CET)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHzW-00068h-B5
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHos-0003Dd-Fx
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:55 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHop-0000Pm-Rq
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:54 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso2115692wmf.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oal98zD2Ir0qFzB3ikWmCThICKS9U3UwIlUa/SE6Qjk=;
 b=JEwYyBGM1y4YANs7IVENPfrlgAZnGcHvqNoPFYdg5AQOyWssYQp4E9yBZwNY4u3PMr
 OREEIS1Be89HXGfZcjQQZxJYFhXcPsjDOEl4S+TRoA46gonyrryIzvovenDvOr02Q0sG
 XHTs37vqSs+/RnZVPZdfBb3FwIN+kdqYUlnkgk6IkqJqf5gSrPuxGKHPiGfW83fwgzuh
 yLTEfWz8ywjOrhYvzMUCjIuOB6wfs0xQc6bXfeYfAijk+HnZimFeNH/bow6zY9+JNVAH
 rmHcvnhZCsAPOmlT4a2SfBwbgOAGBK4NM6K8K4EZ4s2vM7TqaWH4SkVRZBxHRRDtJk8+
 7NFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oal98zD2Ir0qFzB3ikWmCThICKS9U3UwIlUa/SE6Qjk=;
 b=2ZIcpkJ1i/LTWHbPXPILpLEXPJtLVsTufiJL54ofvQmpg5QyinlZu4iO/VkhpAw6I6
 QLrGszk2mosejivYSZb7EgX8pMRevPcMiUy1FOmEw8u184rkUXYs6Y2+S2R8amx3QDgB
 QKv+M/qH64K9uUiBRR6VwZWNtZ+JOTc0TPNio/XAFjWnsHc2Ln7ibLkFMhDvdqRtCVSP
 vTaf310XQQo1FxbGoBWIu+br9MheABCgDB3SbW2ic9o2qXarl0D8MBfNgPRDmRMJ1lNk
 8V1F24VdX2iJYKAm8sSYjNrTasxn23BoH/5U46fefFFyF0uW1ER9Ct+z3vOUgzyKZTa9
 IffA==
X-Gm-Message-State: AOAM532oYH2vd2rVBHs36gp9/pR3jhsZP7NUw3O3QAVnonw9H3PiBqeb
 tKr3yKHdd1M6m1FGHXnArsprlWM3ftg=
X-Google-Smtp-Source: ABdhPJzB2sU0ZY5tBf4d2FoR88u3SIa65h9ZP6m/OXMwxeCDHLOBl6K7WCZYq/ARlLPMiAi3TWapfw==
X-Received: by 2002:a05:600c:22c7:: with SMTP id
 7mr15583957wmg.58.1635951890163; 
 Wed, 03 Nov 2021 08:04:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/27] configure/optionrom: Fix MSYS2 multiboot.bin issue
Date: Wed,  3 Nov 2021 16:04:19 +0100
Message-Id: <20211103150442.387121-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Helge Konetzka <hk@zapateado.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Konetzka <hk@zapateado.de>

This patch enables native builds on MSYS2 with symlinks disabled.

Signed-off-by: Helge Konetzka <hk@zapateado.de>
Message-Id: <2b5ab039-8495-b55f-03f1-ecfd996907a9@zapateado.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                  | 4 ++++
 pc-bios/optionrom/Makefile | 5 ++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 07cb7b412a..03162008aa 100755
--- a/configure
+++ b/configure
@@ -3963,6 +3963,10 @@ for rom in seabios; do
     echo "RANLIB=$ranlib" >> $config_mak
 done
 
+config_mak=pc-bios/optionrom/config.mak
+echo "# Automatically generated by configure - do not modify" > $config_mak
+echo "TOPSRC_DIR=$source_path" >> $config_mak
+
 if test "$skip_meson" = no; then
   cross="config-meson.cross.new"
   meson_quote() {
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 30771f8d17..3482508a86 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -1,6 +1,5 @@
-CURRENT_MAKEFILE := $(realpath $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
-SRC_DIR := $(dir $(CURRENT_MAKEFILE))
-TOPSRC_DIR := $(SRC_DIR)/../..
+include config.mak
+SRC_DIR := $(TOPSRC_DIR)/pc-bios/optionrom
 VPATH = $(SRC_DIR)
 
 all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
-- 
2.31.1



