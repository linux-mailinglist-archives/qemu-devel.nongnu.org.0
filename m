Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C341D4CC1FE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:55:17 +0100 (CET)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnnQ-0003QQ-TY
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:55:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUL-0002nw-WA; Thu, 03 Mar 2022 10:35:34 -0500
Received: from [2607:f8b0:4864:20::336] (port=36857
 helo=mail-ot1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUK-0000lw-Do; Thu, 03 Mar 2022 10:35:33 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 w3-20020a056830060300b005ad10e3becaso4900507oti.3; 
 Thu, 03 Mar 2022 07:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hU29WVIs/lFc81OvEVBSDwlLNpP3N9hMSuV5wawYQ30=;
 b=ID8yGag34As9LNJx2you82UN8qoVaA12ivMvEomAY4cMGXAntnHTdMtQ6h1bb00v+J
 SP6KqMAOmsDK7f8y4KH2FM13jdL3TqjFr6JCxI7oBsQaC8H07iQAfR0zD0KrSRBGe6mE
 AtT1/c+crkiyIx/FpfLuXi4nwcfMmu85+lEkdpbuqZ7xXkUd31jd0PM3ywFbi7EVM/fx
 1f0quvbNB10xuAZYDQM8x5Fv5etpPP/Rb+gtBFeM0pozTevNi1U3tmA1907PKcwwlAMK
 sFMGCg78vP6uBav/8JVfaPqHAZGa+KE8JDsBb5+kKRaIIyJw7/P+7NvM0GnvFFcRGxgx
 RLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hU29WVIs/lFc81OvEVBSDwlLNpP3N9hMSuV5wawYQ30=;
 b=YTGKGUW9t/vm+U0cdoMfztPrG1GaC/gHko2jQvtdy9tyHe5YtZbfgTWYP04CyWpUL1
 iupTLmRdOzOsP0TU3/uyMw9KQzIDZBqG9kTMUWIbD6t6U4jWAo2iF5VXisFQWMuLXGxt
 LNzPh53UVqVg+UZeE2IgtFZL+wZi/tD2qPbaTdPyAGwGI3b8BN6HD+EQJY9rZZhV5P4i
 2haK0FY1wKjLujduBphqXYuKQJjm6j0xTtjFHeZeE2dPBQbp/AhsQuBUcD1WWn53gYOn
 eyKSkZ5PIFXRiiYY+DH20Mxy2zcXu0IdTCy3Xch5lRoPxYC6J34M58CYXmE7H7MuFtwH
 nlJA==
X-Gm-Message-State: AOAM530EB+Y1TkW6+4lECSbhuYQutg30o9LPxAixMeLpmUBphfZw7pBR
 Tc31Gi2/qy5hb8GdbxMtZpc0yYwC1QA=
X-Google-Smtp-Source: ABdhPJxi28NqzIiNZiNM/7bDQW83BiRY5i3d89DMPLusSsHVgW9Hb6IdJt69sGT89pkm+T2dZRlhsQ==
X-Received: by 2002:a05:6830:19c8:b0:5b0:298f:42fa with SMTP id
 p8-20020a05683019c800b005b0298f42famr10439380otp.167.1646321730387; 
 Thu, 03 Mar 2022 07:35:30 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 dw7-20020a056870770700b000d9aa7a6d63sm1178798oab.6.2022.03.03.07.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:35:30 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] qtest/meson.build: check CONFIG_TCG for prom-env-test in
 qtests_ppc
Date: Thu,  3 Mar 2022 12:35:13 -0300
Message-Id: <20220303153517.168943-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303153517.168943-1-danielhb413@gmail.com>
References: <20220303153517.168943-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::336
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, crosa@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'prom-env-test' is a TCG test that will fail if QEMU is compiled with
--disable-tcg:

$ QTEST_QEMU_BINARY=./qemu-system-ppc64 ./tests/qtest/prom-env-test
/ppc64/prom-env/mac99: qemu-system-ppc64: -accel tcg: invalid accelerator tcg
(... hangs indefinitely ...)

Fix it by checking CONFIG_TCG before compiling prom-env-test.

Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/qtest/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f33d84d19b..0c2f2d94e1 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -160,7 +160,8 @@ qtests_ppc = \
   (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
-  ['boot-order-test', 'prom-env-test', 'boot-serial-test']                 \
+  (config_all_devices.has_key('CONFIG_TCG') ? ['prom-env-test'] : []) +                      \
+  ['boot-order-test', 'boot-serial-test']
 
 qtests_ppc64 = \
   qtests_ppc + \
-- 
2.35.1


