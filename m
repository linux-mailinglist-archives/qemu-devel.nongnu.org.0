Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5D743AF6D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 11:48:01 +0200 (CEST)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJ3p-0003sq-1f
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 05:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfJ2f-000321-W7
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:46:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfJ2e-0007Qy-GY
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635241607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQpzg0KFVORSQKK6mVXyA4mfr8d3v7dmtjZJeDLtydE=;
 b=arkabS1/d2DwKzK3vj7K9Ic4xGpwMbAictL9TJ4LECs+U51OFnqHeR/wZ7220Q//hGYp4S
 MKtE/IvpvNo2/l1UNUlV8ftcmgntu7RBMbCOoT6CDidYdkToG6w7WqSSuOIVJ9fnVtZO0V
 KLGKDtmU7m5YMS0Ql3+dgXZpsr1kwKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-meoq4VdGNbaHdQPwa0h4qA-1; Tue, 26 Oct 2021 05:46:44 -0400
X-MC-Unique: meoq4VdGNbaHdQPwa0h4qA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E96810A8E07;
 Tue, 26 Oct 2021 09:46:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20EDE17CE1;
 Tue, 26 Oct 2021 09:46:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C3A3911380A7; Tue, 26 Oct 2021 11:46:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 8/9] qapi: Factor out compat_policy_input_ok()
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-9-armbru@redhat.com>
 <308cdd2b-fb99-74ed-8a93-52897d21d25e@redhat.com>
Date: Tue, 26 Oct 2021 11:46:07 +0200
In-Reply-To: <308cdd2b-fb99-74ed-8a93-52897d21d25e@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 25 Oct 2021 14:13:10
 +0200")
Message-ID: <87czns3yqo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
>> The code to check policy for handling deprecated input is triplicated.
>> Factor it out into compat_policy_input_ok() before I mess with it in
>> the next commit.
>>=20
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  include/qapi/compat-policy.h |  7 +++++
>>  qapi/qapi-visit-core.c       | 18 +++++--------
>>  qapi/qmp-dispatch.c          | 51 +++++++++++++++++++++++++++---------
>>  qapi/qobject-input-visitor.c | 19 +++-----------
>>  4 files changed, 55 insertions(+), 40 deletions(-)
>
>> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
>> index 8cca18c891..e29ade134c 100644
>> --- a/qapi/qmp-dispatch.c
>> +++ b/qapi/qmp-dispatch.c
>> @@ -28,6 +28,40 @@
>> =20
>>  CompatPolicy compat_policy;
>> =20
>> +static bool compat_policy_input_ok1(const char *adjective,
>> +                                    CompatPolicyInput policy,
>> +                                    ErrorClass error_class,
>> +                                    const char *kind, const char *name,
>> +                                    Error **errp)
>> +{
>> +    switch (policy) {
>> +    case COMPAT_POLICY_INPUT_ACCEPT:
>> +        return true;
>> +    case COMPAT_POLICY_INPUT_REJECT:
>> +        error_set(errp, error_class, "%s %s %s disabled by policy",
>> +                  adjective, kind, name);
>> +        return false;
>> +    case COMPAT_POLICY_INPUT_CRASH:
>> +    default:
>> +        abort();
>
> g_assert_not_reached() provides a nicer user experience.

I find it hard to care for making the experience of a crash that should
never ever happen nicer :)

>> +    }
>> +}
>> +
>> +bool compat_policy_input_ok(unsigned special_features,
>> +                            const CompatPolicy *policy,
>> +                            ErrorClass error_class,
>> +                            const char *kind, const char *name,
>> +                            Error **errp)
>> +{
>> +    if ((special_features & 1u << QAPI_DEPRECATED)
>
> Matter of taste, I find code using extract() easier to review:
>
>   extract64(special_features, QAPI_DEPRECATED, 1)

I agree for width > 1.

>> +        && !compat_policy_input_ok1("Deprecated",
>> +                                    policy->deprecated_input,
>> +                                    error_class, kind, name, errp)) {
>> +        return false;
>> +    }
>> +    return true;
>> +}
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!


