Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFF4617D9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:18:34 +0100 (CET)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhUH-0005W0-0m
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:18:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLi-0001BW-QH
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:42 -0500
Received: from [2a00:1450:4864:20::42f] (port=40936
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLd-0006Ty-31
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t9so20122477wrx.7
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBnkomQJkxbzzpqUI0StuDJRpi3gzRMQ5u3DHeZjNiQ=;
 b=nxyGWxtk/O1klH5UIHZvtFe9ZKeXj+mHD+0nrRvVgeyWhJELmQNnnuZVDwyhXid3MD
 Vuch5psX6dmXOyoD/PeEZPySI86MI1Gvr0Dajx0LEdOHNm54FUl08+i+JDkIORHxx5Bs
 Y8+bTl8UF6xTC2gaY965Z17QUezOxCv4n72O9TU8RhkZdYnogq1aKrUm4Qmkkb69Psko
 8OiDp08xjBrMxkSlOyPto1j2yeVjtWZ6Ew8TFrlB6Thy9/PTwGOEJJMpBI9R+rMlr6NL
 xxVREAr3kmMn9UNSj9McTNH+f2df2s6nHKwlYIN+p+Ck22JHuiU6icPW3DAyDvAlIV7i
 Ybnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBnkomQJkxbzzpqUI0StuDJRpi3gzRMQ5u3DHeZjNiQ=;
 b=W0gtoEKXyGmYW2qsWKGk2NwCza+JkK3OqeVaWVl5cm1jhKOw5Okc41OBJLfxRyAkO4
 w8UEqsvnQS+yIRfvUcCDqM49z9w7pOIx/tYB8SiyAAd/z/Ald+64Bn+x3KkLOTOVYI8n
 WHXS3JKZT7ez5l2kKpAKjVxvEKcnQwup+Mcm4C3gEiX+EEcpWcnM72RIEEDMA670QcY/
 T40/6ogDrSDlrgxj3RkobZ05MV7d7TCL+S3gfUTMfi54qsCQPQdmEMLLgRDsDSHGDNTQ
 Uo5zYnLrx6XYTes8TYO59zif97TpEP/dL2/zpe5qZ48EkXGrXax1HHfB0VTjhjnR1SgL
 plGQ==
X-Gm-Message-State: AOAM5302yGqzjaBWa4flY6P2ALzF2tvEknLT0l+iqeWIP9pDm8f1EW/5
 ccJZoF19/+dFD8tZdADI+nfMhw==
X-Google-Smtp-Source: ABdhPJwFojI9lEDiTTrHKUixFph7LMHXLxw28NwQZbNSFOg2Y6+pjeiEDPiTg//nmHOkJwA2y+XJ9w==
X-Received: by 2002:a5d:52c2:: with SMTP id r2mr34699012wrv.548.1638194975597; 
 Mon, 29 Nov 2021 06:09:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y7sm13646852wrw.55.2021.11.29.06.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 06:09:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4AF141FF9B;
 Mon, 29 Nov 2021 14:09:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/8] plugins/meson.build: fix linker issue with weird paths
Date: Mon, 29 Nov 2021 14:09:28 +0000
Message-Id: <20211129140932.4115115-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129140932.4115115-1-alex.bennee@linaro.org>
References: <20211129140932.4115115-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Stefan Weil <sw@weilnetz.de>,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Stefan Weil <sw@weilnetz.de>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/712
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211123205729.2205806-5-alex.bennee@linaro.org>
---
 plugins/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/plugins/meson.build b/plugins/meson.build
index aeb386ebae..b3de57853b 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -2,9 +2,9 @@ plugin_ldflags = []
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
   if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-    plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.project_build_root() / 'qemu-plugins-ld.symbols')]
+    plugin_ldflags = ['-Wl,--dynamic-list=qemu-plugins-ld.symbols']
   elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-    plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.project_build_root() / 'qemu-plugins-ld64.symbols')]
+    plugin_ldflags = ['-Wl,-exported_symbols_list,qemu-plugins-ld64.symbols']
   endif
 endif
 
-- 
2.30.2


