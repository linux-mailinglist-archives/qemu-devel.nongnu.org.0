Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B759E43ADD4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:13:13 +0200 (CEST)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfHa4-0001Ey-IL
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfGgj-0006id-F5
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 03:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfGgb-0005oX-11
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 03:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635232551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jEypT7jEkdu4PHalUKyhVSzF+9hHejOaPFLiUAhzYCU=;
 b=RxD68uR51C2p4rsK+CWmcW/rMe9URQBLsHKDbJwgmTV77Hm1C50T95Qxp++S7usfmYhp4Z
 x6HBf8TzVC8Z49m4CX9jD+U0r7ySQ0gFMlUgpwFP5SkFc8H+HI1uYpp2hVo0443Z8iCiUm
 w4lCkK7yYekIPvA0NS/GEopLulmUaNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-p7UaV0oQO4eNG0ksmzFlpg-1; Tue, 26 Oct 2021 03:15:46 -0400
X-MC-Unique: p7UaV0oQO4eNG0ksmzFlpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 874C21054F98;
 Tue, 26 Oct 2021 07:15:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FA065D705;
 Tue, 26 Oct 2021 07:15:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F2A9C11380A7; Tue, 26 Oct 2021 09:15:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
 <YXadbMF3lj5I4+Cd@paraplu>
Date: Tue, 26 Oct 2021 09:15:30 +0200
In-Reply-To: <YXadbMF3lj5I4+Cd@paraplu> (Kashyap Chamarthy's message of "Mon, 
 25 Oct 2021 14:05:00 +0200")
Message-ID: <87v91k6yul.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 libguestfs@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kashyap Chamarthy <kchamart@redhat.com> writes:

> On Mon, Oct 25, 2021 at 07:25:24AM +0200, Markus Armbruster wrote:
>> By convention, names starting with "x-" are experimental.  The parts
>> of external interfaces so named may be withdrawn or changed
>> incompatibly in future releases.
>> 
>> Drawback: promoting something from experimental to stable involves a
>> name change.  Client code needs to be updated.
>> 
>> Moreover, the convention is not universally observed:
>> 
>> * QOM type "input-barrier" has properties "x-origin", "y-origin".
>>   Looks accidental, but it's ABI since 4.2.
>> 
>> * QOM types "memory-backend-file", "memory-backend-memfd",
>>   "memory-backend-ram", and "memory-backend-epc" have a property
>>   "x-use-canonical-path-for-ramblock-id" that is documented to be
>>   stable despite its name.
>
> Looks like there's another stable property with an "x-" prefix:
> "x-remote-object", part of QOM type @RemoteObjectProperties.

The union branch 'x-remote-object' isn't flagged 'unstable' (because
union branches can't have feature flags), but the enumeration value
'x-remote-object' is.  Sufficient, because you can't use the branch
without using the enumeration value.  Admittedly subtle.

I wrote a bit of code (appended) to make sure I don't miss names.

> Given the above "x-" properties are now stable, I take it that they
> cannot be renamed now, as they might break any tools using them?  My
> guess is the tedious way is not worth it: deprecate them, and add the
> non-x variants as "synonyms".  

"x-use-canonical-path-for-ramblock-id" goes back to commit fa0cb34d22
"hostmem: use object id for memory region name with >= 4.0" (v4.0).  It
may have been intended to be internal back then.  It wasn't anymore when
commit 8db0b20415 "machine: add missing doc for memory-backend option"
(v6.0) documented it:

    And document that x-use-canonical-path-for-ramblock-id,
    is considered to be stable to make sure it won't go away by accident.
    
    x- was intended for unstable/iternal properties, and not supposed to
    be stable option. However it's too late to rename (drop x-)
    it as it would mean that users will have to mantain both
    x-use-canonical-path-for-ramblock-id (for QEMU 5.0-5.2) versions
    and prefix-less for later versions.

Igor's reasoning still applies.

"x-origin" has always been stable.  Same argument.

>> We could document these exceptions, but documentation helps only
>> humans.  We want to recognize "unstable" in code, like "deprecated".
>>
>> Replace the convention by a new special feature flag "unstable".  It
>> will be recognized by the QAPI generator, like the existing feature
>> flag "deprecated", and unlike regular feature flags.
>
> FWIW, sounds good to me.

Thanks!

>> This commit updates documentation and prepares tests.  The next commit
>> updates the QAPI schema.  The remaining patches update the QAPI
>> generator and wire up -compat policy checking.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  docs/devel/qapi-code-gen.rst            | 9 ++++++---
>>  tests/qapi-schema/qapi-schema-test.json | 7 +++++--
>>  tests/qapi-schema/qapi-schema-test.out  | 5 +++++
>>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> [...]


commit 415b71a9f6e5bc37e84895d2e767cf4cfacd279b (HEAD)
Author: Markus Armbruster <armbru@redhat.com>
Date:   Sat Oct 9 09:01:21 2021 +0200

    qapi: Find x- without feature unstable DBG

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index b7b3fc0ce4..f2af1d7eea 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -14,6 +14,8 @@
 
 # TODO catching name collisions in generated code would be nice
 
+import sys
+
 from collections import OrderedDict
 import os
 import re
@@ -118,6 +120,11 @@ def describe(self):
         return "%s '%s'" % (self.meta, self.name)
 
 
+def check_have_feature_unstable(name, info, features):
+    if name.startswith('x-') and 'unstable' not in (f.name for f in features):
+        print(QAPISemError(info, f"XXX %{name} %{features}"), file=sys.stderr)
+
+
 class QAPISchemaVisitor:
     def visit_begin(self, schema):
         pass
@@ -718,6 +725,7 @@ def __init__(self, name, info, ifcond=None, features=None):
         self.features = features or []
 
     def connect_doc(self, doc):
+        check_have_feature_unstable(self.name, self.info, self.features)
         super().connect_doc(doc)
         if doc:
             for f in self.features:
@@ -745,6 +753,7 @@ def __init__(self, name, info, typ, optional, ifcond=None, features=None):
         self.features = features or []
 
     def check(self, schema):
+        check_have_feature_unstable(self.name, self.info, self.features)
         assert self.defined_in
         self.type = schema.resolve_type(self._type_name, self.info,
                                         self.describe)
@@ -789,6 +798,7 @@ def __init__(self, name, info, doc, ifcond, features,
 
     def check(self, schema):
         super().check(schema)
+        check_have_feature_unstable(self.name, self.info, self.features)
         if self._arg_type_name:
             self.arg_type = schema.resolve_type(
                 self._arg_type_name, self.info, "command's 'data'")
@@ -844,6 +854,7 @@ def __init__(self, name, info, doc, ifcond, features, arg_type, boxed):
 
     def check(self, schema):
         super().check(schema)
+        check_have_feature_unstable(self.name, self.info, self.features)
         if self._arg_type_name:
             self.arg_type = schema.resolve_type(
                 self._arg_type_name, self.info, "event's 'data'")


