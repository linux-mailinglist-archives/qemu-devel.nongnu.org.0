Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3857A03B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:58:51 +0200 (CEST)
Received: from localhost ([::1]:49888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnkQ-00035V-Hr
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oDncG-0001t2-IQ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:50:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oDncD-0002Qh-SO
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:50:24 -0400
Received: by mail-pl1-x630.google.com with SMTP id g17so12013936plh.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z69BRE83wivOCalvkXHzgTad0Rtw1/D/zMh+e6gOY64=;
 b=RLRuOKlO7JPDQBaNGkYSZvfu541qpaxhhhckwz1p5kPQEO4ijGtl+chN+Ps3Xf+g4z
 sJ4ZPRiEz7/28kw/YRZCnwEV0MkHNP/8i/5z0npeMgPU6Ln3i2w3roHxEYwzLeyyPwxm
 qJBlJI2tduqlnpB619H3eK1ffscf+lObH1mPhxRMbcdFZycfExfMyfc4mUojW/7wghqm
 bUwALNVkcNw6t1cfbBzSoEHFspOdIRqdKNIns+mpl/g26r/gB57Ccc+TGpy5qsEwPEZO
 Yc32mmRjYMu6ZnndGUY6EEwOlW2leT66+E0zG6mh15lfGFR/JNHnsGdF7QzFfweH1Epy
 nprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z69BRE83wivOCalvkXHzgTad0Rtw1/D/zMh+e6gOY64=;
 b=k3XJKH0naaSjaIvvGySXvKjRdXljZtuGqP7/p7ipnMGZPwn7istaSchvImJZ3W+D7z
 BR7GOtYZyY8jWZZ5ZZqvS7plSXZQYjSChxBV3o5rW0ZXAFYpcI9kI9LeBcmr0rd0RVNb
 ObStlNPQl8O9C9M2VA8+02Xrxw1z649Bga469CWruSE2i6rR72E2l/X35OJsXiddOw/N
 9m+9Q4g0eYwpAogd1F4Eu8aR3slG6G0qR3ScVgNd3Sv5aJbB/pT4oeRmW58OP68ONKAG
 i3DIgfH9N+I3j0jVJadSt31fdSzGSZp6/z2mtXqkHQP1rveTWzv49hO/6W2n/qJcVupt
 ixxA==
X-Gm-Message-State: AJIora8mJYbEnsOK1XAIJoESK1tP4awqPVB+NKsHEo/izSAyRIxUGoAz
 yNi8Ln088PtH5cGORhrcCm8=
X-Google-Smtp-Source: AGRyM1umaBVjhQhRdbqxU52B6fdN9CgMnup7X+i3eNINU35YQd3OXIj+laii0eyNytxuEKwkz2nd+w==
X-Received: by 2002:a17:90b:378c:b0:1f1:6468:a0b0 with SMTP id
 mz12-20020a17090b378c00b001f16468a0b0mr23088346pjb.145.1658238619901; 
 Tue, 19 Jul 2022 06:50:19 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a17090322cb00b0016c33dc879esm11752274plg.113.2022.07.19.06.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 06:50:19 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2] docs: Add caveats for Windows as the build platform
Date: Tue, 19 Jul 2022 21:50:14 +0800
Message-Id: <20220719135014.764981-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
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

From: Bin Meng <bin.meng@windriver.com>

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
Reviewed-by: Stefan Weil <sw@weilnetz.de>
---

Changes in v2:
- fix typo of "preferred"

 docs/about/build-platforms.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index ebde20f981..6b8496c430 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -94,8 +94,16 @@ not tested anymore, so it is recommended to use one of the latest versions of
 Windows instead.
 
 The project supports building QEMU with current versions of the MinGW
-toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
+toolchain, either hosted on Linux (Debian/Fedora) or via `MSYS2`_ on Windows.
+A more recent Windows version is always preferred as it is less likely to have
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


