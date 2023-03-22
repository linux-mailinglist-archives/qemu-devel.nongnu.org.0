Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F36C425B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 06:47:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1perIh-00073I-3A; Wed, 22 Mar 2023 01:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1perIV-000728-9w
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 01:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1perIR-0004om-4g
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 01:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679463944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rins0cam59lhRlFQwoFHdPPHjs351qvtkMx/QDMGDbw=;
 b=iBHC3OJH0L6fKa5yY23ERi80tRAGCKbpWZiHMSKeUzp92DXajEh06HcmqqckUzQp3n70By
 /W2fST+9eehWzlTMlJ4c6LAKAEfKBvz2AXzuJTvHp7JL+amAiieorB/tj6wqECCZ85qlAh
 6OJbAkDSA0DjT4D7lHPuvm6wIBo0OCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-Px3XnEKUND6T7OCSOk1ZZQ-1; Wed, 22 Mar 2023 01:45:41 -0400
X-MC-Unique: Px3XnEKUND6T7OCSOk1ZZQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 134B0185A78F;
 Wed, 22 Mar 2023 05:45:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDC98492C14;
 Wed, 22 Mar 2023 05:45:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D267221E6926; Wed, 22 Mar 2023 06:45:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  qemu-devel@nongnu.org,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Stefan
 Berger <stefanb@linux.vnet.ibm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org>
 <87cz58ubcn.fsf@pond.sub.org> <ZBMfosr0JDyfjhqs@redhat.com>
 <873564spze.fsf@pond.sub.org>
 <aad2628c-196a-3f91-d184-20c034518de7@linaro.org>
 <ZBnLAIXT3pTmjqAy@redhat.com>
 <20230321214327.xgxyvm2iw7pkiogz@redhat.com>
Date: Wed, 22 Mar 2023 06:45:39 +0100
In-Reply-To: <20230321214327.xgxyvm2iw7pkiogz@redhat.com> (Eric Blake's
 message of "Tue, 21 Mar 2023 16:43:27 -0500")
Message-ID: <87sfdx9w58.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Eric Blake <eblake@redhat.com> writes:

> On Tue, Mar 21, 2023 at 03:19:28PM +0000, Daniel P. Berrang=C3=A9 wrote:
>> On Tue, Mar 21, 2023 at 03:31:56PM +0100, Philippe Mathieu-Daud=C3=A9 wr=
ote:
>> > On 16/3/23 15:57, Markus Armbruster wrote:
>> > > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> > >=20
>> > > > On Thu, Mar 16, 2023 at 01:31:04PM +0100, Markus Armbruster wrote:
>> > > > > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>> > > > >=20
>> > > > > > Per the C++ standard, empty enum are ill-formed. Do not genera=
te
>> > >=20
>> > > The C standard.  The C++ standard doesn't apply here :)
>> >=20
>> > I can't find how empty enums are considered by the C standard...

C99 =C2=A76.7.2.2 Enumeration specifiers

               enum-specifier:
                       enum identifier-opt { enumerator-list }
                       enum identifier-opt { enumerator-list , }
                       enum identifier

               enumerator-list:
                       enumerator
                       enumerator-list , enumerator

               enumerator:
                       enumeration-constant
                       enumeration-constant =3D constant-expr

Empty enum is a syntax error.

>> The C standard doesn't really matter either.
>>=20
>> What we actually care about is whether GCC and CLang consider the
>> empty enums to be permissible or not. or to put it another way...
>> if it compiles, ship it :-)
>
> But it doesn't compile:
>
> $ cat foo.c
> typedef enum Blah {
> } Blah;
> int main(void) {
>   Blah b =3D 0;
> }
> $ gcc -o foo -Wall foo.c
> foo.c:2:1: error: empty enum is invalid
>     2 | } Blah;
>       | ^

Gcc opts for an error message more useful than "identifier expected".

> foo.c: In function =E2=80=98main=E2=80=99:
> foo.c:4:5: error: unknown type name =E2=80=98Blah=E2=80=99; use =E2=80=98=
enum=E2=80=99 keyword to refer to the type
>     4 |     Blah b =3D 0;
>       |     ^~~~
>       |     enum=20
> foo.c:4:10: warning: unused variable =E2=80=98b=E2=80=99 [-Wunused-variab=
le]
>     4 |     Blah b =3D 0;
>       |          ^
>
> So we _do_ need to avoid creating an enum with all members optional in
> the configuration where all options are disabled, if we want that
> configuration to compile.  Or require that all QAPI enums have at
> least one non-optional member.

There is just one way to avoid creating such an enum: make sure the QAPI
enum has members in all configurations we care for.

The issue at hand is whether catching empty enums in qapi-gen already is
practical.  Desirable, because qapi-gen errors are friendlier than C
compiler errors in generated code.

Note "practical": qapi-gen makes an effort to catch errors before the C
compiler catches them.  But catching all of them is impractical.

Having qapi-gen catch empty enums sure is practical for truly empty
enums.  But I doubt an enum without any members is a mistake people make
much.

It isn't for enums with only conditional members: the configuration that
makes them all vanish may or may not actually matter, or even exist, and
qapi-gen can't tell.  The C compiler can tell, but only for the
configuration being compiled.

Requiring at least one non-optional member is a restriction: enums with
only conditional members are now rejected even when the configuration
that makes them all vanish does not actually matter.

Is shielding the user from C compiler errors about empty enums worth the
restriction?


