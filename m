Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6041730607C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:04:47 +0100 (CET)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4nJF-0006nP-U7
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4nGm-0006GT-7l
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:02:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l4nGd-0003zw-55
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611763322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hB+kZ2b4gNISpAZAKBrL6flOOkD0jrj+hrLup0xP5no=;
 b=C/YFErRNOKJujQSUGfcVJM0u95Ahp1ShQ3B4b1+nqZh2mg44zkOevOy5oOnsGhrsRdxTks
 NZ4fje5SQf/uzP1R5BSlbPbGHjQP2HpMM571aYUrsiicZgnsHr1L4IFff+tzCJ+cfEGxf/
 DWmrzrK7/VxKTc/T+W9ZH8+gvgXpcvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-PKT0NzTHNKumHWvQxhvDlw-1; Wed, 27 Jan 2021 11:02:00 -0500
X-MC-Unique: PKT0NzTHNKumHWvQxhvDlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BF96190A7A9
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 16:01:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1CCC197F9;
 Wed, 27 Jan 2021 16:01:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 58685113865F; Wed, 27 Jan 2021 17:01:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/6] migration: Fix and clean up around @tls-authz
References: <20201113065236.2644169-1-armbru@redhat.com>
 <20201113065236.2644169-2-armbru@redhat.com>
 <20201210181009.GA59494@redhat.com>
 <87sg88g0dx.fsf@dusky.pond.sub.org>
 <20201216105559.GF189795@redhat.com>
 <87v9d0int6.fsf@dusky.pond.sub.org>
 <20201217140428.GG247354@redhat.com>
Date: Wed, 27 Jan 2021 17:01:57 +0100
In-Reply-To: <20201217140428.GG247354@redhat.com> ("Daniel P. =?utf-8?Q?Be?=
 =?utf-8?Q?rrang=C3=A9=22's?=
 message of "Thu, 17 Dec 2020 14:04:28 +0000")
