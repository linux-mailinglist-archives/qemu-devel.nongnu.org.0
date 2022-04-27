Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B0551166B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:53:41 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njgEm-0006E9-HV
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuV-0000zs-1B
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:43 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuR-0001pW-PA
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:42 -0400
Received: by mail-ej1-x62c.google.com with SMTP id l7so2818906ejn.2
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQ7UtdFAbXFv5YAxs4I1WqXwVn14/HuQbkfQM7Bmago=;
 b=mI4rhjAaTC6AQFZ/p9wJeWw64H+O+Qw09Su+AIdgPzmIVlVzCgDupY+/2whmlLuyu+
 q7QuK4uCXNTpORaI1IpkIxWcMSlktoSgtlnQnecuWbnBYLw8ex0VCOW33jW4+zCcy1Yp
 5VQHWHps2jrRgS9YruzF63Ec8Tp64gxKDVjz2qsV7bNUVkqNP3satN1s4OTtHb0Y8vkE
 PLx7YZuNedOR2/ImqwEAwKfswPH6gLe8WtoZyL4/8QmAJ0cYj92arKPmC7m//Opv9AXj
 Gz5A13F3FGCV4qWeifoc0UnlXP/dERSvuLDSYL731oM1L3rcKpZHpLFZbDxsZw13Rxjb
 rGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gQ7UtdFAbXFv5YAxs4I1WqXwVn14/HuQbkfQM7Bmago=;
 b=6r2gzLmRZFu4Eh2uTvtsnS6ab9KE8b2Ts9+jdAfh898PRTk3PyCpBOyctJNEIP8R9b
 KW20MaAqHaD+57Mbpc+YJixbtsGtaB+n5/9Bk/zI8oMlja665kQvl/iY/m6fCdRjQpuz
 W8kF7Jh3XT6nxcHssp5HPuPKja1xydB/MxB1R11Yfa2okc5m2eytipFsjBU079M31gwS
 fNH2wPb118dkWLvTPQ9ix4cKOGJ7Uf8bkrszLXsZC1338MHgVTvSccIVAu0uenk3love
 h07WKMv2gyHMHgeVBBqFJECDIGMF69SEjGmZr0plvbMdefuXdg6Ude7QjABTnzsR3GxO
 uagw==
X-Gm-Message-State: AOAM533w4LgpKxA0bAYUr1TJ95zE9q8jEvQNsYgx9t4K4rQJTRPNATQQ
 HZGFMQdOWE2nPEoBggVPHYlP79qYMrV/1w==
X-Google-Smtp-Source: ABdhPJwJR6tPIBxIHEYVUh+FDZQ2FZcu+snHq4usSCIq0KFh2rS4nh1/Zg8IjTwkVRu/hBxw4JYO8A==
X-Received: by 2002:a17:907:7811:b0:6ef:a896:b407 with SMTP id
 la17-20020a170907781100b006efa896b407mr24979695ejc.645.1651059152261; 
 Wed, 27 Apr 2022 04:32:32 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d26-20020a170906305a00b006f3a7ffbb0esm3099216ejd.70.2022.04.27.04.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:32:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/6] soundhw: move help handling to vl.c
Date: Wed, 27 Apr 2022 13:32:24 +0200
Message-Id: <20220427113225.112521-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427113225.112521-1-pbonzini@redhat.com>
References: <20220427113225.112521-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mkletzan@redhat.com, berrange@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow processing "-audio model=help" even if the backend
part of the option is missing.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/soundhw.c | 24 +++++++++---------------
 softmmu/vl.c       |  4 ++++
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index a9d8807b18..d81ae91136 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -89,23 +89,17 @@ void select_soundhw(const char *optarg)
         error_setg(&error_fatal, "only one -soundhw option is allowed");
     }
 
-    if (is_help_option(optarg)) {
-        show_valid_soundhw();
-        exit(0);
+    for (c = soundhw; c->name; ++c) {
+        if (g_str_equal(c->name, optarg)) {
+            selected = c;
+            break;
+        }
     }
-    else {
-        for (c = soundhw; c->name; ++c) {
-            if (g_str_equal(c->name, optarg)) {
-                selected = c;
-                break;
-            }
-        }
 
-        if (!c->name) {
-            error_report("Unknown sound card name `%s'", optarg);
-            show_valid_soundhw();
-            exit(1);
-        }
+    if (!c->name) {
+        error_report("Unknown sound card name `%s'", optarg);
+        show_valid_soundhw();
+        exit(1);
     }
 }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index c2919579fd..5bea0eb3eb 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3019,6 +3019,10 @@ void qemu_init(int argc, char **argv, char **envp)
                 audio_parse_option(optarg);
                 break;
             case QEMU_OPTION_soundhw:
+                if (is_help_option(optarg)) {
+                    show_valid_soundhw();
+                    exit(0);
+                }
                 select_soundhw (optarg);
                 break;
             case QEMU_OPTION_h:
-- 
2.35.1



