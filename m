Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6EF337038
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:41:04 +0100 (CET)
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIkZ-0004Yp-Ux
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKIiG-0002yQ-FM
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:38:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKIiC-0000Rx-D6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615459115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAmVe6q399N3DPQE9g05FxL2Algqzmqj5NFWa0tLAXw=;
 b=XoHiKlo3g+JdM3AWRcpIIftlg4rpY+3Tef6vJ/yn5SO++xIIsa+3cxdAvfqiAThvzUIvy8
 Qm2zMVsYGvWELpG0mrmR9VZnplUVz1i0GMrPtxxx9RRX+xtP0ZMfdATx2tJ3hWo3rwRSpX
 yOqz7jYo7DTwGoWVuK2jR8W6SpgMJhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-L8WLACWNPF6uuOvFazkRWA-1; Thu, 11 Mar 2021 05:38:33 -0500
X-MC-Unique: L8WLACWNPF6uuOvFazkRWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7E1380432E;
 Thu, 11 Mar 2021 10:38:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 212BE5945E;
 Thu, 11 Mar 2021 10:38:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9C3711132C12; Thu, 11 Mar 2021 11:38:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
Date: Thu, 11 Mar 2021 11:38:24 +0100
In-Reply-To: <20210310173044.GF6076@merkur.fritz.box> (Kevin Wolf's message of
 "Wed, 10 Mar 2021 18:30:44 +0100")
Message-ID: <87ft12q8kf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 jasowang@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 10.03.2021 um 15:31 hat Paolo Bonzini geschrieben:
>> On 10/03/21 15:22, Peter Krempa wrote:
>> > I've stumbled upon a regression with this patchset applied:
>> >=20
>> > error: internal error: process exited while connecting to monitor: qem=
u-system-x86_64: -object memory-backend-ram,id=3Dpc.ram,size=3D1048576000,h=
ost-nodes=3D0,policy=3Dbind: Invalid parameter type for 'host-nodes', expec=
ted: array
>>=20
>> This is the magic conversion of "string containing a list of integers"
>> to "list of integers".
>
> Ah, crap. This one wouldn't have been a problem when converting only
> object-add, and I trusted your audit that user creatable objects don't
> depend on any QemuOpts magic. I should have noticed it, too, of course,
> but during the convertion I didn't have QemuOpts in mind, only QOM and
> QAPI.
>
> I checked all object types, and it seems this is the only one that is
> affected. We have a second list in AuthZListProperties, but it contains
> structs, so it was never supported on the command line anyway.
>
>> The relevant code is in qapi/string-input-visitor.c, but I'm not sure wh=
ere
>> to stick it in the keyval-based parsing flow (i.e.
>> qobject_input_visitor_new_keyval).  Markus, any ideas?
>
> The best I can think of at the moment would be adding a flag to the
> keyval parser that would enable the feature only for -object (and only
> in the system emulator, because memory-backend-ram doesn't exist in the
> tools):
>
> The keyval parser would create a list if multiple values are given for
> the same key. Some care needs to be taken to avoid mixing the magic
> list feature with the normal indexed list options.

You're cursing^Wtalking about the wrong list hack, I'm afraid.

QemuOpts can indeed be used in a way so that key=3Dval1,key=3Dval2,... get
collected into a list val1, val2, ...  For an example, see how
qemu_semihosting_config_opts() processes the option argument of
-semihosting: repeated arg=3D... get collected in array
semihosting.argv[].

QOM property "host-nodes" employs a different hack.  The QAPI schema
defines it as

    { 'struct': 'Memdev',
      'data': {
        ...
        'host-nodes': ['uint16'],
        ... }}

The QObject input visitor treats it like any other list.  To get node 0
and 4, you say

    "host-nodes": [0,4]

with its JSON flavor, and

    host-nodes.0=3D0,host-nodes.1=3D4

with its dotted keys flavor.

The string input visitor and the opts visitor only support *scalar*
values, *except* they both have a hack to support lists of small
integers.

With the opts visitor, saying

    host-nodes=3D0,host-nodes=3D4

gets you node 0 and 4, and both

    host-nodes=3D0,host-nodes=3D1
    host-nodes=3D0-1

gets you nodes 0 and 1.  This is what parses -object.

Setting NumaNode member @cpus via -numa cpus=3D... is another user of this
hack.

With the string input visitor, repeating the key doesn't work (there is
no syntax for keys, in fact), but comma does.  This is what parses
-global and HMP qom-set.

The problem Peter reported is that switching -object from QemuOpts +
opts visitor to keyval_parse() + QObject input visitor loses the opts
visitor's list-of-integers hack.

The obvious solution is to transplant the hack to the QObject input
visitor.  "Ich kann nicht soviel fressen wie ich kotzen m=C3=B6chte" (okay,=
 I
better don't translate this; all you need to know is that I find the
idea utterly disgusting).

There is the more general problem of human-friendly syntax support.
QAPI/QMP eschew encoding complex data in strings.  They want you to use
complex data types.

Fine for QMP, machines are generally better off with formatting /
parsing verbose JSON than with formatting / parsing lots of ad hoc
little languages.

Not always fine for humans.  Case in point:
host-nodes.0=3D0,host-nodes.1=3D4 is decidedly inferior to something like
host-nodes=3D0+4[*].

Perhaps we need to provide means to define ad hoc little languages for
human use.  Specify the parsing function to use for human input in the
QAPI schema.

Doesn't really help us now, because we can't pull it off in time for the
soft freeze.

Here's a differently terrible hack.  We have

         keyval_parse()       visitor
    optarg --------> QObject --------> QAPI type

Idea: hack the QObject.  If we're working for -object, and QObject maps
key "qom-type" to value "memory-backend-ram", get the value of
host-nodes, and if it's a string, parse it into a list like the opts
visitor does, and put that back, replacing the string value.

Same for other uses of Memdev and NumaNodeOptions with -object, if they
exist.

I told you it's terrible :)

[...]


[*] 0+4 and not 0,4 because ',' would have to be doubled in dotted key
syntax.


