Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE204BF751
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 12:38:35 +0100 (CET)
Received: from localhost ([::1]:57446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMTV3-0006M9-Rm
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 06:38:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMTSY-0005Vh-Em
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:35:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMTSV-0001VT-SY
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645529755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DtdJSqwsmfurwPMOW90X72yycWnlwFSk6JnkKANxrJA=;
 b=ReKIbXJ5TTPPO4Z+Z4BsdzIHvi+L6hrCalSASeq9nENUqdT3QV5ka7B2HEyc9QSM/hEYEw
 HSHIS6Dd2AQA1lYlsdnrb8pYzYIyw6x/Cs6V6/AMZANhJRCRrX9vcSd0fa7h77JPZu0NBM
 ICzGjYeNbKcDQxvTFXN97U5CEqEkj+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-xjvet4IRM2uEXxUyeqO8Ag-1; Tue, 22 Feb 2022 06:35:52 -0500
X-MC-Unique: xjvet4IRM2uEXxUyeqO8Ag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD27B51D5;
 Tue, 22 Feb 2022 11:35:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 689BE1060071;
 Tue, 22 Feb 2022 11:35:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8C50B21A736E; Tue, 22 Feb 2022 12:35:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/2] qapi: Move RTC_CHANGE back out of target schema
References: <20210924140142.31398-1-peter.maydell@linaro.org>
 <87v92pksln.fsf@dusky.pond.sub.org>
 <CAFEAcA-zXMxzBeEPpKYNGy+SSMgkhbLC-aTuYgSXQn7D=WJa2A@mail.gmail.com>
Date: Tue, 22 Feb 2022 12:35:48 +0100
In-Reply-To: <CAFEAcA-zXMxzBeEPpKYNGy+SSMgkhbLC-aTuYgSXQn7D=WJa2A@mail.gmail.com>
 (Peter Maydell's message of "Mon, 21 Feb 2022 18:06:15 +0000")
Message-ID: <87mtijnnfv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Sat, 25 Sept 2021 at 08:44, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > This patchset moves RTC_CHANGE back to misc.json, effectively
>> > reverting commit 183e4281a30962, which moved the RTC_CHANGE event to
>> > the target schema.  That change was an attempt to make the event
>> > target-specific to improve introspection, but the event isn't really
>> > target-specific: it's machine or device specific.  Putting RTC_CHANGE
>> > in the target schema with an ifdef list reduces maintainability (by
>> > adding an if: list with a long list of targets that needs to be
>> > manually updated as architectures are added or removed or as new
>> > devices gain the RTC_CHANGE functionality) and increases compile time
>> > (by preventing RTC devices which emit the event from being "compile
>> > once" rather than "compile once per target", because
>> > qapi-events-misc-target.h uses TARGET_* ifdefs, which are poisoned in
>> > "compile once" files.)
>> >
>> > Patch 2 fixes a minor documentation issue that I noticed while
>> > I was doing this -- we didn't document that the units used in
>> > the RTC_CHANGE event are seconds.
>>
>> Series
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> I realized that this patchset never got applied -- I think I was
> expecting it to be picked up via a QAPI related tree, and then
> it was a bit close to a release to be put in, or something.
> Anyway, I'm going to resend it in a moment.

Want me to take care of merging v2?

>> An additional patch documenting that not all RTCs implement RTC_CHANGE
>> would be nice.  Listing them would be even nicer.
>
> I disagree that listing them would be nice -- the whole point of
> the series is to avoid having lists that get out of date when we
> add a new RTC implementation or fix the missing-feature in an
> existing one. I can add a sentence to the patch 2 docs change:
> "Note that it is not guaranteed that the RTC in a system implements
> this event, or even that the system has an RTC at all."

For a user, "you can rely on RTC_CHANGE with RTCs x, y, z provided by
machines a, b, c" is definitely nicer than "RTC_CHANGE may or may not
work, good luck", which is in turn nicer than nothing at all.

I think you're arguing for being as nice to users as we can without
having to pay for it in maintenance, which is fair.

>> An additional patch adding @qom-path event argument would be nice.
>
> I don't understand what this would involve, so I'll leave it to you
> if you want it.

Okay.


