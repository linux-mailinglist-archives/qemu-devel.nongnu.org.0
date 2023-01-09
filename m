Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC25662E84
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:16:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwfk-0006Z2-BH; Mon, 09 Jan 2023 13:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pEwfi-0006Ym-LL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:14:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pEwfg-0005tB-AC
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673288095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2vnh2UtCuB8CgFfPVhIDlvTz0oe1SrzLoqBCROMVjJ0=;
 b=TLLDZ3rzyDoWQxA7Se1QgyeRcfgdc7CmQtS9NLCnqMc7PqTrwZ7rOW8J/cz804Exc6P+gV
 q4DNwkk4wtn3Xl+7SapF39AeHNxDGtVe5eXpV9mnMXp52MZ3QrFzyTbrYXzdi3cvE4SgSf
 PpYrpt3yYJOCgvV0jBHrgC6UM9o89oE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-cYOwRLb0N6q2CHkHJNcIJg-1; Mon, 09 Jan 2023 13:14:52 -0500
X-MC-Unique: cYOwRLb0N6q2CHkHJNcIJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 487AA857F40;
 Mon,  9 Jan 2023 18:14:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D72F4078903;
 Mon,  9 Jan 2023 18:14:49 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, John Snow <jsnow@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 David Hildenbrand <david@redhat.com>, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 0/5] Fix win32/msys2 shader compilation & drop perl
Date: Mon,  9 Jan 2023 22:14:42 +0400
Message-Id: <20230109181447.235989-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

Fix the shader compilation error on win32/msys2 and convert the related script
from perl to python.

v2:
- add a few patches to drop perl from the build dependencies
- add some tags for v1 patches
- add copyright header to the python script

Marc-André Lureau (5):
  build-sys: fix crlf-ending C code
  .gitlab-ci.d/windows: do not disable opengl
  configure: replace Perl usage with sed
  meson: replace Perl usage with Python
  Draft: Update lcitool

 configure                                     |  8 +++---
 meson.build                                   |  2 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |  2 +-
 .gitlab-ci.d/windows.yml                      |  5 ++--
 scripts/ci/setup/build-environment.yml        |  1 -
 scripts/shaderinclude.pl                      | 16 ------------
 scripts/shaderinclude.py                      | 26 +++++++++++++++++++
 tests/docker/dockerfiles/alpine.docker        |  1 -
 tests/docker/dockerfiles/centos8.docker       |  1 -
 .../dockerfiles/debian-amd64-cross.docker     |  1 -
 tests/docker/dockerfiles/debian-amd64.docker  |  1 -
 .../dockerfiles/debian-arm64-cross.docker     |  1 -
 .../dockerfiles/debian-armel-cross.docker     |  1 -
 .../dockerfiles/debian-armhf-cross.docker     |  1 -
 .../dockerfiles/debian-mips64el-cross.docker  |  1 -
 .../dockerfiles/debian-mipsel-cross.docker    |  1 -
 .../dockerfiles/debian-ppc64el-cross.docker   |  1 -
 .../dockerfiles/debian-s390x-cross.docker     |  1 -
 .../dockerfiles/debian-tricore-cross.docker   |  1 -
 .../dockerfiles/fedora-win32-cross.docker     |  5 ++--
 .../dockerfiles/fedora-win64-cross.docker     |  5 ++--
 tests/docker/dockerfiles/fedora.docker        |  5 ++--
 tests/docker/dockerfiles/opensuse-leap.docker |  1 -
 tests/docker/dockerfiles/ubuntu2004.docker    |  1 -
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/projects/qemu.yml               |  1 -
 tests/lcitool/refresh                         |  6 ++---
 tests/qapi-schema/meson.build                 |  7 ++---
 tests/vm/centos.aarch64                       |  2 +-
 31 files changed, 50 insertions(+), 61 deletions(-)
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100755 scripts/shaderinclude.py

-- 
2.39.0


