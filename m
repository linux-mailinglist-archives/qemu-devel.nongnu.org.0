Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345552D9631
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:17:20 +0100 (CET)
Received: from localhost ([::1]:59362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kokus-0002Cv-Lg
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1koksO-0001c9-OX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:14:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1koksL-0008Oz-Uw
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607940879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZmDxmIBFMfQs0aiT4teR8KxbFf0WaZjeef4aTFzBoQ=;
 b=SlrM3OIZx8epk1JsEMcDaV7Zi4Mn21eDVjK42pgjKsLgrXh8bEnVDScuAfj8ZGu50R6vNU
 P4hofXHDKq2jV3NTROqwHSgGWyS3tdmg0JqfMQix1X3lcTQM8PzqfAufmNCY5i/jJ4y1oL
 on02SHrUKmjvNS3UMCfJJpOi7/37IZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-r3gKOlCYNSywcvxuY4qvlQ-1; Mon, 14 Dec 2020 05:14:37 -0500
X-MC-Unique: r3gKOlCYNSywcvxuY4qvlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE1691005504
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:14:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 599107092B;
 Mon, 14 Dec 2020 10:14:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C566E11329A5; Mon, 14 Dec 2020 11:14:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/6] migration: Fix and clean up around @tls-authz
References: <20201113065236.2644169-1-armbru@redhat.com>
 <20201113065236.2644169-2-armbru@redhat.com>
 <20201210181009.GA59494@redhat.com>
Date: Mon, 14 Dec 2020 11:14:34 +0100
In-Reply-To: <20201210181009.GA59494@redhat.com> ("Daniel P. =?utf-8?Q?Ber?=
 =?utf-8?Q?rang=C3=A9=22's?=
 message of "Thu, 10 Dec 2020 18:10:09 +0000")
