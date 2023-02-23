Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAEC6A1098
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 20:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVHL5-00005d-Td; Thu, 23 Feb 2023 14:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVHL2-000055-JD
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 14:33:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVHL1-0005jn-99
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 14:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677180786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PR7t63qLhAUt36wLTNxtq94mHFVcXgOOO/wVnznFcg0=;
 b=a4HLbCb2EBtx8zMFzDV2ON+5XMU+WpqqPBAt/JCrDUe/A/+RA13bsG/8VymgpJcYNNrx0l
 6mpZjzsPnaUHmhDJEiJNq+KOtxXHfS74iL98BZ6C4B9rPSL/XSHw2gq79FGU7P/Lhq10lW
 DjNKd6Um5VDK2la2xHT9udlesSvCPk0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-ZW6geXnPNfOn4i24-M9hAg-1; Thu, 23 Feb 2023 14:33:01 -0500
X-MC-Unique: ZW6geXnPNfOn4i24-M9hAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66443857A94;
 Thu, 23 Feb 2023 19:33:01 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C0F2C15BA0;
 Thu, 23 Feb 2023 19:32:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2] docs/about/build-platforms: Refine the distro support
 policy
Date: Thu, 23 Feb 2023 20:32:57 +0100
Message-Id: <20230223193257.1068205-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

For long-term distributions that release a new version only very
seldom, we limit the support to five years after the initial release.
Otherwise, we might need to support distros like openSUSE 15 for
up to 7 or even more years in total due to our "two more years
after the next major release" rule, which is just way too much to
handle in a project like QEMU that only has limited human resources.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Only limit the maximum amount of time to five years (instead of
     four years + decreasing the amount of time after the next major
     has been released)

 docs/about/build-platforms.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 1c1e7b9e11..7ad95ae9ae 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -67,7 +67,8 @@ Non-supported architectures may be removed in the future following the
 Linux OS, macOS, FreeBSD, NetBSD, OpenBSD
 -----------------------------------------
 
-The project aims to support the most recent major version at all times. Support
+The project aims to support the most recent major version at all times for
+up to five years after its initial release. Support
 for the previous major version will be dropped 2 years after the new major
 version is released or when the vendor itself drops support, whichever comes
 first. In this context, third-party efforts to extend the lifetime of a distro
-- 
2.31.1


