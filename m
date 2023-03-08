Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D16AFAE0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 01:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZhLa-0006aj-5N; Tue, 07 Mar 2023 19:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZhLY-0006aa-Ba
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:07:56 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZhLT-0006IK-HO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:07:56 -0500
Received: by mail-wr1-x432.google.com with SMTP id v16so13876974wrn.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 16:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678234069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5IGy0vF1LxHD+Mh0VVrt/9yAqy94SmqA9OIZ2xWARic=;
 b=XSHS3/pSdA9RQX6EPgBOLyfltwFTYtD1GB6jR6W9IZME46e/otggAMlfhjlNrNH9Oq
 tgF+cQLF5Xw0Itf2uBlZjfpDmYXlH9Tj1COjWlWJZ9UhRLLlT3RHkhgqxKpF5XvH3kuu
 V6MHX4tG3HHrCuMOn03eJCwoUaDLyR71OSLIBHr/I5eAQSpwPivfHejU3Wg8VYYpD6m8
 /OajKdeBrL4MspBlil0JQtHuCK5QtAs/5UiHA/Rc7OY2a5pe+DhsofM+0z2HZzaM+6bZ
 6OWs1qdXZKXGbnRXqW7rhe27jKHiEdjNDEcfqXeJWShIYyeND6v8HpYRhcoYcrG5q4y1
 ND6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678234069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5IGy0vF1LxHD+Mh0VVrt/9yAqy94SmqA9OIZ2xWARic=;
 b=aRq1qZ++MFGageQlQJ9tP22ukmUsAi8bfgz2v1KEqFKexVQ3MvOsl7K7E7C4hhZdgD
 xezasvaWYTIQT+mJM3RIsqC4UkfOpHzpw/T8sg9Of27c1tCPa7PTJkT6/HC7W9wn25/A
 7zGfMBA7UhPvRIVFTmd8kJLMjRgcDTdjwUce8aO67odFbYlTi754wdXMfij2vDpcS0Ls
 /lzWtyPFbNXNJq5oIOyG3TIolooOlRhOjCjGTGCvi3BN9b3U0LJt7goDYZgYoKvNCgNz
 NIeerOSi21Ii9YL3LANvo/ju/vjkDssVhEXcjg2CVINY0D8QQFlr2WQ12nD5VL6T3N+m
 MdTA==
X-Gm-Message-State: AO0yUKV8nKUBk30s7mSUH/pYs7qqX/Fh+CCEQPqUw5n2dT38MRjyo4vG
 wz5e8Dg2d87Ps+2a+FbiTr/i0NpIZoKNS+t3zUc=
X-Google-Smtp-Source: AK7set+jyz/oJJqo6GaZ1kocd1v3V12qjLyfQrh7d8WFGlzePqVl9XBe3qRRBrXUqAK8rRm67eYe4w==
X-Received: by 2002:a5d:6a0f:0:b0:2cb:f4:e59a with SMTP id
 m15-20020a5d6a0f000000b002cb00f4e59amr10068566wru.71.1678234069109; 
 Tue, 07 Mar 2023 16:07:49 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 f10-20020a5d4dca000000b002c70bfe505esm13536808wru.82.2023.03.07.16.07.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 16:07:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/4] MIPS Virt machine
Date: Wed,  8 Mar 2023 01:07:41 +0100
Message-Id: <20230308000745.56394-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since v2:
- Remove mips64 from gitlab's build-without-defaults job
- Require libfdt for all MIPS targets
- Various changes described in each trickbox/virt patches

v2 cover from Jiaxun Yang:

  This patchset is to add a new machine type for MIPS architecture,
  which is purely a VirtIO machine.

  It is design to utilize existing VirtIO infrastures but also
  compatible with MIPS's existing internal simulation tools.

  It should be able to cooperate with any MIPS core and boot Generic
  MIPS kernel.

  Kernel patch available at:
  https://lore.kernel.org/linux-mips/20230304221524.47160-1-jiaxun.yang@flygoat.com/

Jiaxun Yang (2):
  hw/misc: Add MIPS Trickbox device
  hw/mips: Add MIPS virt board

Philippe Mathieu-Daudé (2):
  gitlab-ci: Remove mips64-softmmu from build-without-defaults job
  configs/targets: Have all MIPS targets select FDT

 .gitlab-ci.d/buildtest.yml              |   4 +-
 MAINTAINERS                             |   7 +
 configs/devices/mips-softmmu/common.mak |   1 +
 configs/targets/mips-softmmu.mak        |   1 +
 configs/targets/mips64-softmmu.mak      |   1 +
 configs/targets/mipsel-softmmu.mak      |   1 +
 docs/system/target-mips.rst             |  22 +
 hw/mips/Kconfig                         |  16 +
 hw/mips/meson.build                     |   1 +
 hw/mips/virt.c                          | 913 ++++++++++++++++++++++++
 hw/misc/Kconfig                         |   3 +
 hw/misc/meson.build                     |   1 +
 hw/misc/mips_trickbox.c                 |  97 +++
 hw/misc/trace-events                    |   4 +
 include/hw/misc/mips_trickbox.h         |  39 +
 15 files changed, 1109 insertions(+), 2 deletions(-)
 create mode 100644 hw/mips/virt.c
 create mode 100644 hw/misc/mips_trickbox.c
 create mode 100644 include/hw/misc/mips_trickbox.h

-- 
2.38.1


