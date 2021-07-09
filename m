Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6985A3C2601
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:32:44 +0200 (CEST)
Received: from localhost ([::1]:60764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rYZ-0007Wt-GF
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWG-0004ht-5Z
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:21 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWE-0005Xh-3o
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so25877039wmq.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kB5ETN9vQppRzYuxebDR/QhiOVXaNnIzza2HWujbjOw=;
 b=zO9CVSQbA1BVwyAJmATTH9PfSgtw/gnATy4Atw2RPRXNKQuNPGBASb3PFlIB3n7FHD
 +pZD/Pb4QZHNzvI/etfJRI2KyyBFKcFnSR1rnkeENTXo1i8ctqTOh74IDaeSfB/KojxA
 uaiaXm+a+MxjRI/suGCwpToXbhshvmp6BYjUVM8tmCGm3t/Q8Bbk6ERj1sSEAebxrZcu
 ehZnT2vydqNcD4pwZu4tTM6T2nvEmOlLIev/zhSiWc5omLcbtGnuclxFG9xMcgStcUyD
 BJIeFUIjg6O+n4aRg2+G7bc/8ltAck4pafhW0ZnS5pT/OpCEKMvS3l4dtFiqkFvGkh9m
 g9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kB5ETN9vQppRzYuxebDR/QhiOVXaNnIzza2HWujbjOw=;
 b=kF9KZOiYPCQx2qSoxwdm0pffKu45PiF/JP2GIniAfZGX58mlgOCl8GWhUyPY0oTHla
 AY+WxZXAR5vRF+9K/H9ap1OX6+smonQndwrKQqIYU02isJ2QUAbtQ0xQl5NWIEL63H59
 j7Rc5H+UO3Q73rSYFzWvERTlx5vpWO8gk3mSYH4b1GPJCX92Wz4bgBlpozDJDjiEohyj
 baVCvhVoqCllORH84GMFPOspMCllS0tF6nW+qb9un5vQDTYacCQIRq1bw8oZDOAeh4a8
 UG3JYEWFGjP6I/SAbcgCHpuXMrfYe3Q+Nv6k9fBNTrFmYhI2A99SRDkHYjTu0+bP4Y1c
 nHhg==
X-Gm-Message-State: AOAM531LKeaEm9xn7hErYDSntPrnzc5+Kfc3Igo0MyYwtSmgxCUr5cTe
 6FZ/gXG/TMJZTVlW3LHR8k9t5A==
X-Google-Smtp-Source: ABdhPJx9Qff7I7+8/ffO0gSN7r/cqnNuaXKKnu1zOB/X+cmyF9Bck4d79vi1zRwg6DkZqQ3IRPv18A==
X-Received: by 2002:a1c:4d0b:: with SMTP id o11mr40261665wmh.36.1625841016629; 
 Fri, 09 Jul 2021 07:30:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r15sm11647557wmq.15.2021.07.09.07.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 171D41FF92;
 Fri,  9 Jul 2021 15:30:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/40] build: validate that system capstone works before
 using it
Date: Fri,  9 Jul 2021 15:29:31 +0100
Message-Id: <20210709143005.1554-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Some versions of capstone have shipped a broken pkg-config file which
puts the -I path without the trailing '/capstone' suffix. This breaks
the ability to "#include <capstone.h>". Upstream and most distros have
fixed this, but a few stragglers remain, notably FreeBSD.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210625172211.451010-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v3
  - fix double it.
---
 meson.build | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meson.build b/meson.build
index 7e12de01be..ff7a9f8b4f 100644
--- a/meson.build
+++ b/meson.build
@@ -1641,6 +1641,19 @@ if capstone_opt in ['enabled', 'auto', 'system']
                         kwargs: static_kwargs, method: 'pkg-config',
                         required: capstone_opt == 'system' or
                                   capstone_opt == 'enabled' and not have_internal)
+
+  # Some versions of capstone have broken pkg-config file
+  # that reports a wrong -I path, causing the #include to
+  # fail later. If the system has such a broken version
+  # do not use it.
+  if capstone.found() and not cc.compiles('#include <capstone.h>',
+                                          dependencies: [capstone])
+    capstone = not_found
+    if capstone_opt == 'system'
+      error('system capstone requested, it does not appear to work')
+    endif
+  endif
+
   if capstone.found()
     capstone_opt = 'system'
   elif have_internal
-- 
2.20.1


