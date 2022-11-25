Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E30A6387E3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 11:51:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyWHa-0004yM-TY; Fri, 25 Nov 2022 05:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyWHX-0004xm-AJ
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:50:07 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyWHU-0004PP-Ux
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:50:06 -0500
Received: by mail-pl1-x62a.google.com with SMTP id y4so3673969plb.2
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ngKkBiobR4LuQBHuAmb4DYyLhbK+9nXlqAS9yJFgS4o=;
 b=mrOoDt1RpGlzpWbLqvqS35CMkVjWydL+dUfc0OjokBmyJIAOMPLHVTnn5rHFXn8ik8
 WXj3GhCTDPSFASlIxNRfG1XDo4x2Tc73pFhf0/QavPiSnKDkKnlRyaFpWdfF+rFi3cqt
 BZSTcwt7DazI4ldkQ/YqctpDXn8Z3UYkUTftdP1GnF5V+hwNiDcPWy0FnHf6tmTlrWEb
 8L6LBuIHGnCAZ81QGdkmhf3+cIiFsUUmySModPx1Y/4aDxqH+PCwuvFZZ8SZf3kwuH1A
 rHb2gn6080bZBwAtHxgVmFOIVOY9dngnGzAQ8g6g2X6Z6dt1iHeg04QbqkZzuNfr0cWj
 4vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ngKkBiobR4LuQBHuAmb4DYyLhbK+9nXlqAS9yJFgS4o=;
 b=Ubt+dd2404OU9Wp6XjhuHsjnmWrfc+z8w2ve14zVPWxcIaJ/T4UHqOM1dqN2xlTdw9
 YAZZWCD/KD9EExevio4gHSHAGKM8Cb4ei49RmOto6gko2lMSR6zl06e4s7fELQXrhPfg
 dLckPcfXCaVFIVFF2qeFXXBJUyJ9AS0kQxORtd4WB5ftLoFmyNnMCYMACwTaPjRXFAQ9
 +axM/rbsZ50mR1Fq3zzbqZ1Z76TVfDhaBNOqj//XNmaSb0KP1CukIDEOF6XLkm/L4Ooe
 ofz09vSaZk/xn834lnRBFDor+De9bpXnsJxP3CWfFmLYjNjPLUtqCGpyF6Aok43JTaoT
 tSGQ==
X-Gm-Message-State: ANoB5plqeqXvkDUDbAwVfOgDgLoBYk90K2Knwj1hnagqb2gt2FN+tOk6
 n4aT+LRxrLTD7rnGpgTGEbRrvUrWp6k=
X-Google-Smtp-Source: AA0mqf6ghYkElbAZ0tpN0mB5NKN0BVyWoQOXNn8zw9O2ggLT2WKDBL9lPIqPEdgyL/io0x0GB/sEJg==
X-Received: by 2002:a17:902:f641:b0:181:b25e:e7bc with SMTP id
 m1-20020a170902f64100b00181b25ee7bcmr18721589plg.46.1669373403042; 
 Fri, 25 Nov 2022 02:50:03 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170902da8700b00188f7ad561asm3055966plx.249.2022.11.25.02.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:50:02 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 3/4] .gitlab-ci.d/windows.yml: Exclude qTests from 64-bit CI
 job for now
Date: Fri, 25 Nov 2022 18:49:50 +0800
Message-Id: <20221125104951.3169611-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125104951.3169611-1-bmeng.cn@gmail.com>
References: <20221125104951.3169611-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

qTests don't run successfully with "--without-default-devices",
so let's exclude the qtests from CI for now.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 .gitlab-ci.d/windows.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index c6de65c784..fce9a02387 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -73,7 +73,9 @@ msys2-64bit:
   - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
       --enable-capstone --without-default-devices'
   - ..\msys64\usr\bin\bash -lc 'make'
-  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
+  # qTests don't run successfully with "--without-default-devices",
+  # so let's exclude the qtests from CI for now.
+  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=\"--no-suite qtest\" || { cat meson-logs/testlog.txt; exit 1; } ;'
 
 msys2-32bit:
   extends: .shared_msys2_builder
-- 
2.34.1


