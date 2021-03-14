Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0C033A83B
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:33:08 +0100 (CET)
Received: from localhost ([::1]:39004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYMF-0002dg-Jj
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGo-0005oW-N8
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:30 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:34586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGn-00087I-0G
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:30 -0400
Received: by mail-qk1-x733.google.com with SMTP id t4so29949619qkp.1
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wW16HYEEbHUJsSDEbNLyjiS39WK8C8tpisXcPK1gkso=;
 b=C/grKP2vV0jCKKC/x583F3iE1k37W7Q9gFZWzG1YAlLpnu4ndiyJ2NgRsvQ9hH4MUl
 mmuWjIzi9ngUeKCs6IswPMD+v92VlteN227WYgHkCpYKYw4XO0NQ8PEMLSq7EfajxTnE
 1IeLWiP2RopbV1Hpu330g44wDuRWaP4toosKmeoNV5jXUkjIJv1qDT4nncU+5LjI+wgx
 6wl+wTpubHS1e7MmqKZr2oZrGglK0F7KE8CAgNLFMLSdDIcghSErFJA94BME3KhKpkzT
 YgVee3pPWQES9tBUjY6leO4ior3G5xwkr4WKIELD9pWm1wvhfyVtlGjnpZPLiWAp6EvC
 /G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wW16HYEEbHUJsSDEbNLyjiS39WK8C8tpisXcPK1gkso=;
 b=dt34InA/O0gcHuLtPEV66Namm4E2zXD2m7edm5WL5h29L59A68Iramwahmy4ZbGph0
 f/io8prlPLZI87xjFpqKVKiW5T674LqLjRF72si7LbPp/Wpe5COgmeFX3kXJrKJgq09w
 Kc7HfI9IAc38aZkCR/uO73UFvJlFLODPtiPU+C1jvZer4DMfYYflhghX8AyXEd3w4crI
 AT6aOB3EUsC99zB++7DFX30Os/LCU3c3qLR6Lo+a3aztU10qAK4xltrA/dinGsTcN2xD
 IEG/dANycs34/IswltXq7ZEoK2s9I3C+GKg5JDZmzyWb4yS8CQblOOIqyRyI74D5FF4A
 Fc7g==
X-Gm-Message-State: AOAM531stgBTcIGo0iau4Tmv9yhIPHGbzqgs/KQ9vj6NXHQyNh/SNY9t
 QILlhea0bXTdNWuD7/G3Qi5vWD3FuMgfqaUH
X-Google-Smtp-Source: ABdhPJxammNS/CgjrG52rHRKw5xt0t71iqRxS9iAH8e6C7G5Mf3Toesz6anFOT2ZQCy0Gd3UslHf2g==
X-Received: by 2002:a37:a913:: with SMTP id s19mr22749659qke.158.1615757248110; 
 Sun, 14 Mar 2021 14:27:28 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/29] meson: Split out tcg/meson.build
Date: Sun, 14 Mar 2021 15:26:56 -0600
Message-Id: <20210314212724.1917075-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: r.bolshakov@yadro.com, j@getutm.app,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build     |  9 ++-------
 tcg/meson.build | 13 +++++++++++++
 2 files changed, 15 insertions(+), 7 deletions(-)
 create mode 100644 tcg/meson.build

diff --git a/meson.build b/meson.build
index a7d2dd429d..742f45c8d8 100644
--- a/meson.build
+++ b/meson.build
@@ -1936,14 +1936,8 @@ specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
 specific_ss.add(files('exec-vary.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
-  'tcg/optimize.c',
-  'tcg/tcg-common.c',
-  'tcg/tcg-op-gvec.c',
-  'tcg/tcg-op-vec.c',
-  'tcg/tcg-op.c',
-  'tcg/tcg.c',
 ))
-specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c', 'tcg/tci.c'))
+specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c'))
 
 subdir('backends')
 subdir('disas')
@@ -1953,6 +1947,7 @@ subdir('net')
 subdir('replay')
 subdir('semihosting')
 subdir('hw')
+subdir('tcg')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
diff --git a/tcg/meson.build b/tcg/meson.build
new file mode 100644
index 0000000000..84064a341e
--- /dev/null
+++ b/tcg/meson.build
@@ -0,0 +1,13 @@
+tcg_ss = ss.source_set()
+
+tcg_ss.add(files(
+  'optimize.c',
+  'tcg.c',
+  'tcg-common.c',
+  'tcg-op.c',
+  'tcg-op-gvec.c',
+  'tcg-op-vec.c',
+))
+tcg_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tci.c'))
+
+specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
-- 
2.25.1


