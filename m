Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F06B2EBE2D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 14:04:02 +0100 (CET)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx8Tp-00077l-5U
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 08:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kx8Sd-0006f9-Ep
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:02:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kx8Sb-0003Xb-3L
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609938164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9cEiEhRiHfzTJDLKT6mHy/pw4zaPX72sfCLNf6zbJSs=;
 b=aRmlhzp86c7srpwA3F4zYjCaFC2PrdDiIJBjaXWMGveABQL3TUgM5Z8sqOigG/nCSLfBXI
 R01ScXZXPaR+LKpezEuLseqNP/cD8G9Jf8Y0aQNU7xsg/qKVAK/gb8JcrmTvnmE4/gSlIp
 2+LdwCcq4+RJr3htjJBDE1CAMoa2SBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-cNeCxBKgOv6tYZgAHk0LQw-1; Wed, 06 Jan 2021 08:02:42 -0500
X-MC-Unique: cNeCxBKgOv6tYZgAHk0LQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6B0CC745A
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 13:02:41 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FAAE5D9D2;
 Wed,  6 Jan 2021 13:02:40 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tracetool: also strip %l and %ll from systemtap format
 strings
Date: Wed,  6 Jan 2021 13:02:39 +0000
Message-Id: <20210106130239.1004729-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, William Cohen <wcohen@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All variables are 64-bit and so %l / %ll are not required, and the
latter is actually invalid:

  $ sudo stap -e 'probe begin{printf ("BEGIN")}'  -I .
  parse error: invalid or missing conversion specifier
          saw: operator ',' at ./qemu-system-x86_64-log.stp:15118:101
       source:     printf("%d@%d vhost_vdpa_set_log_base dev: %p base: 0x%x size: %llu
refcnt: %d fd: %d log: %p\n", pid(), gettimeofday_ns(), dev, base, size, refcnt, fd, log)

                       ^

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 scripts/tracetool/format/log_stap.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

In v2:

 - Change existing logic that stripped %z to handle %l/%ll too

diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
index b486beb672..fac911a0f4 100644
--- a/scripts/tracetool/format/log_stap.py
+++ b/scripts/tracetool/format/log_stap.py
@@ -77,7 +77,12 @@ def c_fmt_to_stap(fmt):
     elif state == STATE_LITERAL:
         bits.append(literal)
 
-    fmt = re.sub("%(\d*)z(x|u|d)", "%\\1\\2", "".join(bits))
+    # All variables in systemtap are 64-bit in size
+    # The "%l" integer size qualifier is thus redundant
+    # and "%ll" is not valid at all. Simiarly the size_t
+    # based "%z" size qualifier is not valid. We just
+    # strip all size qualifiers for sanity.
+    fmt = re.sub("%(\d*)(l+|z)(x|u|d)", "%\\1\\3", "".join(bits))
     return fmt
 
 def generate(events, backend, group):
-- 
2.29.2


