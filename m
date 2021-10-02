Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7141FB1E
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 13:30:00 +0200 (CEST)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWdDL-0004w4-57
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 07:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWdB4-00034s-TP
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:27:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWdB1-0007rP-FG
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633174053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRTyvdXzfLsOCQr8WiThSiEElAO5Ylc5Qa3y0rFuJvk=;
 b=D/AuC/GUpt0fiQdRrapO/bqM+rrWzR/dgTlcWkGFhRm7/QZtHDqaU2wOWSTdVLQK4A3SkQ
 jv74TIapsrFJGUhwwI0xp3jWfrWSOMM4QRaQEGtwQ3yfClwbpM9/VmljrZtA7osc65Nr0n
 HeVA8jXcjuB4IN8uuZUnkDGK1A5/sdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-mw0Ax7uKNGeEBFXRj9cZEQ-1; Sat, 02 Oct 2021 07:27:32 -0400
X-MC-Unique: mw0Ax7uKNGeEBFXRj9cZEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45E70108088C;
 Sat,  2 Oct 2021 11:27:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D12C5F4E7;
 Sat,  2 Oct 2021 11:27:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D4B6E113865F; Sat,  2 Oct 2021 13:27:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
 <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
 <YVdCRYvRHIio6MZe@redhat.com>
 <afa63e10-2999-4073-e440-a5d87fd6da49@redhat.com>
Date: Sat, 02 Oct 2021 13:27:18 +0200
In-Reply-To: <afa63e10-2999-4073-e440-a5d87fd6da49@redhat.com> (Paolo
 Bonzini's message of "Sat, 2 Oct 2021 08:40:46 +0200")
Message-ID: <87bl47ll9l.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 01/10/21 19:15, Daniel P. Berrang=C3=A9 wrote:
>> On Fri, Oct 01, 2021 at 07:08:51PM +0200, Paolo Bonzini wrote:
>>> On 29/09/21 04:58, Yanan Wang wrote:
>>>> @@ -933,8 +935,7 @@ static void machine_set_smp(Object *obj, Visitor *=
v, const char *name,
>>>>            return;
>>>>        }
>>>> -    smp_parse(ms, config, errp);
>>>> -    if (*errp) {
>>>> +    if (!smp_parse(ms, config, errp)) {
>>>>            qapi_free_SMPConfiguration(config);
>>>>        }
>>>>    }
>>>>
>>>
>>> This is actually a leak, so I'm replacing this patch with
>>=20
>> This patch isn't adding a leak, as there's no change in
>> control flow / exit paths.  AFAICT, the leak was introduced
>> in patch 15 instead, so the code below shoudl be squashed
>> into that, and this patch left as-is.
>
> Yes, even better make it a separate patch and fix the conflict in patch
> 15.  But I'm still not sure of the wisdom of this patch.
>
> At this point smp_parse has exactly one caller and it doesn't care about
> the return value.  The "return a boolean" rule adds some complexity (and
> a possibility for things to be wrong/inconsistent) to the function for
> the benefit of the callers.

Yes, but returning something is only a minor burden.  It also makes
success vs. failure obvious at a glance.

I'm not worrying about inconsistency anymore.  In a way, void functions
are an exception.  Many non-void functions return a distinct error value
on failure, like NULL.  The only kind of inconsistency I can remember
seeing in these functions is forgetting to set an error.  Can be screwed
up in a void function just as easily.

>                              If there is only one caller, as is the case
> here or for virtual functions, the benefit can well be zero (this case)
> or negative (virtual functions).

Two small benefits here:

1. No need for ERRP_GUARD().

2. Conforms to the rules.  Rules are not laws, but let's stick to them
when it's as easy as it is here.

For what it's worth, GLib always advised users of GError to return a
value.  We chose to deviate for our Error, then spent nine years
learning how that leads to cumbersome code, leading us to:

commit e3fe3988d7851cac30abffae06d2f555ff7bee62
Author: Markus Armbruster <armbru@redhat.com>
Date:   Tue Jul 7 18:05:31 2020 +0200

    error: Document Error API usage rules
   =20
    This merely codifies existing practice, with one exception: the rule
    advising against returning void, where existing practice is mixed.
   =20
    When the Error API was created, we adopted the (unwritten) rule to
    return void when the function returns no useful value on success,
    unlike GError, which recommends to return true on success and false on
    error then.
   =20
    When a function returns a distinct error value, say false, a checked
    call that passes the error up looks like
   =20
        if (!frobnicate(..., errp)) {
            handle the error...
        }
   =20
    When it returns void, we need
   =20
        Error *err =3D NULL;
   =20
        frobnicate(..., &err);
        if (err) {
            handle the error...
            error_propagate(errp, err);
        }
   =20
    Not only is this more verbose, it also creates an Error object even
    when @errp is null, &error_abort or &error_fatal.
   =20
    People got tired of the additional boilerplate, and started to ignore
    the unwritten rule.  The result is confusion among developers about
    the preferred usage.
   =20
    Make the rule advising against returning void official by putting it
    in writing.  This will hopefully reduce confusion.
   =20
    Update the examples accordingly.
   =20
    The remainder of this series will update a substantial amount of code
    to honor the rule.
   =20
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
    Reviewed-by: Greg Kurz <groug@kaod.org>
    Message-Id: <20200707160613.848843-4-armbru@redhat.com>
    [Tweak prose as per advice from Eric]


