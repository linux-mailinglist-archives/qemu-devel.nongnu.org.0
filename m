Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB31C187900
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 06:15:03 +0100 (CET)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE4ZC-0006RY-RL
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 01:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jE4YC-0005eb-Co
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 01:14:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jE4YB-00081u-AN
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 01:14:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:47496)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jE4Y7-0007ne-8w
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 01:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584422034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmfgMDNzUtJmnd3qcSddNrCZlHCUO4nCb/1RoeUlvbI=;
 b=LJ6/Iz3I5mTDR7iXwGTYL3u2HLzgGH6YjxsKLsf+KbfYNoDj1GF/8Otqs4UGgqfyWZ8XJz
 KAerZW/dP0nh/BayfQYW2ox8oU1obAy6Iyi5/Fu70aA6GXEmnV/JimTA+LqCnaNkkadGEz
 +KTFMUDnQpxbtjVR78miY6evCjtCfIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-Oql1gl8NNBWe1XXv4VsWag-1; Tue, 17 Mar 2020 01:13:51 -0400
X-MC-Unique: Oql1gl8NNBWe1XXv4VsWag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7C708017CC;
 Tue, 17 Mar 2020 05:13:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7039660BF3;
 Tue, 17 Mar 2020 05:13:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 677D911366CF; Mon, 16 Mar 2020 20:48:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 30/34] qapi: Implement deprecated-output=hide for QMP
 event data
References: <20200315144653.22660-1-armbru@redhat.com>
 <20200315144653.22660-31-armbru@redhat.com>
Date: Mon, 16 Mar 2020 20:48:07 +0100
In-Reply-To: <20200315144653.22660-31-armbru@redhat.com> (Markus Armbruster's
 message of "Sun, 15 Mar 2020 15:46:49 +0100")
Message-ID: <875zf4w07c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> This policy suppresses deprecated bits in output, and thus permits
> "testing the future".  Implement it for QMP event data: suppress
> deprecated members.
>
> No QMP event data is deprecated right now.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Needs a fixup:

diff --git a/tests/test-qmp-event.c b/tests/test-qmp-event.c
index be5a2433d0..8f77485454 100644
--- a/tests/test-qmp-event.c
+++ b/tests/test-qmp-event.c
@@ -167,6 +167,8 @@ static void test_event_deprecated_data(TestEventData *d=
ata, const void *unused)
     qapi_event_send_test_event_features0(42);
     g_assert(data->emitted);
=20
+    qobject_unref(data->expect);
+
     compat_policy.deprecated_output =3D COMPAT_POLICY_OUTPUT_HIDE;
     data->expect =3D qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATU=
RES0' }");
     qapi_event_send_test_event_features0(42);
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 78fa60aa8e..f03c825cc1 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -125,6 +125,8 @@ def gen_event_send(name, arg_type, features, boxed,
     visit_complete(v, &obj);
     if (qdict_size(qobject_to(QDict, obj))) {
         qdict_put_obj(qmp, "data", obj);
+    } else {
+        qobject_unref(obj);
     }
 ''')
=20


