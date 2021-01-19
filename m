Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219DC2FAFC8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 06:03:21 +0100 (CET)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1jAl-0007Q3-QZ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 00:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1j9S-0006rX-FK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 00:01:58 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1j9O-000350-Ay
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 00:01:57 -0500
Received: by mail-ej1-x62f.google.com with SMTP id by1so20294615ejc.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 21:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QlhtV/Zy66bhXE98ce4juGehMD6LZDiEqXX3BRf4JbA=;
 b=CekrRf2TY3pM3wmXJDz24cW2vn5JAJq42dZjVxDMxMRWL7ZGP9kT1XTJP/UP/kx021
 LmyzQ+EsqTMyyR011jTvOkj7b0c62qBt6vcPTZeq9DzxHdCDlPFkCzWnqF0/SzlMHYgn
 tu4mN2fgM8Pg3wfgxMXJbp84v6SiOsrH58KyfhUtQD6F2Ac8WuFVPaBkHprzfWIdRBUp
 5KT3yE9qRQoGoi50669hH9cNyKKxXjGjSSMeFyDy4S/13wMDHe2yFSTb3s/TkR4hk2d0
 eKld6aqKZtwU1ilni9bpDH6cNRfu+36Xrc6HRtS1baxHxidC0iJy04I1T/8StHZnL+4N
 3Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QlhtV/Zy66bhXE98ce4juGehMD6LZDiEqXX3BRf4JbA=;
 b=FsF9CddVYCLA5aDPkGHOqNOTIf1RtyVHIW259QP4OVoFxM0aJNmSw6wvSK/U93aVXS
 SwfjQTpj08p7jLOXNOCfPOnErKMN565aJcLINdPQnUfnTmaEJ6xogz5bcEQdcemj5O4c
 yjOWS2/WuIWcZ9sJFMVJNPQlpNGL2LHozRvF6Dc18YWtDT1iGVqOimX9xjWhoebNnkXB
 bGlI3Jp46UiWbCaX+xMcRI6Y7qV42gkKbn75jMzZmtKKuD2omz4s+XXD1PjXlb2V/uvj
 JaM05crbKOZtgEx4Ng+v8EgPnFyveyK9vGCVXkX/lB01a99LOqLxJG1pcimkg1UhYjt3
 GXyQ==
X-Gm-Message-State: AOAM531W5UEzfQIbFoCL/xh0SfNtCF9pzXxztLH1XKvQAjeM1zscsTig
 uutNrWWMO2jsV09NWnjV3/4uoiACDRs=
X-Google-Smtp-Source: ABdhPJwMwV87b+TpBZcgwwhXWuHcS2oEHIoOHr88w8gCjeXGOX6e2ZtPgtdoiqBdB3DxZlxJh15K6g==
X-Received: by 2002:a17:906:b0d2:: with SMTP id
 bk18mr1735701ejb.508.1611032512352; 
 Mon, 18 Jan 2021 21:01:52 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m9sm11763637edd.18.2021.01.18.21.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 21:01:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/docker: Fix _get_so_libs() for docker-binfmt-image
Date: Tue, 19 Jan 2021 06:01:49 +0100
Message-Id: <20210119050149.516910-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a variable rename mistake from commit 5e33f7fead5:

  Traceback (most recent call last):
    File "./tests/docker/docker.py", line 710, in <module>
      sys.exit(main())
    File "./tests/docker/docker.py", line 706, in main
      return args.cmdobj.run(args, argv)
    File "./tests/docker/docker.py", line 489, in run
      _copy_binary_with_libs(args.include_executable,
    File "./tests/docker/docker.py", line 149, in _copy_binary_with_libs
      libs = _get_so_libs(src)
    File "./tests/docker/docker.py", line 123, in _get_so_libs
      libs.append(s.group(1))
  NameError: name 's' is not defined

Fixes: 5e33f7fead5 ("tests/docker: better handle symlinked libs")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
"Tested-by" but apparently not enough... Well actually it was on
Debian, now using Fedora.
---
 tests/docker/docker.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 884dfeb29c4..0b4f6167b3d 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -120,7 +120,7 @@ def _get_so_libs(executable):
             search = ldd_re.search(line)
             if search:
                 try:
-                    libs.append(s.group(1))
+                    libs.append(search.group(1))
                 except IndexError:
                     pass
     except subprocess.CalledProcessError:
-- 
2.26.2


