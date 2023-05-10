Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1516FE12E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:08:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPS-00073L-5o; Wed, 10 May 2023 11:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPG-0006tX-Cy
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:06 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPD-0001WG-Kh
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:06 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f4ad71b00eso5036795e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731222; x=1686323222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZaqIsK+xmLG1Mzcd1yhEiDZ7FA6PX/1YZ6nBDTWovU=;
 b=JOh4tp0VbVvsPutkRunQzym0X5xvYvdJD7A4EyXn3flS8q7tbFmmRz603j0hd/gGzu
 KnFOg0cl8F5fwL+h5xxqLYgmhC/vP5D3VEaafmawvW0QyuTMNOSz/pyVdCNZZBvjziTq
 AE7LGU2yxpaiE8mXYHtL8mhSb0ZV+UokR8Ho0UA7NivEX7sJwrsPC3AHvIi25CA/bVHZ
 8RaXt5u/z+bzAE3qgHz4eBom+omCYZZ41s6JBeZn9gtV2wrxsI3l+gthLsa2JiIr4sBZ
 /+rSbWuw11dQ0EzJIOO1NCBWHuPabbIN5viDZVu9t1kV6MyCPqhKhSa+qdiEX9uanepl
 A5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731222; x=1686323222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pZaqIsK+xmLG1Mzcd1yhEiDZ7FA6PX/1YZ6nBDTWovU=;
 b=E/gJa97xDeA5xRKc9irc1JKHHm3OyU4Dm0s02CW3E7V7oFoX+g44QSzOYGH7OG8Dz4
 ODGPKxHmshhCxciOZDOfM+amtYX3KTusM+juDYZfzZkHcs+RYISq5MjgST1SfCJHmjTW
 9ap51GtvEzXt2aWBMsChkXMgMl7Hrfyo5eDovcrSzQfTgFcPv6NxZjywBtAWFUOFPKLS
 g/jRM3yRUoM/cU6i5jkre8VCELbRjtELgi7o9zblrSGVUNIL5dxHOnDsx8X+N6ymefHI
 2POaA9as7KQjYnTqhjmdGoE+49nJs8BtGDE4b59gOvFa0s76mDgfQ9hCArbG4RAhPIOl
 TYBw==
X-Gm-Message-State: AC+VfDzZ0kix0zGbU1xpAQhu5u/zYgoQdbtqn47Le16L9sNZ6MpG9HLj
 tWGRLdLO6nqwE4xlxN6sqY/dKw==
X-Google-Smtp-Source: ACHHUZ7W0VJxfP7KwNASvKxDpO4Ri52afnvWT6StSsBYzW9boHTIHrRgXBM4qF8yRhK6mwjkvOQeLw==
X-Received: by 2002:a05:600c:2942:b0:3f4:bef6:5a55 with SMTP id
 n2-20020a05600c294200b003f4bef65a55mr1433531wmd.16.1683731222202; 
 Wed, 10 May 2023 08:07:02 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003f18b942338sm22977198wmc.3.2023.05.10.08.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:07:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A7F71FFC2;
 Wed, 10 May 2023 16:06:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 7/8] tests/avocado: use http for mipsdistros.mips.com
Date: Wed, 10 May 2023 16:06:57 +0100
Message-Id: <20230510150658.1399087-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510150658.1399087-1-alex.bennee@linaro.org>
References: <20230510150658.1399087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As the cached assets have fallen out of our cache new attempts to
fetch these binaries fail hard due to certificate expiry. It's hard
to find a contact email for the domain as the root page of mipsdistros
throws up some random XML. I suspect Amazon are merely the hosts.

The checksums should protect us from any man-in-the-middle type
attacks.

Message-Id: <20230503091244.1450613-22-alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index f13456e1ec..fe1e901f4b 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -493,7 +493,7 @@ def test_mips_malta32el_nanomips_4k(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page4k.xz')
         kernel_hash = '477456aafd2a0f1ddc9482727f20fe9575565dd6'
@@ -507,7 +507,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page16k_up.xz')
         kernel_hash = 'e882868f944c71c816e832e2303b7874d044a7bc'
@@ -521,7 +521,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page64k_dbg.xz')
         kernel_hash = '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
-- 
2.39.2


