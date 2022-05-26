Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2535355BF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:42:21 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLFL-0004Kf-Tp
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBx-00011n-2y; Thu, 26 May 2022 17:38:49 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:40784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBv-000861-JD; Thu, 26 May 2022 17:38:48 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f2cd424b9cso3749748fac.7; 
 Thu, 26 May 2022 14:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dSR9OjvRjkIla7RkOrlUUAfHLniqwB07am6FyyQQ80=;
 b=k5nixNwACHYh8f4hKT1FeeJspMtm4kJFBRsV9ySUvHVoexG7AxlWwg1InvaZV8GQ72
 pJXNUQgTEI/6PLIGV7QfRC29AYfPY7n81AoxUfzByOfQFPXeVioz0l7HKmtzlvIlSvqv
 pmqq2xrL5Q8UG08c4BogWZanCu5JPwTc6gwKJGpXql/q/9nw337xKOF01/8GvPNKYuhm
 xedND/UJXK5gpojcGU7pGqvb494JwWMR6a+DLQprB8y+DtMQfjO8XOALdbNvAvyWnerG
 ZvsSKvgfjbp6Dt8hJwiiiTKz19M/aJ0XK6HPhfKZrfGUF/7ROHhLEkgJHqNfDugFpB1G
 SnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dSR9OjvRjkIla7RkOrlUUAfHLniqwB07am6FyyQQ80=;
 b=CNlKKf+Z9fyKrPyT+8g/0ofXrHj3CiuvJhhW8lk+F8CxVdT7uNx5Lo7ipqb4AMT4oJ
 QMyoz0myEYdGHRaV/HF2TjDUjr3z6k0X0w4dahk3GuIVYiebrX/Lp4xLra8gVIlLo/km
 xfddbUs4yRKuMskIBu9820Ix8o3sklhQHMRY/HvzFwiHVQ3fLSKkOkw6r3N2DXleSzMB
 l33qXLd8/kqTfWXCdHQcPGhH6rA9QQj2nnYmeUkwgSP0cCwan+Bq6qJscXAjfTo28oqS
 lIMyxdw13fmx5/SEnl30mguO9u6Hp/DRpuM3xAlb8GdzMMKrBTDK9tN6RWNdBLCYLIHG
 q1zA==
X-Gm-Message-State: AOAM533mwDfZJL2XfLMFsa2xm6u60LBUJnOCMxklU1+ZWPHY8YFaVxt9
 Db93LvjuWp1v7Icl6oxTdUp6Y4JOEys=
X-Google-Smtp-Source: ABdhPJxEbk7IU4WwtIvO+wVqnfHHAGVrqM5/RQJHXVam4Xzg/Xjuxuk9YA41hxZnGPh+ediTGbMveA==
X-Received: by 2002:a05:6870:231f:b0:da:c15:fd43 with SMTP id
 w31-20020a056870231f00b000da0c15fd43mr2320090oao.135.1653601125921; 
 Thu, 26 May 2022 14:38:45 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:38:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 05/34] mos6522: fix linking error when CONFIG_MOS6522 is not set
Date: Thu, 26 May 2022 18:37:46 -0300
Message-Id: <20220526213815.92701-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:

/usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'

Make devices configuration available in hmp-commands*.hx and check for
CONFIG_MOS6522.

Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220510235439.54775-1-muriloo@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hmp-commands-info.hx | 2 +-
 monitor/misc.c       | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index adfa085a9b..834bed089e 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -880,7 +880,7 @@ SRST
     Show intel SGX information.
 ERST
 
-#if defined(TARGET_M68K) || defined(TARGET_PPC)
+#if defined(CONFIG_MOS6522)
     {
         .name         = "via",
         .args_type    = "",
diff --git a/monitor/misc.c b/monitor/misc.c
index 6c5bb82d3b..3d2312ba8d 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -84,6 +84,9 @@
 #include "hw/s390x/storage-attributes.h"
 #endif
 
+/* Make devices configuration available for use in hmp-commands*.hx templates */
+#include CONFIG_DEVICES
+
 /* file descriptors passed via SCM_RIGHTS */
 typedef struct mon_fd_t mon_fd_t;
 struct mon_fd_t {
-- 
2.36.1


