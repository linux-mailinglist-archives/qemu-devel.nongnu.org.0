Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0074A66C9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:04:47 +0100 (CET)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0KU-000403-FH
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:04:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExtv-0002gz-Ev
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:11 -0500
Received: from [2a00:1450:4864:20::433] (port=35716
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExtt-0001gQ-KO
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id e2so33780380wra.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7MhMTi1pxN3EWkNN5Z96EF/V4GjjGNATp/VG7QnEpIk=;
 b=AH3oCIZSNWi0zbnwYzFtbygBh0mGJkAN8rSo6XDUO3vXRG0zGOX6gEZHaejXsjv5Ex
 q10B+AKegCDVF1enK0GZXGA2aCkFuJP9qbVIoRQkNPoJt3lqhfJJJVlKAjumwHIV/qiq
 3O1r6kEXvr0rf5kgKDrsEV1kLPZ5H9LpOC3A1eDNZ9wiE2HXjfOadomuHnzt7Rx/vTJp
 xVqF1RwubY9vWdQciAMgmmwcO46x3Aj6uf0kLRgzoM0ojSP2/puo25jCLzOisSQdDI2Q
 XscDfgbACrYsxlZvCXkjAtGlHtrWtL3Mh+Ll7naachbzi1G9h9nFwUT6C55z5XH/RL2l
 kdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7MhMTi1pxN3EWkNN5Z96EF/V4GjjGNATp/VG7QnEpIk=;
 b=eQGBtYIRxZY04oCAvyhSNPEfx8tvDw73fg9vU2dkZEW9fCjqcuaydc4dbWypZu2Dja
 vWStHDcDgewS52DiN3QtFiBPzdo5zO+4Er76ecPEZXRZ52wBZ32vsoDCd0tFJ0Puc53r
 BMXM/HJ5Q4wLpUbBEG+N+z7Pv8u4YwDtahqHdl/wpL5OzC1EaZgw9IG4ByZAoqREz7tQ
 MrQiORrsYGSQ8kh1fItvlh70O3dZfMjCv6AlgNtWkKUPQKDaoqjoxL9IE+IOXwDu2NwP
 3mPiXb70hFOFH5R8ypqweMoBoCEneU3ItLbpvo6vn9wpc0W1MBn3yshT8Vuof+e5x4fl
 2SYw==
X-Gm-Message-State: AOAM533ushdaO1QqFTHdcKFVpEyqb3Gjma3ZG1Ehi16D9AUGr4Woxf8l
 WPfzJQ6hTpROGy/ClNw6aiTtnA==
X-Google-Smtp-Source: ABdhPJxXXiuHb8pUVPWtDmjPH1gLxmVjJVogGUMtKVyp3s8nJfECtnpJtUzZ5kMutdO5ZJ4OVOxK5Q==
X-Received: by 2002:a05:6000:11cb:: with SMTP id
 i11mr22498805wrx.19.1643740146991; 
 Tue, 01 Feb 2022 10:29:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g9sm10190954wri.95.2022.02.01.10.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:29:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AFC171FFC2;
 Tue,  1 Feb 2022 18:20:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 10/25] tests: Manually remove libxml2 on MSYS2 runners
Date: Tue,  1 Feb 2022 18:20:35 +0000
Message-Id: <20220201182050.15087-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: fam@euphon.net, Luke.Craig@ll.mit.edu, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 aaron@os.amperecomputing.com, cota@braap.org, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, stefanha@redhat.com, crosa@redhat.com,
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


