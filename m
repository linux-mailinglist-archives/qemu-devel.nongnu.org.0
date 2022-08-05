Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850758ACFF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:23:29 +0200 (CEST)
Received: from localhost ([::1]:55462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzAe-0004aK-9j
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz7o-0006Yp-Tk
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz7n-0007fR-24
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659712830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4tbOtoX+okfrNQpn+JtCKcqsZHP3f6wk1WRWkOWk6Cs=;
 b=gu7x/QwJjI0KEApO5XpK5l0GcWDaU6UwZBHrzPWltOA0skmwcSuqJ5q1gwB1lrDEKn1avJ
 EeM8DBcy3bRK1FqFFhBXfh2Pg4/QRlOAJe1B2cCsmXPvqbBqeZxp+MGChBf8yn1JBazOpN
 qv5V42ispFfbuNzTtTWRUpYUOGLrnJo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-m06YNuqTOc-EoHGLVZ7PNg-1; Fri, 05 Aug 2022 11:20:26 -0400
X-MC-Unique: m06YNuqTOc-EoHGLVZ7PNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB39D101A58D;
 Fri,  5 Aug 2022 15:20:25 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8D532026D4C;
 Fri,  5 Aug 2022 15:20:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com, Beraldo Leal <bleal@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>
Subject: [PULL 1/6] docs: build-platforms: Clarify stance on minor releases
 and backports
Date: Fri,  5 Aug 2022 16:20:09 +0100
Message-Id: <20220805152014.135768-2-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Andrea Bolognani <abologna@redhat.com>

These changes match those made in the following libvirt commits:

  2ac78307af docs: Clarify our stance on backported packages
  78cffd450a docs: Spell out our policy concerning minor releases

Since QEMU's platform support policy is based on libvirt's, it
makes sense to mirror these recent changes made to the latter.

The policy is not altered significantly - we're simply spelling
out some rules that were likely already being implicitly
enforced.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/about/build-platforms.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 6b8496c430..26028756d0 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -71,7 +71,10 @@ The project aims to support the most recent major version at all times. Support
 for the previous major version will be dropped 2 years after the new major
 version is released or when the vendor itself drops support, whichever comes
 first. In this context, third-party efforts to extend the lifetime of a distro
-are not considered, even when they are endorsed by the vendor (eg. Debian LTS).
+are not considered, even when they are endorsed by the vendor (eg. Debian LTS);
+the same is true of repositories that contain packages backported from later
+releases (e.g. Debian backports). Within each major release, only the most
+recent minor release is considered.
 
 For the purposes of identifying supported software versions available on Linux,
 the project will look at CentOS, Debian, Fedora, openSUSE, RHEL, SLES and
-- 
2.37.1


