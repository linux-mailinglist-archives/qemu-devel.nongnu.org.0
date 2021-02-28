Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D377A32704B
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 06:06:35 +0100 (CET)
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGEHq-0003ig-SA
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 00:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGEG6-0002qn-1n; Sun, 28 Feb 2021 00:04:47 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:38102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGEG3-00040s-5v; Sun, 28 Feb 2021 00:04:45 -0500
Received: by mail-pf1-x430.google.com with SMTP id 201so8997806pfw.5;
 Sat, 27 Feb 2021 21:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oZqv7cf3/QIhoX/B5luM6q8TwT7GGyNJrb0w2yPu4HA=;
 b=poDnjGMJJTIMUOF3+LHEsDNRj+CKXcYM21rD2/tNvoMSWecE1H3okedsRTU8/0decE
 jokDAhq7AMnboC9it75CR6oOzBmMEGsAY0n/M95YEcEVD1JdyDjv68aKGMjdWB2FYx79
 SKl5w2xqs2hk9l+rqaHWMDiDtmuIyomUFPiFILbn11qTF4J6PJOkm10TC5KRp3/OURcJ
 1jdj8eNJVyRlzZ2MyUI+ZwZfnJWminUtFXMgHI4r8rz/lRVmShUqzNqQndw4g/7GWu0q
 bdygHGDHk1KFP93S+fef3Bi2VZlUdEIib0IYcAEtRdSG7GL6nZXcESCv+qdSbNLA89BL
 rR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oZqv7cf3/QIhoX/B5luM6q8TwT7GGyNJrb0w2yPu4HA=;
 b=Hs5G06HuBK6jTXKGrfNKkRyOEWeiPgJUsaDA7Crrf4qZl13OLglOy/ayTUjzP9dMt8
 01S9EwDI5eGZ11yu4BVXSjTKTrs0PJiM15D7W/lc2vDhZLnYLjFIJiAaU9qlENxNagvs
 lsiu6gbe1554wMoWnRlEcEvsXgHouCySmhaShDdzRxlNNnW/Cx5P1PDqY3Rf7CPekpMX
 QqaiaVITiThqQDeq7ntGL9vOU7WX3eQe/6Nm46BhUFdKQ+tAavrEUeOjovFHPKxQyPGd
 Aor24GyZdVE9v1kRfq5PQrpRlkQWls/Q9NldQA/XkEtidpMZR178RuTrhNZldCJFc8My
 WgGg==
X-Gm-Message-State: AOAM533kyDlF8PQIFF/KA/xAZ3em3OJU5m8S6YkdFzCd3RQQ1/7E4uuI
 g+NeOBLVdxP56b2+WK9L+S4=
X-Google-Smtp-Source: ABdhPJybtIHQFk6vuwiMSuq2pQ1gWGgYzSbtui8KXBqG8Wr+gTMZqsCs2FmfpqqcyzUnwP12kOoQbw==
X-Received: by 2002:a65:4785:: with SMTP id e5mr9032679pgs.0.1614488681394;
 Sat, 27 Feb 2021 21:04:41 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e24sm12615810pjr.13.2021.02.27.21.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 21:04:41 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH] hw/net: fsl_etsec: Fix build error when HEX_DUMP is on
Date: Sun, 28 Feb 2021 13:04:31 +0800
Message-Id: <20210228050431.24647-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

"qemu-common.h" should be included to provide the forward declaration
of qemu_hexdump() when HEX_DUMP is on.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/net/fsl_etsec/etsec.c | 1 +
 hw/net/fsl_etsec/rings.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index 93886bba60..bd9d62b559 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -27,6 +27,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/ptimer.h"
diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index fe055d3381..d6be0d7d18 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 #include "net/checksum.h"
 #include "qemu/log.h"
 #include "etsec.h"
-- 
2.25.1


