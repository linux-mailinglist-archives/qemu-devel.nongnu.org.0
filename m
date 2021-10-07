Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B268425A5D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 20:07:36 +0200 (CEST)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXno-0004L3-Ei
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 14:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYXdA-00052b-GI
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYXd8-0005et-O3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633629389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fgw+iLF03hU/h1yPH0+fm9VyX2b04jOBSqyKLGZY2M=;
 b=RfkT3lBABTRUzGT6I6V4BX8OIVmw9KXXXGhrlw1B+zAUqApMO9v7s+vlO1LbIcjEpc2Fa6
 TkSi/Y4zIM7hAFoOyRv1ZXfIY7D0YOJMfAvlUJzQGC4Mn1NxJLXO7ft1X1BM/GHKDyCaZq
 xYpsbzXzsK9QtlVav9JBz196YZjEE3E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-kb_EHTYKMtaK42xIF_WMpw-1; Thu, 07 Oct 2021 13:56:29 -0400
X-MC-Unique: kb_EHTYKMtaK42xIF_WMpw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso5314862wrg.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7fgw+iLF03hU/h1yPH0+fm9VyX2b04jOBSqyKLGZY2M=;
 b=pnxFpql8apwjbTLWIQtZjLzDntuKSOylYxSYaLX1NUBTqCdBBcHSTnIyh/AlgDJYvF
 9+0wBt5wsgLpGcRu3xk4Om8aiK89ehrhUJCYQR7dP0cAWajrvh3OyMLJOZ+pDYqbpO97
 R8MgRUlQ4vf5VPjxm37XA7tz2hWQClXxy3jYBWJe13PQt73eeHP+ciRUbDvBHQEkcDSJ
 HGDt1ROBGNhm+UH/TGy5sgVxVe8BCPAZh7qmvdjv0D5dLIiuYp1X69ifrgbHVBL5q3y2
 x993giXlmVKmEHF5iKU24o+muizOmdPCRUoMc5AiOs2oGEV2hMm/ojiV2QZaXAaXmP03
 FPxg==
X-Gm-Message-State: AOAM53190EKzqP3ZDWA3pkoMMCNh7rVi/+02T00kmjEnHBHs2EDpUqZh
 dzans0drsxypKSAWu07Lsplgt4P633ozyy0jSKzX9X+yPg8sfdSDqYBnS2+3YEZmCxCERVj1Zju
 d5sp6KO19P51qXlodxz+mi567QAWGRc/rysVu6lxjayTsXut9sFABIbVwEJ6fLa9b
X-Received: by 2002:adf:bc48:: with SMTP id a8mr7118431wrh.19.1633629387584;
 Thu, 07 Oct 2021 10:56:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXg09UIXw/PyR6YZ0rdSVYedZwnDWbseQ9/cXgBGURa/nqhgWO7NiRH37q/7DEC7ugy6Ootw==
X-Received: by 2002:adf:bc48:: with SMTP id a8mr7118401wrh.19.1633629387335;
 Thu, 07 Oct 2021 10:56:27 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id u17sm16972wrw.85.2021.10.07.10.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:56:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/i386/sgx: Move qmp_query_sgx_capabilities() to
 hw/i386/sgx.c
Date: Thu,  7 Oct 2021 19:56:11 +0200
Message-Id: <20211007175612.496366-4-philmd@redhat.com>
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

Move qmp_query_sgx_capabilities() from target/i386/monitor.c to
hw/i386/sgx.c, removing the sgx_get_capabilities() indirection.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/i386/sgx.h | 1 -
 hw/i386/sgx-stub.c    | 4 +++-
 hw/i386/sgx.c         | 3 ++-
 target/i386/monitor.c | 5 -----
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/hw/i386/sgx.h b/include/hw/i386/sgx.h
index 16fc25725c4..2bf90b3f4fe 100644
--- a/include/hw/i386/sgx.h
+++ b/include/hw/i386/sgx.h
@@ -7,6 +7,5 @@
 #include "qapi/qapi-types-misc-target.h"
 
 SGXInfo *sgx_get_info(Error **errp);
-SGXInfo *sgx_get_capabilities(Error **errp);
 
 #endif
diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
index 45c473119ef..3749656db1a 100644
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
index 29724ff8f08..713f1363433 100644
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
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 680d282591c..84fba47f193 100644
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


