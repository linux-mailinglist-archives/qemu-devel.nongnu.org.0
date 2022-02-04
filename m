Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162384A9C12
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:37:59 +0100 (CET)
Received: from localhost ([::1]:50336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0es-0003O2-0G
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:37:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0XA-0003uE-4a
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:30:00 -0500
Received: from [2607:f8b0:4864:20::102d] (port=40663
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0X8-0004Df-1p
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:29:59 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 p22-20020a17090adf9600b001b8783b2647so220172pjv.5
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eha/TYHzse5/9u/DYqXS1oHE24NywDNmpUOtiVb/8oo=;
 b=HwpOEHdHf5XzrwtZEZ5mkQp4mFlmMtXShEDH226AIHDnjTvSWNoskm6iFHKmYdlH1e
 8DeW6qgwlsKTx19k/0DfvKXts+REkHbsz2tuEpnVS0gHLFblcdhVQvCcUZMiwpqylfxh
 USxKOK325e2LXAJrgC452ZVIWYlXSPcXBEDMvzuXzE15h6FEYQUNsGQ+YRXlqJjbPsaS
 oyirWLU3JOkfIGN1ghgqnEtf9jaaliJwsjoMY4Bo92lG1W/ydBRk9Sjth5uKAYRFiieh
 uU70n8dMcVDNuYKn72AfFR74bGFJNGFVLkM+2OkGEGbCxDsZniLVa1Zo7gTHg5pNBDZD
 7aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eha/TYHzse5/9u/DYqXS1oHE24NywDNmpUOtiVb/8oo=;
 b=m+coYoG+QX3ceD7jGOs47SMQDn6NO7N2S+UCxqDJeTlVo6wEW4CS9SdXjBm/QrzlDU
 y+n8uvGL/3xmqMnrfLsU29e1WLcWxJhYgisUu/LNjROfwV/vEYvwptzzCWOD2hI+l2OP
 a0CKiWvIuugH4dT9/tWRWopJjWyfvNh4MonPV4OgTPE7WtHg8g6q/1x+e8ZMsFbwLwnj
 Bh+NyXjg7LqaUfOuetxwb/TkmamMmkqGtk/VxkoHQ51T85Jcih8qsJpA2UyYeQRkzaN2
 CZMFlBokiNc0hasa/SphtBCv7aaMOaTYQmAwMEobGw7v6GERsf4ukK36ogCZdqEfEzz3
 ZK8w==
X-Gm-Message-State: AOAM530QMQyXqlK1dSUzZPgaETDz5XSykC9N03+0aIMK+Ftc5oFelYWI
 PvDJv9el2J7Hlm3O9/NsPgvyH2TAYCk=
X-Google-Smtp-Source: ABdhPJwsJVVdJTNvl5yfvaBtHBDTkz/2ufjiPROW61adtPaYP3yc7B733m4j8OLo3zWN/i20hS35dg==
X-Received: by 2002:a17:90a:5984:: with SMTP id
 l4mr3751872pji.80.1643988588179; 
 Fri, 04 Feb 2022 07:29:48 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m14sm3135816pfc.170.2022.02.04.07.29.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Feb 2022 07:29:47 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/4] tests/fp: Do not build softfloat3 tests if TCG is disabled
Date: Fri,  4 Feb 2022 16:29:22 +0100
Message-Id: <20220204152924.6253-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204152924.6253-1-f4bug@amsat.org>
References: <20220204152924.6253-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Technically we don't need the TCG accelerator to run the
softfloat3 tests. However it is unlikely an interesting
build combination. Developers using softfloat3 likely use
TCG too. Similarly, developers disabling TCG shouldn't
mind much about softfloat3 tests.

This reduces a non-TCG build by 474 objects!

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/fp/meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 59776a00a7..60843fce85 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -1,3 +1,6 @@
+if 'CONFIG_TCG' not in config_all
+  subdir_done()
+endif
 # There are namespace pollution issues on Windows, due to osdep.h
 # bringing in Windows headers that define a FLOAT128 type.
 if targetos == 'windows'
-- 
2.34.1


