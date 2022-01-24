Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A7499459
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:42:50 +0100 (CET)
Received: from localhost ([::1]:42834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6Ar-00016t-51
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:42:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lQ-0006eM-4R
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:32 -0500
Received: from [2a00:1450:4864:20::52d] (port=33765
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lN-0003Fj-1s
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:31 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b13so58843252edn.0
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TW3W9KlK1GSYsFODuOKwc8BNQgjkV0+601rjpw3zLtY=;
 b=DS1D1rkYXqWEdTLxJePOavXm7T899dtv3hFMa0d/ussc7dL5aemRbM5n4mAgqt66T2
 dC+DSM4o9J1YizqxnU3pMgSALR0PB91fmvNjOLGT+WjdbZuJSw39JkVYOwJ9Z0n+yBbu
 Wqj5G5CyECqxcujLgxGsymN+Nz2XcRahnKY2O9y5zgqeDUIbbS5ypJiLypfmMDW+CkNo
 dtRvgumrVSz+PZdauDSC4+g3/sTFFd1MxChq7Jboa0GXhdIv3WAN1U+Y2/6b6pfKCSrI
 tPOsJQIJhnIpeaZzXtL9IWYC/zEXMWuOz224TksjXvSCifl4V1PXdYXNTXteRXI36le5
 Fkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TW3W9KlK1GSYsFODuOKwc8BNQgjkV0+601rjpw3zLtY=;
 b=E26DiDZCWbNba+QONR6bgzydDS0D9bLrJPEo26lf6Sgdrx1YdbkvYgux5+r/ez0BpL
 el+lMIbAW3GzWLhCicYFa34s0zaiIdRK7cAUYPk5bwIJZIXBOGGFZkmPqV4udy5axGPd
 MXiuZbYN8f34BaEOZPEjU2AAZjdrkeMwcw92n+9RQoRRkioEYkWZAgpS75pnwuodRWfo
 XJueu/zzArf9D1U1Aa3L7/xdntvOVwf5MYKXHea1J1vHTGLpPm2r49IL05NTkU+ZoiTA
 1tuvjoOQ/l91rjEpUqMmsw8k87nHxLoxv7afiCYsv31LLa4hnE3UJgNDUUmluIi9W6gb
 MJIA==
X-Gm-Message-State: AOAM532vRdD5PZ44NdQPe81jZmA3M81USthXuG+P4TMYrp0iEVb3mKGW
 PXGe8VrZC0Vp2/qSSWPmvuqtWg==
X-Google-Smtp-Source: ABdhPJxvtybvWI6FB0nr4XXpQSSTn2FyslTJ87M8MZD+DMYuXqnds20x2r6/3VvAiDZ9Qb+9VYztXQ==
X-Received: by 2002:a05:6402:483:: with SMTP id
 k3mr17134238edv.323.1643055386167; 
 Mon, 24 Jan 2022 12:16:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v3sm6448329edy.21.2022.01.24.12.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B5561FFC2;
 Mon, 24 Jan 2022 20:16:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 10/22] tests: Manually remove libxml2 on MSYS2 runners
Date: Mon, 24 Jan 2022 20:15:56 +0000
Message-Id: <20220124201608.604599-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Yonggang Luo <luoyonggang@gmail.com>
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


