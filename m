Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DC458B28
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 10:12:41 +0100 (CET)
Received: from localhost ([::1]:51746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp5NM-0001ry-Rw
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 04:12:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp5Lc-00014k-DQ
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:10:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp5LY-0001Mh-AK
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 04:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637572242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9TqZCiLbpMfL2jPsRI1Tp18pLVrwWWzQ0XIGkcjRUQ=;
 b=QUaaI6MchghoD7RdChNa5rSkKGCVZP1xPgcjJ1Z5Z26TB4YHfpscRymvkOMK8NmUE51Z8t
 clAX0SjmjIuEwLMl5YzLZlXhZwDMbQfMCKQv7V8vHSzDqEbKTdJwxX8kFidRBrBJSOOvBI
 77UMqrh10w4kfvb5iEB9KgonfT/N+hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-7WDa68JeOaq18mtQA46USg-1; Mon, 22 Nov 2021 04:10:38 -0500
X-MC-Unique: 7WDa68JeOaq18mtQA46USg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7ED410168C0;
 Mon, 22 Nov 2021 09:10:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D14D4ABBB;
 Mon, 22 Nov 2021 09:10:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 67A3D11380A7; Mon, 22 Nov 2021 10:10:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v3 3/3] cpus-common: implement dirty limit on vCPU
References: <cover.1637403404.git.huangy81@chinatelecom.cn>
 <cover.1637403404.git.huangy81@chinatelecom.cn>
 <99ea5e76926164d60a4ee62d0a1831823bc0d7a9.1637403404.git.huangy81@chinatelecom.cn>
 <87o86cprql.fsf@dusky.pond.sub.org>
 <1a8f3590-c7be-016e-842c-b4b29df92d2c@chinatelecom.cn>
Date: Mon, 22 Nov 2021 10:10:01 +0100
In-Reply-To: <1a8f3590-c7be-016e-842c-b4b29df92d2c@chinatelecom.cn> (Hyman
 Huang's message of "Mon, 22 Nov 2021 16:19:37 +0800")
Message-ID: <874k84o8t2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hyman Huang <huangy81@chinatelecom.cn> writes:

> =3DE5=3D9C=3DA8 2021/11/22 15:35, Markus Armbruster =3DE5=3D86=3D99=3DE9=
=3D81=3D93:
>> huangy81@chinatelecom.cn writes:
>>=20
>>> From: Hyman Huang(=3DE9=3DBB=3D84=3DE5=3D8B=3D87) <huangy81@chinateleco=
m.cn>
>>>
>>> implement dirtyrate calculation periodically basing on
>>> dirty-ring and throttle vCPU until it reachs the quota
>>> dirtyrate given by user.
>>>
>>> introduce qmp commands set-dirty-limit/cancel-dirty-limit to
>>> set/cancel dirty limit on vCPU.
>>=20
>> Please start sentences with a capital letter.
>>=20
> Ok=EF=BC=8Ci'll check the syntax problem next version.
>>>
>>> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.c=
n>
>>
>>=20
>> [...]
>>=20
>>> diff --git a/qapi/misc.json b/qapi/misc.json
>>> index 358548a..98e6001 100644
>>> --- a/qapi/misc.json
>>> +++ b/qapi/misc.json
>>> @@ -527,3 +527,42 @@
>>>    'data': { '*option': 'str' },
>>>    'returns': ['CommandLineOptionInfo'],
>>>    'allow-preconfig': true }
>>> +
>>> +##
>>> +# @set-dirty-limit:
>>> +#
>>> +# This command could be used to cap the vCPU memory load, which is als=
o
>>> +# refered as dirtyrate. One should use "calc-dirty-rate" with "dirty-r=
ing"
>>> +# and to calculate vCPU dirtyrate and query it with "query-dirty-rate"=
.
>>> +# Once getting the vCPU current dirtyrate, "set-dirty-limit" can be us=
ed
>>> +# to set the upper limit of dirtyrate for the interested vCPU.
>>=20
>> "dirtyrate" is not a word.  Let's spell it "dirty page rate", for
>> consistency with the documentation in migration.json.
> Ok, sounds good.
>>=20
>> Regarding "One should use ...": sounds like you have to run
>> calc-dirty-rate with argument @mode set to @dirty-ring before this
>> command.  Correct?  What happens when you don't?  set-dirty-limit fails?

You didn't answer this question.

>> Do you also have to run query-dirty-rate before this command?
> Actually no, i'll clarify the usage next verison.

Regarding "dirty-ring": is this merely a limitation of the
implementation, i.e. other modes could be made to work if we cared, or
is it more fundamental?

>> Speaking of migration.json: should these commands be defined there, next
>> to calc-dirty-rate and query-dirty-rate?
> I'm struggling too because these commands will be used in migration but=
=20
> it is vCPU they handle.

I think migration.json is more about CPUs than misc.json is.  Let's add
the new commands to migration.json if migration maintainers are okay
with it.

[...]


