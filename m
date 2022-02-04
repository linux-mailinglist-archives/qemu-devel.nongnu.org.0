Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03A04AA173
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:56:24 +0100 (CET)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5cz-0001aj-Uw
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:56:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qw-0006lw-I7
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:54 -0500
Received: from [2a00:1450:4864:20::429] (port=33709
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qu-0007MZ-My
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id e8so13515540wrc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7MhMTi1pxN3EWkNN5Z96EF/V4GjjGNATp/VG7QnEpIk=;
 b=wNemT6mxFr7IKrXkzBgsEm6ooGldA+qPJymPltxx4WweuNJ+aL0NBt4sLnD8WWzZN6
 TTRCGVWytH7Znu9yXkRj7ikgTiN4uKB/WWXvxlzG9uCIpKve2tRNuIfyBwGiynz9WDIT
 K9VZQ9nYU5e6uagwNM3NdahCcoVgYCqbLX0iuaMX0k1VQ+gT9nh70Z9Pdnbpt2c9aLJw
 auG6K5U6KMl8+8r6ySqThgHOCzOPq0rME4/vCW0eXVLr3v/mxpyjtARBywEHj/4Ckguw
 FB66RNG0e93kRe5uUyzJuHvXT7ypmyMFDKaWXxuVDCnDpO3wGEISPYSYN6hkK6P8u1Mx
 uBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7MhMTi1pxN3EWkNN5Z96EF/V4GjjGNATp/VG7QnEpIk=;
 b=irAt3Mkh2TNrR04wRe++bsXPYjyOq1DtnWznuXEM27+krxe+bxAY8GTTS9qmX+btCg
 Qt6x1+NSRO1so6+H199Vq9ifThsEr6xolFySqKJjutOSJzfNFYYl9N+qFc0KeW6Sjr3d
 LUkEeoiSNWAhpODAaaQJJjSqpwiQ/0f9kXNYLGfqr796ftNt26URh2bpjYufH5PVfqhb
 FMu4EP0YngYPIWh1lNdliufm8uvlNJSgqAPMJnw9jvtIO+DOd06IvUmKeOgiect9lx71
 uE54jGPz8iFeKzcb8kh2/Y4tluywEPVxaRzKTAvtNFeaN5EfbdwbunVcdts+e1OhZ5t9
 uvwQ==
X-Gm-Message-State: AOAM533AotJ6bvCduOQoUK2Z81eazu34hyNmQo6ZnP1BG3cqCOYH1x3w
 yysY8epcGnbzh8NARfUUY01eAQ==
X-Google-Smtp-Source: ABdhPJxrsvNwopziR9DVX4QVvfqAM6dqhiroEJkjzzbJu3JKDeBf9uXzsHvxJtx4JTfITgNiyRScCA==
X-Received: by 2002:a05:6000:1b81:: with SMTP id
 r1mr501826wru.609.1644007431467; 
 Fri, 04 Feb 2022 12:43:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e15sm3250693wrg.6.2022.02.04.12.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:42 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21D261FFC2;
 Fri,  4 Feb 2022 20:43:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 10/26] tests: Manually remove libxml2 on MSYS2 runners
Date: Fri,  4 Feb 2022 20:43:19 +0000
Message-Id: <20220204204335.1689602-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: fam@euphon.net, stefanha@redhat.com, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 aaron@os.amperecomputing.com, cota@braap.org, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Luke.Craig@ll.mit.edu, crosa@redhat.com,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org, robhenry@microsoft.com,
 Yonggang Luo <luoyonggang@gmail.com>, pbonzini@redhat.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
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
Message-Id: <20220124201608.604599-11-alex.bennee@linaro.org>
---
 .cirrus.yml              | 1 -
 .gitlab-ci.d/windows.yml | 2 --
 2 files changed, 3 deletions(-)

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


