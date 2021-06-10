Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8EA3A280D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:17:01 +0200 (CEST)
Received: from localhost ([::1]:43178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGo8-0004WL-AV
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrGmV-0003iJ-Ku
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:15:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrGmS-0003Ri-IR
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623316516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFbtuUYazDJ0ZmpcBjIC+E8bPTxy25795ot6auKfMsc=;
 b=ORT6m55+pgcENML1E0wljVhINKmygzxGS55z5mzoZnB0ytrqUmSeWLQTJGTev9rVV01jHk
 RShacuY0qyZZ0AK/aY02qwury1wuS4iHgsFEdOMjbrKl3nSEYSA3Fr6AvAalgCfiR8f+xf
 oVsl36uIBPGugOPhSfP8hkRSomzzGJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-GYhHpzFgOXG8MhzJCMKmQA-1; Thu, 10 Jun 2021 05:15:14 -0400
X-MC-Unique: GYhHpzFgOXG8MhzJCMKmQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE6A0100CF78;
 Thu, 10 Jun 2021 09:15:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9051B60917;
 Thu, 10 Jun 2021 09:15:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 260B7113865F; Thu, 10 Jun 2021 11:15:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] tpm: Return QMP error when TPM is disabled in build
References: <20210609152559.1088596-1-philmd@redhat.com>
 <CAJ+F1CL0ZdNUdcgTR8gv3w-+p++tDfvtFVYPm6NgoU_b03VgRQ@mail.gmail.com>
 <2ebcd286-cc73-e8da-53ef-2424419822ff@redhat.com>
 <d73d226b-557e-d619-10ba-e547fc51ad9d@redhat.com>
 <YMD8IaJKTHJwp+io@redhat.com>
Date: Thu, 10 Jun 2021 11:15:12 +0200
In-Reply-To: <YMD8IaJKTHJwp+io@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 9 Jun 2021 18:36:33 +0100")
Message-ID: <87k0n2dqsf.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Jun 09, 2021 at 07:34:32PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On 6/9/21 7:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> > On 6/9/21 6:01 PM, Marc-Andr=C3=A9 Lureau wrote:
>> >> Hi
>> >>
>> >> On Wed, Jun 9, 2021 at 7:33 PM Philippe Mathieu-Daud=C3=A9 <philmd@re=
dhat.com
>> >> <mailto:philmd@redhat.com>> wrote:
>> >>
>> >>     When the management layer queries a binary built using --disable-=
tpm
>> >>     for TPM devices, it gets confused by getting empty responses:
>> >>
>> >>     =C2=A0 { "execute": "query-tpm" }
>> >>     =C2=A0 {
>> >>     =C2=A0 =C2=A0 =C2=A0 "return": [
>> >>     =C2=A0 =C2=A0 =C2=A0 ]
>> >>     =C2=A0 }
>> >>     =C2=A0 { "execute": "query-tpm-types" }
>> >>     =C2=A0 {
>> >>     =C2=A0 =C2=A0 =C2=A0 "return": [
>> >>     =C2=A0 =C2=A0 =C2=A0 ]
>> >>     =C2=A0 }
>> >>     =C2=A0 { "execute": "query-tpm-models" }
>> >>     =C2=A0 {
>> >>     =C2=A0 =C2=A0 =C2=A0 "return": [
>> >>     =C2=A0 =C2=A0 =C2=A0 ]
>> >>     =C2=A0 }
>> >>
>> >>     Make it clearer by returning an error, mentioning the feature is
>> >>     disabled:
>> >>
>> >>     =C2=A0 { "execute": "query-tpm" }
>> >>     =C2=A0 {
>> >>     =C2=A0 =C2=A0 =C2=A0 "error": {
>> >>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "class": "GenericError",
>> >>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "desc": "this feature or comma=
nd is not currently supported"
>> >>     =C2=A0 =C2=A0 =C2=A0 }
>> >>     =C2=A0 }
>> >>
>> >>     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
>> >>     <mailto:philmd@redhat.com>>
>> >>
>> >>
>> >> Why not make the qapi schema conditional?
>>=20
>> Using your suggestion (and ignoring QAPI marshaling error) I'm getting:
>>=20
>> { "execute": "query-tpm" }
>> {
>>     "error": {
>>         "class": "CommandNotFound",
>>         "desc": "The command query-tpm has not been found"
>>     }
>> }
>>=20
>> Is that OK from a management perspective?
>
> That's fairly typical of what we'd expect to see from a feature
> which is either removed at compile time, or never existed in the first
> place. mgmt apps don't really need to distinguish those two scenarios,
> so this is fine.

Yes, this is how commands tied to compiled-out features should behave:
same both for "this version of QEMU doesn't have the feature" and "this
build of QEMU doesn't have the feature".  Management applications don't
care fore the difference.

Unfortunately, quite a few such commands predate QAPI conditionals, and
do something else.

Making such a command properly conditional now adds a new error to it.
We reserve the right to add errors to QMP commands, even though this
could conceivably unmask error handling bugs in management applications.

I think making such commands properly conditional is a good move anyway,
because it makes introspection more useful.


