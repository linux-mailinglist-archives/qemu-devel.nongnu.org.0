Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26286461CA2
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:20:55 +0100 (CET)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkKk-0000OJ-9Q
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:20:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF4-0002Ua-N5
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:02 -0500
Received: from [2a00:1450:4864:20::432] (port=35731
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF1-0001Ty-MC
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:02 -0500
Received: by mail-wr1-x432.google.com with SMTP id i5so38418167wrb.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pSXjooYIqUSopMaI8U32omJPUXeLHjnCad+z87RE0LI=;
 b=spHcISJNgE1rnTte1rq7lSQ+sM6M4Nb393v/D9F3BEPxcq0C3zRr1og1AgP6pE3jXm
 dMqlOpkYDdSAU0E9BT76saS8VIQQV7Pn4bCg/SWe8vzKO2hS17nTKoykjDzzigB5wSYd
 4ZCUz9i7rjkZsqEBriuHXzfGvYcf450KLL5v4LCJz1utsq+S1y+uFGWSYi/T6JPH71nR
 S/R6jZtkIYjBI48dVeHZX7NHl7qwFGXS/dB3Oy21ph7g+g9lNSq+szsYHvsAzZHU2Nca
 Tzgc8b1UTnU6hN2ECC5aGXhqq6AgIV3UP2wAlhvJrIGxSvsNVctm/+qgQ0PTgzwg5leH
 A0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pSXjooYIqUSopMaI8U32omJPUXeLHjnCad+z87RE0LI=;
 b=dIjJ4oP+WoHSFmIFH1URFSdkImfS1/qRiG7+YzrCEUuedDdgPmq9c41vUCeGcB3TJA
 kHkk94u1ynn2wgcl+BAjkrY1XHA5y2wmXXAzO2TYtAVn8wKoLgVlXzlpZnyxt/2inzTN
 IC2IZ84cnoEDsQnhHSAR0ldks4n/BOvfBetoDhpUCy0/FfIOTsamPT6B/juCJhov28Q6
 TOYSVh6pz70bHpgbO6v+VHfpiYumhRb7f6FbCbHRcI25JhDjd5BSu2SvflCwgKqRhRVV
 a/50KZchpb8a1R5eCH1DrLEfKAUojK00c3wBLo+eZhTR7EutaMcU+sK7T3urvNS608k5
 4NJw==
X-Gm-Message-State: AOAM532BXvFA3G+W0WCVcbflkj4cQfMoRnGgdg0cFB4HJhJRBAmDOgCj
 y2IwDMBrnj7rGuD3UKyYRT4svg==
X-Google-Smtp-Source: ABdhPJwsPbmHlkRscgUJqrFcQobUB5eXV/fEJ1DCdO1qrf4gbLwxTv3k/KznNWgUrQTkwKBIcLD8ow==
X-Received: by 2002:a5d:5151:: with SMTP id u17mr36371708wrt.126.1638206095924; 
 Mon, 29 Nov 2021 09:14:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l5sm17256249wrs.59.2021.11.29.09.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 09:14:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 166831FF9A;
 Mon, 29 Nov 2021 17:14:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	peter.maydell@linaro.org
Subject: [PULL 3/8] tests/avocado: fix tcg_plugin mem access count test
Date: Mon, 29 Nov 2021 17:14:44 +0000
Message-Id: <20211129171449.4176301-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129171449.4176301-1-alex.bennee@linaro.org>
References: <20211129171449.4176301-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we cleaned up argument handling the test was missed.

Fixes: 5ae589faad ("tests/plugins/mem: introduce "track" arg and make args not positional")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211129140932.4115115-4-alex.bennee@linaro.org>

diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index 9ca1515c3b..642d2e49e3 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -131,7 +131,7 @@ def test_aarch64_virt_mem_icount(self):
                                                  suffix=".log")
 
         self.run_vm(kernel_path, kernel_command_line,
-                    "tests/plugin/libmem.so,arg=both", plugin_log.name,
+                    "tests/plugin/libmem.so,inline=true,callback=true", plugin_log.name,
                     console_pattern,
                     args=('-icount', 'shift=1'))
 
-- 
2.30.2