Message-ID: <87wnvymkqy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Dec 17, 2020 at 02:07:01PM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Mon, Dec 14, 2020 at 11:14:34AM +0100, Markus Armbruster wrote:
>> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >>=20
>> >> > On Fri, Nov 13, 2020 at 07:52:31AM +0100, Markus Armbruster wrote:
>> >> >> Commit d2f1d29b95 "migration: add support for a "tls-authz" migrat=
ion
>> >> >> parameter" added MigrationParameters member @tls-authz.  Whereas t=
he
>> >> >> other members aren't really optional (see commit 1bda8b3c695), thi=
s
>> >> >> one is genuinely optional: migration_instance_init() leaves it abs=
ent,
>> >> >> and migration_tls_channel_process_incoming() passes it to
>> >> >> qcrypto_tls_session_new(), which checks for null.
>> >> >>=20
>> >> >> Commit d2f1d29b95 has a number of issues, though:
>> >> >>=20
>> >> >> * When qmp_query_migrate_parameters() copies migration parameters =
into
>> >> >>   its reply, it ignores has_tls_authz, and assumes true instead.  =
When
>> >> >>   it is false,
>> >> >>=20
>> >> >>   - HMP info migrate_parameters prints the null pointer (crash bug=
 on
>> >> >>     some systems), and
>> >> >>=20
>> >> >>   - QMP query-migrate-parameters replies "tls-authz": "" (because =
the
>> >> >>     QObject output visitor silently maps null pointer to "", which=
 it
>> >> >>     really shouldn't).
>> >> >>=20
>> >> >>   The HMP defect was noticed and fixed in commit 7cd75cbdb8
>> >> >>   'migration: use "" instead of (null) for tls-authz'.  Unfortunat=
ely,
>> >> >>   the fix papered over the real bug: it made
>> >> >>   qmp_query_migrate_parameters() map null tls_authz to "".  It als=
o
>> >> >>   dropped the check for has_tls_authz from
>> >> >>   hmp_info_migrate_parameters().
>> >> >>=20
>> >> >>   Revert, and fix qmp_query_migrate_parameters() not to screw up
>> >> >>   has_tls_authz.  No change to HMP.  QMP now has "tls-authz" in th=
e
>> >> >>   reply only when it's actually present in
>> >> >>   migrate_get_current()->parameters.  If we prefer to remain
>> >> >>   bug-compatible, we should make tls_authz non-optional there.
>> >> >>=20
>> >> >> * migrate_params_test_apply() neglects to apply tls_authz.  Curren=
tly
>> >> >>   harmless, because migrate_params_check() doesn't care.  Fix it
>> >> >>   anyway.
>> >> >>=20
>> >> >> * qmp_migrate_set_parameters() crashes:
>> >> >>=20
>> >> >>     {"execute": "migrate-set-parameters", "arguments": {"tls-authz=
": null}}
>> >> >>=20
>> >> >>   Add the necessary rewrite of null to "".  For background
>> >> >>   information, see commit 01fa559826 "migration: Use JSON null ins=
tead
>> >> >>   of "" to reset parameter to default".
>> >> >>=20
>> >> >> Fixes: d2f1d29b95aa45d13262b39153ff501ed6b1ac95
>> >> >> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> >> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> >> >> ---
>> >> >>  qapi/migration.json   |  2 +-
>> >> >>  migration/migration.c | 17 ++++++++++++++---
>> >> >>  monitor/hmp-cmds.c    |  2 +-
>> >> >>  3 files changed, 16 insertions(+), 5 deletions(-)
>> >> >>=20
>> >> >> diff --git a/qapi/migration.json b/qapi/migration.json
>> >> >> index 3c75820527..688e8da749 100644
>> >> >> --- a/qapi/migration.json
>> >> >> +++ b/qapi/migration.json
>> >> >> @@ -928,7 +928,7 @@
>> >> >>  ##
>> >> >>  # @MigrationParameters:
>> >> >>  #
>> >> >> -# The optional members aren't actually optional.
>> >> >> +# The optional members aren't actually optional, except for @tls-=
authz.
>> >> >
>> >> > and tls-hostname and tls-creds.
>> >>=20
>> >> Really?  See [*] below.
>> >>=20
>> >> >>  #
>> >> >>  # @announce-initial: Initial delay (in milliseconds) before sendi=
ng the
>> >> >>  #                    first announce (Since 4.0)
>> >> >> diff --git a/migration/migration.c b/migration/migration.c
>> >> >> index 3263aa55a9..cad56fbf8c 100644
>> >> >> --- a/migration/migration.c
>> >> >> +++ b/migration/migration.c
>> >> >> @@ -855,9 +855,8 @@ MigrationParameters *qmp_query_migrate_paramet=
ers(Error **errp)
>> >>         params->has_tls_creds =3D true;
>> >> >>      params->tls_creds =3D g_strdup(s->parameters.tls_creds);
>> >> >>      params->has_tls_hostname =3D true;
>> >> >>      params->tls_hostname =3D g_strdup(s->parameters.tls_hostname)=
;
>> >>=20
>> >> [*] Looks non-optional to me.
>> >
>> > I guess it depends on what you mean by "optional" :-)
>>=20
>> I meant "non-optional in the value of query-migrate-parameters".  The
>> comment were debating applies to that value, and nothing else.
>>=20
>> > When I say they are all optional, I'm talking about from the POV
>> > of the end users / mgmt who first configures a migration operation.
>> >
>> > tls-creds only needs to be set if you want to enable TLS
>> >
>> > tls-hostname only needs to be set if you need to override the
>> > default hostname used for cert validation.
>> >
>> > tls-authz only needs to be set if you want to enable access
>> > control over migration clients.
>> >
>> > IOW, all three are optional from the POV of configuring a
>> > migration.
>>=20
>> Understood.
>>=20
>> > As with many things though, simple theory has turned into
>> > messy reality, by virtue of this previous fixup:
>> >
>> >   commit 4af245dc3e6e5c96405b3edb9d75657504256469
>> >   Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> >   Date:   Wed Mar 15 16:16:03 2017 +0000
>> >
>> >     migration: use "" as the default for tls-creds/hostname
>> >    =20
>> >     The tls-creds parameter has a default value of NULL indicating
>> >     that TLS should not be used. Setting it to non-NULL enables
>> >     use of TLS. Once tls-creds are set to a non-NULL value via the
>> >     monitor, it isn't possible to set them back to NULL again, due
>> >     to current implementation limitations. The empty string is not
>> >     a valid QObject identifier, so this switches to use "" as the
>> >     default, indicating that TLS will not be used
>> >    =20
>> >     The tls-hostname parameter has a default value of NULL indicating
>> >     the the hostname from the migrate connection URI should be used.
>> >     Again, once tls-hostname is set non-NULL, to override the default
>> >     hostname for x509 cert validation, it isn't possible to reset it
>> >     back to NULL via the monitor. The empty string is not a valid
>> >     hostname, so this switches to use "" as the default, indicating
>> >     that the migrate URI hostname should be used.
>> >    =20
>> >     Using "" as the default for both, also means that the monitor
>> >     commands "info migrate_parameters" / "query-migrate-parameters"
>> >     will report existance of tls-creds/tls-parameters even when set
>> >     to their default values.
>> >    =20
>> >     Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
>> >     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> >     Reviewed-by: Eric Blake <eblake@redhat.com>
>> >    =20
>> >     Signed-off-by: Juan Quintela <quintela@redhat.com>
>> >
>> >
>> > I have a nasty feeling that libvirt relies on that last paragraph
>> > to determine whether TLS is supported in QEMU or not too :-( Ideally
>> > we should be able to report their existance, but also report that
>> > they are set to NULL. I guess that could be considered a regression
>> > at this point though.
>> >
>> > So anyway, this explains why we have the wierd behaviour where
>> > querying parameters always reports them as being set.
>>=20
>> Yes.
>>=20
>> What do you want me to change in my patch?
>>=20
>> >> >> -    params->has_tls_authz =3D true;
>> >> >> -    params->tls_authz =3D g_strdup(s->parameters.tls_authz ?
>> >> >> -                                 s->parameters.tls_authz : "");
>> >> >> +    params->has_tls_authz =3D s->parameters.has_tls_authz;
>> >> >
>> >> > I'm kind of confused why has_tls_authz needs to be handled differen=
tly
>> >> > from tls_hostname and tls_creds - both of these are optional to
>> >> > the same extent that tls_authz is AFAIR.
>> >>=20
>> >> I'm kind of confused about pretty much everything around here :)
>> >
>> > So tls_authz was following the wierd precedent used by tls_hostname
>> > and tls_creds in always reporting its own existance, as the empty
>> > string.
>> >
>> >> The patch hunk is part of the revert of flawed commit 7cd75cbdb8.  We
>> >> need to revert both parts or none.
>> >>=20
>> >> One difference between tls_authz and the others is in
>> >> migration_instance_init(): it leaves params->tls_authz null, unlike
>> >> ->tls_hostname and ->tls_creds.
>> >>=20
>> >> Hmm, it sets ->has_ for none of them.  Wrong.  If we set ->FOO, we mu=
st
>> >> also set ->has_FOO =3D true, and if we leave ->has_FOO false, we shou=
ld
>> >> leave ->FOO null.
>> >>=20
>> >> Another difference is in migration_tls_channel_process_incoming():
>> >> s->parameters.tls_creds must not be null (it's used unchecked in
>> >> migration_tls_get_creds()), while s->parameters.tls_authz may be
>> >> (qcrypto_tls_session_new() checks).
>> >>=20
>> >> We need to make up our minds what is optional and what isn't.
>> >
>> > So they are all optional in terms of what needs to be set.
>> >
>> > They are all always reported when querying parameters.
>> >
>> > The main difference seems to be that internally we use NULL
>> > as a default for tls_authz, and convert NULL to "" when reporting,
>> > while for tls_creds/tls_hostname we convert NULL to "" immediately
>> > so we always have "" internally.
>> >
>> > Should we instead set tls_authz to "" internally straight away
>> > like we do for tls_creds/tls_hostname, and then make the code
>> > turn "" back into NULL at time of use.
>>=20
>> I don't know!  I'm merely trying to fix a crash bug I ran into :)
>
> Ok, if you don't mind which approach, then I'd vote for making
> migration_instance_init() set  tls_authz to "", in common with
> tls_hostname/tls_creds.
>
> Then in migration_tls_channel_process_incoming we can turn the
> "" back into NULL.
>
> That way we'll have consistently used "" internally for all the
> TLS related parameters.

I suffered mental garbage collection during the Christmas break, and can
no longer make heads or tails out of all this.

I might have to drop the series on the floor :(


