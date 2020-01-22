Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8DE144957
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 02:30:19 +0100 (CET)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu4qY-0002dg-3M
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 20:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1iu4oU-000196-QV
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 20:28:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1iu4oS-0004Ln-73
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 20:28:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52123
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1iu4oR-0004LM-QK
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 20:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579656487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZGnOeCb+HX3ZYT+0UWuqmdl4QzEYfGj2k0sOkWcJtyI=;
 b=Qs90CitZuSEVeFoCu/mWgPfZVnjfXygrM7v1hHLBsf1suD27iHWI1W4GsFfeSDotHolr8B
 Ixiyg5x2mt118tvmUkHPO4HoOUyZbJtu44UpvYU0A0tivL9cM8gnD0N5k/bAaicUJZbH6I
 SMvNAciBxfnnJwW31gOC7cIiaLDLnng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-5q-g39xrPe-tlUqHBZ_LUA-1; Tue, 21 Jan 2020 20:28:03 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 180FF107ACCA;
 Wed, 22 Jan 2020 01:28:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-78.gru2.redhat.com
 [10.97.116.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B15385733;
 Wed, 22 Jan 2020 01:27:56 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] Acceptance tests: boot Linux with KVM test
Date: Tue, 21 Jan 2020 22:27:49 -0300
Message-Id: <20200122012753.9846-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 5q-g39xrPe-tlUqHBZ_LUA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: philmd@redhat.com, thuth@redhat.com, alex.bennee@linaro.org,
 ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds boot Linux tests for x86_64, aarch64, ppc64, and s390x
targets which, unlike others, enable the KVM acceleration. Likewise
it was added test cases for tcg.

It is introduced an infraestructure on avocado_qemu framework
so that:
a) simply tagging the test with `accel:kvm` (or `accel:tcg`) will
automatically set the corresponding '-accel' on the launched
QEMU;
b) test is canceled if the accelerator is not enabled on the QEMU
binary or not available in the host.

The acceptance builder on Travis was changed too in order to make
the test run.

Changes v2 -> v3:
- Uses '-accel kvm' rather than '-enable-kvm' when automatically setting
  the accelerator [thuth]
- Added patch 04 which enable the KVM acceptance tests to run on
  Travis [thuth]
v2: [PATCH v2 0/3] Acceptance tests: boot Linux with KVM test
- https://www.mail-archive.com/qemu-devel@nongnu.org/msg666238.html
v1: [PATCH 0/3] Acceptance tests: boot Linux with KVM test
- https://www.mail-archive.com/qemu-devel@nongnu.org/msg627498.html

Tree:
- Git: https://github.com/wainersm/qemu
- Branch: acceptance_kvm_test-v3

CI:
- Travis (PASS): https://travis-ci.org/wainersm/qemu/builds/640172969

Wainer dos Santos Moschetta (4):
  tests/acceptance: avocado_qemu: Introduce the 'accel' test parameter
  tests/acceptance: boot_linux_console: Add boot Linux with kvm tests
  tests/acceptance: avocado_qemu: Refactor the handler of 'machine'
    parameter
  travis.yml: Enable acceptance KVM tests

 .travis.yml                               |  7 +-
 docs/devel/testing.rst                    | 16 +++++
 tests/acceptance/avocado_qemu/__init__.py | 27 ++++++-
 tests/acceptance/boot_linux_console.py    | 88 +++++++++++++++++------
 4 files changed, 115 insertions(+), 23 deletions(-)

--=20
2.23.0


