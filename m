Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623904CEE82
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:31:11 +0100 (CET)
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0LG-0002H0-6E
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:31:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09h-0000ib-5A; Sun, 06 Mar 2022 18:19:13 -0500
Received: from [2a00:1450:4864:20::32b] (port=53009
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09f-0007T4-MU; Sun, 06 Mar 2022 18:19:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id r65so8197283wma.2;
 Sun, 06 Mar 2022 15:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/7dyfQ+q13OVQN73h3YfXem2xDDBUD4YaJugztqF7Q=;
 b=bOEU7lD256+f4WT3ERWIvQPJKpvJ5Y/X5SjpUdN2JucmyBt/s3WsWdzqBpw826Z2Dw
 +mFsukII2c71MJs9/ju60AhwX6c9wE/bdT1PM34AZ2l/cuAsMji3de8CAQM6k/ueVDQa
 dFgiuQ3s1Y5F2ogcnSRBj0v+dr/co5DKdsZwgIs0JBUqWKC9gsv2XE69onvUn0o/u0x2
 4p/ChhemMoy2zs5+7unwKUcPWTZuEGOp2V30WBI0qmyNKBsZEgl0sWOn1DNVfXx0n02o
 bKcbFaXKIfDr47Y3SWoMyrX4K03Y9z6JHHI+QRVkpEv7pKxUE2H1HYmNNRDGWRcQnCBQ
 S5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/7dyfQ+q13OVQN73h3YfXem2xDDBUD4YaJugztqF7Q=;
 b=fLUDTYX0mxtKVV8j2inktngkoF6xQDhz4eK4IsxwaySHFlxCwNb0AsBdn+4hwnS86o
 ACkHH83iBNK5JMndqSfiN5pujNlqXztugCB/0X0d9w2NL4PvJYWAZJZYKe677B7dS3TI
 necg08Cl3prESM1vyT/kUUd89aQ0krukP7OQ6diIRoQsKUTMlRi9ZcadwNYAccB1mzMx
 guwTGYV65MvthY+AmZiL9yIKskEiCG+T1E0h4wX9Rsb/fF1tkStIBlZNHn0PhdF2KY4T
 4LYUndBBjqesee+Pxo36q2THoYkVURhcUZfQmLqXXsV0SvtIJtTetv1BYDR27wPEfg11
 Hlbg==
X-Gm-Message-State: AOAM530sJxz/ivdrHWGic1AM2OHl9wb/PU0rLwR7OE+ucRmXRs6AZCgV
 w0KW5TA9pQvqFx8SuelusIs7+W4cBXM=
X-Google-Smtp-Source: ABdhPJxW2G7iCog24saAI7iCmSuUziLH4TaNhQoKCiovACEDGNf3u0rdeK0l2jgedUx+MmSra6RSFg==
X-Received: by 2002:a05:600c:643:b0:389:9596:4d27 with SMTP id
 p3-20020a05600c064300b0038995964d27mr6418885wmm.194.1646608749847; 
 Sun, 06 Mar 2022 15:19:09 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056000128100b001f04a47762dsm9661248wrx.109.2022.03.06.15.19.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:19:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 14/22] meson: Resolve the entitlement.sh script once for
 good
Date: Mon,  7 Mar 2022 00:17:45 +0100
Message-Id: <20220306231753.50277-15-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit 235b523dba ("meson: Use find_program() to resolve the
entitlement.sh script") didn't correctly fixed the issue, as
the script is still resolved for each target. Move the check
earlier, before processing each target.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b6e30d7463..8ca2b7c8c2 100644
--- a/meson.build
+++ b/meson.build
@@ -3063,6 +3063,10 @@ common_all = static_library('common',
 
 feature_to_c = find_program('scripts/feature_to_c.sh')
 
+if targetos == 'darwin'
+  entitlement = find_program('scripts/entitlement.sh')
+endif
+
 emulators = {}
 foreach target : target_dirs
   config_target = config_target_mak[target]
@@ -3220,7 +3224,6 @@ foreach target : target_dirs
         install_input += meson.current_source_dir() / entitlements
       endif
 
-      entitlement = find_program('scripts/entitlement.sh')
       emulators += {exe['name'] : custom_target(exe['name'],
                    input: build_input,
                    output: exe['name'],
-- 
2.34.1


