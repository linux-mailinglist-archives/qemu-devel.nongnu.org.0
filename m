Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7AB408B1B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:35:19 +0200 (CEST)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlB7-0000eo-PJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbF-0002x9-Bm
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:13 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbE-00066I-05
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:13 -0400
Received: by mail-wm1-x32d.google.com with SMTP id g128so2011174wma.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ybwvFhhB8BrLO2rZlPd30rviyTAUGPZU5FsjXoQhJS4=;
 b=cRXAaKID0KEkmZrPkRFbg7PDKnwjTyPqJatyyV6bscuEshYDBdNROLtWnFr3XHDqdr
 ZCysVA3vpLX6ln57y24aMeN3DGdoVDDkuRfAYyKlwv9upmOHqaHVGPENuMdaYaOkgO9O
 EapdtinU8a9GY/a16I9CHGHSlpocnixMll1h64WqxASPzeAWSp9/oeHyxEyS6bSWVkt2
 0D8zMfM3jJIgsFnDQLhW7urY8Fnn2d+gUbMEr2zmFDoxj/zcVAR2O5XzDx+9uenuWe6b
 kp72fPiB0kwQsucNBj49CpSkEeBRBvNaUBDH33REDGdJUyr52HPehkeAqNZ1lURga/04
 cGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ybwvFhhB8BrLO2rZlPd30rviyTAUGPZU5FsjXoQhJS4=;
 b=bmc2vKle92blNaHnFVJ4ySEOpJ/9WP/v74F2eFe5cS5gsjz3eTHBgY7SUPbW8spgXI
 Pj98BGKHL3RQrrAWjxqviZUVO6rU5bRAvI1o9aBntzwcB6Rryvte/3rX3PH9asN+/fF3
 uREvHPjbbXifOQNBR0nEL4Afcijhi7N56nBTFhLdKzpNFBzz9oetJLLD8ZYme+W1Del1
 6R7HcUeftyVu5az+GMN/+2kmgndUuEzn6Io5FOCxzK2UU5JV243QJx/NbW9KkbF4iwTa
 cviUDTMCa9999j7NuMZYOE4SIs4vyTJYxmVdWdZKYIlb8WLW8hBquxS3NaFg6bNSZ9jJ
 hHJQ==
X-Gm-Message-State: AOAM532tR4rq2wU/ZccTRF7icfc6qLbxews3NzaEbhO/ivUtQ5pw+TY5
 e2LKRd7h7qzaTcFF3cL1X/A+iL6W8+Q=
X-Google-Smtp-Source: ABdhPJzRdKBfxH3FHm2CqlQUJCGK6637/7EdjYuDkiU3mH42tvsZvNsNvcoJhwz4zeok80CXoSHWmQ==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr10730703wmr.157.1631534290711; 
 Mon, 13 Sep 2021 04:58:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/21] Only check CONFIG_NVMM when NEED_CPU_H is defined
Date: Mon, 13 Sep 2021 13:57:40 +0200
Message-Id: <20210913115742.533197-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Reinoud Zandijk <Reinoud@NetBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Reinoud Zandijk <reinoud@NetBSD.org>

Userland targers will otherwise use a poisoned CONFIG_NVMM

Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
Message-Id: <20210718134650.1191-2-reinoud@NetBSD.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/nvmm.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/nvmm.h b/include/sysemu/nvmm.h
index 6d216599b0..833670fccb 100644
--- a/include/sysemu/nvmm.h
+++ b/include/sysemu/nvmm.h
@@ -10,8 +10,7 @@
 #ifndef QEMU_NVMM_H
 #define QEMU_NVMM_H
 
-#include "config-host.h"
-#include "qemu-common.h"
+#ifdef NEED_CPU_H
 
 #ifdef CONFIG_NVMM
 
@@ -23,4 +22,6 @@ int nvmm_enabled(void);
 
 #endif /* CONFIG_NVMM */
 
-#endif /* CONFIG_NVMM */
+#endif /* NEED_CPU_H */
+
+#endif /* QEMU_NVMM_H */
-- 
2.31.1



