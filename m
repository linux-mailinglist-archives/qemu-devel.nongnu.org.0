Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36823C9EB7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 14:34:18 +0200 (CEST)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m40ZF-0006Sf-Uw
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 08:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m40XH-0004ef-O1
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 08:32:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m40XD-0002sn-Ds
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 08:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626352330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKv3LBWGuaWuR7+I5a77cDRTtGYapVOEhyHqdRMMBZg=;
 b=UiRVJRXLpmExQOcuLrYESIxEaP1H4aLfDvYGNipz1IzNHGqzjyZvW4qe4BaiDo4qAtkr/X
 wFlkT1oAjnMiVgrf/7R4XW+5yqXt5Y/iz9THzR1M5bs8yaAYOUKwnjJaFiSRBZ0VH0ec5x
 tK9XdDrma19ufuAhQeeleeDdtz//950=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-QSIBe15FPpmCeT8TbEllNg-1; Thu, 15 Jul 2021 08:32:08 -0400
X-MC-Unique: QSIBe15FPpmCeT8TbEllNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A74C0100CCC0;
 Thu, 15 Jul 2021 12:32:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7306419C45;
 Thu, 15 Jul 2021 12:32:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0B94B113861E; Thu, 15 Jul 2021 14:32:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] qapi: Fix crash on missing enum member name
Date: Thu, 15 Jul 2021 14:32:06 +0200
Message-Id: <20210715123206.212379-2-armbru@redhat.com>
In-Reply-To: <20210715123206.212379-1-armbru@redhat.com>
References: <20210715123206.212379-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: John Snow <jsnow@redhat.com>, peter.maydell@linaro.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New test case enum-dict-no-name.json crashes:

    $ python3 scripts/qapi-gen.py tests/qapi-schema/enum-dict-no-name.json
    Traceback (most recent call last):
    [...]
      File "/work/armbru/qemu/scripts/qapi/expr.py", line 458, in check_enum
	member_name = member['name']
    KeyError: 'name'

Root cause: we try to retrieve member 'name' before we check for
missing members.  With that fixed, we get the expected error "'data'
member misses key 'name'".

Fixes: 0825f62c842f2c07c5471391c6d7fd3f4fe83732
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210616072121.626431-1-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py                     | 2 +-
 tests/qapi-schema/enum-dict-no-name.err  | 2 ++
 tests/qapi-schema/enum-dict-no-name.json | 2 ++
 tests/qapi-schema/enum-dict-no-name.out  | 0
 4 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 tests/qapi-schema/enum-dict-no-name.err
 create mode 100644 tests/qapi-schema/enum-dict-no-name.json
 create mode 100644 tests/qapi-schema/enum-dict-no-name.out

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 496f7e0333..cf98923fa6 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -455,8 +455,8 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
                   for m in members]
     for member in members:
         source = "'data' member"
-        member_name = member['name']
         check_keys(member, info, source, ['name'], ['if'])
+        member_name = member['name']
         check_name_is_str(member_name, info, source)
         source = "%s '%s'" % (source, member_name)
         # Enum members may start with a digit
diff --git a/tests/qapi-schema/enum-dict-no-name.err b/tests/qapi-schema/enum-dict-no-name.err
new file mode 100644
index 0000000000..3ce0c16987
--- /dev/null
+++ b/tests/qapi-schema/enum-dict-no-name.err
@@ -0,0 +1,2 @@
+enum-dict-no-name.json: In enum 'Enum':
+enum-dict-no-name.json:2: 'data' member misses key 'name'
diff --git a/tests/qapi-schema/enum-dict-no-name.json b/tests/qapi-schema/enum-dict-no-name.json
new file mode 100644
index 0000000000..5952a8662e
--- /dev/null
+++ b/tests/qapi-schema/enum-dict-no-name.json
@@ -0,0 +1,2 @@
+# enum member lacking a name
+{ 'enum': 'Enum', 'data': [ {} ] }
diff --git a/tests/qapi-schema/enum-dict-no-name.out b/tests/qapi-schema/enum-dict-no-name.out
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.31.1


