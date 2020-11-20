Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9357E2BA569
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:06:38 +0100 (CET)
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2NJ-0006F3-5s
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg2Lv-0005iE-SF
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:05:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kg2Lt-0005uG-Bi
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605863107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iajxhw1cLYwzpab802gnIudWvVm2FWiyEDPQ/taY/y4=;
 b=fSigVNr3fs4iTLfWZNCCctcZJsdo8A+tiEOZ6K8TGBwKVSQVH+HimbJsyDRBeEK2gFBiuC
 TeX0QGwdb2T1xnQyifVqsZdqsMBYKEsFSIw61s0DlYi2eWBNATMags5QfynSxEFRXGIfH/
 NWCJhxQHKnvvxRf2bQV9HPmoL8rrChw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-nPEsrrCSMR6bl94XIVmr1w-1; Fri, 20 Nov 2020 04:05:05 -0500
X-MC-Unique: nPEsrrCSMR6bl94XIVmr1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26C82100B716;
 Fri, 20 Nov 2020 09:05:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB9BE5C1D5;
 Fri, 20 Nov 2020 09:05:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 80E5F11358BA; Fri, 20 Nov 2020 10:05:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 3/8] qnum: QNumValue type for QNum value literals
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-4-ehabkost@redhat.com>
 <CAJ+F1C+YUZdP56MuLtZbO0fK6rPsDosgxXG4zaDq=mjwqsV74A@mail.gmail.com>
 <20201117144246.GD1235237@habkost.net>
 <CAJ+F1CLZg-hhuK2ffRzVaWiZKe2Aqvf0-mqxXGAzscSa8FmCNw@mail.gmail.com>
 <87mtzdd4p7.fsf@dusky.pond.sub.org>
 <20201119182158.GX1509407@habkost.net>
 <20201119205502.GC1509407@habkost.net>
Date: Fri, 20 Nov 2020 10:05:02 +0100
In-Reply-To: <20201119205502.GC1509407@habkost.net> (Eduardo Habkost's message
 of "Thu, 19 Nov 2020 15:55:02 -0500")
Message-ID: <87k0ug760x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Nov 19, 2020 at 01:21:58PM -0500, Eduardo Habkost wrote:
>> On Thu, Nov 19, 2020 at 11:24:52AM +0100, Markus Armbruster wrote:
> [...]
>> > >> > > +    return qnum_from_value((QNumValue) QNUM_VAL_INT(value));
>> >=20
>> > No space between between (type) and its operand, please.
>> >=20
>> > Could we lift the cast into the macro somehow?
>>=20
>> I think we can.  I had thought the cast in the macro would break
>> usage as static variable initializers.  I was wrong.
>
> Actually, including the cast in the macro breaks QLIT_QDICT
> initializers (which use (QLitDictEntry[]) compound literals), and
> I don't know why.
>
> Compound literals in initializers of static variables is a GCC
> extension.  I don't understand why it doesn't work inside array
> compound literals, though.
>
> Any language lawyers around?
>
> This works:
>
>   typedef struct QLit {
>       int x, y;
>   } QLit;
>  =20
>   typedef struct Entry {
>       int key;
>       QLit value;
>   } Entry;
>  =20
>   Entry e =3D { .key =3D 0, .value =3D (QLit) { 1,   2 } };
>
> This works:
>
>   Entry *es1 =3D (Entry[]) {
>       { .key =3D 0, .value =3D { 1,   2 } },
>   };
>
> But this doesn't:
>
>   Entry *es2 =3D (Entry[]) {
>       { .key =3D 0, .value =3D (QLit) { 1,   2 } },
>   };
>
> dict.c:16:24: error: initializer element is not constant
>    16 | Entry *es2 =3D (Entry[]) {
>       |                        ^
> dict.c:16:24: note: (near initialization for =E2=80=98es2=E2=80=99)
>
> (gcc (GCC) 10.2.1 20201005 (Red Hat 10.2.1-5))

Can't explain this offhand.

Another pecularity: a const QLitObject is for the most part not actually
const.  Evidence:

    $ size bld-x86/libqemu-x86_64-softmmu.fa.p/meson-generated_.._qapi_qapi=
-introspect.c.o
       text=09   data=09    bss=09    dec=09    hex=09filename
      19590=09 351600=09     48=09 371238=09  5aa26=09bld-x86/libqemu-x86_6=
4-softmmu.fa.p/meson-generated_.._qapi_qapi-introspect.c.o

Score 5 out of 100 points.


