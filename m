Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95587417FFC
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 08:29:00 +0200 (CEST)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU1BD-0002EQ-KJ
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 02:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU17z-0007YR-Si
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 02:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU17v-0007E8-J2
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 02:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632551135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgt/qx5DHAI+iBFfRYjAmQ/+wVvk1NDCMGKDj1ImZDk=;
 b=S8ZgDgnnPk4vU2Q1c5+bVMQlWez0pzdSkXGLpJr7YWA5HKyl3LlV5Axpc+OV08K+uSio9w
 iaFezNXf+VHbJ/ER0DOASfA+WBJVGFOFCmI77mOzCDNoR0e0F/lDQe4VqojodCXRqYkG14
 JWX0Acwqf0N/ec6U7AED+iVaZhnH65E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-hfctazaONg-_qZYTnFobtg-1; Sat, 25 Sep 2021 02:25:33 -0400
X-MC-Unique: hfctazaONg-_qZYTnFobtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80B5F1084683;
 Sat, 25 Sep 2021 06:25:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A3A60936;
 Sat, 25 Sep 2021 06:25:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3DF561138468; Sat, 25 Sep 2021 08:25:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/25] tests/qapi-schema: Prepare for simple union
 UserDefListUnion removal
Date: Sat, 25 Sep 2021 08:25:11 +0200
Message-Id: <20210925062525.988405-12-armbru@redhat.com>
In-Reply-To: <20210925062525.988405-1-armbru@redhat.com>
References: <20210925062525.988405-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

To prepare for their removal, simple union UserDefListUnion has to go.
It is used to cover arrays.  The next few commits will eliminate its
uses, and then it gets deleted.  As a first step, provide struct
ArrayStruct for the tests to be rewritten.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210917143134.412106-12-armbru@redhat.com>
---
 tests/qapi-schema/qapi-schema-test.json | 16 ++++++++++++++++
 tests/qapi-schema/qapi-schema-test.out  | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 3c43e14e22..b2d795cb19 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -140,6 +140,22 @@
             'sizes': ['size'],
             'any': ['any'],
             'user': ['Status'] } } # intentional forward ref. to sub-module
+{ 'struct': 'ArrayStruct',
+  'data': { 'integer': ['int'],
+            's8': ['int8'],
+            's16': ['int16'],
+            's32': ['int32'],
+            's64': ['int64'],
+            'u8': ['uint8'],
+            'u16': ['uint16'],
+            'u32': ['uint32'],
+            'u64': ['uint64'],
+            'number': ['number'],
+            'boolean': ['bool'],
+            'string': ['str'],
+            '*sz': ['size'],
+            '*any': ['any'],
+            '*user': ['Status'] } } # intentional forward ref. to sub-module
 
 # for testing sub-modules
 { 'include': 'include/sub-module.json' }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index d557fe2d89..7a488c1d06 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -189,6 +189,22 @@ object UserDefListUnion
     case sizes: q_obj_sizeList-wrapper
     case any: q_obj_anyList-wrapper
     case user: q_obj_StatusList-wrapper
+object ArrayStruct
+    member integer: intList optional=False
+    member s8: int8List optional=False
+    member s16: int16List optional=False
+    member s32: int32List optional=False
+    member s64: int64List optional=False
+    member u8: uint8List optional=False
+    member u16: uint16List optional=False
+    member u32: uint32List optional=False
+    member u64: uint64List optional=False
+    member number: numberList optional=False
+    member boolean: boolList optional=False
+    member string: strList optional=False
+    member sz: sizeList optional=True
+    member any: anyList optional=True
+    member user: StatusList optional=True
 include include/sub-module.json
 command user-def-cmd None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-- 
2.31.1