Message-ID: <87sg88g0dx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Nov 13, 2020 at 07:52:31AM +0100, Markus Armbruster wrote:
>> Commit d2f1d29b95 "migration: add support for a "tls-authz" migration
>> parameter" added MigrationParameters member @tls-authz.  Whereas the
>> other members aren't really optional (see commit 1bda8b3c695), this
>> one is genuinely optional: migration_instance_init() leaves it absent,
>> and migration_tls_channel_process_incoming() passes it to
>> qcrypto_tls_session_new(), which checks for null.
>>=20
>> Commit d2f1d29b95 has a number of issues, though:
>>=20
>> * When qmp_query_migrate_parameters() copies migration parameters into
>>   its reply, it ignores has_tls_authz, and assumes true instead.  When
>>   it is false,
>>=20
>>   - HMP info migrate_parameters prints the null pointer (crash bug on
>>     some systems), and
>>=20
>>   - QMP query-migrate-parameters replies "tls-authz": "" (because the
>>     QObject output visitor silently maps null pointer to "", which it
>>     really shouldn't).
>>=20
>>   The HMP defect was noticed and fixed in commit 7cd75cbdb8
>>   'migration: use "" instead of (null) for tls-authz'.  Unfortunately,
>>   the fix papered over the real bug: it made
>>   qmp_query_migrate_parameters() map null tls_authz to "".  It also
>>   dropped the check for has_tls_authz from
>>   hmp_info_migrate_parameters().
>>=20
>>   Revert, and fix qmp_query_migrate_parameters() not to screw up
>>   has_tls_authz.  No change to HMP.  QMP now has "tls-authz" in the
>>   reply only when it's actually present in
>>   migrate_get_current()->parameters.  If we prefer to remain
>>   bug-compatible, we should make tls_authz non-optional there.
>>=20
>> * migrate_params_test_apply() neglects to apply tls_authz.  Currently
>>   harmless, because migrate_params_check() doesn't care.  Fix it
>>   anyway.
>>=20
>> * qmp_migrate_set_parameters() crashes:
>>=20
>>     {"execute": "migrate-set-parameters", "arguments": {"tls-authz": nul=
l}}
>>=20
>>   Add the necessary rewrite of null to "".  For background
>>   information, see commit 01fa559826 "migration: Use JSON null instead
>>   of "" to reset parameter to default".
>>=20
>> Fixes: d2f1d29b95aa45d13262b39153ff501ed6b1ac95
>> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qapi/migration.json   |  2 +-
>>  migration/migration.c | 17 ++++++++++++++---
>>  monitor/hmp-cmds.c    |  2 +-
>>  3 files changed, 16 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 3c75820527..688e8da749 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -928,7 +928,7 @@
>>  ##
>>  # @MigrationParameters:
>>  #
>> -# The optional members aren't actually optional.
>> +# The optional members aren't actually optional, except for @tls-authz.
>
> and tls-hostname and tls-creds.

Really?  See [*] below.

>>  #
>>  # @announce-initial: Initial delay (in milliseconds) before sending the
>>  #                    first announce (Since 4.0)
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 3263aa55a9..cad56fbf8c 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -855,9 +855,8 @@ MigrationParameters *qmp_query_migrate_parameters(Er=
ror **errp)
        params->has_tls_creds =3D true;
>>      params->tls_creds =3D g_strdup(s->parameters.tls_creds);
>>      params->has_tls_hostname =3D true;
>>      params->tls_hostname =3D g_strdup(s->parameters.tls_hostname);

[*] Looks non-optional to me.

>> -    params->has_tls_authz =3D true;
>> -    params->tls_authz =3D g_strdup(s->parameters.tls_authz ?
>> -                                 s->parameters.tls_authz : "");
>> +    params->has_tls_authz =3D s->parameters.has_tls_authz;
>
> I'm kind of confused why has_tls_authz needs to be handled differently
> from tls_hostname and tls_creds - both of these are optional to
> the same extent that tls_authz is AFAIR.

I'm kind of confused about pretty much everything around here :)

The patch hunk is part of the revert of flawed commit 7cd75cbdb8.  We
need to revert both parts or none.

One difference between tls_authz and the others is in
migration_instance_init(): it leaves params->tls_authz null, unlike
->tls_hostname and ->tls_creds.

Hmm, it sets ->has_ for none of them.  Wrong.  If we set ->FOO, we must
also set ->has_FOO =3D true, and if we leave ->has_FOO false, we should
leave ->FOO null.

Another difference is in migration_tls_channel_process_incoming():
s->parameters.tls_creds must not be null (it's used unchecked in
migration_tls_get_creds()), while s->parameters.tls_authz may be
(qcrypto_tls_session_new() checks).

We need to make up our minds what is optional and what isn't.

>> +    params->tls_authz =3D g_strdup(s->parameters.tls_authz);
>
> This makes it match what is done for tls_hostname/creds though
> which makes sense.
>
>>      params->has_max_bandwidth =3D true;
>>      params->max_bandwidth =3D s->parameters.max_bandwidth;
>>      params->has_downtime_limit =3D true;
>> @@ -1433,6 +1432,11 @@ static void migrate_params_test_apply(MigrateSetP=
arameters *params,
>>          dest->tls_hostname =3D params->tls_hostname->u.s;
>>      }
>> =20
>> +    if (params->has_tls_authz) {
>> +        assert(params->tls_authz->type =3D=3D QTYPE_QSTRING);
>> +        dest->tls_authz =3D params->tls_authz->u.s;
>> +    }
>> +
>
> Makes sense, as it was missed previously

Second item in the commit message's list.

>>      if (params->has_max_bandwidth) {
>>          dest->max_bandwidth =3D params->max_bandwidth;
>>      }
>> @@ -1622,6 +1626,13 @@ void qmp_migrate_set_parameters(MigrateSetParamet=
ers *params, Error **errp)
>>          params->tls_hostname->type =3D QTYPE_QSTRING;
>>          params->tls_hostname->u.s =3D strdup("");
>>      }
>> +    /* TODO Rewrite "" to null instead */
>> +    if (params->has_tls_authz
>> +        && params->tls_authz->type =3D=3D QTYPE_QNULL) {
>> +        qobject_unref(params->tls_authz->u.n);
>> +        params->tls_authz->type =3D QTYPE_QSTRING;
>> +        params->tls_authz->u.s =3D strdup("");
>> +    }
>
> Makes sense, as it matches what was done for tls_creds/tls_hostname

Third item.

>> =20
>>      migrate_params_test_apply(params, &tmp);
>> =20
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index a6a6684df1..492789248f 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -476,7 +476,7 @@ void hmp_info_migrate_parameters(Monitor *mon, const=
 QDict *qdict)
>>              params->max_postcopy_bandwidth);
>>          monitor_printf(mon, "%s: '%s'\n",
>>              MigrationParameter_str(MIGRATION_PARAMETER_TLS_AUTHZ),
>> -            params->tls_authz);
>> +            params->has_tls_authz ? params->tls_authz : "");
>
> Again, I'm confused why it needs to be handled differently from
> tls_creds / tls_hostname, which are also optional. It feels like
> either we need to change all three, or none of them.

This is the other part of the revert of flawed commit 7cd75cbdb8.  We
need to revert both parts or none.


