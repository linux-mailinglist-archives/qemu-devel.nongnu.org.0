Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529AF2DBF12
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 11:57:46 +0100 (CET)
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUV7-0006E3-Ct
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 05:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpUTa-0005MY-MT
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:56:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpUTX-0008Ah-Uw
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608116166;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eL8tE3OizmbIEMHn7wwOh8FhApHSvC5agVQdKyNimyE=;
 b=S2vdZp1yAcqj1K4JTLj4t8lnoAAW2HuW/0A905uCI3SzgZnmzLzSAa3/V17wSxxj+Tavux
 ck6cMODXumu10bZkDttT+TtwBOmVKGwlVWVBJ3iZIiGLnSU9RTp3bg3SaRAfJWfyYUyqXu
 4Cd8bZK0wW3MtzTzlodgaOrWLKuhvMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-RqMkeyyqOM2uS0va0PZuyw-1; Wed, 16 Dec 2020 05:56:04 -0500
X-MC-Unique: RqMkeyyqOM2uS0va0PZuyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB93715720
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:56:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-177.ams2.redhat.com [10.36.115.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E78118035;
 Wed, 16 Dec 2020 10:56:02 +0000 (UTC)
Date: Wed, 16 Dec 2020 10:55:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/6] migration: Fix and clean up around @tls-authz
Message-ID: <20201216105559.GF189795@redhat.com>
References: <20201113065236.2644169-1-armbru@redhat.com>
 <20201113065236.2644169-2-armbru@redhat.com>
 <20201210181009.GA59494@redhat.com>
 <87sg88g0dx.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87sg88g0dx.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: quintela@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 11:14:34AM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Fri, Nov 13, 2020 at 07:52:31AM +0100, Markus Armbruster wrote:
> >> Commit d2f1d29b95 "migration: add support for a "tls-authz" migration
> >> parameter" added MigrationParameters member @tls-authz.  Whereas the
> >> other members aren't really optional (see commit 1bda8b3c695), this
> >> one is genuinely optional: migration_instance_init() leaves it absent,
> >> and migration_tls_channel_process_incoming() passes it to
> >> qcrypto_tls_session_new(), which checks for null.
> >> 
> >> Commit d2f1d29b95 has a number of issues, though:
> >> 
> >> * When qmp_query_migrate_parameters() copies migration parameters into
> >>   its reply, it ignores has_tls_authz, and assumes true instead.  When
> >>   it is false,
> >> 
> >>   - HMP info migrate_parameters prints the null pointer (crash bug on
> >>     some systems), and
> >> 
> >>   - QMP query-migrate-parameters replies "tls-authz": "" (because the
> >>     QObject output visitor silently maps null pointer to "", which it
> >>     really shouldn't).
> >> 
> >>   The HMP defect was noticed and fixed in commit 7cd75cbdb8
> >>   'migration: use "" instead of (null) for tls-authz'.  Unfortunately,
> >>   the fix papered over the real bug: it made
> >>   qmp_query_migrate_parameters() map null tls_authz to "".  It also
> >>   dropped the check for has_tls_authz from
> >>   hmp_info_migrate_parameters().
> >> 
> >>   Revert, and fix qmp_query_migrate_parameters() not to screw up
> >>   has_tls_authz.  No change to HMP.  QMP now has "tls-authz" in the
> >>   reply only when it's actually present in
> >>   migrate_get_current()->parameters.  If we prefer to remain
> >>   bug-compatible, we should make tls_authz non-optional there.
> >> 
> >> * migrate_params_test_apply() neglects to apply tls_authz.  Currently
> >>   harmless, because migrate_params_check() doesn't care.  Fix it
> >>   anyway.
> >> 
> >> * qmp_migrate_set_parameters() crashes:
> >> 
> >>     {"execute": "migrate-set-parameters", "arguments": {"tls-authz": null}}
> >> 
> >>   Add the necessary rewrite of null to "".  For background
> >>   information, see commit 01fa559826 "migration: Use JSON null instead
> >>   of "" to reset parameter to default".
> >> 
> >> Fixes: d2f1d29b95aa45d13262b39153ff501ed6b1ac95
> >> Cc: Daniel P. Berrangé <berrange@redhat.com>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  qapi/migration.json   |  2 +-
> >>  migration/migration.c | 17 ++++++++++++++---
> >>  monitor/hmp-cmds.c    |  2 +-
> >>  3 files changed, 16 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/qapi/migration.json b/qapi/migration.json
> >> index 3c75820527..688e8da749 100644
> >> --- a/qapi/migration.json
> >> +++ b/qapi/migration.json
> >> @@ -928,7 +928,7 @@
> >>  ##
> >>  # @MigrationParameters:
> >>  #
> >> -# The optional members aren't actually optional.
> >> +# The optional members aren't actually optional, except for @tls-authz.
> >
> > and tls-hostname and tls-creds.
> 
> Really?  See [*] below.
> 
> >>  #
> >>  # @announce-initial: Initial delay (in milliseconds) before sending the
> >>  #                    first announce (Since 4.0)
> >> diff --git a/migration/migration.c b/migration/migration.c
> >> index 3263aa55a9..cad56fbf8c 100644
> >> --- a/migration/migration.c
> >> +++ b/migration/migration.c
> >> @@ -855,9 +855,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>         params->has_tls_creds = true;
> >>      params->tls_creds = g_strdup(s->parameters.tls_creds);
> >>      params->has_tls_hostname = true;
> >>      params->tls_hostname = g_strdup(s->parameters.tls_hostname);
> 
> [*] Looks non-optional to me.

I guess it depends on what you mean by "optional" :-)

