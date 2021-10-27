Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA4243C276
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:58:14 +0200 (CEST)
Received: from localhost ([::1]:34638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfbwy-0007VI-I0
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbvc-0006i0-2z
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:56:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbva-0003KN-Kc
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635314205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KnZbcDD3cZa3aJ55iQ82RRyoPC57xaUnCH8DPM+foc=;
 b=D3pCdcA+Dfu/jnaSZRKuYx2NSh9CsTSvGghTtN52MQ3SccYrJhtv1XH5h63S0F+TD+f6GC
 7r4YJbwMtY7eB54F1LJBQEG4gsEu40Gw3UHkZrtpJKreKNHpYBVqBhp1a/LV5uCMexePHb
 hEpBcwiW/7scTYh4gAajkYGzJwtyx5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-H5_e8h_jN9-y12dKUfv2Lw-1; Wed, 27 Oct 2021 01:56:41 -0400
X-MC-Unique: H5_e8h_jN9-y12dKUfv2Lw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE97B10A8E01;
 Wed, 27 Oct 2021 05:56:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67A99ADD8;
 Wed, 27 Oct 2021 05:56:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F1CB411380A7; Wed, 27 Oct 2021 07:56:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/9] qapi: Generalize struct member policy checking
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-6-armbru@redhat.com>
 <d62aead1-4217-1091-4bd6-d81c0c217903@redhat.com>
Date: Wed, 27 Oct 2021 07:56:38 +0200
In-Reply-To: <d62aead1-4217-1091-4bd6-d81c0c217903@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 26 Oct 2021 17:43:02
 +0200")
Message-ID: <87cznrc8o9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com, libguestfs@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 10/25/21 07:25, Markus Armbruster wrote:
>> The generated visitor functions call visit_deprecated_accept() and
>> visit_deprecated() when visiting a struct member with special feature
>> flag 'deprecated'.  This makes the feature flag visible to the actual
>> visitors.  I want to make feature flag 'unstable' visible there as
>> well, so I can add policy for it.
>>=20
>> To let me make it visible, replace these functions by
>> visit_policy_reject() and visit_policy_skip(), which take the member's
>> special features as an argument.  Note that the new functions have the
>> opposite sense, i.e. the return value flips.
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/qapi/visitor-impl.h   |  6 ++++--
>>  include/qapi/visitor.h        | 17 +++++++++++++----
>>  qapi/qapi-forward-visitor.c   | 16 +++++++++-------
>>  qapi/qapi-visit-core.c        | 22 ++++++++++++----------
>>  qapi/qobject-input-visitor.c  | 15 ++++++++++-----
>>  qapi/qobject-output-visitor.c |  9 ++++++---
>>  qapi/trace-events             |  4 ++--
>>  scripts/qapi/visit.py         | 14 +++++++-------
>>  8 files changed, 63 insertions(+), 40 deletions(-)
>
>> diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
>> index 71b24a4429..fda485614b 100644
>> --- a/qapi/qobject-input-visitor.c
>> +++ b/qapi/qobject-input-visitor.c
>> @@ -662,16 +662,21 @@ static void qobject_input_optional(Visitor *v, con=
st char *name, bool *present)
>>      *present =3D true;
>>  }
>> =20
>> -static bool qobject_input_deprecated_accept(Visitor *v, const char *nam=
e,
>> -                                            Error **errp)
>> +static bool qobject_input_policy_reject(Visitor *v, const char *name,
>> +                                        unsigned special_features,
>> +                                        Error **errp)
>>  {
>> +    if (!(special_features && 1u << QAPI_DEPRECATED)) {
>
> Unreachable =3D) Proof than extract() is safer :P

Good eyes, thank you!

I actually like extract & desposit macros when the width is greater than
one.  Then, the longhand C code is illegible anyway, and having to
remember what the macros mean is no worse.

For width 1 it feels like a wash.  Universal use of the macros could
build familiarity and thus tip the balance.

I count more than a thousand instances of '& (1 <<'.

I wasn't even aware the macros existed in QEMU[*].

>
>> +        return false;
>> +    }


[*] I may well have seen them before, but my memory is limited and
lossy.


