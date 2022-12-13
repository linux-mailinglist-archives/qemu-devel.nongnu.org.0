Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0680B64B544
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:37:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54WE-0001MZ-U5; Tue, 13 Dec 2022 07:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54WA-0001KC-0a
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:36:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54W8-00063Q-9A
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:36:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m19so8172241wms.5
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIWqF960/rg6gqFejdnkrSGn2PEdfww2KszocKY9NPM=;
 b=h+gcwRarxYHjDQt6eSyU6mMb0ymg/ujMpr/wyp/9NOXKwuVevsa2yuezcU38aA6uR6
 EgIrEBN6stZqv94xqIx1RCw3f2THn/jyeyfS3pp8+5l4OVRciFQf4RGrOJcsrgOZrb+W
 /UgIenJ71XQQYqRl07SuUEGXJFw3kRU5W4AP6MNJlgUVyH+IQBn8P/gBnYW/8PyXFjjT
 7qrpQPkacbCf7KNPFamMzHqj6FSCnjenY/SZwxTNqpgykDjL3eS5PQBeFY2AATyiFpcm
 UA4WpWOcvjMpG62XkYMzgJriRHmuK97wk4cyMPnuYWKn2rrBYZ8fHqx1FNQ77WpX9igD
 myZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EIWqF960/rg6gqFejdnkrSGn2PEdfww2KszocKY9NPM=;
 b=PZ5Hl3Vswiwid4bq0AHv8RhQpROu4NRS5ej21kmqbxZ5SNDWUz6r8LnB/2TuI1kj9O
 h0iMTrCXWeilbDnQYd8V/tDhLVY7j9xGIsD0fN6w3ejuz94Ldg/0OSzuA6CtKL/6EHwg
 rTerU3pCkH+akhM+9HzvdPRcY2kmKx3Nlc4gDI1j5KuhTuBNxhMq7j+Zy4ACHT+4IxXt
 e6gMAc+pF++TUOufBZ7J+5c2zD/oNrI/p+3vfp5tBlBvivlNvmvtDuicqIuKn1YLRvef
 tVXy6lhHPvHRBEwKAV1dEi5VWVCUGj5YqCfEc2oayODc1TdcHbuDvMzBUXAHcPV8AtOy
 V00g==
X-Gm-Message-State: ANoB5pnvyroEJmWHLKBnmwk4N1dQWf06cmHBOgDoSFjW+jp7BUi6mKu6
 vXvg4yMk/KmCCSPd2aVSvPiJuAX0NmPlqUQHyr4=
X-Google-Smtp-Source: AA0mqf7dkCjTxnH6apRlWOJdUMUEZAV5hp9evrnE4rLoQ6DaTgUx1600ij+Ta4YGbtEpSlYE+HcuzA==
X-Received: by 2002:a05:600c:1c06:b0:3cf:71f9:3b4c with SMTP id
 j6-20020a05600c1c0600b003cf71f93b4cmr14756046wms.23.1670934975281; 
 Tue, 13 Dec 2022 04:36:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c1c1100b003cfd42821dasm14467122wms.3.2022.12.13.04.36.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 04:36:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 4/4] hw/ppc/spapr_ovec: Avoid target_ulong
 spapr_ovec_parse_vector()
Date: Tue, 13 Dec 2022 13:35:50 +0100
Message-Id: <20221213123550.39302-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213123550.39302-1-philmd@linaro.org>
References: <20221213123550.39302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

spapr_ovec.c is a device, but it uses target_ulong which is
target specific. The hwaddr type (declared in "exec/hwaddr.h")
better fits hardware addresses.

Change spapr_ovec_parse_vector() to take a hwaddr argument,
allowing the removal of "cpu.h" in a device header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr_ovec.c         | 3 ++-
 include/hw/ppc/spapr_ovec.h | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
index b2567caa5c..a18a751b57 100644
--- a/hw/ppc/spapr_ovec.c
+++ b/hw/ppc/spapr_ovec.c
@@ -19,6 +19,7 @@
 #include "qemu/error-report.h"
 #include "trace.h"
 #include <libfdt.h>
+#include "cpu.h"
 
 #define OV_MAXBYTES 256 /* not including length byte */
 #define OV_MAXBITS (OV_MAXBYTES * BITS_PER_BYTE)
@@ -176,7 +177,7 @@ static target_ulong vector_addr(target_ulong table_addr, int vector)
     return table_addr;
 }
 
-SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector)
+SpaprOptionVector *spapr_ovec_parse_vector(hwaddr table_addr, int vector)
 {
     SpaprOptionVector *ov;
     target_ulong addr;
diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
index c3e8b98e7e..d756b916e4 100644
--- a/include/hw/ppc/spapr_ovec.h
+++ b/include/hw/ppc/spapr_ovec.h
@@ -37,7 +37,7 @@
 #ifndef SPAPR_OVEC_H
 #define SPAPR_OVEC_H
 
-#include "cpu.h"
+#include "exec/hwaddr.h"
 
 typedef struct SpaprOptionVector SpaprOptionVector;
 
@@ -73,7 +73,7 @@ void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
 void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
 bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
 bool spapr_ovec_empty(SpaprOptionVector *ov);
-SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector);
+SpaprOptionVector *spapr_ovec_parse_vector(hwaddr table_addr, int vector);
 int spapr_dt_ovec(void *fdt, int fdt_offset,
                   SpaprOptionVector *ov, const char *name);
 
-- 
2.38.1