When I say they are all optional, I'm talking about from the POV
of the end users / mgmt who first configures a migration operation.

tls-creds only needs to be set if you want to enable TLS

tls-hostname only needs to be set if you need to override the
default hostname used for cert validation.

tls-authz only needs to be set if you want to enable access
control over migration clients.

IOW, all three are optional from the POV of configuring a
migration.

As with many things though, simple theory has turned into
messy reality, by virtue of this previous fixup:

  commit 4af245dc3e6e5c96405b3edb9d75657504256469
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Wed Mar 15 16:16:03 2017 +0000

    migration: use "" as the default for tls-creds/hostname
    
    The tls-creds parameter has a default value of NULL indicating
    that TLS should not be used. Setting it to non-NULL enables
    use of TLS. Once tls-creds are set to a non-NULL value via the
    monitor, it isn't possible to set them back to NULL again, due
    to current implementation limitations. The empty string is not
    a valid QObject identifier, so this switches to use "" as the
    default, indicating that TLS will not be used
    
    The tls-hostname parameter has a default value of NULL indicating
    the the hostname from the migrate connection URI should be used.
    Again, once tls-hostname is set non-NULL, to override the default
    hostname for x509 cert validation, it isn't possible to reset it
    back to NULL via the monitor. The empty string is not a valid
    hostname, so this switches to use "" as the default, indicating
    that the migrate URI hostname should be used.
    
    Using "" as the default for both, also means that the monitor
    commands "info migrate_parameters" / "query-migrate-parameters"
    will report existance of tls-creds/tls-parameters even when set
    to their default values.
    
    Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
    Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    
    Signed-off-by: Juan Quintela <quintela@redhat.com>


I have a nasty feeling that libvirt relies on that last paragraph
to determine whether TLS is supported in QEMU or not too :-( Ideally
we should be able to report their existance, but also report that
they are set to NULL. I guess that could be considered a regression
at this point though.

So anyway, this explains why we have the wierd behaviour where
querying parameters always reports them as being set.

> 
> >> -    params->has_tls_authz = true;
> >> -    params->tls_authz = g_strdup(s->parameters.tls_authz ?
> >> -                                 s->parameters.tls_authz : "");
> >> +    params->has_tls_authz = s->parameters.has_tls_authz;
> >
> > I'm kind of confused why has_tls_authz needs to be handled differently
> > from tls_hostname and tls_creds - both of these are optional to
> > the same extent that tls_authz is AFAIR.
> 
> I'm kind of confused about pretty much everything around here :)

So tls_authz was following the wierd precedent used by tls_hostname
and tls_creds in always reporting its own existance, as the empty
string.

> The patch hunk is part of the revert of flawed commit 7cd75cbdb8.  We
> need to revert both parts or none.
> 
> One difference between tls_authz and the others is in
> migration_instance_init(): it leaves params->tls_authz null, unlike
> ->tls_hostname and ->tls_creds.
> 
> Hmm, it sets ->has_ for none of them.  Wrong.  If we set ->FOO, we must
> also set ->has_FOO = true, and if we leave ->has_FOO false, we should
> leave ->FOO null.
> 
> Another difference is in migration_tls_channel_process_incoming():
> s->parameters.tls_creds must not be null (it's used unchecked in
> migration_tls_get_creds()), while s->parameters.tls_authz may be
> (qcrypto_tls_session_new() checks).
> 
> We need to make up our minds what is optional and what isn't.

So they are all optional in terms of what needs to be set.

They are all always reported when querying parameters.

The main difference seems to be that internally we use NULL
as a default for tls_authz, and convert NULL to "" when reporting,
while for tls_creds/tls_hostname we convert NULL to "" immediately
so we always have "" internally.

Should we instead set tls_authz to "" internally straight away
like we do for tls_creds/tls_hostname, and then make the code
turn "" back into NULL at time of use.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


