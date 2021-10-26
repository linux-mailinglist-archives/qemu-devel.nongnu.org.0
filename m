Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C743B577
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:24:56 +0200 (CEST)
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOJr-0004Kq-A9
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfOB4-0008FB-6i
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfOB2-0006Dv-FG
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635261347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XClyofZcaxSOe54dXRPpMgyDh3OxSuvKq2e3pJ+w6oU=;
 b=Rn/FmhxW1GJRJaJgAI3COuUXqKpZpyljSUKwTf9dEC4LvY/evJ1Yx5PIughmDWuJjiJs87
 Z+BDJQcaYUo4rQICl4w7tRhq9hMu99Q1rT4zSzbe0zlkMBGqMWzzp5RN4UnwFViDYxb9cf
 O2nnNjNB178KNlBZSH5hItREKi03CGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-8YARrrL7N1CHohsJtzEnCA-1; Tue, 26 Oct 2021 11:15:46 -0400
X-MC-Unique: 8YARrrL7N1CHohsJtzEnCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02B6A100B3BA;
 Tue, 26 Oct 2021 15:15:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 568E9AFD81;
 Tue, 26 Oct 2021 15:15:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A042911380A7; Tue, 26 Oct 2021 17:15:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
 <YXewOaSDEXJDYV+1@redhat.com> <87r1c83z5c.fsf@dusky.pond.sub.org>
 <YXgXGocQsFu/Cnzr@redhat.com>
Date: Tue, 26 Oct 2021 17:15:10 +0200
In-Reply-To: <YXgXGocQsFu/Cnzr@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 26 Oct 2021 15:56:26 +0100")
Message-ID: <87a6ivg6m9.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, libvir-list@redhat.com,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Oct 26, 2021 at 11:37:19AM +0200, Markus Armbruster wrote:
>> Kevin Wolf <kwolf@redhat.com> writes:
>>=20
>> > Am 25.10.2021 um 07:25 hat Markus Armbruster geschrieben:
>> >> By convention, names starting with "x-" are experimental.  The parts
>> >> of external interfaces so named may be withdrawn or changed
>> >> incompatibly in future releases.
>> >>=20
>> >> Drawback: promoting something from experimental to stable involves a
>> >> name change.  Client code needs to be updated.
>> >>=20
>> >> Moreover, the convention is not universally observed:
>> >>=20
>> >> * QOM type "input-barrier" has properties "x-origin", "y-origin".
>> >>   Looks accidental, but it's ABI since 4.2.
>> >>=20
>> >> * QOM types "memory-backend-file", "memory-backend-memfd",
>> >>   "memory-backend-ram", and "memory-backend-epc" have a property
>> >>   "x-use-canonical-path-for-ramblock-id" that is documented to be
>> >>   stable despite its name.
>> >>=20
>> >> We could document these exceptions, but documentation helps only
>> >> humans.  We want to recognize "unstable" in code, like "deprecated".
>> >>=20
>> >> Replace the convention by a new special feature flag "unstable".  It
>> >> will be recognized by the QAPI generator, like the existing feature
>> >> flag "deprecated", and unlike regular feature flags.
>> >>=20
>> >> This commit updates documentation and prepares tests.  The next commi=
t
>> >> updates the QAPI schema.  The remaining patches update the QAPI
>> >> generator and wire up -compat policy checking.
>> >>=20
>> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> >
>> > Obviously, replacing the old convention gets rid of the old drawbacks,
>> > but adds a new one: While using x- makes it very obvious for a human
>> > user that this is an unstable feature, a feature flag in the schema wi=
ll
>> > almost certainly go unnoticed in manual use.
>>=20
>> I thought about this, but neglected to put it in writing.  My bad.
>>=20
>> Manual use of unstable interfaces is mostly fine.  Human users can adapt
>> to changing interfaces.  HMP works that way.
>>=20
>> Management applications are better off with a feature flag than with a
>> naming convention we sometimes ignore.
>
> We will sometimes ignore/forget the feature flag too though, so I'm
> not convinced there's much difference there.

-compat unstable-input=3Dreject,unstable-output=3Dhide should help you stay
on the straight & narrow :)

>> If we want to keep "unstable" obvious to the humans who write such
>> programs, we can continue to require "x-", in addition to the feature
>> flag.  We pay for it with renames, and the risk of forgetting to rename
>> in time (which is what got us the awkward stable
>> "x-use-canonical-path-for-ramblock-id").  Tradeoff.  I chose not to, but
>> if y'all think we should...
>
> IMHO the renames arguably make life easier for mgmt apps, as they
> only need to check for the name without the x- prefix, and they
> know they won't be accidentally using the fature from an older
> QEMU where it was unstable because the older QEMU had a different
> name they won't be checking for.
>
> We can just as easily forget to remove the "unstable" feature
> flag, as forget to rename.
>
> The plus point about the feature flag is that it is aligned with
> the "deprecated" feature flag, and potentially aligned with a
> future "insecure" feature flag.

Yup.


