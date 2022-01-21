Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C94495DE9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:44:21 +0100 (CET)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArP2-0001Ll-W7
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:44:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArI4-0004Bc-UC; Fri, 21 Jan 2022 05:37:09 -0500
Received: from [2a00:1450:4864:20::333] (port=42701
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArI3-0005As-Bo; Fri, 21 Jan 2022 05:37:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso18057656wmf.1; 
 Fri, 21 Jan 2022 02:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vabZUgXCc8y6pgkTLFnvHt9OHIbqfyKMtptKUA3UOiA=;
 b=MdQZTTxoLV7ou3v4qkIl8VaNlQ0dIRdaLZ7ECfPKXhwLYj85bPjy8r5cs14paSY1+2
 NyO8br1PpPLYZx8R7usuOrx8K7xqR27Urd1WTOQkMuAGRB63kZ53DTrESNT/RVQmOlcX
 Oj8YGCJFFV4h21AzU1TXmOBhNEMIrrJuqOzcfYDUYxP5QBoPNMy6AxkEtBVXiydiKg2k
 Xf/5wmdSJt+6jE3r8LFRQaFAWsVsY5aPlIndufURxKhng8AdTjSWW5RHD06jCAVh+pra
 8wPB1IGv6b9CAkHxbId5JL/2dRkZeMOQkSLJBlJQaDFo0I3c80OupEJ98RYQTnVEqTG0
 6sqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vabZUgXCc8y6pgkTLFnvHt9OHIbqfyKMtptKUA3UOiA=;
 b=zsM/jTCrZ21fWJIVoyS4GtO9U3MNXoaXBqzSSfuLIp8HrMjhnzAIvDaDtb7FjTf5TS
 47alEcxN0FMQP9jdD4v849CGtzvsEBtCrYj2H+5eATiV94/emV9ccEs8yMT1kSqWQtWw
 xg9FXaFqA7aG73LDdHeVF7jBTYTp6v73/dZAmfz3wqUeOAtjvEzdchFZZWpEbEX23XcP
 7m+Ov4o+T2mLChK9ENSBifmuw7R6OeROYaqKpBUbmnpeot3iyFELLffjK6JH2zlyftIa
 IkpJnkSrGB8fVcwAuMsKHQ3v7HLWFdnmV0idC9/pLTXzuzaImyRo+m6KRhvL8stIMNvC
 3Wog==
X-Gm-Message-State: AOAM530uyZPN2ETiIRT8I4bYIO0vX8B19Yn6jflnMBy82uir3KlZXcnj
 mNm7UPWgl7KhiZ9Y7KB4lASvi8hi8zE=
X-Google-Smtp-Source: ABdhPJxY6L4haEf9le5FdR9Wq6MY9nAYmSibtm9/kRlHsGCgDskzcaH+tXrv1ThakLfo+bQ4mxqZPA==
X-Received: by 2002:a05:6000:156b:: with SMTP id
 11mr3235668wrz.283.1642761425434; 
 Fri, 21 Jan 2022 02:37:05 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 m187sm4582099wme.25.2022.01.21.02.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 02:37:05 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 8/8] tests: Manually remove libxml2 on MSYS2 runners
Date: Fri, 21 Jan 2022 11:36:23 +0100
Message-Id: <20220121103623.288054-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121103623.288054-1-f4bug@amsat.org>
References: <20220121103623.288054-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

lcitool doesn't support MSYS2 targets, so manually remove
this now unnecessary library.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .cirrus.yml              | 1 -
 .gitlab-ci.d/windows.yml | 2 --
 2 files changed, 3 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 02c43a074a1..7552d709745 100644
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
index 62dd9ed8329..1df16303491 100644
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
2.34.1


