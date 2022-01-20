Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA1494DA8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 13:12:38 +0100 (CET)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAWIv-0002s4-IH
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 07:12:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVGW-0003z4-UD; Thu, 20 Jan 2022 06:06:06 -0500
Received: from [2a00:1450:4864:20::32d] (port=36514
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVGT-0001tX-I6; Thu, 20 Jan 2022 06:06:04 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso19573702wma.1; 
 Thu, 20 Jan 2022 03:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=unytR7h709i2GQRuGPW9gVI8ltSteIf9FMCneCY+cP4=;
 b=PJxxXz8XbovZH1OJyaS6bxy7fqnK3sWWevK9V72Gdtba1IfUcCZED2+cKSIsRGooHY
 E6jeEV3TaWpgZXnD7DmED52f+MteB5Dq7HRaM4I+b8sUdAMXK0NHhN7oJ1v6miUTOAf8
 AYQmKpN+Ow+KlYtFo1cxn0R3FU+5pO8UUgHk4fdtNFDNK+4XK7cNrEuT/KL+YH9GbVhH
 g6FzC+5aux/0ElnUmNxJEO+CQHnp2nCoXHE+P16VDPmO0fFISoIPc0PQ1eBiwlM/ZwVw
 ZoUzHBE/B++XpLFJJqljl+FIVXJMGPq6V2ia+Ze2XTeKbXaTfCHzbJ3DHT3ftvtQQ16R
 q/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=unytR7h709i2GQRuGPW9gVI8ltSteIf9FMCneCY+cP4=;
 b=iU3cLS7awjwfyb/b4JQZB+wfW8dHkPZAEVw2UP3d0+XLd2+0lTVeOoEfMFfwA3b44E
 bGHJucy7yF88Ha8DJ7Xirxkw9o1Ah4OFhKIbOPen9cgenomxJuP4pIft4l7pPPgfS+nj
 TxJZwrmoUMQ7p3oxQ3ffKSo7TMRkCW1k4XVKPB8z+JAuYEOqlEBLx0jUhfVwNZbYR/m4
 sqmNu3xP2fOfxAOIUf7Uuwe5mHsxoe3YpfxLpDRuJqrH+Itp2RODK5nFZqVRwNrz3b7m
 v2yUgzBylXqoYzrQM4X81foZC4QJED5wMqHg398WJH2uAnC0TFZRkgcHX1QHssS6w8mM
 Gggg==
X-Gm-Message-State: AOAM533qKcwENhNgJq6P9Zcl8+/FYVMpZcJDujCsw9wkCEg+s7MxCfB5
 Bwn7h8iurQ3R8WyHVuJYZz3G3+AT/Aw=
X-Google-Smtp-Source: ABdhPJyL/rUTp1ZNq/zY1oXmOV53P0/WHolWRN1RcCljcybVo5chA4YyWBtQup65m2HoFnZTsWMKVg==
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr26517147wrs.592.1642676748187; 
 Thu, 20 Jan 2022 03:05:48 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 o15sm2853191wri.86.2022.01.20.03.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:05:47 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH v2 0/6] tests: Refresh lcitool submodule & remove libxml2
Date: Thu, 20 Jan 2022 12:05:39 +0100
Message-Id: <20220120110545.263404-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

Refresh lcitool to latest and remove libxml2 (mjt).=0D
=0D
v2:=0D
- rebased (testing/next)=0D
- include mjt's libxml2 removal patch=0D
=0D
Supersedes: <20220110124638.610145-1-f4bug@amsat.org>=0D
=0D
Michael Tokarev (1):=0D
  drop libxml2 checks since libxml is not actually used (for parallels)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  MAINTAINERS: Cover lcitool submodule with build test / automation=0D
  tests: Refresh lcitool submodule=0D
  tests/lcitool: Install libibumad to cover RDMA on Debian based distros=0D
  tests/lcitool: Remove libxml2=0D
  tests: Manually remove libxml2 on MSYS2 targets=0D
=0D
 meson.build                                     | 6 ------=0D
 .cirrus.yml                                     | 1 -=0D
 .gitlab-ci.d/windows.yml                        | 2 --=0D
 MAINTAINERS                                     | 1 +=0D
 block/meson.build                               | 3 +--=0D
 meson_options.txt                               | 2 --=0D
 scripts/ci/org.centos/stream/8/x86_64/configure | 1 -=0D
 scripts/coverity-scan/coverity-scan.docker      | 1 -=0D
 scripts/coverity-scan/run-coverity-scan         | 2 +-=0D
 tests/docker/dockerfiles/alpine.docker          | 4 ++--=0D
 tests/docker/dockerfiles/centos8.docker         | 4 +---=0D
 tests/docker/dockerfiles/fedora.docker          | 4 +---=0D
 tests/docker/dockerfiles/opensuse-leap.docker   | 3 +--=0D
 tests/docker/dockerfiles/ubuntu1804.docker      | 4 ++--=0D
 tests/docker/dockerfiles/ubuntu2004.docker      | 4 ++--=0D
 tests/lcitool/libvirt-ci                        | 2 +-=0D
 tests/lcitool/projects/qemu.yml                 | 2 +-=0D
 17 files changed, 14 insertions(+), 32 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

