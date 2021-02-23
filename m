Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DD43227E9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:36:25 +0100 (CET)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEU7E-0003QR-KY
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEU4i-0002RD-Rs
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:33:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEU4g-0004S3-SV
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614072823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDKjDYPBR+y/IE8gp0J1JPApi+jgweUm8HzQ5fb+4zY=;
 b=YOHMlIKuyn+GFAzPyGL//uh2jxTe938sraKfw3VS2vNIqEVC25A+5p8m2lVqBORiSQFF0k
 kxXN21sGGHX0jeQWs4Rr7bQD8pTADfOJmAc5efW8H1PG9txmDGYWfZ4M6+LZWb85x/qT66
 a2kjJOH0NYLB64V5FqasJzZk9EvL5jQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-Csyee0moNQye9OywIHd1Ng-1; Tue, 23 Feb 2021 04:33:41 -0500
X-MC-Unique: Csyee0moNQye9OywIHd1Ng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E088D8D99;
 Tue, 23 Feb 2021 09:31:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05A9A106222F;
 Tue, 23 Feb 2021 09:31:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 818C0113860F; Tue, 23 Feb 2021 10:31:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
References: <875z2knoa5.fsf@dusky.pond.sub.org> <YDPMs1Hu8LDRJUhX@redhat.com>
 <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com>
 <YDPv7Bk6/DNq/lCn@redhat.com>
Date: Tue, 23 Feb 2021 10:31:55 +0100
In-Reply-To: <YDPv7Bk6/DNq/lCn@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Mon, 22 Feb 2021 17:54:52 +0000")
Message-ID: <87o8gbf7uc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Feb 22, 2021 at 06:47:30PM +0100, Paolo Bonzini wrote:
>> On 22/02/21 16:24, Daniel P. Berrang=C3=A9 wrote:
>> > This problem isn't unique to QEMU. Any app using JSON from the
>> > shell will have the tedium of quote escaping. JSON is incredibly
>> > widespread and no other apps felt it neccessary to introduce single
>> > quoting support, because the benefit doesn't outweigh the interop
>> > problem it introduces.
>>=20
>> The quotes were introduced for C code (and especially qtest), not for th=
e
>> shell.  We have something like
>>=20
>>     response =3D qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s,=
 "
>>                    "'property': 'temperature' } }", id);
>>=20
>> These are sent to QEMU as double-quoted strings (the single-quoted JSON =
is
>> parsed to get interpolation and printed back; commit 563890c7c7, "libqte=
st:
>> escape strings in QMP commands, fix leak", 2014-07-01). However, doing t=
he
>> interpolation requires a parser that recognizes the single-quoted string=
s.
>
> IMHO this is the wrong solution to the problem.  Consider the equivalent
> libvirt code that uses a standard JSON library underneath and has a high
> level API to serialize args into the command
>
>       qemuMonitorJSONMakeCommand("qom-get",
>                                  "s:path", id,
> =09=09=09=09 "s:property", "temperature");
>
> Of course this example is reasonably easy since it is a flat set of
> arguments. Nested args get slightly more complicated, but still always
> preferrable to doing string interpolation IMHO.

Misunderstanding: our JSON interpolation feature is *not* string
interpolation!  It interpolates *objects* into the QObject built by the
parser.

Best explained with an example.  The qmp() call above internally builds
the following QObject:

    QDict mapping
        key "execute" to a QString for "qom-get"
        key "arguments" to a QDict mapping
            key "path" to a QString for @id (interpolation!)
            key "property" to a QString for "temperature"

Unlike string interpolation, this is safe for any valid C string @id.

If you think like a hacker, you might try shenanigans like

    "{'execute': '%s'}"

You will then find that somebody has thought like a hacker before
you[*].

The %-sequences are cleverly chosen to get some protection against
common mistakes from the compiler.

This interpolation has worked quite well for us, and I have no plans to
replace it.  Doesn't mean I'm against replacing it, only that I want to
see benefits exceeding the costs.

A bigger stumbling block for replacement is our need for a streaming
interface: we feed the parser characters, and expect to be called back
when an expression is complete.


[*] Commit 16a4859921 "json: Improve safety of
qobject_from_jsonf_nofail() & friends", fixed up in commit bbc0586ced
"json: Fix % handling when not interpolating".


