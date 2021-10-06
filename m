Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADFA4243B2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:09:56 +0200 (CEST)
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAQU-0001S7-BO
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYAOo-0000UB-Ct
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYAOl-0002qt-8E
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633540086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CFbVGe9eX9tRB5LbQy+xdlj6wpfh1SEhjkhLlewRII0=;
 b=FVU7VAaJWcMs/P+csJ0BAMJFfa3UzWH+rkp6q6+9VXOXE0jQxFIVJIs4omF+1PbS8cHYnS
 67xC4eG9moYjeb+9R6EG/nnxGxhon9+gv06WLW5SBzPlRU72uyS5zPvWPhNf+t9DVo3StU
 Vnvk0EXE+omOyHcmjOOvkq+X9sx1Jz8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-4TZG7Kt4OEGwF6yD0gCJ_Q-1; Wed, 06 Oct 2021 13:08:04 -0400
X-MC-Unique: 4TZG7Kt4OEGwF6yD0gCJ_Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso2598137wrc.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CFbVGe9eX9tRB5LbQy+xdlj6wpfh1SEhjkhLlewRII0=;
 b=LYqiHNmMvssW3LJR6fejvvzEsQNfDpn80xosb5kBIXS7Lj5SJPCacposH56DbT2w9Y
 vdXoplguxzl8MiI77jysHcwj43lmcUjRu2eHGRQsHPJydsg4rE1v2kk2xaM+E03finnW
 9zb8f6InaXJWXgOTh82j5W9iXcPCaIqTz8gfYsBQ+rv+H1li5zf+iiPsvPfRzYAq7PZy
 z/ToSKw5lb7VlP1K3HAHLR7IQWdMrnBBtp8K53fQ5ftn4PwL6FP2x6UCUjOO3zigQ5b4
 1eBhEmvUfkAaupI8Pf/B6uTz3fdttk65Slt0LEYf5ZPecqJo/lsXXZKBknZOojKpaKud
 9Qhg==
X-Gm-Message-State: AOAM533roDC+h/Ff1oRIlKiK4E1w20P1Xea+bF/gcLERHv/ixLVTd7Ip
 vfIC7q6hZwmPM+1at0aOCUF0mJnz7Q22DQfz7Ctocrbcbk4k+Er5ZnSWCtxXOU8uucPbCVbEbzk
 zpJwbfC0ySGHkQ8nlSkGW+odx84LiJJLVmv6Puy47N4YLPVQklHGTxfEAJVPsN9Ea
X-Received: by 2002:adf:ab43:: with SMTP id r3mr13264134wrc.225.1633540083139; 
 Wed, 06 Oct 2021 10:08:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Q10+JOVNjEOOYI+G6nmefa/nbweUHz65hVSQwcQSjJRnaLN2zwSSIYFWBRyUF2qzXpW2Zg==
X-Received: by 2002:adf:ab43:: with SMTP id r3mr13264096wrc.225.1633540082843; 
 Wed, 06 Oct 2021 10:08:02 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o12sm7164868wms.15.2021.10.06.10.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:08:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/ppc/spapr_softmmu: Reduce include list
Date: Wed,  6 Oct 2021 19:08:01 +0200
Message-Id: <20211006170801.178023-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 962104f0448 ("hw/ppc: moved hcalls that depend on softmmu")
introduced a lot of unnecessary #include directives. Remove them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/spapr_softmmu.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
index 6c6b86dd3c6..f8924270eff 100644
--- a/hw/ppc/spapr_softmmu.c
+++ b/hw/ppc/spapr_softmmu.c
@@ -1,25 +1,10 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
-#include "qapi/error.h"
-#include "sysemu/hw_accel.h"
-#include "sysemu/runstate.h"
-#include "qemu/log.h"
-#include "qemu/main-loop.h"
-#include "qemu/module.h"
-#include "qemu/error-report.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
 #include "helper_regs.h"
 #include "hw/ppc/spapr.h"
-#include "hw/ppc/spapr_cpu_core.h"
 #include "mmu-hash64.h"
-#include "cpu-models.h"
-#include "trace.h"
-#include "kvm_ppc.h"
-#include "hw/ppc/fdt.h"
-#include "hw/ppc/spapr_ovec.h"
 #include "mmu-book3s-v3.h"
-#include "hw/mem/memory-device.h"
 
 static inline bool valid_ptex(PowerPCCPU *cpu, target_ulong ptex)
 {
-- 
2.31.1


