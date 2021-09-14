Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9A40AC29
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:03:46 +0200 (CEST)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ6E5-0000ic-CF
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ6BC-0007bF-Tf
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ6B5-0007TT-Ly
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631617237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4qbnWJ/iMslU3EjInssRD7EGo9hP9MuF3l9BXhrGokA=;
 b=Lco71TimhfXBc9Ch1vtHmuHiyVKSWxO1XfaxwIMIE4aoY3lExZo9JtQKfLBfcvdGzXL9rn
 PtyHteadn30iTQnt5gDB7ZGJGek6ga7MAIlq9oqmR/9WCh3JQnv6V39XM2KM5dN9temyR7
 pPi7psRm94V3RaVkef6OqhmuSnTW1c8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-IxCDQgRzOfmvw7OtsrMsHA-1; Tue, 14 Sep 2021 07:00:36 -0400
X-MC-Unique: IxCDQgRzOfmvw7OtsrMsHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 521061084681
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 11:00:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE5D960C7F;
 Tue, 14 Sep 2021 11:00:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 62519113865F; Tue, 14 Sep 2021 13:00:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 5/6] qapi: Add support for aliases
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-6-kwolf@redhat.com>
 <87eea1d8x8.fsf@dusky.pond.sub.org> <YTo4tZgLIj8p2EPX@redhat.com>
 <87k0jjeeg0.fsf@dusky.pond.sub.org>
Date: Tue, 14 Sep 2021 13:00:33 +0200
In-Reply-To: <87k0jjeeg0.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 14 Sep 2021 10:42:07 +0200")
Message-ID: <874kanbewe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Kevin Wolf <kwolf@redhat.com> writes:
>
>> Am 06.09.2021 um 17:24 hat Markus Armbruster geschrieben:
>>> Kevin Wolf <kwolf@redhat.com> writes:
>>>=20
>>> > Introduce alias definitions for object types (structs and unions). Th=
is
>>> > allows using the same QAPI type and visitor for many syntax variation=
s
>>> > that exist in the external representation, like between QMP and the
>>> > command line. It also provides a new tool for evolving the schema whi=
le
>>> > maintaining backwards compatibility during a deprecation period.
>>> >
>>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>

[...]

>> It don't remember the details of why I needed the list(), but
>> a.check_clash() is (a wrapper around) QAPISchemaMember.check_clash(), so
>> yes, it does change @seen. Specifically, it adds alias names to it.
>
> That's why you need it: seen.values() is a dictionary view object, but
> you need something writable.
>
> The silent change from list to view we got with Python 3 is kind of
> iffy: we store the view in self.members (visible right below), which
> keeps @seen alive.
>
> Would you mind reverting this silent change in a separate one-liner
> patch?

Appending one for your convenience.

[...]

From 4eee60a6a02e425d25167761c47e858e240fe3f8 Mon Sep 17 00:00:00 2001
From: Markus Armbruster <armbru@redhat.com>
Date: Tue, 14 Sep 2021 12:25:09 +0200
Subject: [PATCH] qapi: Revert an accidental change from list to view object
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

A long time ago, commit 23a4b2c6f1 "qapi: Eliminate
QAPISchemaObjectType.check() variable members" replaced the manual
building of the list of members by seen.values(), where @seen is an
OrderedDict mapping names to members.  The list is then stored in
self.members.

With Python 2, this is an innocent change: seen.values() returns "a
copy of the dictionary=E2=80=99s list of values".

With Python 3, it returns a dictionary view object instad.  These
"provide a dynamic view on the dictionary=E2=80=99s entries, which means th=
at
when the dictionary changes, the view reflects these changes."

Commit 23a4b2c6f1 predates the first mention of Python 3 in
scripts/qapi/ by years.  If we had wanted a view object then, we'd
have used seen.viewvalues().

The accidental change of self.members from list to view object keeps
@seen alive longer.  Not wanted, but harmless enough.  I believe
that's all.

However, the change is in the next commit's way, which wants to mess
with self.members.  Revert it.

All other uses of .values() in scripts/qapi/ are of the form

    for ... in dict.values():

where the change to view object is just fine.  Same for .keys() and
.items().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/schema.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index d1d27ff7ee..f313dbea27 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -413,7 +413,7 @@ def check(self, schema):
         for m in self.local_members:
             m.check(schema)
             m.check_clash(self.info, seen)
-        members =3D seen.values()
+        members =3D list(seen.values())
=20
         if self.variants:
             self.variants.check(schema, seen)
--=20
2.31.1


