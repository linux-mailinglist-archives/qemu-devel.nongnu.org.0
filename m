Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6438345904C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:34:25 +0100 (CET)
Received: from localhost ([::1]:47086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAOl-00025p-W1
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:34:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpANL-0001PU-Nj
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:32:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpANE-00032o-Po
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637591567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WX1g1nPJVs2mMUuUIt17shWM2dlca3kljRJX5GXwJCo=;
 b=EmnC509bZEK5r3QpePJ9BXBtsb9lOSC3O1YJBd5fxKN7kv7nB/AvN+KhsnSWe7PwzK5uFK
 4Y+s1XtgWwcNq82LXL8bbtM+rPyU4lQ5gCllyyfsV9NrO6Mv2OMfLdu9lD/wypY0MPRcxw
 rV0fIajLSispywLueweYJY24jY2YkJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-rIVMOumDMqmzJYKSQJ8Q_A-1; Mon, 22 Nov 2021 09:32:44 -0500
X-MC-Unique: rIVMOumDMqmzJYKSQJ8Q_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85CA08799E0
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 14:32:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D545460C82;
 Mon, 22 Nov 2021 14:32:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 299B411380A7; Mon, 22 Nov 2021 15:32:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH-for-6.2 v3] qdev-monitor: Only allow full --global
 <driver>.<property>=<val> option
References: <20211119182644.480115-1-philmd@redhat.com>
 <87czmv1fof.fsf@dusky.pond.sub.org> <YZuZUVAho51eoVXA@redhat.com>
Date: Mon, 22 Nov 2021 15:32:36 +0100
In-Reply-To: <YZuZUVAho51eoVXA@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 22 Nov 2021 13:21:21 +0000")
Message-ID: <87ilwkjm63.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Dau?= =?utf-8?Q?d=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Sat, Nov 20, 2021 at 07:53:20AM +0100, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>> > When not all fields of the --global option are provided,
>> > QEMU might crash:
>> >
>> >   $ qemu-system-x86_64 -global driver=3Disa-fdc
>> >   qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394=
:
>> >   string_input_visitor_new: Assertion `str' failed.
>> >   Aborted (core dumped)
>> >
>> > Fix by only allowing --global with all 3 fields:
>> >
>> >   $ qemu-system-x86_64 -global driver=3Disa-fdc
>> >   Invalid 'global' option format. It must be provided as:
>> >     --global <driver>.<property>=3D<value>
>> >
>> > Reported-by: Thomas Huth <thuth@redhat.com>
>> > Suggested-by: Markus Armbruster <armbru@redhat.com>
>> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > ---
>> > v3: Change qemu_global_option (Markus)
>> >
>> > Supersedes: <20211119122911.365036-1-philmd@redhat.com>
>> > ---
>> >  softmmu/qdev-monitor.c | 9 +++------
>> >  1 file changed, 3 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> > index 01f3834db57..558272b147c 100644
>> > --- a/softmmu/qdev-monitor.c
>> > +++ b/softmmu/qdev-monitor.c
>> > @@ -1029,13 +1029,10 @@ int qemu_global_option(const char *str)
>> >          qemu_opt_set(opts, "value", str + offset + 1, &error_abort);
>> >          return 0;
>> >      }
>> > +    printf("Invalid 'global' option format. It must be provided as:\n=
");
>> > +    printf("  --global <driver>.<property>=3D<value>\n");
>> > =20
>> > -    opts =3D qemu_opts_parse_noisily(&qemu_global_opts, str, false);
>> > -    if (!opts) {
>> > -        return -1;
>> > -    }
>> > -
>> > -    return 0;
>> > +    return -1;
>> >  }
>> > =20
>> >  bool qmp_command_available(const QmpCommand *cmd, Error **errp)
>>=20
>> This drops a documented part of the external interface:
>>=20
>>     $ qemu-system-x86_64 -help | grep -C 1 global
>>                     i.e. -set drive.$id.file=3D/path/to/image
>>     -global driver.property=3Dvalue
>> --> -global driver=3Ddriver,property=3Dproperty,value=3Dvalue
>>                     set a global default for a driver property
>
> This doc makes it look like the two syntaxes are functionally
> equivalent, but it seems that's not quite the case.
>
> libvirt uses the driver.propert=3Dvalue syntax for everything
> except one case
>
>   -global driver=3Dcfi.pflash01,property=3Dsecure,value=3Don
>
> for that one if we try to use
>
>   -global cfi.pflash01.secure=3Don
>
> it complains
>
>   qemu-system-x86_64: warning: global cfi.pflash01.secure has invalid cla=
ss name
>
> what's going on here ?

Off-the-cuff guess: cfi.pflash01.secure=3Don gets parsed as

    driver=3Dcfi
    property=3Dpflash01.secure
    value=3Don

Once again our "anything goes" attitude to naming wastes us time and
thus money.

In contrast, QAPI restricts names to "only ASCII letters, digits,
hyphen, and underscore" (see docs/devel/qapi-code-gen.rst section Naming
rules and reserved names).


