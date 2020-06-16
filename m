Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2142E1FB51C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:55:47 +0200 (CEST)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlD06-0004LB-5a
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQh-0003Xh-Oe; Tue, 16 Jun 2020 10:19:11 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQd-0006xs-9Z; Tue, 16 Jun 2020 10:19:08 -0400
Received: by mail-oi1-x242.google.com with SMTP id t25so19384808oij.7;
 Tue, 16 Jun 2020 07:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lEcayuvB+XGeWNX8U/Yu92PQGUAoKZ14ovL5ftbZCxY=;
 b=GAnh6LxNH6I2LyEAf7T2OHebxodipl3Wzk9PmkLXuXD/ix0miP4QPr1rilFE1Npl18
 ureW8Fp9erWINJAQT27zEMLz86HAzs665EYRwbHmPbx6UWw1VE3ZDm2NJOoFSnX43JBp
 bGfYJkfbUnR3Rha04jydqYl47DuJ9SQHNvPEas/QUSk8B3gGeFdukKSV5X6JuhJBmGAy
 +0iVaU1KG3ko3YVoY3FcEGBLAu3du80FGe4s6glKqu4JIys5rGMPbVVDZjh3JORncqMA
 8tggU5tgGp4ZqM+W1OLTlZgLjp/D/bj90yUwVp3JCV9LZSMZWSa52+Faz/pGQzzf9Qt+
 6rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=lEcayuvB+XGeWNX8U/Yu92PQGUAoKZ14ovL5ftbZCxY=;
 b=sFJIDSYlqDklPGM/zRKqs3v+pMiWMSMCHFsvrHVSQeg2iKBSkkS48P6RX0SFQhz+UK
 7aSEQ7sibYfNBSD1z4iAsuZ697e2qFAM6ScVi/8XaudfQi6NWg4WmCdP+5LuDTedJADH
 d7BYVOuUSjxI2/Jq2hfEGpb3FSnN/lCLTkMwOoonXoVuQDJKc7mxPDCeDm6jo68YX8Be
 0feEqoZSH3BSBth8H2scWUB0y8SXW8nWz9N9SgLAypndj9iVt4omlgEs4T1EgB4LneBp
 JwkTF8h75p2kEZJcknZmm5ob9/Bb3Pp4A8XBhPR/hmqKdotUzMiChvu781fvfXSp4ajX
 x6vQ==
X-Gm-Message-State: AOAM530DMc7ZZJoTpwb6EqVizL243rUK81COsS9pwLYKNE5G+waEldKc
 M/A+wGlnFzQrjv5qLEzh9QdCNNqN
X-Google-Smtp-Source: ABdhPJzIg6sqCW7gxojRgIsnEhaN+ZXNtttu7aBVQ9zTzQIb4d+VffBOsqvS4QWOQRYh3vSPRoi03w==
X-Received: by 2002:aca:fd94:: with SMTP id b142mr3610894oii.9.1592317145394; 
 Tue, 16 Jun 2020 07:19:05 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id b4sm4085033oti.3.2020.06.16.07.19.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:19:04 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 59/78] qga-win: Handle VSS_E_PROVIDER_ALREADY_REGISTERED error
Date: Tue, 16 Jun 2020 09:15:28 -0500
Message-Id: <20200616141547.24664-60-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=flukshun@gmail.com; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Sameeh Jubran <sjubran@redhat.com>, Basil Salman <basil@daynix.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sameeh Jubran <sjubran@redhat.com>

This patch handles the case where VSS Provider is already registered,
where in such case qga uninstalls the provider and registers it again.

Signed-off-by: Sameeh Jubran <sjubran@redhat.com>
Signed-off-by: Basil Salman <basil@daynix.com>
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
(cherry picked from commit b2413df83348acf371c03bced9a3845bba883ed5)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 qga/vss-win32/install.cpp | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index 6713e58670..a456841360 100644
--- a/qga/vss-win32/install.cpp
+++ b/qga/vss-win32/install.cpp
@@ -443,6 +443,17 @@ STDAPI DllRegisterServer(void)
                                      VSS_PROV_SOFTWARE,
                                      const_cast<WCHAR*>(QGA_PROVIDER_VERSION),
                                      g_gProviderVersion);
+    if (hr == (long int) VSS_E_PROVIDER_ALREADY_REGISTERED) {
+        DllUnregisterServer();
+        hr = pVssAdmin->RegisterProvider(g_gProviderId, CLSID_QGAVSSProvider,
+                                         const_cast<WCHAR * >
+                                         (QGA_PROVIDER_LNAME),
+                                         VSS_PROV_SOFTWARE,
+                                         const_cast<WCHAR * >
+                                         (QGA_PROVIDER_VERSION),
+                                         g_gProviderVersion);
+    }
+
     if (FAILED(hr)) {
         errmsg_dialog(hr, "RegisterProvider failed");
     }
-- 
2.17.1


