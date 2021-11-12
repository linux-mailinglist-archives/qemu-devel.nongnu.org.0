Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2810B44E5E1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 13:00:58 +0100 (CET)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlVEm-00058a-PS
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 07:00:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlVDn-0004RW-Lv
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:59:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlVDb-0004Nv-Ej
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636718382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orQ2KeswGubGNsAyOQY9peWNrf38LmBL/GCwH5WxRPU=;
 b=MtHwBMMmJ1UtfADs0ZCaFOsko1JRhjvX/qyyABoqTaxsy3ABnB8xmR7Gi1PfXG8mjHxnim
 qL7AvgrmWJt8WmPAyAqjPYrr18NBPKUKnvqo8LtfZCWDlepW0gttHRXT/4ZcsoQWMFFuq/
 IkdF9cUCkwsNPjiwc6+wkeLvXHUx2js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-DgM1TZlsOZaP6T2ptrTTjg-1; Fri, 12 Nov 2021 06:59:40 -0500
X-MC-Unique: DgM1TZlsOZaP6T2ptrTTjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16F5E6417A
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 11:59:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EBE419C59;
 Fri, 12 Nov 2021 11:59:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7CC8211380A7; Fri, 12 Nov 2021 12:59:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v5 4/6] migration: Add zerocopy parameter for QMP/HMP
 for Linux
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-5-leobras@redhat.com>
 <87pmr5vdmm.fsf@secure.mitica> <YY5LFM6dAF/+enCP@redhat.com>
Date: Fri, 12 Nov 2021 12:59:35 +0100
In-Reply-To: <YY5LFM6dAF/+enCP@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 12 Nov 2021 11:08:04 +0000")
Message-ID: <87a6i9h9eg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Nov 12, 2021 at 12:04:33PM +0100, Juan Quintela wrote:
>> Leonardo Bras <leobras@redhat.com> wrote:

[...]

>> > diff --git a/migration/migration.c b/migration/migration.c
>> > index abaf6f9e3d..add3dabc56 100644
>> > --- a/migration/migration.c
>> > +++ b/migration/migration.c
>> > @@ -886,6 +886,10 @@ MigrationParameters *qmp_query_migrate_parameters=
(Error **errp)
>> >      params->multifd_zlib_level =3D s->parameters.multifd_zlib_level;
>> >      params->has_multifd_zstd_level =3D true;
>> >      params->multifd_zstd_level =3D s->parameters.multifd_zstd_level;
>> > +#ifdef CONFIG_LINUX
>> > +    params->has_zerocopy =3D true;
>> > +    params->zerocopy =3D s->parameters.zerocopy;
>> > +#endif
>> >      params->has_xbzrle_cache_size =3D true;
>> >      params->xbzrle_cache_size =3D s->parameters.xbzrle_cache_size;
>> >      params->has_max_postcopy_bandwidth =3D true;
>> > @@ -1538,6 +1542,11 @@ static void migrate_params_test_apply(MigrateSe=
tParameters *params,
>> >      if (params->has_multifd_compression) {
>> >          dest->multifd_compression =3D params->multifd_compression;
>> >      }
>> > +#ifdef CONFIG_LINUX
>> > +    if (params->has_zerocopy) {
>> > +        dest->zerocopy =3D params->zerocopy;
>> > +    }
>> > +#endif
>> >      if (params->has_xbzrle_cache_size) {
>> >          dest->xbzrle_cache_size =3D params->xbzrle_cache_size;
>> >      }
>> > @@ -1650,6 +1659,11 @@ static void migrate_params_apply(MigrateSetPara=
meters *params, Error **errp)
>> >      if (params->has_multifd_compression) {
>> >          s->parameters.multifd_compression =3D params->multifd_compres=
sion;
>> >      }
>> > +#ifdef CONFIG_LINUX
>> > +    if (params->has_zerocopy) {
>> > +        s->parameters.zerocopy =3D params->zerocopy;
>> > +    }
>> > +#endif
>>=20
>> After seing all this CONFIG_LINUX mess, I am not sure that it is a good
>> idea to add the parameter only for LINUX.  It appears that it is better
>> to add it for all OS's and just not allow to set it to true there.
>>=20
>> But If QAPI/QOM people preffer that way, I am not going to get into the =
middle.
>
> I don't like all the conditionals either, but QAPI design wants the
> conditionals, as that allows mgmt apps to query whether the feature
> is supported in a build or not.

Specifically, the conditionals keep @zerocopy out of query-qmp-schema
(a.k.a. schema introspection) when it's not actually supported.

This lets management applications recognize zero-copy support.

Without conditionals, the only way to probe for it is trying to switch
it on.  This is inconvenient and error-prone.

Immature ideas to avoid conditionals:

1. Make *values* conditional, i.e. unconditional false, but true only if
CONFIG_LINUX.  The QAPI schema language lets you do this for
enumerations today, but not for bool.

2. A new kind of conditional that only applies to schema introspection,
so you can eat your introspection cake and keep the #ifdef-less code
cake (and the slight binary bloat that comes with it).


