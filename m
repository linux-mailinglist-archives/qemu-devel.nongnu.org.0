Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52DB2D90CB
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 22:43:25 +0100 (CET)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koZ9I-0008PQ-9D
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 16:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koYj0-0005xD-Jg
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 16:16:15 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koYit-0007CL-DO
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 16:16:12 -0500
Received: by mail-wm1-x341.google.com with SMTP id k10so12032766wmi.3
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gLHr+Zz3WuQUpNekwEjIGq/hWn3iElhHMhpUYcOLiR4=;
 b=H6h3QfMBAVRKBuH/x1rU6EOjsZXCcKCQSHU3aVATvzx1Ca7N9DavCrur+O7UCFqwwp
 q5U7xQShv0hA92XPeb40TuTZc16KoLyx7yEtvOFtcHReD9ccm+YC6358wGcit6x6JVQ/
 NOFouSKxLtlSMalGG8VGHcGwLylFNsAjGO6J8dbg8xA1Qtrc3AoKyZ/e9Qfwd1SUFqQX
 rXZiBftfEXpJy5N4YZm0Jf8HOeuMloBT6Q7X8f7yCImVddUB5I7ywjq1eoohF5q1iKcS
 82JLUI70J02JW6uimZMl2o0Ydka+x+vgnaidfUtb6CbUudVGuXsAcl6fpmlbQBu/QiSw
 jJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gLHr+Zz3WuQUpNekwEjIGq/hWn3iElhHMhpUYcOLiR4=;
 b=PFxdw2QLnuijwi1/QR920YVor88y+WOElu+K+HeTLkXMZdQONWmZrXUl8Cv7F2P4Kp
 xAphS8jv4MI3Myw8t8jtkOvwP67L837N/Uy9gJy7yoTcir3L3wwJ0ButwaeIIqRNbeiz
 vWBiqZ3W+jVhFi1a6Uac/8patn7HD+JEEf+G+Tot+eyBTl6K2ez6JZsMgx95EeYdh8d/
 U/m706CO9t/w+fxKXXfNRa0JkAWAbE/xeVD+vL/ufzU3KIteTQEI/fdBGLbn+t5PgJkf
 VCgd4RKPhj1w6aatJoBzQ86h6fzccx+RjjdtnW0usts43LmAhR2LoohdCOJkjeVoYG6d
 /vBw==
X-Gm-Message-State: AOAM533v8p64kIieHFbsCrdIB8x2az25vpeS7n/vSlQ0HO9mQzMH8wrm
 1eU4nJOIFXjYBEhbK1KFKMmYHTxt+Ps=
X-Google-Smtp-Source: ABdhPJxN4zjqYlRs89GalPZcVnpWDJPBBnu/VT3uZMKOjtJyYxQG0ajXH7KkZrrVlWNopjbKgzaJeA==
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr24256960wmb.77.1607894163983; 
 Sun, 13 Dec 2020 13:16:03 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z64sm26557029wme.10.2020.12.13.13.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 13:16:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/docker: Include 'ccache' in Debian base image
Date: Sun, 13 Dec 2020 22:16:01 +0100
Message-Id: <20201213211601.253530-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include the 'ccache' package to speed up compilation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian10.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 73a3caac9cd..9d42b5a4b81 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -20,6 +20,7 @@ RUN apt update && \
         bc \
         build-essential \
         ca-certificates \
+        ccache \
         clang \
         dbus \
         gdb-multiarch \
-- 
2.26.2


