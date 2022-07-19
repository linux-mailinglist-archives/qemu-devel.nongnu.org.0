Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C6A579F6B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:19:26 +0200 (CEST)
Received: from localhost ([::1]:39898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDn8G-0002Wm-QW
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oDn4W-0005p9-68
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:15:32 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oDn4S-0004bE-KV
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:15:31 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y9so13473415pff.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AxjzFDfUy3cq6Gwgu8LFrLUEDAqgpA9Q7NEwlD7zaIw=;
 b=Im0fLGxxMeSkl56Lt6j4KYLiJaW+TFzqU9udF/57ghBprXb1hp84847Ox7bYQdnpXY
 Bv4tOXUjzvUKHfZMkTk36FJMZITJat0Egv73D2V8judFUAq68NIZ4vxWfPwg1WbVCckj
 vjH1O7eQWfsbfi6VLSj2ZFGDlntbs5qw4X1qjAo06GOVRjD4EPj9hqbV/2gy/2ZeYEPo
 oIorp8DUnxqz8CxallUS2KPXT2A/3AnGDob7OQo6eH6H5eA0mPvBX48y+NGx8s37ISih
 bBuKKZGAzrYggg5ZBYMoYkk5R1G809IVr3kOi0AafzrpzcEhqTKQsXoPl5o7TJuiylm0
 8HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AxjzFDfUy3cq6Gwgu8LFrLUEDAqgpA9Q7NEwlD7zaIw=;
 b=SflxWLcvuDJO0HQTWAitsMrhlsYDh+VZPPXQxxe2S95uWymHcxAC6RtWfUfepVjMCY
 U7a4On8oVaqSWrN0nfd6uTCLDRKLy1KVg2C9VuvuaWOqsnjhVylS4mMelECZnact7nrg
 HFy92lMNvfbGA+RVmZeYcejI+TDFUjCh/LrIRos7X4X0UWwouYF+145GjtKZAoWboB3e
 0WpHDk70K/VFiSioRYy7M0OU9Yo+xZgq4orW+jZZERMQ208MS8AUKOYgdjId2uoiFvQV
 r6xw1qkueiCLRiPnnaEF+7R/A6lb/rYWBSDoq8AiDa89YVTP95sFyPYnaFllD1rjQhBH
 eGWA==
X-Gm-Message-State: AJIora91qZJ0ICIFd+BT9Xv/maw9smfm+9fRU4zPProzAP15raarSZ/K
 igKHVfBy3MN9ftyDnuIk+ZU=
X-Google-Smtp-Source: AGRyM1uMi1SJh3V7eqA8CWJ0ZRhyuzKs0AOV0zuHJRWrwEDh1g+nSv0ACwbph5m3Ta/rWRDwEiF2gg==
X-Received: by 2002:a63:6b49:0:b0:40e:64ef:1be7 with SMTP id
 g70-20020a636b49000000b0040e64ef1be7mr28865477pgc.552.1658236526511; 
 Tue, 19 Jul 2022 06:15:26 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a056a00009100b0052b6ed5ca40sm4559754pfj.192.2022.07.19.06.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 06:15:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org
Subject: [PATCH] docs: Add caveats for Windows as the build platform
Date: Tue, 19 Jul 2022 21:15:21 +0800
Message-Id: <20220719131521.764317-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cf60ccc3306c ("cutils: Introduce bundle mechanism") introduced
a Python script to populate a bundle directory using os.symlink() to
point to the binaries in the pc-bios directory of the source tree.
Commit 882084a04ae9 ("datadir: Use bundle mechanism") removed previous
logic in pc-bios/meson.build to create a link/copy of pc-bios binaries
in the build tree so os.symlink() is the way to go.

However os.symlink() may fail [1] on Windows if an unprivileged Windows
user started the QEMU build process, which results in QEMU executables
generated in the build tree not able to load the default BIOS/firmware
images due to symbolic links not present in the bundle directory.

This commits updates the documentation by adding such caveats for users
who want to build QEMU on the Windows platform.

[1] https://docs.python.org/3/library/os.html#os.symlink

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 docs/about/build-platforms.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index ebde20f981..1b297e87ee 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -94,8 +94,16 @@ not tested anymore, so it is recommended to use one of the latest versions of
 Windows instead.
 
 The project supports building QEMU with current versions of the MinGW
-toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
+toolchain, either hosted on Linux (Debian/Fedora) or via `MSYS2`_ on Windows.
+A more recent Windows version is always prefered as it is less likely to have
+problems with building via MSYS2. The building process of QEMU involves some
+Python scripts that call os.symlink() which needs special attention for the
+build process to successfully complete. On newer versions of Windows 10,
+unprivileged accounts can create symlinks if Developer Mode is enabled.
+When Developer Mode is not available/enabled, the SeCreateSymbolicLinkPrivilege
+privilege is required, or the process must be run as an administrator.
 
 .. _Homebrew: https://brew.sh/
 .. _MacPorts: https://www.macports.org/
+.. _MSYS2: https://www.msys2.org/
 .. _Repology: https://repology.org/
-- 
2.34.1


