Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5611E0F56
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 15:22:28 +0200 (CEST)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdD3j-0000ir-Lq
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 09:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdD0b-0004Al-4N
 for qemu-devel@nongnu.org; Mon, 25 May 2020 09:19:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35137
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdD0a-0004D6-7y
 for qemu-devel@nongnu.org; Mon, 25 May 2020 09:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590412751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=9VWgymfj7voU3ZB+90xqh8f5PhrfYdnnmPmhVIXrKDI=;
 b=W+I3JeLA/wCr9gwVhSAjTmVEdJC7L4zp6Q2r9rM7OSycyqNTw0oUduBc6mMy7Q0jcBeSeQ
 TAfwZ8TNR+NaaLrq0bZVdjn84xxTvyQUFc1X19kJ1cxqcZF5t+a+HB6hP/Y9TNxa0I0vyj
 uh+31N7QV5MhO2nhOxckAhufX4j/2TE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-OzY78ig6Ph-WZh98Ml4SbA-1; Mon, 25 May 2020 09:19:09 -0400
X-MC-Unique: OzY78ig6Ph-WZh98Ml4SbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D08EA1005510;
 Mon, 25 May 2020 13:19:08 +0000 (UTC)
Received: from thuth.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4699C5C1BB;
 Mon, 25 May 2020 13:19:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] gitlab-ci: Determine the number of jobs dynamically
Date: Mon, 25 May 2020 15:18:22 +0200
Message-Id: <20200525131823.715-7-thuth@redhat.com>
In-Reply-To: <20200525131823.715-1-thuth@redhat.com>
References: <20200525131823.715-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 01:44:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some people might want to run the gitlab CI pipelines in an environment
where multiple CPUs are available to the runners, so let's rather get
the number for "-j" from the "nproc" program (increased by 1 to compensate
for jobs that wait for I/O) instead of hard-coding it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 559ec2ab4d..349c77aa58 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -7,12 +7,14 @@ include:
   - apt-get update -qq
   - apt-get install -y -qq git gcc libglib2.0-dev libpixman-1-dev make
         genisoimage
+  - JOBS=$(expr $(nproc) + 1)
 
 .update_dnf_template: &before_script_dnf
  before_script:
   - dnf update -y
   - dnf install -y bzip2 diffutils gcc git genisoimage findutils glib2-devel
         make python3 perl-podlators perl-Test-Harness pixman-devel zlib-devel
+  - JOBS=$(expr $(nproc) + 1)
 
 build-system1:
  image: ubuntu:19.10
@@ -25,8 +27,8 @@ build-system1:
  - ../configure --enable-werror --target-list="aarch64-softmmu alpha-softmmu
       cris-softmmu hppa-softmmu lm32-softmmu moxie-softmmu microblazeel-softmmu
       mips64el-softmmu m68k-softmmu ppc-softmmu riscv64-softmmu sparc-softmmu"
- - make -j2
- - make -j2 check
+ - make -j"$JOBS"
+ - make -j"$JOBS" check
 
 build-system2:
  image: fedora:latest
@@ -40,8 +42,8 @@ build-system2:
  - ../configure --enable-werror --target-list="tricore-softmmu unicore32-softmmu
       microblaze-softmmu mips-softmmu riscv32-softmmu s390x-softmmu sh4-softmmu
       sparc64-softmmu x86_64-softmmu xtensa-softmmu nios2-softmmu or1k-softmmu"
- - make -j2
- - make -j2 check
+ - make -j"$JOBS"
+ - make -j"$JOBS" check
 
 build-disabled:
  image: fedora:latest
@@ -56,8 +58,8 @@ build-disabled:
       --disable-qom-cast-debug --disable-spice --disable-vhost-vsock
       --disable-vhost-net --disable-vhost-crypto --disable-vhost-user
       --target-list="i386-softmmu ppc64-softmmu mips64-softmmu i386-linux-user"
- - make -j2
- - make -j2 check-qtest SPEED=slow
+ - make -j"$JOBS"
+ - make -j"$JOBS" check-qtest SPEED=slow
 
 build-tcg-disabled:
  image: centos:8
@@ -67,7 +69,7 @@ build-tcg-disabled:
  - mkdir build
  - cd build
  - ../configure --cc=clang --enable-werror --disable-tcg --audio-drv-list=""
- - make -j2
+ - make -j"$JOBS"
  - make check-unit
  - make check-qapi-schema
  - cd tests/qemu-iotests/
@@ -86,7 +88,7 @@ build-user:
  - cd build
  - ../configure --enable-werror --disable-system --disable-guest-agent
                --disable-capstone --disable-slirp --disable-fdt
- - make -j2
+ - make -j"$JOBS"
  - make run-tcg-tests-i386-linux-user run-tcg-tests-x86_64-linux-user
 
 build-clang:
@@ -100,8 +102,8 @@ build-clang:
  - ../configure --cc=clang --cxx=clang++ --enable-werror
       --target-list="alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
                      ppc-softmmu s390x-softmmu x86_64-softmmu arm-linux-user"
- - make -j2
- - make -j2 check
+ - make -j"$JOBS"
+ - make -j"$JOBS" check
 
 build-tci:
  image: centos:8
@@ -112,7 +114,7 @@ build-tci:
  - cd build
  - ../configure --enable-tcg-interpreter
       --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)"
- - make -j2
+ - make -j"$JOBS"
  - make run-tcg-tests-x86_64-softmmu
  - make tests/qtest/boot-serial-test tests/qtest/cdrom-test tests/qtest/pxe-test
  - for tg in $TARGETS ; do
-- 
2.18.1


