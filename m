Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE055BAB59
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 12:38:06 +0200 (CEST)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ8jV-0006Vv-Cg
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 06:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ8i6-0004wv-Lr
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 06:36:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ8i2-0003Ir-JC
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 06:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663324593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SP0FyELxvnoEGejrSlNBqkYXw7nKf7Bl1/OuHIvNU8w=;
 b=aj1ZClBL4uc5FZQJzPi2KfWnAaZguo5KIPLYtdwl+hbN4fNOERyk/UVgA2wwRR7HMwSi5m
 mcY/VF/3tiCwra5DDBwB4N1qpTWpYXF8KUO05bZUGoXE8vma6KIJp9eGhXZmA47FKHpTot
 AzB72K4wlcYsbaUh+rJFTMepFhInS2o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-FSK8Mo3bN7WLmYPBL_1oog-1; Fri, 16 Sep 2022 06:36:32 -0400
X-MC-Unique: FSK8Mo3bN7WLmYPBL_1oog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2517811E81;
 Fri, 16 Sep 2022 10:36:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86DBB2314B;
 Fri, 16 Sep 2022 10:36:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B9DD21E6900; Fri, 16 Sep 2022 12:36:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  jsnow@redhat.com,
 eblake@redhat.com
Subject: Re: [PATCH 05/27] qapi tests: Elide redundant has_FOO in generated C
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-6-armbru@redhat.com>
 <YyQ51Gvy2JS56+TL@redhat.com>
Date: Fri, 16 Sep 2022 12:36:30 +0200
In-Reply-To: <YyQ51Gvy2JS56+TL@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 16 Sep 2022 09:54:44 +0100")
Message-ID: <87fsgrd2s1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Sep 15, 2022 at 10:42:55PM +0200, Markus Armbruster wrote:
>> The has_FOO for pointer-valued FOO are redundant, except for arrays.
>> They are also a nuisance to work with.  Recent commit "qapi: Start to
>> elide redundant has_FOO in generated C" provided the means to elide
>> them step by step.  This is the step for
>> tests/qapi-schema/qapi-schema-test.json.
>>=20
>> Said commit explains the transformation in more detail.  The invariant
>> violations mentioned there do not occur here.
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  tests/qtest/qmp-cmd-test.c               |  2 +-
>>  tests/unit/test-qmp-cmds.c               | 26 +++++++++++-------------
>>  tests/unit/test-qmp-event.c              |  4 ++--
>>  tests/unit/test-qobject-input-visitor.c  |  2 +-
>>  tests/unit/test-qobject-output-visitor.c |  2 --
>>  tests/unit/test-visitor-serialization.c  |  3 +--
>>  scripts/qapi/schema.py                   |  4 +---
>>  7 files changed, 18 insertions(+), 25 deletions(-)
>
>> diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
>> index 6085c09995..2373cd64cb 100644
>> --- a/tests/unit/test-qmp-cmds.c
>> +++ b/tests/unit/test-qmp-cmds.c
>> @@ -43,15 +43,15 @@ void qmp_user_def_cmd1(UserDefOne * ud1, Error **err=
p)
>>  {
>>  }
>>=20=20
>> -FeatureStruct1 *qmp_test_features0(bool has_fs0, FeatureStruct0 *fs0,
>> -                                   bool has_fs1, FeatureStruct1 *fs1,
>> -                                   bool has_fs2, FeatureStruct2 *fs2,
>> -                                   bool has_fs3, FeatureStruct3 *fs3,
>> -                                   bool has_fs4, FeatureStruct4 *fs4,
>> -                                   bool has_cfs1, CondFeatureStruct1 *c=
fs1,
>> -                                   bool has_cfs2, CondFeatureStruct2 *c=
fs2,
>> -                                   bool has_cfs3, CondFeatureStruct3 *c=
fs3,
>> -                                   bool has_cfs4, CondFeatureStruct4 *c=
fs4,
>> +FeatureStruct1 *qmp_test_features0(FeatureStruct0 *fs0,
>> +                                   FeatureStruct1 *fs1,
>> +                                   FeatureStruct2 *fs2,
>> +                                   FeatureStruct3 *fs3,
>> +                                   FeatureStruct4 *fs4,
>> +                                   CondFeatureStruct1 *cfs1,
>> +                                   CondFeatureStruct2 *cfs2,
>> +                                   CondFeatureStruct3 *cfs3,
>> +                                   CondFeatureStruct4 *cfs4,
>>                                     Error **errp)
>
> It makes me so happy to see this change finally arrive, the new
> method signature just "feels right".

Thank you!

>> @@ -87,8 +86,8 @@ UserDefTwo *qmp_user_def_cmd2(UserDefOne *ud1a,
>>=20=20
>>      ud1c->string =3D strdup(ud1a->string);
>>      ud1c->integer =3D ud1a->integer;
>> -    ud1d->string =3D strdup(has_udb1 ? ud1b->string : "blah0");
>> -    ud1d->integer =3D has_udb1 ? ud1b->integer : 0;
>> +    ud1d->string =3D strdup(ud1b ? ud1b->string : "blah0");
>> +    ud1d->integer =3D ud1b ? ud1b->integer : 0;
>
> Pre-existing problem. use of 'strdup' will leave these fields
> NULL on OOM and nothing is checking this.

Yes.

Here, the value is assigned to a mandatory member of a QAPI object type.
Such members are specified not to be null.  When strdup() returns null
on OOM, we break the invariant.  Unaffected by the patch.

However, changes like

   -    obj->has_frob =3D true;
        obj->frob =3D strdup(...);

*are* affected: before the patch, we break the invariant "obj->has_frob
=3D=3D !!obj->frob", and afterwards, we change present to absent instead.

Arguing the finer points of this change seems a waste of time, since OOM
means doom anyway.

>                                           Fortunately it is only
> the test suite so not a big deal, but worth changing to g_strdup
> at some point (separate from this patch / series). Repeated in
> other chunks of the test beyond this quoted one, but I won't
> point them out.

Yes, g_strdup() would be better.

I count some 50 occurences of strdup() in the tree.  Getting rid of them
shouldn't be too hard.

> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Thanks again!


