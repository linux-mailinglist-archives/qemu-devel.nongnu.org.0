Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B8E652D66
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tkq-00070d-TF; Wed, 21 Dec 2022 02:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tkg-0006zt-Ao
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:58 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tke-00048m-Oj
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:58 -0500
Received: by mail-wr1-x429.google.com with SMTP id w15so14036819wrl.9
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zn8RE9bkGb5wvE/Wo/L+tyIK7nNLQkZXvyqS6ZelWWU=;
 b=icPi5z68TEE0JNAzOOB4+LLMgx+zGcT79ND3LTALsFoNIdZ4Iy2+rJGJOOLVJkSDYz
 v4prhhnOzfbudk+j5fXdwMFIhOW6X8fs1VQOpAc4Zl6SdJEd+RmZ3eQ/4a/hxlQovaQn
 FFGnh1EtI2nx08gfnFIqoStrjbDlFMs4qav1ig4mBlueYMHCc9X+QqdRMmLX4WRYGh2d
 POiRYLq75yCrzj4bxc+q1sLzaLK0UA5ACVfLhL5QLCG00yGE0+W4+roMrHX52wQwrh+1
 Og4ajYVgV1m4JaDChx1a39MwCEBhMW4KrPuWu/dYW7h8Gb8DKODNVET+STKLDpA1lz8y
 vMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zn8RE9bkGb5wvE/Wo/L+tyIK7nNLQkZXvyqS6ZelWWU=;
 b=JclC1VPOsombZdTdzKnaz6/qmjoRd4X+5NYhhBtZeAvD7vBgi+adSIO6+HAEI0NfwF
 00JWmBlPWfDCb506T6mzmuVvUDb6+3e2EobvbMksDvnFYjAmqqEPWnxydf1l50uC6B4W
 HrL8KdLd1z4ihRAUuQcZeBBaaODDYiRt0LduNFzG5bf0YE/0dRPxOcN0mlw5QJxk6lVa
 MQ/lF4XiKWIu9eUo+iCJmT/2vrZny7pEqNih5+Og1sBNdBX7+sFcnnGgUtELF6WVTUn/
 P9Rtr+3eysiU03/rQJs9cWIo1e+4nOTJSitMUmfHmvRyEAd6+OlFgiavj4xa7anoFS5f
 3UcQ==
X-Gm-Message-State: AFqh2krsv3szRb2Eb5UeZTpa2YWYWj81l9WILzTZsk0X8uqieBg7bqg7
 Smxb3bAggGBE6Ek+/DlYSI/3tpKP+GJGE25T
X-Google-Smtp-Source: AMrXdXuEycVc7JxgwYb4+fGN3jVGPL3mz88YpD2lHMc+DZ9W9B4oMBHS02JBqi9S1bwW/V7vApv6IQ==
X-Received: by 2002:adf:eb4f:0:b0:242:659c:dc7 with SMTP id
 u15-20020adfeb4f000000b00242659c0dc7mr394592wrn.61.1671608575237; 
 Tue, 20 Dec 2022 23:42:55 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600018cc00b002423edd7e50sm14307188wrq.32.2022.12.20.23.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 23:42:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE7701FFBC;
 Wed, 21 Dec 2022 07:42:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [[PATCH]--edit 4/6] tests/tcg: fix unused variable in linux-test
Date: Wed, 21 Dec 2022 07:42:50 +0000
Message-Id: <20221221074252.1962896-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221074252.1962896-1-alex.bennee@linaro.org>
References: <20221221074252.1962896-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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


