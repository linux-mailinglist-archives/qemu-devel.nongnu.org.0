Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0879469AC68
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 14:28:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT0lJ-0006li-Rj; Fri, 17 Feb 2023 08:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT0l8-0006h9-7R
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 08:26:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT0l6-0002Jv-9k
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 08:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676640398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YyEWsufYi24jIzkbEA2JmZYcJBl4qZPzpdEL9y+eEdc=;
 b=IQtoji7yOyr9JWOuV0KMZV61BR7ofQgWWmPjhWk1+HzN19+llHgtqHyw5ry+vo5j6XgWKc
 GkvYy0Fh1eOQAkiguRywcOebiC9+85C5N5iUavVvnl2MCtGuwe87LLv0qzIME7WxfxKwp6
 5j+FJB02rpjXMxELE3fsnLIsFRd3lo8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-nRCEOK4-NyGtFjy_94J70w-1; Fri, 17 Feb 2023 08:26:35 -0500
X-MC-Unique: nRCEOK4-NyGtFjy_94J70w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 261D638123BF;
 Fri, 17 Feb 2023 13:26:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96B4D175A2;
 Fri, 17 Feb 2023 13:26:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH] docs/about/build-platforms: Refine the distro support
 policy
Date: Fri, 17 Feb 2023 14:26:31 +0100
Message-Id: <20230217132631.403112-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

Our distro support policy has been written with a best-effort
estimation of what users and developers need. However, as we now
know, the support for older long-term distributions can get really
troublesome for upstream development, since it is for example close
to impossible to keep the code for all Python versions maintained,
especially if upstream projects dropped support a longer time ago
already (Python 3.6 has been EOL at the end of 2021) while it is
still the main version of some long-term distros (CentOS/RHEL 8 and
openSUSE/SLES 15).
The QEMU project only has a limited amount of people working on
the development, so we just cannot afford of supporting both, very
old and the latest versions of our dependencies without burning
the few people who are working on those topics. So we *have* to
refine our support statement instead:

1) Once a new major version has been released, it should be enough
to limit the support for the previous major versions to one year
instead of two. One year should be enough time to get all people
who are interested in following the development of QEMU and who would
like to use the latest and greatest version of QEMU to upgrade their
system to the next major release of their distribution. All others
are likely happy with the old version of QEMU that is provided by
their distributor anyway and thus likely won't try to compile the
latest and greatest version of QEMU on their system.

2) For long-term distributions that release a new version only very
seldom, we limit the support to four years after the initial release.

Note: These changes mean that openSUSE is not considered as supported
anymore (since version 15.0 has been released in May 2018), and
RHEL/CentOS 8 will not be supported anymore in 3 months (since version
8.0 has been released in May 2019).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/build-platforms.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 1c1e7b9e11..cdc38f16a4 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -67,10 +67,11 @@ Non-supported architectures may be removed in the future following the
 Linux OS, macOS, FreeBSD, NetBSD, OpenBSD
 -----------------------------------------
 
-The project aims to support the most recent major version at all times. Support
-for the previous major version will be dropped 2 years after the new major
-version is released or when the vendor itself drops support, whichever comes
-first. In this context, third-party efforts to extend the lifetime of a distro
+The project aims to support the most recent major version at all times for
+up to four years after its initial release. Support for the previous major
+version will be dropped one years after the new major version is released
+or when the vendor itself drops support, whichever comes first.
+In this context, third-party efforts to extend the lifetime of a distro
 are not considered, even when they are endorsed by the vendor (eg. Debian LTS);
 the same is true of repositories that contain packages backported from later
 releases (e.g. Debian backports). Within each major release, only the most
-- 
2.31.1


