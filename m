Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D0C461804
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:24:14 +0100 (CET)
Received: from localhost ([::1]:40286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhZl-0004MK-Pv
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:24:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLk-0001Hc-Fi
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:44 -0500
Received: from [2a00:1450:4864:20::32c] (port=38840
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLh-0006UV-2a
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso16924038wms.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ouEp36joxnPAP6ToPpz7+NhGlX24uSLIBMD0iYKDcl0=;
 b=kYQG87QHMlgrKeUfuE59nUCz0/d/vQyrkkFElPWhW1yUCLwtnGwjHKVprUpZKQWqp1
 dUmCd48nyt7P0lERtCw9MP07OKxJLeT9NToKjLr1XkGIhzcn0fTW6ra1OWfUhByT5jtI
 1cYEOaqEzA/czAgGHTAPrjcije0y8sqfoQhc84E3ZqWj5SLkglcyPROyFXjqmUCGsG8V
 w35rc7h2ChfnZbpUt5OmIDzhDIZIDFnq/XrgmivGFESJlPVeZKFH/BWrIxQXnBQ/fbBx
 SqAH3t+dc8J5lHi9ijGDXg2KYnu754iLXDccm4bwKu+hvN0LnDcl8z6puFYcXysI4roB
 dcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ouEp36joxnPAP6ToPpz7+NhGlX24uSLIBMD0iYKDcl0=;
 b=nEX3SoppvmLi5ggm08PqUMz8j/vw8YgBKoZNYH8HrDBeUGx/adT7o5dA0QTfOx5X82
 9OMjRltKLS6lSXHKt3kv399T0yFUiYPJRtnzTmWPFGEvAwMzmW+f8/Nk27PRtg8NH2MH
 Z/Qt7VkpbJ86RFy4T+A7eSOVyC0w2S+wBrgO6MGbiTAkYAxlVTgfTN/BxvpVCsBGw4Df
 XmTIPQ8HoVW9zH3CcrY8nPqzaT+Dme9DXrBmY/mpQgBwaWMS3TP4BEQZRK9EvEVaVnxT
 aaplZxY4St1neyX6ra9OxoK+fWU1mal0qQeE8pB7eU5ygu0olDKaw7BMcIm/eqTKYqus
 o1pQ==
X-Gm-Message-State: AOAM532d6J012i42DimmfqABjemPSfmvzOV7TLpOtNM15zRN7Zv4+vZ8
 svcP9WUY2DOchAX1+PEfWFr5Gg==
X-Google-Smtp-Source: ABdhPJxF8RYdZRo+FTnHzyp1+NvWWpI3+hK0EYkvnyYETKodHytyiF69FMah+yB9exxYTs+5EKyW+g==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr35829986wmi.173.1638194979787; 
 Mon, 29 Nov 2021 06:09:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m20sm22730587wmq.11.2021.11.29.06.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 06:09:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32BF01FF9A;
 Mon, 29 Nov 2021 14:09:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 3/8] tests/avocado: fix tcg_plugin mem access count test
Date: Mon, 29 Nov 2021 14:09:27 +0000
Message-Id: <20211129140932.4115115-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129140932.4115115-1-alex.bennee@linaro.org>
References: <20211129140932.4115115-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we cleaned up argument handling the test was missed.

Fixes: 5ae589faad ("tests/plugins/mem: introduce "track" arg and make args not positional")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211123205729.2205806-4-alex.bennee@linaro.org>
---
 tests/avocado/tcg_plugins.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


