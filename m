Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9154AF5BF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:52:34 +0100 (CET)
Received: from localhost ([::1]:60188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpGj-0007b3-JE
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:52:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHntv-0000Az-7w
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:24:55 -0500
Received: from [2a00:1450:4864:20::329] (port=35328
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHntt-0001Kk-ND
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:24:54 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so3332508wml.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cejMymT5qp+YN89i5F2QmBkgBmNSCMmO1G7UbfovVP0=;
 b=k1eIuBseKvFST9GUEOS1XvhcffkZnI7j4B367F933k/Lnu94wIFiO4w576S4G5de2x
 fFl8KRyTTI6Uoh7P0MsIBBeKJ9VZR+WKpeJVlpva7E8tIBO7jaX66av2b/1k6nFTDAmq
 Rj9FuPh3KVEAnSMZLErS6IYFebI4344aiNylAw9CDWKEdeP2RrKWfx+LcM76r0Gu1HWa
 nNhXRx1YUuKKRWpN2rDS3GQXfVC9pU/jiwCfBAUWWFDiWCapDb/xTrGfKO9qMXRpHAZJ
 r4BhwaZnL8mQdGBXjjAy44U424uR+ELY67ktz5uJlOmh3uTLsIDylQY/6apzAQrNUSnp
 Ub2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cejMymT5qp+YN89i5F2QmBkgBmNSCMmO1G7UbfovVP0=;
 b=OifQVHYHV2T17YVaSsanpcfKAURZHumwcxP/6XQe6Jk/9ec03egmo3e5VhTE4j5JXd
 w5jrlOY8pMg2velC3kSBHIfp8TE51AZk748v9Uy3Woxx1DOM8jndLcJ0TK9WknQuKny3
 GRorKw4RujOrT2+gvlZJ0BdJSg4fmCWSOAbNZZl/A/CzK+ft2UlFTtt2Ts9z0MdqdF+2
 2soLGjHuRLbxDlbJY60/aIe0zksW58b5H78cU+qjB+iegf0Mdt4hHlj4CjKjApraqaMc
 yjC+ht+yU0Xsg2cnS5lNXcY2psNF02wEoTYi72DpOTVhq/gdbVg/T1prt0uf9+sQKiVv
 44xA==
X-Gm-Message-State: AOAM533AvIY7NkUAJJkEFrEeZRksE6k8CY+tjqIwkvBgFNLoYvNStqNg
 SbfXXlucP53+IZt5Cv03FC9B2T+tpN+0zw==
X-Google-Smtp-Source: ABdhPJxli9Yy7JZ6r4t9+MsuRB8l6vDzYeYSikVyx6TxJcD+ng8sfaJJr+BT6eTOsVyP2AxkWLFKSw==
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr2804510wmr.63.1644416691913; 
 Wed, 09 Feb 2022 06:24:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n7sm2789775wra.5.2022.02.09.06.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:24:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 373661FFC2;
 Wed,  9 Feb 2022 14:15:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/28] tests: Manually remove libxml2 on MSYS2 runners
Date: Wed,  9 Feb 2022 14:15:11 +0000
Message-Id: <20220209141529.3418384-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

lcitool doesn't support MSYS2 targets, so manually remove
this now unnecessary library.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-7-f4bug@amsat.org>
Message-Id: <20220204204335.1689602-11-alex.bennee@linaro.org>

diff --git a/.cirrus.yml b/.cirrus.yml
index 02c43a074a..7552d70974 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -32,7 +32,6 @@ windows_msys2_task:
       mingw-w64-x86_64-libgcrypt
       mingw-w64-x86_64-libpng
       mingw-w64-x86_64-libssh
-      mingw-w64-x86_64-libxml2
       mingw-w64-x86_64-snappy
       mingw-w64-x86_64-libusb
       mingw-w64-x86_64-usbredir
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 62dd9ed832..1df1630349 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -44,7 +44,6 @@ msys2-64bit:
       mingw-w64-x86_64-libssh
       mingw-w64-x86_64-libtasn1
       mingw-w64-x86_64-libusb
-      mingw-w64-x86_64-libxml2
       mingw-w64-x86_64-nettle
       mingw-w64-x86_64-ninja
       mingw-w64-x86_64-pixman
@@ -80,7 +79,6 @@ msys2-32bit:
       mingw-w64-i686-libssh
       mingw-w64-i686-libtasn1
       mingw-w64-i686-libusb
-      mingw-w64-i686-libxml2
       mingw-w64-i686-lzo2
       mingw-w64-i686-ninja
       mingw-w64-i686-pixman
-- 
2.30.2


