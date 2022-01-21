Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9369749624A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:46:58 +0100 (CET)
Received: from localhost ([::1]:42402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAw7t-0006U9-Du
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:46:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw3I-0001wm-OU
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:42:12 -0500
Received: from [2a00:1450:4864:20::42e] (port=38418
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw3H-0007rp-2i
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:42:12 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q22so394913wrc.5
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jmhL/OO2/CergPGLZmyF9NCYKTuS6CMx+Lqk/P5jTQc=;
 b=egdEub2zlmdpfyXntZPxBT03VWPkwqIrj0sYdpQd0NGhBznI2saFourXf+tWhg8GRQ
 AzvdZRaUQUYQmUhyDepEIVN5fNJT8XwzkmzUi93VPXwcrzGbNNp4AOa9Xhxl0QciInIM
 3hhRB9RDyvDTxkrl9oKD1knuZUU6FN9ck2/c6BCxE+4+6odWTuxe0Sy+Q0RAHgxAkfzm
 MO6KlDYwoONr1TooLsGBkyYL9HiBPaHDNVTvm3cKJOsFFBmmWLU2S8yPjGhQfyVa+MbX
 ao8KZm0KFIDDx9qzVZ6uRZUJ8IFG7p3abeIlqhMXtpJEPF+hWHMI+tSgRUFHtdpHpKq0
 FW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jmhL/OO2/CergPGLZmyF9NCYKTuS6CMx+Lqk/P5jTQc=;
 b=iAFqoqPMqT4Rq/M5UptuG03DibHdQCJaUtBOrK0WS86s9cNzCw/9L3B5QSAMZAuO/1
 vnzr26zd1m+NhO/wiVbbSWD3IL4mXRC15JTsdo9rrZKuFE0iHoQAXYT+s1ozH/Umpv5n
 UL5s6act1QHdWrXoRSmhnuZT4np/y6ZqEoLLWt0GBD77akHPb7sOQZ/XB5RLAIMbYSIC
 XyBdwZrEBuPF8stAuP8Nhz/KzQvin+SxcoFPrlPfqUD60oCj3FtEhO1qQVxgJSeVuzOC
 D0e+j9Qz3W/WbOVNJAgKl9ckNdFJqpp79bHIDP0SUFUxoqpEWq6HHMXbltWpCwq7s94H
 Cb/w==
X-Gm-Message-State: AOAM531XpohogyHBVKF/3cS64TYplhXeiIqtLr1TZO/rjcJR6GD+Z1in
 Gu2IqKD8bhZnevjO4cgod41jwnCkf6U=
X-Google-Smtp-Source: ABdhPJyrDxvuEOzwxqg/NXSdG+3QLGoImx3NBPO/IKhsjWM+htee5QeS9FsgXY8Uc9BR/l6Oit/qUw==
X-Received: by 2002:adf:f90c:: with SMTP id b12mr4410987wrr.379.1642779726324; 
 Fri, 21 Jan 2022 07:42:06 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 r8sm6067360wrx.2.2022.01.21.07.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:42:05 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 6/7] tests: Manually remove libxml2 on MSYS2 runners
Date: Fri, 21 Jan 2022 16:41:33 +0100
Message-Id: <20220121154134.315047-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154134.315047-1-f4bug@amsat.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


