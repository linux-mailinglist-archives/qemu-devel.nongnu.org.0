Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003FC4B73F7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:07:04 +0100 (CET)
Received: from localhost ([::1]:45428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1I6-0002Lh-UF
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:07:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1D2-0004tG-61
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:48 -0500
Received: from [2607:f8b0:4864:20::62a] (port=45805
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Cw-0007VN-ML
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:47 -0500
Received: by mail-pl1-x62a.google.com with SMTP id w20so13537377plq.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MksClFfWuwT461ko/karqF5I+zAWkXZ4G+9GZEuB/6s=;
 b=qiCzRSQGPBQa1BD+A2xdeRAbGmmq4l9eFvMH9PVSzGajHlPlXmwXBAx6oX0YcXoGkm
 qdfP2vrideCYokPoq2iXexwnr85TRT9ZQkn5bjpAH59bcOgW4F5YlqsSP8qicVEAhJ7Y
 WApE35yEyv2v/uoX7Ahzs/LepS28AgoDW6zJomKL7RKqS93nJr0mBQa9yPqoY+K7Khfr
 KDZf1aeJPBS3yTFpnYX1Zfn/1cTrSn4zN+oM4nygN9Qsm1F7BP8tSa/XGM4RhMzhwMyl
 OADaa4Jlf8odcQuTFJSXqPH8baj81Soi+WhwVDBk3D3ZhUmrBiM4biPfIBbrKaYZ6N4b
 gZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MksClFfWuwT461ko/karqF5I+zAWkXZ4G+9GZEuB/6s=;
 b=22lIrDd0ExQCzpHtfW+G12itx5AhegMIovthqbAfceJEcvTOOJWxgIPZSE8X6cU6gm
 aLTqIVq4mxBA5gdevguUBNfdy6YHgit0I3Rob7qTVRoRsFIgXKRzOwjhqHE8/oHjI1h8
 yt+TOHOt+2G73C3AC1pfEZ9XdS9qxIQ+BHAWLQAvXnFBRjy6LMxWS8LUcc556LWdU+L8
 kg8deis4QTbPLFjmEEluYWKXEn0aCpKJ8DyBo6jmWKjpmBwWOL9W/y6D7CP4lWRVl/L7
 ZeP1v9X/au7NVAmin2C5iDPJiiLWg9We7tqM2rEy2KH9P3RFUG6pNfNFEc48yYx4LbLu
 ZM4Q==
X-Gm-Message-State: AOAM5331YzYt/asS8Gh8QcXcdVkpcu4xuMrfMcAaGpED/6zTcAhSe6tD
 haLq/rF+UUiAFW16+ys+CZuGu3FujCo=
X-Google-Smtp-Source: ABdhPJw5F/K/KKt4B3f+sm29kXbYt4uf69VgD5dMEuzVhS1gq4dpdJv6FXoRRgqvha+v3GzflIy+Kw==
X-Received: by 2002:a17:902:f60c:: with SMTP id
 n12mr5020611plg.155.1644944497638; 
 Tue, 15 Feb 2022 09:01:37 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id i3sm3151099pgq.65.2022.02.15.09.01.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 09:01:37 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 3/8] meson: Resolve the entitlement.sh script once for good
Date: Tue, 15 Feb 2022 18:01:01 +0100
Message-Id: <20220215170106.95848-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215170106.95848-1-f4bug@amsat.org>
References: <20220215170106.95848-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Commit 235b523dba ("meson: Use find_program() to resolve the
entitlement.sh script") didn't correctly fixed the issue, as
the script is still resolved for each target. Move the check
earlier, before processing each target.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index df25e7a5e7..287be51ff2 100644
--- a/meson.build
+++ b/meson.build
@@ -2894,6 +2894,10 @@ common_all = static_library('common',
 
 feature_to_c = find_program('scripts/feature_to_c.sh')
 
+if targetos == 'darwin'
+  entitlement = find_program('scripts/entitlement.sh')
+endif
+
 emulators = {}
 foreach target : target_dirs
   config_target = config_target_mak[target]
@@ -3051,7 +3055,6 @@ foreach target : target_dirs
         install_input += meson.current_source_dir() / entitlements
       endif
 
-      entitlement = find_program('scripts/entitlement.sh')
       emulators += {exe['name'] : custom_target(exe['name'],
                    input: build_input,
                    output: exe['name'],
-- 
2.34.1


