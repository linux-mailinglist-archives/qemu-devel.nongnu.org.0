Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F6B4CEB9B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:03:50 +0100 (CET)
Received: from localhost ([::1]:37240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqY8-0003Gq-QK
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:03:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUj-0000Bk-64
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:18 -0500
Received: from [2a00:1450:4864:20::42b] (port=42765
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUh-0003n1-O3
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:16 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u10so17692652wra.9
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BOg+Rx+mC8Syyjx9fXrlTOUMVFKVJ0SJfpeDXko8AYU=;
 b=i2RKhip5dL54CzkKPW3WAmIEMmfba2u/64E1VheUtJrUSM2BQ/mpWbEW4Hj6u3iEva
 vHiMKXOoX4iQSrszRxqVSwaeC08QottM5BmLvFZRX+bREjeciRbgb+jJhcxb0RLoVq1+
 p/mYZ2IGZRXtxYz7IcuNFGzz7GvyeB15HBC54Ooho4oCY0/yCvE5A+XUSxBIqKoIjX6R
 r0vyeke+u+6rJw/+OeEMvCP+mwzJiBTDkQqndCDQSyLc7jdJY5OYdvTSLgisqoCVJtMG
 OgVTMIqKxzFRn6sOTc+oPf5Q5TYgqrB7vXmX8UpI9rmPIm1c8fYq0AWALlmUDJiXNOK2
 L3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BOg+Rx+mC8Syyjx9fXrlTOUMVFKVJ0SJfpeDXko8AYU=;
 b=N4Qwt0aYUev+SqDhRz86ZujkurzGI6z5C/oINROvuyp2XFL20z+2CksNVGFxQr15Yp
 JSFfYVekHMheWvGF8Wp5kFtyjVawWF42KAXG/0E3l3nISFtWtnE2eNplDnCqGpfzsU1C
 g5HQZKpSejfqzJ1TwbLEBMFIPDP0A6vxJuP1xVoO46wjARHt99qT7igYpkRxfmXXhnJ4
 1uy7/gQT7QfeuVxCq6Cyb4i7cn10litwKMx2mOxbIJJZ7Sgw6tKPduI/mDxk2b+icPSl
 UHLvc800RKQd2plkclnV0VdYWzxPzrnkdLBXIvmdxozUXj4O582JM+HLOWEpYpYw+HJQ
 xLdg==
X-Gm-Message-State: AOAM531fpJCXcdRtmE3uytkQSrp+xa1svlytPWaYWWjYs9CnfA48qAHj
 SfiioxUAGTvM7s1RQDXPpFLdQKIid1c=
X-Google-Smtp-Source: ABdhPJwUZGDPKZygRxm8nTIXkZwcEb18f2OE/9NufciMZJnyj5neCpIYQ+7/azhNMUib6P0jv8u27A==
X-Received: by 2002:adf:f804:0:b0:1f0:326e:5e78 with SMTP id
 s4-20020adff804000000b001f0326e5e78mr5350850wrp.251.1646571614311; 
 Sun, 06 Mar 2022 05:00:14 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4010000000b001f07772457csm5773437wrp.101.2022.03.06.05.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/33] accel/meson: Only build hw virtualization with system
 emulation
Date: Sun,  6 Mar 2022 13:59:29 +0100
Message-Id: <20220306130000.8104-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-3-f4bug@amsat.org>
---
 accel/meson.build | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/accel/meson.build b/accel/meson.build
index dfd808d2c8e..b9a963cf80c 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -2,12 +2,14 @@
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
-subdir('hvf')
-subdir('qtest')
-subdir('kvm')
 subdir('tcg')
-subdir('xen')
-subdir('stubs')
+if have_system
+  subdir('hvf')
+  subdir('qtest')
+  subdir('kvm')
+  subdir('xen')
+  subdir('stubs')
+endif
 
 dummy_ss = ss.source_set()
 dummy_ss.add(files(
-- 
2.35.1


