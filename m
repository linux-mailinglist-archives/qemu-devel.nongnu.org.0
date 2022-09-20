Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347825BEF04
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:15:02 +0200 (CEST)
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaka4-0001Zm-Q9
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqT-0000KD-01
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqR-0000eJ-9k
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:40 -0400
Received: by mail-ej1-x62a.google.com with SMTP id 13so7827874ejn.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Xn9EeJ1e0W9n/ww6L6+IOrL4d7Yg4BtDuGfce46InmQ=;
 b=MuoshtcmoQci0CvXVYKhCnLNK/M3BqwOyaRpMkviKxjG0X5hWeBBjQFDwVCksMh+XV
 TH6CrdigTMQnp1DqnSVmPP8jg4Su5MsKEAFP2FK3514hMn475AhOVwVb3x1xfnn5HCL2
 GXZ1OlDC44PPrAyOFDBM9qADPwkFZI2OerRBR+T+18vsA/UUxvqZG0cus+E05gnR7AIZ
 /oJJLaFYispqt6FrsbSeOigmPhNxnL5VFK0nXKC3Y74CPeeWA3HDAm6hSSw1Zux74iaM
 i1T8AbTfpjmFga1QRGz2oWVGRESHetSj2zfsjyqnRMabdl0nZB3NVeV04/F8BbNLfIm1
 LcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Xn9EeJ1e0W9n/ww6L6+IOrL4d7Yg4BtDuGfce46InmQ=;
 b=No5F8dOrpS8od+I2yp6YtM81QB16fqufCgTEpbZGBS48son4oRr/zOd+pcMVMYZCnB
 P6SY6b4fB745olfT1uZAeJA6QyqRCl6w+KE67U7QPDMYRvklC0DwElLnafg2j9M6o/kk
 SmiKQvZTKZOvjCQjkGRgoGv5g1SNIZ5+vxMS/gaKcpIzwsPp6IS/Al8Tq/E0QRNSFINq
 YybalJZb4dJ+uoANT6jinbzjEOn0ilyvRKU85bqTJh1HP4GJSBvwEKOQuBJUJpMPt3iC
 0XGad+NQ2e2PetWnrDaPy+QRGKot2Hd9/NcWKyyNBaBQis4iRS6sEQyPIF7PyDPvP9V9
 LHOA==
X-Gm-Message-State: ACrzQf0InMz/37PDnuB4ERnolt9Sl7sS2JTNhihzlWn5/lqk1xgI9HWV
 hgGEvP7B/p1QaARlaMWdI57kEA==
X-Google-Smtp-Source: AMsMyM6Mi/Sd1uP/R4BOM0TcnPaZ60YDzhn2X+JTvF1MmDz3VI3S3hCOSDToxILMu3NYaJ8cuCr0qQ==
X-Received: by 2002:a17:907:2d2a:b0:77e:def7:65e9 with SMTP id
 gs42-20020a1709072d2a00b0077edef765e9mr17615721ejc.85.1663694137714; 
 Tue, 20 Sep 2022 10:15:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a1709062db100b0077f15e98256sm103221eji.203.2022.09.20.10.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CCC6B1FFB8;
 Tue, 20 Sep 2022 18:15:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 01/30] gitlab: reduce targets in cross_user_build_job
Date: Tue, 20 Sep 2022 18:15:04 +0100
Message-Id: <20220920171533.1098094-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We already limit the scope of the cross system build to reduce the
cross build times. With the recent addition of more targets we are
also running into timeout issues for some of the cross user builds.

I've selected a few of those linux-user targets which are less likely
to be in common use as distros don't have pre-built rootfs for them.
I've also added the same CROSS_SKIP_TARGETS variable as is
occasionally used to further limit cross system builds.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-2-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 28b2142ec2..5e8892fd49 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -46,5 +46,8 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-system
+        --disable-system --target-list-exclude="aarch64_be-linux-user
+          alpha-linux-user cris-linux-user m68k-linux-user microblazeel-linux-user
+          nios2-linux-user or1k-linux-user ppc-linux-user sparc-linux-user
+          xtensa-linux-user $CROSS_SKIP_TARGETS"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
-- 
2.34.1


