Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A875548290
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 10:56:53 +0200 (CEST)
Received: from localhost ([::1]:59418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0fsS-0000QA-H8
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 04:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fiV-0006CH-Sc
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:35 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fiT-0001Lk-8i
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:34 -0400
Received: by mail-pj1-x1036.google.com with SMTP id cx11so5032334pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 01:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q3fGRGDeYAftNQXo0oss3Vx5kluxVT3NQN9Z7xzpHV4=;
 b=UEiq2C/1QauxHnprzuy7mrd+LIs+d1krZcWQ6ULXHGXwESXDk+rqGihOitcWihIoGi
 ZzoBRyakVyYy8/S1heQso3rC86DO2ON4USRFRk49JpEgBCM3isjiCbc0uE7xwyxg+QgI
 LxHQ5IJDhp3kGDdY13Prl/sXSC1K0IUnRuiFkZGbmxC2IMHhZBeREaDKQLniqPtBd1Lr
 BrZEPYhBnwdjPG+38LeDN+AbWaR1KHWju7oYhdS5ulIbEASO4gtqQw6hNzz2guL9PL6s
 VWNTMCc9Dd/qKqIp4B9bkcLWnxLPUQg0eU4rIKsvCm/lDZep9IjY4Es4XvYmGNnW+4rz
 FlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q3fGRGDeYAftNQXo0oss3Vx5kluxVT3NQN9Z7xzpHV4=;
 b=ybmuvETRKhBp5XjnSV4XGA+SkimH2C84Yxyzf17zGsVIg/+5qRJC/Cy4PQrVcW6laZ
 LUvl2/E6JGpAkcRJ/Og5iIsE0HRvsgzWpzE0A5gYKRHUw2Db+EvmSd8X5MoBmmz6bXkB
 ELebQ1LWWGEe42mrzbcbiY3XRo79g/FfeslnhddCCW1oo4UrAO0Zr2QNA6xa5dD4n1Uz
 aRrmraoJf6jneNvnr/JK4kuWU6k5iwaBm7SiDeeNRaLdABQLzMu3+IzSZkgrEtIMUdn6
 AcFXIuVhio2dArt/+BGJvQZTr3SjXsDYHg3x+gnE4kHMnwPMuPl3SnYlN4OAgTd2DhM7
 5Liw==
X-Gm-Message-State: AOAM532wGPxSMiEkk1aJClqsYHiR0rp3Wshll672BBbBOF5wDcw5ndfC
 qOvzLjP0scsjQ70gj4BYswsgNg==
X-Google-Smtp-Source: ABdhPJz3PR3dAJdMPWSnTUPGEHAQWdCRhc/yN2zXBp/i4OtrOAWEz2/XrBwV7h9Es4AubbuNi/gSGA==
X-Received: by 2002:a17:90a:f3c1:b0:1ea:a976:dd9a with SMTP id
 ha1-20020a17090af3c100b001eaa976dd9amr6719802pjb.160.1655109991820; 
 Mon, 13 Jun 2022 01:46:31 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id
 f27-20020aa79d9b000000b0050dc762814fsm4729196pfq.41.2022.06.13.01.46.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 01:46:31 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com, arei.gonglei@huawei.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Cc: helei.sig11@bytedance.com,
	pizhenwei@bytedance.com,
	jasowang@redhat.com
Subject: [PATCH 3/7] crypto: remove "qemu/osdep.h" in rsakey.h
Date: Mon, 13 Jun 2022 16:45:27 +0800
Message-Id: <20220613084531.8086-4-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220613084531.8086-1-helei.sig11@bytedance.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move 'include "qemu/osdep.h"' from rsakey.h to rsakey.c.

Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 crypto/rsakey.c | 1 +
 crypto/rsakey.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/rsakey.c b/crypto/rsakey.c
index cc40e072f0..dcdbd9ec57 100644
--- a/crypto/rsakey.c
+++ b/crypto/rsakey.c
@@ -19,6 +19,7 @@
  *
  */
 
+#include "qemu/osdep.h"
 #include "rsakey.h"
 
 void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *rsa_key)
diff --git a/crypto/rsakey.h b/crypto/rsakey.h
index 974b76f659..ba88974d12 100644
--- a/crypto/rsakey.h
+++ b/crypto/rsakey.h
@@ -22,7 +22,6 @@
 #ifndef QCRYPTO_RSAKEY_H
 #define QCRYPTO_RSAKEY_H
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "crypto/akcipher.h"
 
-- 
2.11.0


