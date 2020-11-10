Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21ED2AD53F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:31:19 +0100 (CET)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRrq-0008Jl-M3
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZX-0007gR-V9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZV-0004hI-Sa
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=TkmwefC3kVAtGCmQqjvbSLJzX4g8HaHIHSYhBkga8nU=;
 b=aJq2XNMXIEsUb5JDQqo/VeVCLREIPLkS1pFOfNekQZV+er+W3bLDxOM4S4P/+llpbacteo
 Lp1u0XsvMT+EApXLa+V5L1AEzaW0hh7PGybzFNeYn49btBYvTagMueejwHcY27dWW6tpIM
 3ZvMc2ObbocSSiM2hyDvfeTzFzOiRqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-4OOtf-nNPMySMfpa7Uu5yQ-1; Tue, 10 Nov 2020 06:12:19 -0500
X-MC-Unique: 4OOtf-nNPMySMfpa7Uu5yQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBA775720B;
 Tue, 10 Nov 2020 11:12:17 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C60110013D9;
 Tue, 10 Nov 2020 11:12:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 18/19] s390x: fix clang 11 warnings in cpu_models.c
Date: Tue, 10 Nov 2020 12:11:31 +0100
Message-Id: <20201110111132.559399-19-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

There are void * pointers that get casted to enums, in cpu_models.c
Such casts can result in a small integer type and are caught as
warnings with clang, starting with version 11:

Clang 11 finds a bunch of spots in the code that trigger this new warnings:

../qemu-base/target/s390x/cpu_models.c:985:21: error: cast to smaller integer type 'S390Feat' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
    S390Feat feat = (S390Feat) opaque;
                    ^~~~~~~~~~~~~~~~~
../qemu-base/target/s390x/cpu_models.c:1002:21: error: cast to smaller integer type 'S390Feat' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
    S390Feat feat = (S390Feat) opaque;
                    ^~~~~~~~~~~~~~~~~
../qemu-base/target/s390x/cpu_models.c:1036:27: error: cast to smaller integer type 'S390FeatGroup' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
    S390FeatGroup group = (S390FeatGroup) opaque;
                          ^~~~~~~~~~~~~~~~~~~~~~
../qemu-base/target/s390x/cpu_models.c:1057:27: error: cast to smaller integer type 'S390FeatGroup' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
    S390FeatGroup group = (S390FeatGroup) opaque;
                          ^~~~~~~~~~~~~~~~~~~~~~
4 errors generated.

Avoid this warning by casting the pointer to uintptr_t first.

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-Id: <20201105221905.1350-3-dbuono@linux.vnet.ibm.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu_models.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 461e0b8f4a..b5abff8bef 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -986,7 +986,7 @@ void s390_realize_cpu_model(CPUState *cs, Error **errp)
 static void get_feature(Object *obj, Visitor *v, const char *name,
                         void *opaque, Error **errp)
 {
-    S390Feat feat = (S390Feat) opaque;
+    S390Feat feat = (S390Feat) (uintptr_t) opaque;
     S390CPU *cpu = S390_CPU(obj);
     bool value;
 
@@ -1003,7 +1003,7 @@ static void get_feature(Object *obj, Visitor *v, const char *name,
 static void set_feature(Object *obj, Visitor *v, const char *name,
                         void *opaque, Error **errp)
 {
-    S390Feat feat = (S390Feat) opaque;
+    S390Feat feat = (S390Feat) (uintptr_t) opaque;
     DeviceState *dev = DEVICE(obj);
     S390CPU *cpu = S390_CPU(obj);
     bool value;
@@ -1037,7 +1037,7 @@ static void set_feature(Object *obj, Visitor *v, const char *name,
 static void get_feature_group(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp)
 {
-    S390FeatGroup group = (S390FeatGroup) opaque;
+    S390FeatGroup group = (S390FeatGroup) (uintptr_t) opaque;
     const S390FeatGroupDef *def = s390_feat_group_def(group);
     S390CPU *cpu = S390_CPU(obj);
     S390FeatBitmap tmp;
@@ -1058,7 +1058,7 @@ static void get_feature_group(Object *obj, Visitor *v, const char *name,
 static void set_feature_group(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp)
 {
-    S390FeatGroup group = (S390FeatGroup) opaque;
+    S390FeatGroup group = (S390FeatGroup) (uintptr_t) opaque;
     const S390FeatGroupDef *def = s390_feat_group_def(group);
     DeviceState *dev = DEVICE(obj);
     S390CPU *cpu = S390_CPU(obj);
-- 
2.18.4


