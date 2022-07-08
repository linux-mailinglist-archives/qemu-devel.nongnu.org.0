Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F056BD15
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:56:18 +0200 (CEST)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qL3-00046n-HP
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9q0i-0006j9-6D
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:35:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9q0f-0007NA-7u
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657294512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMIei2hcuuM+fB0KPCKp5cCbCSDtNxfH8/XKbJiJjMs=;
 b=hGwooJ76xEyOBHBzRPdEiJtT49qqnmQdqNs6SH1LL/mJPBWS7QXKRzjj69XNpc9h/WYsxo
 +znZeq4vBWCv1WQA31DjTqJS7HRxAtWms02R+Lncf1dN467eeYZ0a37RYjIQUf1g2fdDnX
 jIeDxLq07NsaJVRN2LySaD27zF+oGUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-gLWmt_arNzaYjxO3dwZFFg-1; Fri, 08 Jul 2022 11:35:11 -0400
X-MC-Unique: gLWmt_arNzaYjxO3dwZFFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83207101A58D;
 Fri,  8 Jul 2022 15:35:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 149DD18EB5;
 Fri,  8 Jul 2022 15:35:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Berrange <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v4 10/12] tests/qemu-iotests: hotfix for 307, 223 output
Date: Fri,  8 Jul 2022 11:35:01 -0400
Message-Id: <20220708153503.18864-11-jsnow@redhat.com>
In-Reply-To: <20220708153503.18864-1-jsnow@redhat.com>
References: <20220708153503.18864-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Do not merge; staged in Hanna's branch.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/223.out | 4 ++--
 tests/qemu-iotests/307.out | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
index 06479415312..26fb347c5da 100644
--- a/tests/qemu-iotests/223.out
+++ b/tests/qemu-iotests/223.out
@@ -93,7 +93,7 @@ exports available: 3
  export: 'n2'
   description: some text
   size:  4194304
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: 1
   opt block: 4096
   max block: 33554432
@@ -212,7 +212,7 @@ exports available: 3
  export: 'n2'
   description: some text
   size:  4194304
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: 1
   opt block: 4096
   max block: 33554432
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index ec8d2be0e0a..390f05d1b78 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -83,7 +83,7 @@ exports available: 2
  export: 'export1'
   description: This is the writable second export
   size:  67108864
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: XXX
   opt block: XXX
   max block: XXX
@@ -109,7 +109,7 @@ exports available: 1
  export: 'export1'
   description: This is the writable second export
   size:  67108864
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
+  flags: 0xded ( flush fua trim zeroes df multi cache fast-zero )
   min block: XXX
   opt block: XXX
   max block: XXX
-- 
2.34.3


