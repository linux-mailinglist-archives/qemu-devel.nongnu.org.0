Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509FA43FE0D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 16:10:58 +0200 (CEST)
Received: from localhost ([::1]:55552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgSar-00032m-QX
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 10:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgSZL-0002G7-EN
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:09:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mgSZH-00067q-Eo
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635516553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zytPB636mGbAtKtmnL2Knm8zrF4/JdIpj33EPsn0mWk=;
 b=G9FGmVtEXm/N9iNW/nNriuLxWxCJ8Zs/6khyYllf0AtE0PlGoBKfHe0ATknI5m/CmfFOUT
 0+lvwFMUnV4hE2EZqdmmuraB8LfllvejQlRUk3HEwlKYg92PVIFmFimpFz/sUbIQ7jTTFy
 SY8pNxLndcx2Dxbk18DT8/V9iD+mgtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-_awAhHcePNqKdyZUt89xVQ-1; Fri, 29 Oct 2021 10:09:09 -0400
X-MC-Unique: _awAhHcePNqKdyZUt89xVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03C7D1006AA7;
 Fri, 29 Oct 2021 14:09:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 841CF60854;
 Fri, 29 Oct 2021 14:08:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1905711380A7; Fri, 29 Oct 2021 16:08:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 8/9] qapi: Factor out compat_policy_input_ok()
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-9-armbru@redhat.com>
 <308cdd2b-fb99-74ed-8a93-52897d21d25e@redhat.com>
 <87czns3yqo.fsf@dusky.pond.sub.org>
 <fe045a5c-94ab-97f2-eeb2-3e624b1bd400@redhat.com>
Date: Fri, 29 Oct 2021 16:08:11 +0200
In-Reply-To: <fe045a5c-94ab-97f2-eeb2-3e624b1bd400@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 26 Oct 2021 12:39:23
 +0200")
Message-ID: <87ee83exf8.fsf@dusky.pond.sub.org>
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com, libguestfs@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 10/26/21 11:46, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> On 10/25/21 07:25, Markus Armbruster wrote:
>>>> The code to check policy for handling deprecated input is triplicated.
>>>> Factor it out into compat_policy_input_ok() before I mess with it in
>>>> the next commit.
>>>>
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>> ---
>>>>  include/qapi/compat-policy.h |  7 +++++
>>>>  qapi/qapi-visit-core.c       | 18 +++++--------
>>>>  qapi/qmp-dispatch.c          | 51 +++++++++++++++++++++++++++--------=
-
>>>>  qapi/qobject-input-visitor.c | 19 +++-----------
>>>>  4 files changed, 55 insertions(+), 40 deletions(-)
>>>
>>>> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
>>>> index 8cca18c891..e29ade134c 100644
>>>> --- a/qapi/qmp-dispatch.c
>>>> +++ b/qapi/qmp-dispatch.c
>>>> @@ -28,6 +28,40 @@
>>>> =20
>>>>  CompatPolicy compat_policy;
>>>> =20
>>>> +static bool compat_policy_input_ok1(const char *adjective,
>>>> +                                    CompatPolicyInput policy,
>>>> +                                    ErrorClass error_class,
>>>> +                                    const char *kind, const char *nam=
e,
>>>> +                                    Error **errp)
>>>> +{
>>>> +    switch (policy) {
>>>> +    case COMPAT_POLICY_INPUT_ACCEPT:
>>>> +        return true;
>>>> +    case COMPAT_POLICY_INPUT_REJECT:
>>>> +        error_set(errp, error_class, "%s %s %s disabled by policy",
>>>> +                  adjective, kind, name);
>>>> +        return false;
>>>> +    case COMPAT_POLICY_INPUT_CRASH:
>>>> +    default:
>>>> +        abort();
>>>
>>> g_assert_not_reached() provides a nicer user experience.
>>=20
>> I find it hard to care for making the experience of a crash that should
>> never ever happen nicer :)
>
> Well COMPAT_POLICY_INPUT_CRASH can happen... What about:

Point.

>    case COMPAT_POLICY_INPUT_CRASH:
>        error_printf("%s %s %s disabled by policy",
>                     adjective, kind, name);
>        abort();
>    default:
>        g_assert_not_reached();

Separate patch.  I'd prefer to delay it a bit, to avoid rocking the boat
so close to the soft freeze.


