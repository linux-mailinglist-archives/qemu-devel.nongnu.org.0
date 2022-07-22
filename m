Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1349C57E213
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 15:09:34 +0200 (CEST)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEsPN-0002AM-0Z
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 09:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEsKg-0005aA-Po
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEsKa-0000tf-DF
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658495075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LOzPV5e9U4xvLRgG9vwc1jq4IFt2LVNPOuotxJggYB8=;
 b=JAVyh+YQFSHAYpI+nHbqzgEil7T9Cm/Vgz8gctfmL8rZkcjkDKLX3PAwFt1aVdUMnBhUj8
 Sgv03ubvoOhZM7geuVlS2TwU3ukmf6rG7O3PShK4kj3+xoPSNCNa1o0wFTIQMS2lonJl6w
 zllAHbFOfU4ZNqzxIQZg3kCga0dMOjE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-eSxC1qd3OJ6ct8MmVWfePg-1; Fri, 22 Jul 2022 09:04:34 -0400
X-MC-Unique: eSxC1qd3OJ6ct8MmVWfePg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE6AB8037AE;
 Fri, 22 Jul 2022 13:04:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A0F7492C3B;
 Fri, 22 Jul 2022 13:04:32 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 0/3] ci: refresh packages/containers and misc changes
Date: Fri, 22 Jul 2022 14:04:28 +0100
Message-Id: <20220722130431.2319019-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Mostly this is to get the latest libvirt-ci content pulled in,
but I throw two small fixes on top.

Changed in v2:

  - Reworded various bits of the commit message
    for first patch

Daniel P. Berrangé (3):
  tests: refresh to latest libvirt-ci module
  gitlab: show testlog.txt contents when cirrus/custom-runner jobs fail
  gitlab: drop 'containers-layer2' stage

 .gitlab-ci.d/cirrus/build.yml                 |  3 ++-
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  3 +--
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  3 +--
 .gitlab-ci.d/cirrus/macos-11.vars             |  4 ++--
 .gitlab-ci.d/container-cross.yml              | 24 +++++++++----------
 .../custom-runners/centos-stream-8-x86_64.yml |  2 ++
 .../custom-runners/ubuntu-20.04-aarch32.yml   |  2 ++
 .../custom-runners/ubuntu-20.04-aarch64.yml   | 12 ++++++++++
 .../custom-runners/ubuntu-20.04-s390x.yml     | 12 ++++++++++
 .gitlab-ci.d/stages.yml                       |  1 -
 tests/docker/dockerfiles/alpine.docker        |  4 +++-
 tests/docker/dockerfiles/centos8.docker       |  6 ++---
 tests/docker/dockerfiles/debian-amd64.docker  |  2 ++
 .../dockerfiles/debian-arm64-cross.docker     |  2 ++
 .../dockerfiles/debian-armel-cross.docker     |  2 ++
 .../dockerfiles/debian-armhf-cross.docker     |  2 ++
 .../dockerfiles/debian-mips64el-cross.docker  |  2 ++
 .../dockerfiles/debian-mipsel-cross.docker    |  2 ++
 .../dockerfiles/debian-ppc64el-cross.docker   |  2 ++
 .../dockerfiles/debian-s390x-cross.docker     |  2 ++
 tests/docker/dockerfiles/fedora.docker        |  3 ++-
 tests/docker/dockerfiles/opensuse-leap.docker |  7 +++---
 tests/docker/dockerfiles/ubuntu2004.docker    |  2 ++
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/projects/qemu.yml               |  6 +++--
 tests/lcitool/refresh                         |  4 ++--
 26 files changed, 83 insertions(+), 33 deletions(-)

-- 
2.36.1


