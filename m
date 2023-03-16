Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBCB6BD2D6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:59:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcp3R-0005OU-8J; Thu, 16 Mar 2023 10:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pcp3P-0005OI-4m
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:58:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pcp3N-0002zV-3U
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:58:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678978683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25xY9sFL573myU0M0eDnl5E/sPs2CIun/8GxV7tEV4U=;
 b=hTEqK6EFbcgqhAA3E50M1Nf6FtZhkdupf+tFxen0KgDHY+nCuyifD3y8A83gtbrmDgpJKJ
 mV4zgk/mE2Z/6tV66QoGNXLYs3S6m9L1x6cXaHf2advAtB7rN4JuzHlSnMcxswgdiFQBgT
 cWK+h47kiZQy5cYj8+UMBuZ2tyEoXMA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-UL4wMMHEMWOw9LGAR9XTdQ-1; Thu, 16 Mar 2023 10:57:58 -0400
X-MC-Unique: UL4wMMHEMWOw9LGAR9XTdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76EA12807D76;
 Thu, 16 Mar 2023 14:57:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30B542A68;
 Thu, 16 Mar 2023 14:57:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2A3EE21E675B; Thu, 16 Mar 2023 15:57:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Stefan
 Berger <stefanb@linux.vnet.ibm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org>
 <87cz58ubcn.fsf@pond.sub.org> <ZBMfosr0JDyfjhqs@redhat.com>
Date: Thu, 16 Mar 2023 15:57:57 +0100
In-Reply-To: <ZBMfosr0JDyfjhqs@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 16 Mar 2023 13:54:42 +0000")
Message-ID: <873564spze.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Mar 16, 2023 at 01:31:04PM +0100, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>> > Per the C++ standard, empty enum are ill-formed. Do not generate

The C standard.  The C++ standard doesn't apply here :)

>> > them in order to avoid:
>> >
>> >   In file included from qga/qga-qapi-emit-events.c:14:
>> >   qga/qga-qapi-emit-events.h:20:1: error: empty enum is invalid
>> >      20 | } qga_QAPIEvent;
>> >         | ^
>> >
>> > Reported-by: Markus Armbruster <armbru@redhat.com>
>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>=20
>> Two failures in "make check-qapi-schema" (which is run by "make check"):
>>=20
>> 1. Positive test case qapi-schema-test
>>=20
>>     --- /work/armbru/qemu/bld-x86/../tests/qapi-schema/qapi-schema-test.=
out
>>     +++=20
>>     @@ -19,7 +19,6 @@
>>          member enum2: EnumOne optional=3DTrue
>>          member enum3: EnumOne optional=3DFalse
>>          member enum4: EnumOne optional=3DTrue
>>     -enum MyEnum
>>      object Empty1
>>      object Empty2
>>          base Empty1
>>=20
>>    You forgot to update expected test output.  No big deal.
>>=20
>> 2. Negative test case union-empty
>>=20
>>     --- /work/armbru/qemu/bld-x86/../tests/qapi-schema/union-empty.err
>>     +++=20
>>     @@ -1,2 +1,2 @@
>>     -union-empty.json: In union 'Union':
>>     -union-empty.json:4: union has no branches
>>     +union-empty.json: In struct 'Base':
>>     +union-empty.json:3: member 'type' uses unknown type 'Empty'
>>     stderr:
>>     qapi-schema-test FAIL
>>     union-empty FAIL
>>=20
>>    The error message regresses.
>>=20
>>    I can see two ways to fix this:
>>=20
>>    (A) You can't just drop empty enumeration types on the floor.  To not
>>        generate code for them, you need to skip them wherever we
>>        generate code for enumeration types.
>>=20
>>    (B) Outlaw empty enumeration types.
>>=20
>> I recommend to give (B) a try, it's likely simpler.
>
> Possible trap-door with (B), if we have any enums where *every*
> member is conditionalized on a CONFIG_XXX rule, there might be
> certain build scenarios where an enum suddenly becomes empty.

True.  Scratch the idea.

Trap-door also applies to (A): we can still end up with empty enums.

(C) Always emit a dummy member.  This is actually what we do now:

    typedef enum OnOffAuto {
        ON_OFF_AUTO_AUTO =3D 1,
        ON_OFF_AUTO_ON =3D 2,
        ON_OFF_AUTO_OFF =3D 3,
        ON_OFF_AUTO__MAX,               <--- the dummy
    } OnOffAuto;

But the next patch changes it to

    typedef enum OnOffAuto {
        ON_OFF_AUTO_AUTO,
        ON_OFF_AUTO_ON,
        ON_OFF_AUTO_OFF,
    #define ON_OFF_AUTO__MAX 3
    } OnOffAuto;

Two problems, actually.

One, we lose the dummy.  We could add one back like

    typedef enum OnOffAuto {
        ON_OFF_AUTO__DUMMY =3D 0,
        ON_OFF_AUTO_AUTO =3D 0,
        ON_OFF_AUTO_ON,
        ON_OFF_AUTO_OFF,
    #define ON_OFF_AUTO__MAX 3
    } OnOffAuto;

But all of this falls apart with conditional members!

Example 1 (taken from qapi/block-core.json):

    { 'enum': 'BlockdevAioOptions',
      'data': [ 'threads', 'native',
                { 'name': 'io_uring', 'if': 'CONFIG_LINUX_IO_URING' } ] }

Generates now:

    typedef enum BlockdevAioOptions {
        BLOCKDEV_AIO_OPTIONS_THREADS,
        BLOCKDEV_AIO_OPTIONS_NATIVE,
    #if defined(CONFIG_LINUX_IO_URING)
        BLOCKDEV_AIO_OPTIONS_IO_URING,
    #endif /* defined(CONFIG_LINUX_IO_URING) */
        BLOCKDEV_AIO_OPTIONS__MAX,
    } BlockdevAioOptions;

BLOCKDEV_AIO_OPTIONS__MAX is 3 if defined(CONFIG_LINUX_IO_URING), else
2.

After the next patch:

    typedef enum BlockdevAioOptions {
        BLOCKDEV_AIO_OPTIONS_THREADS,
        BLOCKDEV_AIO_OPTIONS_NATIVE,
    #if defined(CONFIG_LINUX_IO_URING)
        BLOCKDEV_AIO_OPTIONS_IO_URING,
    #endif /* defined(CONFIG_LINUX_IO_URING) */
    #define BLOCKDEV_AIO_OPTIONS__MAX 3
    } BlockdevAioOptions;

Now it's always 3.

Example 2 (same with members reordered):

    { 'enum': 'BlockdevAioOptions',
      'data': [ { 'name': 'io_uring', 'if': 'CONFIG_LINUX_IO_URING' },
                'threads', 'native' ] }

Same problem for __MAX, additional problem for __DUMMY:

    typedef enum BlockdevAioOptions {
        BLOCKDEV_AIO_OPTIONS__DUMMY =3D 0,
    #if defined(CONFIG_LINUX_IO_URING)
        BLOCKDEV_AIO_OPTIONS_IO_URING =3D 0,
    #endif /* defined(CONFIG_LINUX_IO_URING) */
        BLOCKDEV_AIO_OPTIONS_THREADS,
        BLOCKDEV_AIO_OPTIONS_NATIVE,
    #define BLOCKDEV_AIO_OPTIONS__MAX 3
    } BlockdevAioOptions;

If CONFIG_LINUX_IO_URING is off, the enum starts at 1 instead of 0.

Arrays indexed by the enum start with a hole.  Code using them is
probably not prepared for holes.

*Sigh*


