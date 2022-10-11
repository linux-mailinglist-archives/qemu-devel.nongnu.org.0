Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316745FB2CC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:00:10 +0200 (CEST)
Received: from localhost ([::1]:60344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiErg-0003JN-VM
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiDWf-0004dZ-Rm
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:34:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiDWd-0004KK-T7
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:34:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bp11so8398471wrb.9
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=swpAeTXkw+r3Pdnuc+Et6l8kTLpvDMCsn+BVyozRXBk=;
 b=PiL+vx+N7gkYZuVTltmhXIIwRhpZoCmOPsrr1S6zIvFsxCKMkPVwtH7sYvWc9n/vYn
 IREeLZhprKwGZqhzEU6sxv84mhvtnrE80vfj8SxvkGmL6hvuf7u5cO8rohv0+fpORP4x
 kyLbniooJ1Z9Gi2Vo7Mu0ih9J2pM9gjzg9rv4oGb5X1/8G9r3s2M03nhT70afMIgl+yH
 OzVrJdKqmzHfaKX3EJIImyBfKnxE4Ie4haGcPnOoVix5/4P0lUb5A62lDCWh3lSluSmo
 FxzXEWe6bYB+bYJWc4mHyuzLn9fmvyiY335hvYUDCIwREdOpg3CH5eUTY42JTXGvbx16
 96qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=swpAeTXkw+r3Pdnuc+Et6l8kTLpvDMCsn+BVyozRXBk=;
 b=NFttJXVsWdgqutIMJy9I2Gg1t/PMAtojOLLCQwgw7Q7iLfWGpaLmGhaD2090UTL+yU
 Lk4+HzCA17EdGkY8fEFNrSS5aEUjTK7bk6xguU8RH5Gml2A0IlOKTxZn4OIZbiFzx0Iv
 iCPSYjk6PijZctp6hBQP6/cBTGga4B24/8mrn5kvJucV0PsgM/VrG3UsX1ScJoIjsJAO
 LBE9Wba034WLubxhbSnMlRHJFu5B2laIiOuSAdcm2l8Uu2PAJectK19/HSqQXQ4hTwnY
 jCqG4YAXaDbzfW+s8W3GluOMIwaqmt5G623c1fbUC4wS78zwz9Q88KBn6Ksf9Hcg4Vba
 ZFYw==
X-Gm-Message-State: ACrzQf113ZPAolQ2ZVg/in6CNy43WTrgRVhzH7whZSOw5HwDuQV50jbI
 3TXks27aA7J9p+/AizIbJ3k5zw==
X-Google-Smtp-Source: AMsMyM6ReULISw3MsSV19WmLr9Ea3kv/5HawNg+Qou2pvCNViuqZceun7zGUzS6+ORhkEu3B1m7dJw==
X-Received: by 2002:adf:e109:0:b0:225:4ca5:80d5 with SMTP id
 t9-20020adfe109000000b002254ca580d5mr14443492wrz.465.1665488058469; 
 Tue, 11 Oct 2022 04:34:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v127-20020a1cac85000000b003b505d26776sm17913809wme.5.2022.10.11.04.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 04:34:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C2401FFB7;
 Tue, 11 Oct 2022 12:34:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/4] testing/next hotfix (revert bios build, mingw)
Date: Tue, 11 Oct 2022 12:34:13 +0100
Message-Id: <20221011113417.794841-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Consider this a hotfix testing/next series. I hadn't noticed the
update to build the BIOS's would trigger a lot of downloading for a
normal build. I've reverted one patch which stops that from happening
and we can revisit enabling this is a more sustainable way later.

Also we have updates for the win32/64 builds which didn't make the
last PR although they currently rely on a out-of-tree libvirt-ci
update.

I'm still without CI minutes so haven't been able to run this through
gitlab yet.

Please review (and push to CI) so I can spin a PR today.

Alex Bennée (4):
  tests/docker: update fedora-win[32|64]-cross with lcitool
  tests/docker: update test-mingw to run single build
  Revert "configure: build ROMs with container-based cross compilers"
  configure: expose the direct container command

 configure                                     |  33 ++-
 tests/docker/dockerfiles/alpine.docker        |   2 +-
 tests/docker/dockerfiles/centos8.docker       |   2 +-
 .../dockerfiles/debian-amd64-cross.docker     | 234 ++++++++---------
 tests/docker/dockerfiles/debian-amd64.docker  | 236 +++++++++---------
 .../dockerfiles/debian-arm64-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-armel-cross.docker     | 230 ++++++++---------
 .../dockerfiles/debian-armhf-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-mips64el-cross.docker  | 226 ++++++++---------
 .../dockerfiles/debian-mipsel-cross.docker    | 226 ++++++++---------
 .../dockerfiles/debian-ppc64el-cross.docker   | 230 ++++++++---------
 .../dockerfiles/debian-s390x-cross.docker     | 228 ++++++++---------
 .../dockerfiles/fedora-win32-cross.docker     | 139 ++++++++---
 .../dockerfiles/fedora-win64-cross.docker     | 138 +++++++---
 tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
 tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
 tests/docker/dockerfiles/ubuntu2004.docker    | 234 ++++++++---------
 tests/docker/test-mingw                       |  16 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  48 ++--
 20 files changed, 1520 insertions(+), 1400 deletions(-)

-- 
2.34.1


