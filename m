Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A6E485AC0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:34:27 +0100 (CET)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DvO-0002DG-HY
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:34:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlN-0001SU-5R; Wed, 05 Jan 2022 16:24:05 -0500
Received: from [2607:f8b0:4864:20::936] (port=35455
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlL-0007s0-N3; Wed, 05 Jan 2022 16:24:04 -0500
Received: by mail-ua1-x936.google.com with SMTP id o20so880088uat.2;
 Wed, 05 Jan 2022 13:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DY9HFxZzoO7gIfVsmbRfhVt1/ApoSVto9bl/u3+Ahgc=;
 b=BQKANi/+FesqGyCNbAMR72JpzODIC7t3Wt5I4AuYf7GfqZNt06zxqhLt7gS7bzqv1l
 94S/IN7jTpE7COSxuzyFP5hcY+TlxBItkeXfjLUQnSK8I77R+NrpqVaDItF9JybNVh9Z
 TbIX+67T+f/BamBZB03sWcTl18J85KazJ2e/msQe8BUgw+9CrRW0jX+IHey8IDk3CAJW
 T13qUsN2Fpq5Nih3MA6cMuQv96pbOgpuQMJ9aAZKTWFAd2R6wkTaz+pC48ZvghviNeAU
 FzIW00Hg6KKKAVX6uShxEEOC1Ibglvj3ro1jmKnUC4rujqyKtAjBnpybFVkb18fiy7Y6
 14Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DY9HFxZzoO7gIfVsmbRfhVt1/ApoSVto9bl/u3+Ahgc=;
 b=fgFSwE7XJ358dHEOZMaLlIA7GNP4O0Xs8CVzSYPari8c4fBohbeq6pjBGJ0+mjJJU9
 J0jONoCKIe3VW8PuYW3qnhuCsOHEZX5/iWD2L0M0Nhk6qpZWtN/FfRaXV0Y1gCqTIJH2
 C90L/jxWsH21qtV13zonUCQO+eb2N9SvJIxOPNnt4OZa4ffAgSV0n1gSRfbR8mEC84I1
 RWZGz6aldMxTT6+9o5rYcAPFFPhPm3wZpvspRhkONVNbUGE4aA66RXxnk/yAbEhnlMNw
 sBtrf+HJAoIW7RLAjbFwm7Lno33HxEQdWUdHH82kcnSq/3nl5fzcm3QbwzAri82ON45Y
 4dAA==
X-Gm-Message-State: AOAM531xAbXP9/AYPSTm7fqw/20fsSCZIlfKpj52jf9xNKVI+2nCRim4
 5/ypkcbCk7sLecmjwGgVkW3LU3enzIs=
X-Google-Smtp-Source: ABdhPJxWakiXNB3cHrDNFpIFPmqRdMNytvImXo/URDSDPNQ5gRzNt4oTdoUCQLLGs9hrIf8iPA6hRw==
X-Received: by 2002:a67:3346:: with SMTP id z67mr18113411vsz.13.1641417842610; 
 Wed, 05 Jan 2022 13:24:02 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:02 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/18] pnv_phb4.c: check if root port exists in rc_config
 functions
Date: Wed,  5 Jan 2022 18:23:25 -0300
Message-Id: <20220105212338.49899-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pnv_phb4_rc_config_read() and pnv_phb4_rc_config_write() are asserting
the existence of the root port. The root port is now optional, and there
will be cases where a pnv-phb4 device won't have a root port attached.

Instead of asserting, check if the root port exists before read/writing
into it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 14827f8464..83dedc878a 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -152,7 +152,10 @@ static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
     }
 
     pdev = pci_find_device(pci->bus, 0, 0);
-    assert(pdev);
+    if (!pdev) {
+        phb_error(phb, "rc_config_write device not found\n");
+        return;
+    }
 
     pci_host_config_write_common(pdev, off, PHB_RC_CONFIG_SIZE,
                                  bswap32(val), 4);
@@ -171,7 +174,10 @@ static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
     }
 
     pdev = pci_find_device(pci->bus, 0, 0);
-    assert(pdev);
+    if (!pdev) {
+        phb_error(phb, "rc_config_read device not found\n");
+        return ~0ull;
+    }
 
     val = pci_host_config_read_common(pdev, off, PHB_RC_CONFIG_SIZE, 4);
     return bswap32(val);
-- 
2.33.1


