Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D14274D04
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 01:01:41 +0200 (CEST)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKrI4-0008Ct-RC
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 19:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2k-0002Ij-P8
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2g-0000TQ-3P
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600814732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnkRQDBe/lGMVQUX9scHUathhJcZdcy6Q+U6UzBr6QE=;
 b=fJz56H3heg5yf19UgEZn+ZAz3rKNbejDFOIO7vxGE/EqhOc/PmTJreKlu35cOiiRbITFPn
 Vnc2rLrm6Ejy7+ftRxbmwFpHJPygpTeMPhwQimUfKWZAjpqYoEeAYmz+R+6zjNWgRuZlCq
 S1Jzmh1RGunQEHh8oaiyxcfv3unIkh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520--J-Tmn0JP-a9lFLJnOJ96Q-1; Tue, 22 Sep 2020 18:45:30 -0400
X-MC-Unique: -J-Tmn0JP-a9lFLJnOJ96Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D12881CAFC;
 Tue, 22 Sep 2020 22:45:29 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D6055C1A3;
 Tue, 22 Sep 2020 22:45:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 19/25] qapi/schema.py: Convert several methods to classmethods
Date: Tue, 22 Sep 2020 18:44:55 -0400
Message-Id: <20200922224501.4087749-20-jsnow@redhat.com>
In-Reply-To: <20200922224501.4087749-1-jsnow@redhat.com>
References: <20200922224501.4087749-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If they don't use self and nothing that extends them needs self either,
they can be classmethods.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/schema.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 61238c0686..2d23ce04eb 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -1096,7 +1096,8 @@ def _def_predefineds(self) -> None:
         self._def_entity(QAPISchemaEnumType('QType', None, None, None, None,
                                             qtype_values, 'QTYPE'))
 
-    def _make_features(self,
+    @classmethod
+    def _make_features(cls,
                        features: Optional[List[Dict[str, Any]]],
                        info: QAPISourceInfo) -> List[QAPISchemaFeature]:
         if features is None:
@@ -1104,7 +1105,8 @@ def _make_features(self,
         return [QAPISchemaFeature(f['name'], info, f.get('if'))
                 for f in features]
 
-    def _make_enum_members(self,
+    @classmethod
+    def _make_enum_members(cls,
                            values: List[Dict[str, Any]],
                            info: Optional[QAPISourceInfo],
                            ) -> List[QAPISchemaEnumMember]:
@@ -1213,7 +1215,8 @@ def _def_struct_type(self,
             self._make_members(data, info),
             None))
 
-    def _make_variant(self,
+    @classmethod
+    def _make_variant(cls,
                       case: str,
                       typ: str,
                       ifcond: Optional[List[str]],
-- 
2.26.2


