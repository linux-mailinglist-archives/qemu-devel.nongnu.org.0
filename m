Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505A69522C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:49:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfkt-0000mw-Gq; Mon, 13 Feb 2023 15:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRbSz-000830-Rd
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:14:09 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRbSx-0005jL-TL
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:14:09 -0500
Received: by mail-wr1-x434.google.com with SMTP id by3so11490113wrb.10
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Iv7ueH+YvlIvsqvyByk3Lx6CxW9r/thv1Qci1pXSYqk=;
 b=do+/nUzgWl/WBirWjgyQrMoKJfXXcgsPTGFdiPUu92alX6vOMFAb4LVovi7otS8rwh
 73SWUYosZgZUoh6c0399/z0wvdwJ9JfTwN0Pwp+VyKJi3kkopOdv48BXPXTADWVjoGs/
 MeD88jhoIUF7UQYvk6ofjMJVKdiKRm+W691riaaTpHohZSzdYdNM4ZqCabJdLMz8r1dh
 dJU1q+Ujl5WfRnhYWWpz3k2lK90ylYvKpVjcmAULt9HbZP26/NiHz7OCiVIjConSbv2J
 8xEKk25ivlUcEMZmZxjGCz4d5Aa7jRvFiRrDhdCyN1iA7btU+N9fb8DFtFKHyZD/2C7q
 cQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iv7ueH+YvlIvsqvyByk3Lx6CxW9r/thv1Qci1pXSYqk=;
 b=fvmS4YdV9/3ZH8hSOxdymBHF8AI74bdGQlMHKoSXgBDSjCbGsaLtm8sG34pBKlDsnG
 E53N1+twqqpZBb2nY7irhikHZoYH83S55dkVj7YCAMMFnW2PsZlwgB9/VDb3iJdAu7xZ
 FCt+mTC107mzsW7MbxwtMDCvo7GJKGrHrTSdPfIAIPjDr4PN8jWohPx6m0NNjUqPoTrj
 e7dQgVO/zIvYbjN8UDTE1gsuXbYgcyk2MBPiqvpRBgpkFbG2bUR9L6gRN5/FEDrAbtkP
 2pvJtbyE25UUKk5d6Bd2yJ4KiZVt6Wn2SAZaEf4dIoU+NI3qidtCghxcJq+d1jdLKdke
 KlDA==
X-Gm-Message-State: AO0yUKUxf9ZZO9oewy/IU4MAHuT+7AIDmAfwGl3quQq2wV+Kv3CeTTZh
 B0KR8NCVC5e/gVBE9pR3VdZQRnHqqp/nR0Nz7W4=
X-Google-Smtp-Source: AK7set+zOHDQxBCNnDedjyjDfi/CGyzSDC0ZXNhtFH63sizXFXJ1U7gBh3LfJTUO72Imu13Afbo9MQ==
X-Received: by 2002:a5d:62ce:0:b0:2c5:5a65:79a0 with SMTP id
 o14-20020a5d62ce000000b002c55a6579a0mr2728685wrv.53.1676304845665; 
 Mon, 13 Feb 2023 08:14:05 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:8df5:e191:f2b0:5825])
 by smtp.gmail.com with ESMTPSA id
 t13-20020adfe44d000000b002c557f82e27sm3582882wrm.99.2023.02.13.08.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:14:05 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 0/4] Adds support for running QEMU natively on windows-arm64
Date: Mon, 13 Feb 2023 17:13:48 +0100
Message-Id: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 15:48:53 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Note: As it's my first submission using git send-email and on QEMU, don't
hesitate to report if anything is wrong/missing.

To compile this, the fastest route is to use msys2, setup with clangarm64
repository. This way, all dependencies can be installed easily, and clang is
available directly. Please note that GCC currently is not able to generate code
for this platform, so only clang can be used for now.

---

After having being able to compile, I had to fix two blocking issues:
- illegal instruction
- setjmp/longjmp segfaulting

Then, two warnings were reported, and their fix is included in this series as
well, so we can have clean support out of the box on this platform.

---

This series was tested with:
- make check (find a full log here [1], compiled using this script [2])
- installing and booting a debian bullseye x64
- installing and booting an ubuntu 22.10 arm64

Despite the slowness of an emulated system, it works well!

[1] https://gitlab.com/Linaro/windowsonarm/packages/qemu/-/jobs/3761641695
[2] https://gitlab.com/Linaro/windowsonarm/packages/qemu/-/blob/master/recipe.sh

---

As it has been discussed privately inside Linaro, we can allocate one Windows on
Arm machine (running in our lab), to add a runner for gitlab CI. But this is
probably a discussion for another thread.

---

Pierrick Bouvier (4):
  util/cacheflush: fix illegal instruction on windows-arm64
  sysemu/os-win32: fix setjmp/longjmp on windows-arm64
  qga/vss-win32: fix warning for clang++-15
  target/ppc: fix warning with clang-15

 include/sysemu/os-win32.h | 18 ++++++++++++++++--
 qga/vss-win32/install.cpp |  2 +-
 target/ppc/dfp_helper.c   |  4 ++--
 util/cacheflush.c         |  5 +++--
 4 files changed, 22 insertions(+), 7 deletions(-)

-- 
2.30.2


