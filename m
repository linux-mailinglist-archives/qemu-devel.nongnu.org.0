Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0450D42BBA4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:31:37 +0200 (CEST)
Received: from localhost ([::1]:48620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maabo-0005xf-VC
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEw-0002bj-S7
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:00 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:41961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEs-0005xA-Nx
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:58 -0400
Received: by mail-ed1-x52f.google.com with SMTP id a25so7236798edx.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yk4kcyQ2A5Yj4updooA55fCsiBi5b3aUbtCd8WI+3P0=;
 b=d2iQkwsjOxRVOvwfFPqCtYXwEtaLru1lW2i3p04fHOPnLy+M22hTQLbDIj7bnaQC+7
 go/c6OywzFA7mDGeQvtIWtvKOiSeKsMSVc2/z7YVGXeHrh+PMT4+8PDtV1i6S6cNzjGd
 c1IHJpkSq8dBvNcyCcBdL8Q89wYaXddZYER+bJF5bVtjDUYIH+276OWUZRcVMGrrqHh+
 KlTaUMZyV9rxnjydR1mLKqRSa5MG1MlbfRjToeQ9WKbMxUsYbNawqMSeLbc2TMelme+v
 5Rb4ZUwZ51CC03ncSLWXMy0uBs4wioDzJFAZbD5yDnY3TmrF9K8gPl0RaWXiYu5JiXho
 sQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yk4kcyQ2A5Yj4updooA55fCsiBi5b3aUbtCd8WI+3P0=;
 b=pP87Hb4aPtHLiZg28UxCg6giEj/IH9sRfOKP8QCFgd4z0SyxryPHQRbqNsEiLP8yov
 9AW9bjtNXEv3xnJyOEipM8aAfX430QGofbhHT5xFiHfwobGuII04XSeB6wqmZjC7aZxs
 /g4hk3/S5Q8Gz0rQRLDx/JdAC6ERUOX6hVpAPIMwZk9Dosvr19snzMFH+QCnMN/DxhH8
 khb6669o99UgfxLDint6Igp8tONIebeM56bx7JWaKIKNya6ltuodrX7WerRL8xiI2ikk
 JwmfyKVTJunpHYrg44U3qW4HiQ/0Com7uC7gRpGOsR8DqPynB0tqskftm7KiG1vgkNTm
 Fjlw==
X-Gm-Message-State: AOAM531KALBPKG0HPKLihYQ8MKJbHFyV9jzEG8czR3tMbOXfOZobkgUJ
 Wumfk4vwL79XbzkWdERnsq3HfQUJsec=
X-Google-Smtp-Source: ABdhPJyEwch15Yd2dB1DL8CyDPZs7QTZxvgbyEGHW3vw2VB+uUeKH81R1rAyR8ajtGzzUL5pYWWWtg==
X-Received: by 2002:a50:fc8e:: with SMTP id f14mr7821561edq.87.1634116073366; 
 Wed, 13 Oct 2021 02:07:53 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/40] hw/i386/sgx: Move qmp_query_sgx_capabilities() to
 hw/i386/sgx.c
Date: Wed, 13 Oct 2021 11:07:22 +0200
Message-Id: <20211013090728.309365-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Move qmp_query_sgx_capabilities() from target/i386/monitor.c to
hw/i386/sgx.c, removing the sgx_get_capabilities() indirection.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007175612.496366-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-stub.c    | 4 +++-
 hw/i386/sgx.c         | 3 ++-
 include/hw/i386/sgx.h | 1 -
 target/i386/monitor.c | 5 -----
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
index 45c473119e..3749656db1 100644
--- a/hw/i386/sgx-stub.c
+++ b/hw/i386/sgx-stub.c
@@ -2,6 +2,8 @@
 #include "hw/i386/pc.h"
 #include "hw/i386/sgx-epc.h"
 #include "hw/i386/sgx.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-misc-target.h"
 
 SGXInfo *sgx_get_info(Error **errp)
 {
@@ -9,7 +11,7 @@ SGXInfo *sgx_get_info(Error **errp)
     return NULL;
 }
 
-SGXInfo *sgx_get_capabilities(Error **errp)
+SGXInfo *qmp_query_sgx_capabilities(Error **errp)
 {
     error_setg(errp, "SGX support is not compiled in");
     return NULL;
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 29724ff8f0..713f136343 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -16,6 +16,7 @@
 #include "hw/mem/memory-device.h"
 #include "monitor/qdev.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-misc-target.h"
 #include "exec/address-spaces.h"
 #include "hw/i386/sgx.h"
 #include "sysemu/hw_accel.h"
@@ -57,7 +58,7 @@ static uint64_t sgx_calc_host_epc_section_size(void)
     return size;
 }
 
-SGXInfo *sgx_get_capabilities(Error **errp)
+SGXInfo *qmp_query_sgx_capabilities(Error **errp)
 {
     SGXInfo *info = NULL;
     uint32_t eax, ebx, ecx, edx;
diff --git a/include/hw/i386/sgx.h b/include/hw/i386/sgx.h
index 16fc25725c..2bf90b3f4f 100644
--- a/include/hw/i386/sgx.h
+++ b/include/hw/i386/sgx.h
@@ -7,6 +7,5 @@
 #include "qapi/qapi-types-misc-target.h"
 
 SGXInfo *sgx_get_info(Error **errp);
-SGXInfo *sgx_get_capabilities(Error **errp);
 
 #endif
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 680d282591..84fba47f19 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -700,8 +700,3 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
     monitor_printf(mon, "size: %" PRIu64 "\n",
                    info->section_size);
 }
-
-SGXInfo *qmp_query_sgx_capabilities(Error **errp)
-{
-    return sgx_get_capabilities(errp);
-}
-- 
2.31.1



