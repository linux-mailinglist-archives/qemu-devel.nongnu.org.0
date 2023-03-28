Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C97A6CCBFA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 23:12:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phGbK-0003Rh-5g; Tue, 28 Mar 2023 17:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1phGbG-0003R1-MA
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 17:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1phGbE-0004sV-LQ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 17:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680037884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cqDhTFXuMwRIaOiqmInD8u7Yx1PWYoEu50Bs7fN/YXM=;
 b=Fg9ZCzZneJJ+bvR+b7HwDMRAPb2lqIAmgNNoMOajdMHxJmtR8L7Tx2WebppYou1e/ns+eb
 +YYLPVUzFyqHOqayU3BUCEX2atQLLYAb/4ETbyv7okAo8/4K8K3rxejd80r8m//HRc7enO
 vu4xI3Hvs3i4tNw+feAUA3FaGRmCJ/Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-M1vslpIfNTmo5WodJGqK3g-1; Tue, 28 Mar 2023 17:11:20 -0400
X-MC-Unique: M1vslpIfNTmo5WodJGqK3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFE631C068CE;
 Tue, 28 Mar 2023 21:11:19 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93032C15BA0;
 Tue, 28 Mar 2023 21:11:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [RFC PATCH 0/3] configure: create a python venv and install meson
Date: Tue, 28 Mar 2023 17:11:16 -0400
Message-Id: <20230328211119.2748442-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

This patch series creates a mandatory venv during configure time and=0D
uses it to install meson.=0D
=0D
The eventual point of this is to ensure that the Python used to run=0D
meson is the same Python used to run Sphinx, tests, and any build-time=0D
scripting we have. As it stands, meson and sphinx (and their extensions)=0D
may run in a different Python environment than the one configured and=0D
chosen by the user at configure/build time.=0D
=0D
My goals for this series and future work are:=0D
=0D
- Unconditionally create a venv to be used for both building and testing=0D
  at configure time=0D
- The python interpreter used by this venv is unconditionally the one=0D
  specified by configure=0D
- *all* python scripts in qemu.git executed as part of the build system,=0D
   tests, or CI are *always* executed in the context of this venv.=0D
- It is possible to build and test fully offline with sufficient=0D
  preparation by installing appropriate system packages.=0D
- Missing depdencies, when possible, are fetched and installed=0D
  automatically to make developer environments "just work".=0D
- Minimize cost during configure time whenever possible.=0D
=0D
This series is in RFC state; some notable things:=0D
- So far, only meson is included in this setup.=0D
- There's a ton of debugging prints everywhere. It's extremely chatty right=
 now.=0D
- Sphinx and qemu.qmp are not yet included in this venv.=0D
  (qemu.qmp isn't able to be removed from the tree yet.)=0D
- Testing isn't yet *fully* switched over.=0D
- There is no online functionality yet, this series is *100% offline* -=0D
  it's the harder option, so I tackled it first.=0D
=0D
Some known bugs as of now:=0D
- venv-in-venv setups are not yet handled.=0D
- python3.7 setups without setuptools/pip in the host environment may be=0D
  unable to generate script file shims; a workaround is in development=0D
  but wasn't ready today. I decided to exclude it.=0D
=0D
The good news:=0D
- Works for Python 3.7 and up, on Fedora, OpenSuSE, Red Hat, CentOS, Alpine=
,=0D
  Debian, Ubuntu, NetBSD, OpenBSD, and hopefully everywhere=0D
- Startup cost is only milliseconds on the fast path=0D
- No new dependencies (...for most platforms; the asterisk is Debian.)=0D
- No new configure flags (...yet.)=0D
=0D
John Snow (3):=0D
  python: add mkvenv.py=0D
  tests: add python3-venv dependency=0D
  configure: install meson to a python virtual environment=0D
=0D
 configure                                     | 155 ++++--=0D
 .gitlab-ci.d/buildtest-template.yml           |   2 +-=0D
 python/scripts/mkvenv.py                      | 445 ++++++++++++++++++=0D
 .../dockerfiles/debian-all-test-cross.docker  |   3 +-=0D
 .../dockerfiles/debian-hexagon-cross.docker   |   3 +-=0D
 .../dockerfiles/debian-riscv64-cross.docker   |   3 +-=0D
 .../dockerfiles/debian-tricore-cross.docker   |   3 +-=0D
 7 files changed, 561 insertions(+), 53 deletions(-)=0D
 create mode 100644 python/scripts/mkvenv.py=0D
=0D
-- =0D
2.39.2=0D
=0D


