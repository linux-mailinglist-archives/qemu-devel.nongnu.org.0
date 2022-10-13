Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C855FDD96
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:53:14 +0200 (CEST)
Received: from localhost ([::1]:52590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0WE-0003O9-Qy
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QS-00063n-Gw
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:12 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QQ-0006nh-92
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:12 -0400
Received: by mail-wr1-x430.google.com with SMTP id j7so3501357wrr.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s9tLEkGMjx+LeRH2K1bXF7eut3rxyi+ihNtthl4Zd5o=;
 b=nkQI8G3be+0K6dP7DRKs4rH4rDiNECC0S+1S9GwSa2u6ef/th9+UWAQMnibxL4Ddpr
 X/naGim0Lnmsz82U+hYbs3ds0HxcIkrGT+3lLdUpHRLp8gBKtjl5qIRf/QF90P84rQfW
 Po2CjSuf0aPwkf8/f+xM7ZjhU7wgTpNR2V79QaFrnGJZxwItF+v6pG+kr1Xp1YV+7Rtu
 Gs6iG9w0ZJ8tm4rHKBYq3Symm0hcu/qv7Zw0k2Dufxr9uywa6Oc5PFtbJQpcNp/5wqST
 gqjZibEU8y/+87HW3/KHOwmABpXpUmBvfuAwONNe/W3yOrwo1KB48ihQS3pkBlr259UC
 AFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s9tLEkGMjx+LeRH2K1bXF7eut3rxyi+ihNtthl4Zd5o=;
 b=6bibk1D3zZ8dzRgq4RigyLT89TEDTG1S/SyuKS9oIbEJ5K35FX32Avi5Ymp5YJtg/5
 gjCBEIuvtmy7McsVBrLcfvoEsRxfDn047khQYrUY72PqvgGUYARIp6N21XnVsDD/4JXa
 LLflnHD1mRvxyB5LQqwjwZHonc3MObZtXXM/vIJgZtrjN38os4VfBgnIWqTv3rI5kcFu
 Htchu6uCnIN1ZQFbWAdkL9YnJ7l5VktHjgH0hmKYnOjCkbRFZwne2g7QX1e27wBtjENR
 dITjkyfKhMZY3vGTWTaDXwC7L6b4ycUYvb+BrKSSYr+eH3tJaDen7uytrf8M79qJfkND
 tVXg==
X-Gm-Message-State: ACrzQf2EnVwA+wr3oa1L9KRXXo3sWvT91B1AFXDxl2SZQ/Rt+SzTM/hA
 YgSyINhLUFxAb43vKLz7KbfwqQ==
X-Google-Smtp-Source: AMsMyM53QrpIprRhvx1VpQX3RfgaHUUQeik0pwMEaHmRtCLHVb/sZCoq0lOtaPZEaACaJsoPT6/oOQ==
X-Received: by 2002:adf:f2c8:0:b0:22e:223a:330e with SMTP id
 d8-20020adff2c8000000b0022e223a330emr443614wrp.8.1665676027712; 
 Thu, 13 Oct 2022 08:47:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b003a601a1c2f7sm5101579wmq.19.2022.10.13.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 08:47:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 892251FFB7;
 Thu, 13 Oct 2022 16:47:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 0/7] testing/next (configure, RUNC, win32|64)
Date: Thu, 13 Oct 2022 16:46:58 +0100
Message-Id: <20221013154705.1846261-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

OK back to hopefully a less hectic set of testing updates. This
includes a number of patches from the last iteration and also an
attempt to avoid using docker.py for the builds and instead call the
container engine directly.

I've actually pushed the results of:

  make docker-image-debian-hexagon-cross V=1 NOCACHE=1 NOUSER=1
  docker tag qemu/debian-hexagon-cross:latest registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross
  docker push registry.gitlab.com/qemu-project/qemu/qemu/debian-hexagon-cross

but sadly the build attempts to regenerate the container locally
(rather than caching all the steps except the last).

Please review.


Alex Bennée (6):
  tests/docker: update fedora-win[32|64]-cross with lcitool
  tests/docker: update test-mingw to run single build
  configure: don't enable cross compilers unless in target_list
  configure: fix the --enable-static --disable-pie case
  configure: expose the direct container command
  tests/docker: use direct RUNC call in debian-toolchain

Anton Johansson (1):
  tests/docker: Add flex/bison to `debian-all-test`

 configure                                     |  13 +-
 tests/docker/Makefile.include                 |  38 +--
 tests/docker/dockerfiles/alpine.docker        |   2 +-
 tests/docker/dockerfiles/centos8.docker       |   2 +-
 .../dockerfiles/debian-all-test-cross.docker  |   2 +
 .../dockerfiles/debian-amd64-cross.docker     | 234 ++++++++---------
 tests/docker/dockerfiles/debian-amd64.docker  | 236 +++++++++---------
 .../dockerfiles/debian-arm64-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-armel-cross.docker     | 230 ++++++++---------
 .../dockerfiles/debian-armhf-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-hexagon-cross.docker   |   5 +
 .../dockerfiles/debian-mips64el-cross.docker  | 226 ++++++++---------
 .../dockerfiles/debian-mipsel-cross.docker    | 226 ++++++++---------
 .../dockerfiles/debian-ppc64el-cross.docker   | 230 ++++++++---------
 .../dockerfiles/debian-s390x-cross.docker     | 228 ++++++++---------
 .../dockerfiles/debian-toolchain.docker       |   5 +
 .../dockerfiles/fedora-win32-cross.docker     | 139 ++++++++---
 .../dockerfiles/fedora-win64-cross.docker     | 138 +++++++---
 tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
 tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
 tests/docker/dockerfiles/ubuntu2004.docker    | 234 ++++++++---------
 tests/docker/test-mingw                       |  16 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  48 ++--
 24 files changed, 1549 insertions(+), 1401 deletions(-)

-- 
2.34.1


