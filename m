Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1B2479A1D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 11:02:40 +0100 (CET)
Received: from localhost ([::1]:57440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myWY3-0003ua-AJ
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 05:02:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myWW9-00034X-Q7
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 05:00:41 -0500
Received: from [2a00:1450:4864:20::332] (port=37757
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myWW7-0004Gy-S0
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 05:00:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 a203-20020a1c7fd4000000b003457874263aso3444012wmd.2
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 02:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b9FN074V72lRLnoJcg0mz2937yjw6qjV4nrIEYRa1hU=;
 b=RLcHlYW+Ktk+dRxhWDwRLf92+ZjVqc8uNXroopKUvKeZIgbnau90aQh0HZmBmf2fA0
 ZOmxK1xFcltHBGXnQs8PYwbTZ5Te2YDl+7OVATWm5rMoxu827FifMxB70pNhc7XDasze
 cYdN1JAp1Pg9rzjWnwExUkhwVggsUHcqe1njYQPoZm/ApcJlsuXtYQoxkEu/CrswWjDD
 5xhs7wfgeH1ul2vAOvxAe7WZ/etYHCkPAoC2KELDg1jUdjEYyfYtVuiAD/F95Zj0Xx/t
 niVjxDbJy4jOlAbxPctiTYZ2dSAeRaVc99IL3SrJVDvPA9i9lzOwrw6Tc0YhmZegnzXo
 V6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=b9FN074V72lRLnoJcg0mz2937yjw6qjV4nrIEYRa1hU=;
 b=RJM2mfBAh0wycKAH/sAmzce1VriV8z8uJMIMtYUdlwXtjpTAYg2GPWWUquWvrvYf9b
 s0CnSypUrd6y44Un9w1WzTFFbWuAVwGAr2nPe7Cl9kkv0bUUYZN8YBBoS7p7DWyWMm3H
 u3gp5r11CDotnbwQUXv6xptMvKd3RgsGBsks4t/n/UCstI423z3+UuVNuSXslyCIa71S
 bgRbYKuLbAyYYYu2nI5PJaK/8Gm5DUPqQ8dWihG0MYv7F5agufSBic6OStv35Dng6lLS
 qx/tMauszTmnLcCh1zRyoddZNc1lfC31G1W+ENSsL97q5+3YlWI+A7FaMj+KfNomNTTZ
 HyJg==
X-Gm-Message-State: AOAM531oBC3fHJpleX+oe4Dzv46c83mkSMgFSIdCM5jQ9I90oVx+GgZW
 560Dz0ndCjcERlBxFq9s+o3z/Yqb63WPSw==
X-Google-Smtp-Source: ABdhPJydm/K7UYQQ4QtVn4lUg58w5MUBYnLtB85lwdve8A+GwTVDsowNSPa0pJW0A/X+2MR5L+/TfA==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr6128198wmf.161.1639821637887; 
 Sat, 18 Dec 2021 02:00:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id r11sm9688866wrw.5.2021.12.18.02.00.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 02:00:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-options: warn for short form booleans in all parsing
 functions
Date: Sat, 18 Dec 2021 11:00:34 +0100
Message-Id: <20211218100034.223305-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_opts_parse and qemu_opts_do_parse were not warning for short form booleans.

qemu_opts_parse is used internally and short form boolean options are never
passed to it.  qemu_opts_do_parse is mostly used by the block layer, and
also for character device creation with options other than -chardev.  Since
version 6.0 of QEMU has removed all uses of the short form boolean options
from the documentation, we can warn there too for consistency.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-option.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index eedd08929b..a833c5a4eb 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -797,15 +797,14 @@ static const char *get_opt_name_value(const char *params,
 }
 
 static bool opts_do_parse(QemuOpts *opts, const char *params,
-                          const char *firstname,
-                          bool warn_on_flag, bool *help_wanted, Error **errp)
+                          const char *firstname, bool *help_wanted, Error **errp)
 {
     char *option, *value;
     const char *p;
     QemuOpt *opt;
 
     for (p = params; *p;) {
-        p = get_opt_name_value(p, firstname, warn_on_flag, help_wanted, &option, &value);
+        p = get_opt_name_value(p, firstname, help_wanted, &option, &value);
         if (help_wanted && *help_wanted) {
             g_free(option);
             g_free(value);
@@ -875,12 +874,11 @@ bool has_help_option(const char *params)
 bool qemu_opts_do_parse(QemuOpts *opts, const char *params,
                        const char *firstname, Error **errp)
 {
-    return opts_do_parse(opts, params, firstname, false, NULL, errp);
+    return opts_do_parse(opts, params, firstname, NULL, errp);
 }
 
 static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
-                            bool permit_abbrev,
-                            bool warn_on_flag, bool *help_wanted, Error **errp)
+                            bool permit_abbrev, bool *help_wanted, Error **errp)
 {
     const char *firstname;
     char *id = opts_parse_id(params);
@@ -895,8 +893,7 @@ static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
         return NULL;
     }
 
-    if (!opts_do_parse(opts, params, firstname,
-                       warn_on_flag, help_wanted, errp)) {
+    if (!opts_do_parse(opts, params, firstname, help_wanted, errp)) {
         qemu_opts_del(opts);
         return NULL;
     }
@@ -914,7 +911,7 @@ static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
 QemuOpts *qemu_opts_parse(QemuOptsList *list, const char *params,
                           bool permit_abbrev, Error **errp)
 {
-    return opts_parse(list, params, permit_abbrev, false, NULL, errp);
+    return opts_parse(list, params, permit_abbrev, NULL, errp);
 }
 
 /**
@@ -932,7 +929,7 @@ QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list, const char *params,
     QemuOpts *opts;
     bool help_wanted = false;
 
-    opts = opts_parse(list, params, permit_abbrev, true,
+    opts = opts_parse(list, params, permit_abbrev,
                       opts_accepts_any(list) ? NULL : &help_wanted,
                       &err);
     if (!opts) {
-- 
2.33.1


