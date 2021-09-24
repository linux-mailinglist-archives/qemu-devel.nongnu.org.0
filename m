Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BB14171FB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:37:28 +0200 (CEST)
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkSF-00049Y-Us
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTkD5-0004UV-QN
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mTkD1-00066R-TZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBbgz1Tc+XbdcIZGj4JYpH7tCeElxK0ZQ0Ief04aoqY=;
 b=ElGx8cgBizG54RNhH03OJFtJwctHT6XQtpCQUj3M+inPAoyfDaB+XAp1rHEMZoY8sUwqM2
 S87WfZo9dusHr4CXEhuPAb32YjIV8zPQDsu6AIKLYU8Y0XaO53fEo0g7KQZuctV70fSOIj
 AogEx7obDVjtqkLIQXa22MStSlodnHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-i2_HTewLPwuorYNvf7b02A-1; Fri, 24 Sep 2021 08:21:37 -0400
X-MC-Unique: i2_HTewLPwuorYNvf7b02A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D4041084681;
 Fri, 24 Sep 2021 12:21:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0454C4180;
 Fri, 24 Sep 2021 12:21:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 93CA3113865F; Fri, 24 Sep 2021 14:21:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PULL 18/18] qapi: move RTC_CHANGE to the target
 schema
References: <20190218140607.31998-1-armbru@redhat.com>
 <20190218140607.31998-19-armbru@redhat.com>
 <CAFEAcA9tzLOwbzO56HjhPUM2yTT7xxfkkOYX3OHVfKT-UC14gA@mail.gmail.com>
Date: Fri, 24 Sep 2021 14:21:21 +0200
In-Reply-To: <CAFEAcA9tzLOwbzO56HjhPUM2yTT7xxfkkOYX3OHVfKT-UC14gA@mail.gmail.com>
 (Peter Maydell's message of "Thu, 23 Sep 2021 14:14:31 +0100")
Message-ID: <874kaarwou.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 18 Feb 2019 at 14:19, Markus Armbruster <armbru@redhat.com> wrote=
:
>>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> A few targets don't emit RTC_CHANGE, we could restrict the event to
>> the tagets that do emit it.
>>
>> Note: There is a lot more of events & commands that we could restrict
>> to capable targets, with the cost of some additional complexity, but
>> the benefit of added correctness and better introspection.
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Message-Id: <20190214152251.2073-19-armbru@redhat.com>
>
> Hi; I've just run into this starting from Eric's patch to add
> RTC_CHANGE event support to the pl031 RTC. It seems kind of
> awkward to me:
>
>> diff --git a/qapi/target.json b/qapi/target.json
>> index 5c41a0aee7..da7b4be51e 100644
>> --- a/qapi/target.json
>> +++ b/qapi/target.json
>> @@ -7,6 +7,29 @@
>>
>>  { 'include': 'misc.json' }
>>
>> +##
>> +# @RTC_CHANGE:
>> +#
>> +# Emitted when the guest changes the RTC time.
>> +#
>> +# @offset: offset between base RTC clock (as specified by -rtc base), a=
nd
>> +#          new RTC clock value
>> +#
>> +# Note: This event is rate-limited.
>> +#
>> +# Since: 0.13.0
>> +#
>> +# Example:
>> +#
>> +# <-   { "event": "RTC_CHANGE",
>> +#        "data": { "offset": 78 },
>> +#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 }=
 }
>> +#
>> +##
>> +{ 'event': 'RTC_CHANGE',
>> +  'data': { 'offset': 'int' },
>> +  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) || defined(TARGET=
_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) || defined(TARGET_MI=
PS64) || defined(TARGET_MOXIE) || defined(TARGET_PPC) || defined(TARGET_PPC=
64) || defined(TARGET_S390X) || defined(TARGET_SH4) || defined(TARGET_SPARC=
)' }
>> +
>
> Now we have a massive list of TARGET if conditions. As a general
> principle if we can avoid long TARGET if-lists we should, because
> it is yet another thing that needs updating when a new target
> is added.

On the other hand, we really want to have the schema reflect
target-specifity, to make it visible in introspection, as the commit
message says.  However, ...

>           In this case any new architecture that can handle an
> ISA device would need to update this list. I pretty much guarantee
> nobody is going to remember to do that.
>
> It also doesn't actually usefully tell the thing on the other
> end whether it can expect to see RTC_CHANGE events, because
> whether it will actually get them depends not on the target
> architecture but on the specific combination of machine type
> and plugged-in devices. If there's a need for the other end of
> the QMP connection to tell in advance whether it's going to get
> RTC_CHANGE events then we should probably have an event or
> something for that, and make all rtc-change aware RTC devices
> cause QMP to send that event on startup (or otherwise register
> themselves as being present).
>
> It also means that now rtc devices that emit this event need to
> change in meson.build from softmmu_ss to specific_ss, because the
> qapi_event_send_rtc_change() prototype is in the generated
> qapi/qapi-events-misc-target.h header, and that header uses
> TARGET_* defines which are poisoned for softmmu compiles.
> So instead of being able to build the RTC device once for
> all targets, we need to build it over and over again for
> each target.

... this isn't really *target*-specific, it's *device*-specific: some
devices implement the event, some don't.

Ideally, we'd just fix that.

If we can't, we should document which devices don't implement it.  Since
users typically get these devices indirectly via machine type, we should
also document which machine types are affected.

We may need to make the "RTC_CHANGE not implemented" bit observable in
QMP somehow.  I'd ignore that until we have a use case.

> Could we reconsider this change? It seems to me to be adding
> complexity and build time and I don't really see the advantage
> that compensates for that.

No objection.  Marc-Andr=C3=A9?


