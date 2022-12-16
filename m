Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA8964F3FF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:21:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IpB-0007ou-9Z; Fri, 16 Dec 2022 17:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iox-0007i9-8r
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:57 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iov-0005IA-Jt
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:47 -0500
Received: by mail-ej1-x62a.google.com with SMTP id vv4so9330784ejc.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Z9Q/ZOLM/RvXrGdDf9zoAVvthQ7cKK+Y7xARgd6nyc=;
 b=F2sy76oHmOeqwFZt3OOkRRYFmar0ZGgBSjneNY1pXPFyUkDYrsRNGEg3erl7/FaPJW
 dDKkzbl2mwZCNhDaaQBcVX/YiMmX115xxMng196Q+72W0LN93xAql0UL9YeBcgMrl6rX
 rezcrazAsFgDV2RXKWhGpLvBzXCoo+cd1Mq/QScWeR2nBVPYTQXdGRl82x1iOmOU2tjk
 t15lx7Wt80QPNy8TEjj/JCwa8huTjCk9V7v7+zI1/EZUOKvU/pjw7nueD/vgru7pJ3rs
 cxWL3zuhAGzt/8BJdmE+7kDI9SB2WLv8M9F70ZbHdkeZM6+ilseVIq3nGm5fF4XD+TjJ
 9vSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Z9Q/ZOLM/RvXrGdDf9zoAVvthQ7cKK+Y7xARgd6nyc=;
 b=DErAaCk/qEBBsgb1agbVbIF/fdkzpKlJGWplG8kKO31H4XVxeb+tbdZaaXpPDiRsAM
 r3ZhxgIxhrbtih8yc4/44Ky8Ok/UJbW6HSvRWz3gl7TmOjJMnrBB+SV0CPBafiBJIJk2
 2dxV+iVUOWtPLiORN0CyTsFDKOzQ0aSN6L06oVPk+QJh1dRXokw3DqlGq/ytLS3nQTGx
 p3HNJ/nQg0K3sW+wItJk5dZSpL/EtFuzUDJMOTSgfTQPhq47mZUJVxgLKzswqBGL68gt
 mMp3WZBHsoZY61qC7dfAj/wUs/aOj/5JSnS6FqoRHruv6Z2Ieh4d615pcdWtSd96SEbk
 a1QQ==
X-Gm-Message-State: ANoB5pnGWsggVNwJzC87iOVS0eO1gosx3JxskK3qzE7gHwRpl2WSzV2v
 TdiPy/vUwzUucdo7t+lPmqboNyN/3lYo0Exuwfw=
X-Google-Smtp-Source: AA0mqf5ibeL3jG69WRZlCFQ37E56SY9xe7eA7oRiPDDt2MyfdPzuB1pqnDmYVlewpZOhrpvjQv7uzQ==
X-Received: by 2002:a17:907:1045:b0:7c0:ca94:4631 with SMTP id
 oy5-20020a170907104500b007c0ca944631mr28366322ejb.30.1671228284050; 
 Fri, 16 Dec 2022 14:04:44 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ku7-20020a170907788700b007c0be4861e8sm1292035ejc.23.2022.12.16.14.04.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:04:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 5/5] target/s390x/tcg/excp_helper: Restrict system headers to
 sysemu
Date: Fri, 16 Dec 2022 23:04:11 +0100
Message-Id: <20221216220411.6779-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220411.6779-1-philmd@linaro.org>
References: <20221216220411.6779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/tcg/excp_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index fe02d82201..e9eb7c455e 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -21,15 +21,15 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
-#include "s390x-internal.h"
 #include "exec/helper-proto.h"
-#include "qemu/timer.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
-#include "hw/s390x/ioinst.h"
-#include "exec/address-spaces.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #ifndef CONFIG_USER_ONLY
+#include "qemu/timer.h"
+#include "exec/cpu_ldst.h"
+#include "exec/address-spaces.h"
+#include "hw/s390x/ioinst.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/boards.h"
 #endif
-- 
2.38.1


