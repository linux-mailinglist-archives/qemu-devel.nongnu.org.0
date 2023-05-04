Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3326F715F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:44:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucq0-0002dI-Im; Thu, 04 May 2023 13:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pubAG-0006O9-G4
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:46:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pubAE-0004jF-It
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683215196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=laFIMdHqE0FAySWYc/7xIg86Al6FwYT6TYYRQWvViJI=;
 b=Gpe2D3gz8vWpyGHnThuEfJFITdIwJH/OhVKphZN8jwZ5Cr3P1Agc4nbT8OvJt8CN4mZI/c
 4xLojpv1Br/Pd2Nu/MqPI4av/6oUsIG3c67S0Pb6dqhO1Xypk0cCKC0Up+QdX08N5gyiN4
 bH6q70aO2p1tEsPbix8ebPw/IDpu+O8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-R1Py3UAqOEqa9N2gOnz7KA-1; Thu, 04 May 2023 11:46:33 -0400
X-MC-Unique: R1Py3UAqOEqa9N2gOnz7KA-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-24e0d569a01so325512a91.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 08:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683215191; x=1685807191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=laFIMdHqE0FAySWYc/7xIg86Al6FwYT6TYYRQWvViJI=;
 b=WRxfRixFvFjqg0YF8RnZEuM6kXU1IDmNdMpCl47PaenO+VBqw1p9rQnTwm3Dz8u8Ak
 6ek7S8Be00YQeClnhXJflk5sVwW2v1ZSw27qStJVVJ4EIL2eXydTiUWCo0GdupT2z7Am
 wazPifHRA5bRcdcsQpy1qwbiZj3ijevSdehufGJyKA5oY5389cVFrP3J0QTWocTBFSlN
 rdGPKTkmcFgYEEFMjCMTqcRtb1bx20sQe208E4J13V+sYtWd/3s2QBxBS9+RWO/lke7f
 crHsZNIix6/4Q0YAk6GNDRsohcPFpubxrRaaH4SRoTBtBGqz32XI3P5mYuCK4pa3wZcZ
 xbiQ==
X-Gm-Message-State: AC+VfDwzkYCrd60UfnYz+3JNNj2XL6roGbYfegnO/zDzxxuF1S/jxyxe
 DHhOOY49Ca8ZAYV2StHTg11ISALaCeYJpYT3/IoE71G5RYXouv0VXBy4+g/ybCJXfL/JDjhB94o
 JCEqFIUw1I8aiIQt8Cju9zFYLnWKG59Oosgh5R+1cgFP3GG8mqDf/x7MiZ5haYP+vqoabhCql+v
 c=
X-Received: by 2002:a17:90a:474d:b0:24b:af7d:201d with SMTP id
 y13-20020a17090a474d00b0024baf7d201dmr2635265pjg.24.1683215191475; 
 Thu, 04 May 2023 08:46:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+wxJtyXE/wuAqy5v260io2xj9yfgA0Qd2oaa0Ys+J0RWN8DSPc0YSARR5Ixo7zsBL22sx+g==
X-Received: by 2002:a17:90a:474d:b0:24b:af7d:201d with SMTP id
 y13-20020a17090a474d00b0024baf7d201dmr2635233pjg.24.1683215191042; 
 Thu, 04 May 2023 08:46:31 -0700 (PDT)
Received: from localhost.localdomain ([115.96.136.25])
 by smtp.googlemail.com with ESMTPSA id
 cu19-20020a17090afa9300b0024df4cfc881sm3282829pjb.10.2023.05.04.08.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 08:46:30 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, mst@redhat.com, berrange@redhat.com,
 alex.bennee@linaro.org, philmd@linaro.org, wainersm@redhat.com,
 bleal@redhat.com, thuth@redhat.com
Subject: [PATCH v2 0/2] tests/lcitool: Add mtools and xorriso and remove
 genisoimage as dependencies
Date: Thu,  4 May 2023 21:16:09 +0530
Message-Id: <20230504154611.85854-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

mformat and xorriso tools are needed by biosbits avocado tests. This patchset
adds those two tools in the docker container images.
xorriso package conflicts with genisoimage package on some distributions.
Therefore, it is not possible to have both the packages at the same time
in the container image uniformly for all distribution flavors. Further,
on some distributions like RHEL, both xorriso and genisoimage
packages provide /usr/bin/genisoimage and on some other distributions like
Fedora, only genisoimage package provides the same utility.
Therefore, this change removes the dependency on geninsoimage for building
container images altogether keeping only xorriso package. At the same time,
cdrom-test.c is updated to use and check for existence of only xorrisofs.

Patch 1 pulls in the latest changes in lcitool in order to add mappings
for these packages in various distros.
Patch 2 updates all Dockerfiles in QEMU repository to add these two
tools. It also removed genisoimage package and updated cdrom-test to not
use genisoimage but xorrisofs.

CC: mst@redhat.com
CC: berrange@redhat.com
CC: alex.bennee@linaro.org
CC: philmd@linaro.org
CC: wainersm@redhat.com
CC: bleal@redhat.com
CC: thuth@redhat.com
TO: qemu-devel@nongnu.org

Changelog:
v2: remove genisoimage package and update Dockerfile. Also update cdrom-test.c
so that it uses xorrisofs and not genisoimage. I have tested patch #2 on both
Fedora 37 and RHEL 9.1. cdrom-test passed on both.

Ani Sinha (2):
  tests: libvirt-ci: Update to commit 'c8971e90ac' to pull in mformat
    and xorriso
  tests/lcitool: Add mtools and xorriso and remove genisoimage as
    dependencies

 .gitlab-ci.d/cirrus/freebsd-13.vars                |  2 +-
 .gitlab-ci.d/cirrus/macos-12.vars                  |  2 +-
 tests/docker/dockerfiles/alpine.docker             |  3 ++-
 tests/docker/dockerfiles/centos8.docker            |  3 ++-
 tests/docker/dockerfiles/debian-amd64-cross.docker |  3 ++-
 tests/docker/dockerfiles/debian-amd64.docker       |  3 ++-
 tests/docker/dockerfiles/debian-arm64-cross.docker |  3 ++-
 tests/docker/dockerfiles/debian-armel-cross.docker |  3 ++-
 tests/docker/dockerfiles/debian-armhf-cross.docker |  3 ++-
 .../dockerfiles/debian-mips64el-cross.docker       |  3 ++-
 .../docker/dockerfiles/debian-mipsel-cross.docker  |  3 ++-
 .../docker/dockerfiles/debian-ppc64el-cross.docker |  3 ++-
 tests/docker/dockerfiles/debian-s390x-cross.docker |  3 ++-
 tests/docker/dockerfiles/fedora-win32-cross.docker |  3 ++-
 tests/docker/dockerfiles/fedora-win64-cross.docker |  3 ++-
 tests/docker/dockerfiles/fedora.docker             |  3 ++-
 tests/docker/dockerfiles/opensuse-leap.docker      |  3 ++-
 tests/docker/dockerfiles/ubuntu2004.docker         |  3 ++-
 tests/docker/dockerfiles/ubuntu2204.docker         |  3 ++-
 tests/lcitool/libvirt-ci                           |  2 +-
 tests/lcitool/projects/qemu.yml                    |  3 ++-
 tests/qtest/cdrom-test.c                           | 14 +++++++-------
 22 files changed, 46 insertions(+), 28 deletions(-)

-- 
2.31.1


