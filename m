Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C554B652E33
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:05:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7v1V-00008y-Dy; Wed, 21 Dec 2022 04:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7v1N-00006p-Py
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:04:17 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7v1M-0000F2-0l
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:04:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h7so14239231wrs.6
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zn8RE9bkGb5wvE/Wo/L+tyIK7nNLQkZXvyqS6ZelWWU=;
 b=czyvMP9gAypZgYJcWCiUyA6/8cCj2u8scAP6hZ/Ehrz0LD81NVpiGkybs7SJZbx2nH
 3caOfX+QM4IKzk1F88dYmwlweAN8e7Lofx1DGsVKPL8QMgd+xpjsm+cY/WizhDLl2vsY
 dq4gSft8XsIltnwGsT2Yp0C1/XO+wCl7LL1YJv6fkTajJUKE0vB4KMmoyc6sHAQeBb1c
 4i4Ae+mn/2WV5TBPc4qIOHPykCy/bM+Juqav6xWhtuDi4zuji+zeBLV9Zcp3zvQzOwQF
 qf3T/ymKsYeq9VuN0CJ5s5e1iKStjO5/SufmyYJF7vk7IZM7oO/7iio8atdLdIch0zqD
 hUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zn8RE9bkGb5wvE/Wo/L+tyIK7nNLQkZXvyqS6ZelWWU=;
 b=msiVeJcPZI3/vy1USpIdEPNYNa3u6ZJw/VxmgRA24Cn9n3mSvaSVQmMUH4AY8CS1Ee
 gryLhUU5j06ZREapc5nWloORPYkL4akA1WYz9cjtq6Orpi9zKH03CeVLjOo9MvBTE145
 WzzWPFVGfm7TY/e2SvnyU6r35CYjci1kVAEcaeh0Znep7+1kn7PSNZx6h4VWn74QTpLs
 yjHXFGQ87nsPc8QdIVFuTv/RDJDr6/O3htuEyRomUEuewzRCbwFf/NfpYEcQTXLWbH8p
 HpMXCDj4hddH0qClpM5ffmXz5+XGVHSBR2WVhQDSPzZv5AHOnf0wywG2tC5y0M/dcj+I
 qC3g==
X-Gm-Message-State: AFqh2kpzokI9zkc6uRYEXZ0ANQ+EuMkVj/uP5mGYN90rwgdtV7rPfNxm
 1SppqJTm7VWH7TETvCbUq2/zXw==
X-Google-Smtp-Source: AMrXdXt5bKAhfAd0jOSAvPxtqsXFaAV/8Xhv+D1tRLrT4j3D1OhBQIY07OK8RSoyWyadI2dboCk7uA==
X-Received: by 2002:adf:e383:0:b0:242:3cb6:36b8 with SMTP id
 e3-20020adfe383000000b002423cb636b8mr651289wrm.44.1671613454690; 
 Wed, 21 Dec 2022 01:04:14 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4ad2000000b002365cd93d05sm14829885wrs.102.2022.12.21.01.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 01:04:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 430851FFBC;
 Wed, 21 Dec 2022 09:04:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, fam@euphon.net,
 berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 4/6] tests/tcg: fix unused variable in linux-test
Date: Wed, 21 Dec 2022 09:04:09 +0000
Message-Id: <20221221090411.1995037-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221090411.1995037-1-alex.bennee@linaro.org>
References: <20221221090411.1995037-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The latest hexagon compiler picks up that we never consume wcount.
Given the name of the #define that rcount checks against is WCOUNT_MAX
I figured the check just got missed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/linux/linux-test.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/linux/linux-test.c b/tests/tcg/multiarch/linux/linux-test.c
index 5a2a4f2258..64f57cb287 100644
--- a/tests/tcg/multiarch/linux/linux-test.c
+++ b/tests/tcg/multiarch/linux/linux-test.c
@@ -354,13 +354,17 @@ static void test_pipe(void)
             if (FD_ISSET(fds[0], &rfds)) {
                 chk_error(read(fds[0], &ch, 1));
                 rcount++;
-                if (rcount >= WCOUNT_MAX)
+                if (rcount >= WCOUNT_MAX) {
                     break;
+                }
             }
             if (FD_ISSET(fds[1], &wfds)) {
                 ch = 'a';
                 chk_error(write(fds[1], &ch, 1));
                 wcount++;
+                if (wcount >= WCOUNT_MAX) {
+                    break;
+                }
             }
         }
     }
-- 
2.34.1


