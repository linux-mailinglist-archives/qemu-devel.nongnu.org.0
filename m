Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEC84B2A8A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:39:04 +0100 (CET)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYwp-0002fm-B9
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:39:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYt7-0008Fu-Sn
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:35:15 -0500
Received: from [2607:f8b0:4864:20::1031] (port=36659
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYt6-0002A8-B0
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:35:13 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso10853324pjd.1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nu4DUrbIWXAn4pHgWXMlADFVEGOdcq7Po3cgGBBjqHs=;
 b=bIc0I20QDdCXOolwUGqkRL2pXbi2lcgaZZoj0y7EErW5mkE7A/ZxqmX5+IbBjkll0j
 1mtznEVeR2Zlr75/Tip4MVZCYDECSpjo8xu9g80qd7evipGjzUF9vgcsvhFP4s8c9wx8
 ULZ0dots7TkX9qKweL+9sObXUnY5s0IPzutA6dv5LdLbSBKEmZUqtkVSHiUqbotdnU25
 zR1ZYD3yqAed0yZofFH+s2dLDiEc6e5pk11vp7GiXFLaAkYORezdaLfbRCS6GDClrg2R
 JJWvupCJpkIdVEIKSLm4rwCq3S9H6UCZfw4j4oFZUkQDpPOWCp2lImehVCBr0ZVTt4Ce
 No4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Nu4DUrbIWXAn4pHgWXMlADFVEGOdcq7Po3cgGBBjqHs=;
 b=VksEd7hXFVK+XRZ0UCpsK5jRUS+/ePGEtT/gIS5LZEA0EPyogaH8xdyKWPn/sNqlDR
 MwXvY+AQrq5tKDsYk3pONdWlijw7RbvKCDqKbkcEZqQmwxKq5x9TQngK1AGXYIh0wkKc
 UutZWq0Tbny0S2TFG/La3RoeP6bhDW4g5NYNRZ4kNByQQei8ROhTZuM0v04Ih7a+84Z6
 WPpc7xV05cF6SrqBoTnRGUhIY0nq1u2zsc5mNuCeyuQNhlDu5gORqXIMwH/WxboVP+Ja
 yYR/h+q50re4DDfGJzji5JpFcOj+WcP7OAvPK1AiubYRwZH460AvP01R30+B25qmdbyz
 ey0Q==
X-Gm-Message-State: AOAM531H00vlwLnpwcAv3V41R293zhsOdjR3KD9mXwN1GLMtvxzwkGe5
 u/lPeHQKxSOMKRZmCVLWWiFFFkWEl+Y=
X-Google-Smtp-Source: ABdhPJxFpzQhLD0l2EE3lWpAYKXFlmXZxoX6KgEuC9OoZDSkXKzNmANPNbHaTxnN9U+W8jy2KdCvQw==
X-Received: by 2002:a17:902:8603:: with SMTP id
 f3mr2433422plo.134.1644597310991; 
 Fri, 11 Feb 2022 08:35:10 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id ip4sm6153574pjb.8.2022.02.11.08.35.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:35:10 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 03/13] tests/fp/berkeley-testfloat-3: Ignore ignored
 #pragma directives
Date: Fri, 11 Feb 2022 17:34:24 +0100
Message-Id: <20220211163434.58423-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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

Since we already use -Wno-unknown-pragmas, we can also use
-Wno-ignored-pragmas. This silences hundred of warnings using
clang 13 on macOS Monterey:

  [409/771] Compiling C object tests/fp/libtestfloat.a.p/berkeley-testfloat-3_source_test_az_f128_rx.c.o
  ../tests/fp/berkeley-testfloat-3/source/test_az_f128_rx.c:49:14: warning: '#pragma FENV_ACCESS' is not supported on this target - ignored [-Wignored-pragmas]
  #pragma STDC FENV_ACCESS ON
               ^
  1 warning generated.

Having:

  $ cc -v
  Apple clang version 13.0.0 (clang-1300.0.29.30)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/fp/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 59776a00a7..5192264a08 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -30,6 +30,7 @@ tfcflags = [
   '-Wno-implicit-fallthrough',
   '-Wno-strict-prototypes',
   '-Wno-unknown-pragmas',
+  '-Wno-ignored-pragmas',
   '-Wno-uninitialized',
   '-Wno-missing-prototypes',
   '-Wno-return-type',
-- 
2.34.1


