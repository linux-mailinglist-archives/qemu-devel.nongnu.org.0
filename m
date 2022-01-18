Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F9492B7E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:48:49 +0100 (CET)
Received: from localhost ([::1]:46790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rf5-0000bq-Rf
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:48:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9rLC-0003VH-AY
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:28:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9rL8-00048B-06
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s++c99WtfCvcaTWdBqGaqsLNU4DD6wAcWI3OPn2euag=;
 b=I+nqHEtij36/Mmrr/qfuVykGnU4G+CVGawBRKD/DWrdzdL63ZimHZSKwSX8Pb4M6JytUnz
 2lCoFrcrPV2NMGQQWJTikMxX1u3QPyCyKtzPqHiYAG9Pqf6fIxeLdwjpv7tjB0h5hIeLEE
 i7aSws7I0AIv6fRIDaN6z0E5P8iQvJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-VTWs1ZUGNXawCwNhlapsdg-1; Tue, 18 Jan 2022 11:28:00 -0500
X-MC-Unique: VTWs1ZUGNXawCwNhlapsdg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2C7288994A;
 Tue, 18 Jan 2022 16:20:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32544798C6;
 Tue, 18 Jan 2022 16:20:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A5E4D113865F; Tue, 18 Jan 2022 17:20:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] python/qom: Fix qom-set failure
References: <20211220174418.84977-1-louiswpf@gmail.com>
 <CAFn=p-Y5_=R9Z6ofk6FTvYFRp+o19DvS7JLb5D5K0ZoDPOfaOg@mail.gmail.com>
Date: Tue, 18 Jan 2022 17:20:02 +0100
In-Reply-To: <CAFn=p-Y5_=R9Z6ofk6FTvYFRp+o19DvS7JLb5D5K0ZoDPOfaOg@mail.gmail.com>
 (John Snow's message of "Mon, 10 Jan 2022 15:16:39 -0500")
Message-ID: <87a6ft818t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Wang Bing-hua <louiswpf@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Mon, Dec 20, 2021 at 12:46 PM Wang Bing-hua <louiswpf@gmail.com> wrote:
>
>> Fix the following failure by interpreting 'value' argument as 'int'.
>>
>>
> Thanks for the patch. Do you use the qom tools often? I wasn't sure anybody
> did ...
>
>
>> $ scripts/qmp/qom-set -s /tmp/qmp-socket
>> /machine/unattached/device[6].temperature 0
>> QMPResponseError: Invalid parameter type for 'temperature', expected:
>> integer
>>
>> Fixes: c750c02891a8 ("python/qmp: Add qom script rewrites")
>> Signed-off-by: Wang Bing-hua <louiswpf@gmail.com>
>> ---
>>  python/qemu/qmp/qom.py | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py
>> index 8ff28a8343..0b77dc6aa3 100644
>> --- a/python/qemu/qmp/qom.py
>> +++ b/python/qemu/qmp/qom.py
>> @@ -72,6 +72,7 @@ def configure_parser(cls, parser:
>> argparse.ArgumentParser) -> None:
>>          cls.add_path_prop_arg(parser)
>>          parser.add_argument(
>>              'value',
>> +            type=int,
>>              metavar='<value>',
>>              action='store',
>>              help='new QOM property value'
>> --
>> 2.34.1
>>
>>
> Is this always going to be correct, though? QOM property values aren't
> *always* integers. Won't this break other cases?

I believe it will.

The QMP core parses arguments (which are JSON values) into QObjects.
JSON strings become QString, JSON booleans becomes QBool, and so forth.

qmp_qom_set() feeds its value argument to the property's .set() method
together with a QObject input visitor.  Fails when its the wrong kind of
QObject.

The problem is figuring out what the right kind is.

QAPI schema introspection can't tell you, because we declare: 'value':
'any'.

QOM introspection is (in my educated opinion) crap.  See below.

> The old qom-set script did this [1]:
>> print(srv.command('qom-set', path=path, property=prop, value=value))
>
> which looks an awful lot like the old qom-set just passed a string along,
> too.
>
> Two ideas:
>
> (1) try qom-get on the same property and just take note of what type it is
> that you get back from the server. e.g.
>
> rsp = self.qmp.command('qom-get', path=self.path, property=self.prop)
> if isinstance(rsp, int):
>     # Property we are setting must be an int
> else:
>     # It's something else.

Assumes .set() accepts the kind of object .get() returns, which should
be the case.

However, .set() could accept more.  And the kind of object .get()
returns could depend on state.  Which kind is the right one to use for
the string we get from the CLI?  We can't know.  What we can is guess.
There will always be cases where we guess wrong.

My advice is to stay away from this program.

> (2) use a query to just determine the type. qom-list with
> path=/tmp/qmp-socket /machine/unattached/device[6] will return a list of
> dicts; filter out for the one where "name" is "temperature", then use the
> "type" value to know what type we should expect from the user.

This is QOM introspection.  Possible "type" values are documented in
qom.json:

    # @type: the type of the property.  This will typically come in one of four
    #        forms:
    #
    #        1) A primitive type such as 'u8', 'u16', 'bool', 'str', or 'double'.
    #           These types are mapped to the appropriate JSON type.
    #
    #        2) A child type in the form 'child<subtype>' where subtype is a qdev
    #           device type name.  Child properties create the composition tree.
    #
    #        3) A link type in the form 'link<subtype>' where subtype is a qdev
    #           device type name.  Link properties form the device model graph.

I like that it says "one of four", then lists three.  Fair warning to
the reader not to trust this.

In fact, 1) is aspirational.  The value is whatever C code passes to
object_property_add().  Actually values include "bool", "int", "int32",
"size", "string", "uint16", "uint32", "uint64", "uint8",
"GuestPanicInformation", "QemuUUID", "X86CPUFeatureWordInfo", my
favorites "container", "guest statistics", "struct tm", and my special
favorite "struct".

Again, all we can do is guess.

>
> --js
>
> [1]
> https://gitlab.com/jsnow/qemu/-/blob/553032db17440f8de011390e5a1cfddd13751b0b/scripts/qmp/qom-set#L66


