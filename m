Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7659662E86
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:16:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwg1-0006eb-Ka; Mon, 09 Jan 2023 13:15:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pEwfz-0006e9-Az
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:15:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pEwfx-00069m-Mq
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673288113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4bcdIamR/UYLssDq4J/lT5HEewpacYug2bz0YOnVPU=;
 b=gYqksG96XvC9l+ehfN2y7Z2meZ5GLWFmf1FHr7s8pcnOzuRHxusseJSHUzv7VPvVogQW2A
 PfBi/BFFITPB2DoYDRXLtH4aEo1Xe+grlBX3feO33O58rP9CsoHwojrGXmENSO7djhhhNV
 vdPr/7gg4wKtZ6eLENfZ2ptdztBbvOY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-bAIF0NUPNdSSO7JfsHZU0g-1; Mon, 09 Jan 2023 13:15:09 -0500
X-MC-Unique: bAIF0NUPNdSSO7JfsHZU0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CE51181E3F0;
 Mon,  9 Jan 2023 18:15:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74ABA2166B26;
 Mon,  9 Jan 2023 18:15:08 +0000 (UTC)
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
Subject: [PATCH v2 4/5] meson: replace Perl usage with Python
Date: Mon,  9 Jan 2023 22:14:46 +0400
Message-Id: <20230109181447.235989-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230109181447.235989-1-marcandre.lureau@redhat.com>
References: <20230109181447.235989-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Let's try to remove Perl usage during build time.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qapi-schema/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 9dfe98bc9a..d85b14f28c 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -259,22 +259,23 @@ if build_docs
   # Fix possible inconsistency in line endings in generated output and
   # in the golden reference (which could otherwise cause test failures
   # on Windows hosts). Unfortunately diff --strip-trailing-cr
-  # is GNU-diff only. The odd-looking perl is because we must avoid
+  # is GNU-diff only. The odd-looking python is because we must avoid
   # using an explicit '\' character in the command arguments to
   # a custom_target(), as Meson will unhelpfully replace it with a '/'
   # (https://github.com/mesonbuild/meson/issues/1564)
+  remove_cr = [python, '-c', 'import sys;[sys.stdout.write(line.replace(chr(13), "")) for line in sys.stdin]']
   qapi_doc_out_nocr = custom_target('QAPI rST doc newline-sanitized',
                                     output: ['doc-good.txt.nocr'],
                                     input: qapi_doc_out[0],
                                     build_by_default: true,
-                                    command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
+                                    command: [remove_cr, '@INPUT@'],
                                     capture: true)
 
   qapi_doc_ref_nocr = custom_target('QAPI rST doc reference newline-sanitized',
                                     output: ['doc-good.ref.nocr'],
                                     input: files('doc-good.txt'),
                                     build_by_default: true,
-                                    command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
+                                    command: [remove_cr, '@INPUT@'],
                                     capture: true)
 
   test('QAPI rST doc', diff, args: ['-u', qapi_doc_ref_nocr[0], qapi_doc_out_nocr[0]],
-- 
2.39.0


