Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E95B69D7F6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 02:26:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUHP9-0003AQ-Sw; Mon, 20 Feb 2023 20:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUHP5-00039X-Iq
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 20:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUHP3-0006BA-Hx
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 20:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676942708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YnqaeXgTu+v8DNUsabIh4l5M9MMZ/FkEDT0N4nVdwk=;
 b=jAw3VyHutqwePx7kA+i+CeIteTTU37ihsXftQsjy95MMT3DrycivpqdMPo1qhSIFY+mjVG
 iulPRycB7O2liCl2zNXbpIWnHsiqKhTvog2caEAUniQ8vUUzaU0sKmxMTD+uZKs/f8MJaZ
 srtrYDGvqw8+iDnYMsgcAN04RFavAxQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-rlXjSyEXP_ON1CAp4BsXoQ-1; Mon, 20 Feb 2023 20:25:00 -0500
X-MC-Unique: rlXjSyEXP_ON1CAp4BsXoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88B00811E6E;
 Tue, 21 Feb 2023 01:24:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F10542166B26;
 Tue, 21 Feb 2023 01:24:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Subject: [PATCH v3 4/6] DO-NOT-MERGE: testing: add pip-installed sphinx-build
 to CentOS 8
Date: Mon, 20 Feb 2023 20:24:54 -0500
Message-Id: <20230221012456.2607692-5-jsnow@redhat.com>
In-Reply-To: <20230221012456.2607692-1-jsnow@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

This is just for sake of demonstration again; by modifying the
dockerfile we can continue to support building docs on CentOS 8 with
minimal pain.

Note: This uses pip to install packages as root; this is hygienically
not a *great* idea for arbitrary systems. For CI, I am abusing the fact
that this is a custom-built environment that does not get altered after
being built. Individual developers should almost certainly just use a
virtual environment to avoid interfering with their system.

That process can look like this:

1. Install the new python interpreter:
   > sudo dnf install python38

2. Go to a folder where you'd be happy to store some python crud:
   > cd ~/.cache

3. Create a virtual environment using the new python:
   > python3.8 -m venv qemu_venv

4. Install a modern version of sphinx into this venv:
   > ./qemu_venv/bin/pip install sphinx

5. Try running sphinx-build:
   > ./qemu_venv/bin/sphinx-build --help

From here, you can specify ~/.cache/qemu_venv/bin/sphinx-build as your
sphinx binary to configure in order to get doc building. This approach
doesn't interfere with anything; it requires you specifically to opt
into using it, which is likely the safest option if you don't have a lot
of Python knowhow.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/docker/dockerfiles/centos8.docker | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index a3bfddf382d..a53ccada55a 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -129,6 +129,10 @@ RUN dnf distro-sync -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
+RUN /usr/bin/python3.8 -m ensurepip && \
+    /usr/bin/python3.8 -m pip --no-cache-dir install sphinx sphinx-rtd-theme
+
+
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
-- 
2.39.0


