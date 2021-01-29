Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A43308B61
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:29:28 +0100 (CET)
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XaJ-0003UZ-Pg
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XJA-0003QP-J2
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XJ5-00074p-4X
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6JYP9W32stwdwNTOMk8OrBP4nVF1AJX/Q/uK1qg7Dw=;
 b=hPPH2pKKtDmJ4G2UuJLCVkD1ntxnnhW6ctodLNA5zSr8c+1MORTPXjT8qGIETAqosJRrQN
 jdFLuOUnGpCoys3WAAF5nDjBUAJHxQHL8HwnmyHBnBMSADpYABFpOoP1uHYJj92dKzkhCD
 nbvh/509ra/eHupQVWnQCsb6qhcR/YA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-YyC1LwiKNUCYtSwTs3Pepw-1; Fri, 29 Jan 2021 12:11:36 -0500
X-MC-Unique: YyC1LwiKNUCYtSwTs3Pepw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2E50107ACE6;
 Fri, 29 Jan 2021 17:11:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95AF95D705;
 Fri, 29 Jan 2021 17:11:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] os: deprecate the -enable-fips option and QEMU's FIPS
 enforcement
Date: Fri, 29 Jan 2021 17:10:54 +0000
Message-Id: <20210129171102.4109641-6-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
References: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -enable-fips option was added a long time ago to prevent the use of
single DES when VNC when FIPS mode is enabled. It should never have been
added, because apps are supposed to unconditionally honour FIPS mode
based on the '/proc/sys/crypto/fips_enabled' file contents.

In addition there is more to achieving FIPS compliance than merely
blocking use of certain algorithms. Those algorithms which are used
need to perform self-tests at runtime.

QEMU's built-in cryptography provider has no support for self-tests,
and neither does the nettle library.

If QEMU is required to be used in a FIPS enabled host, then it must be
built with the libgcrypt library enabled, which will unconditionally
enforce FIPS compliance in any algorithm usage.

Thus there is no need to keep either the -enable-fips option in QEMU, or
QEMU's internal FIPS checking methods.

Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst | 12 ++++++++++++
 os-posix.c                 |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 9de663526a..6ac757ed9f 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -134,6 +134,18 @@ Boolean options such as ``share=on``/``share=off`` could be written
 in short form as ``share`` and ``noshare``.  This is now deprecated
 and will cause a warning.
 
+``--enable-fips`` (since 6.0)
+'''''''''''''''''''''''''''''
+
+This option restricts usage of certain cryptographic algorithms when
+the host is operating in FIPS mode.
+
+If FIPS compliance is required, QEMU should be built with the ``libgcrypt``
+library enabled as a cryptography provider.
+
+Neither the ``nettle`` library, or the built-in cryptography provider are
+supported on FIPS enabled hosts.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/os-posix.c b/os-posix.c
index 1de2839554..a6846f51c1 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -153,6 +153,9 @@ int os_parse_cmd_args(int index, const char *optarg)
         break;
 #if defined(CONFIG_LINUX)
     case QEMU_OPTION_enablefips:
+        warn_report("-enable-fips is deprecated, please build QEMU with "
+                    "the `libgcrypt` library as the cryptography provider "
+                    "to enable FIPS compliance");
         fips_set_state(true);
         break;
 #endif
-- 
2.29.2


