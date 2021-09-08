Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1BD40338B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 06:57:26 +0200 (CEST)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNpeI-0001RS-1d
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 00:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNpbc-0007Bo-C7
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNpbZ-0003mF-3b
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631076875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8s3GVflHgiaeZv1+C+0LpGk9NBKUroVD7P8DxZqB9Q0=;
 b=bBEro6IBt42n5omxZNftNj7RTCWkKkaf9MwaVjkL81BYImOD42ASy9G+cZzszgm1Nce/wl
 eppI117Y70OtjkpadBkI3oNcB0yR4LEjNYDOCJ7Yypo+X97MRsxXqUF58kjpGGIOktZkBV
 WXtGDsIwWwj8M4zYnDajvNXNCvEAVbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-hQmbfVe_MAqUucJz_Jlkiw-1; Wed, 08 Sep 2021 00:54:34 -0400
X-MC-Unique: hQmbfVe_MAqUucJz_Jlkiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E1610053E7;
 Wed,  8 Sep 2021 04:54:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60181100763B;
 Wed,  8 Sep 2021 04:54:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB96B1138221; Wed,  8 Sep 2021 06:54:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] tests/qapi-schema: Cover 'not' condition with empty
 argument
Date: Wed,  8 Sep 2021 06:54:27 +0200
Message-Id: <20210908045428.2689093-5-armbru@redhat.com>
In-Reply-To: <20210908045428.2689093-1-armbru@redhat.com>
References: <20210908045428.2689093-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We flag this, but the error message is bogus:

    bad-if-not.json:2: 'if' condition [] of struct is useless

The next commit will fix it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/bad-if-not.err  | 2 ++
 tests/qapi-schema/bad-if-not.json | 3 +++
 tests/qapi-schema/bad-if-not.out  | 0
 tests/qapi-schema/meson.build     | 1 +
 4 files changed, 6 insertions(+)
 create mode 100644 tests/qapi-schema/bad-if-not.err
 create mode 100644 tests/qapi-schema/bad-if-not.json
 create mode 100644 tests/qapi-schema/bad-if-not.out

diff --git a/tests/qapi-schema/bad-if-not.err b/tests/qapi-schema/bad-if-not.err
new file mode 100644
index 0000000000..b3acdd679a
--- /dev/null
+++ b/tests/qapi-schema/bad-if-not.err
@@ -0,0 +1,2 @@
+bad-if-not.json: In struct 'TestIfStruct':
+bad-if-not.json:2: 'if' condition [] of struct is useless
diff --git a/tests/qapi-schema/bad-if-not.json b/tests/qapi-schema/bad-if-not.json
new file mode 100644
index 0000000000..9fdaacc47b
--- /dev/null
+++ b/tests/qapi-schema/bad-if-not.json
@@ -0,0 +1,3 @@
+# check 'if not' with empy argument
+{ 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
+  'if': { 'not': '' } }
diff --git a/tests/qapi-schema/bad-if-not.out b/tests/qapi-schema/bad-if-not.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 4697c070bc..6b2a4ce41a 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -43,6 +43,7 @@ schemas = [
   'bad-if-key.json',
   'bad-if-keys.json',
   'bad-if-list.json',
+  'bad-if-not.json',
   'bad-type-bool.json',
   'bad-type-dict.json',
   'bad-type-int.json',
-- 
2.31.1


