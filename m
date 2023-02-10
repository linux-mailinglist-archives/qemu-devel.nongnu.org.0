Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D1691CBF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 11:32:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQQhW-0005B3-Et; Fri, 10 Feb 2023 05:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQQhK-00053Z-N7
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQQhH-0005fO-CV
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676025116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSoofUudxRnHwnjAHDzGVqIksTz/IKrbIdtYwP6PY8s=;
 b=crEKT/ItC5ASnVcFpjwqMSi2beDUU6hMOH8QqNTf2d/B4y/OBK9DQ7mypQChrsVgRSLDmO
 rqdpm0TurOovsQXTlrTe2gYRwJTcb+IjAwgr9nQVX2WoVHmsZwDe6OpPcdzwG+mI91HyCS
 a6aYYIOQTxynEnKfrAHTMFXYaQsFk5s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-SxJ49xmmPpW4BXCdRvxXmA-1; Fri, 10 Feb 2023 05:31:53 -0500
X-MC-Unique: SxJ49xmmPpW4BXCdRvxXmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E48E1875041;
 Fri, 10 Feb 2023 10:31:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2C48C16022;
 Fri, 10 Feb 2023 10:31:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B244021E6A1F; Fri, 10 Feb 2023 11:31:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Eric Blake <eblake@redhat.com>,  Het Gala <het.gala@nutanix.com>,
 qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  quintela@redhat.com,
 dgilbert@redhat.com,  pbonzini@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v2 2/6] migration: Updated QAPI format for 'migrate'
 qemu monitor command
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
 <20230208201712.b3a5xtufscrvncqt@redhat.com>
 <Y+TJr7An261VcVJ/@redhat.com> <Y+T3apJYMdQ3nxu2@redhat.com>
Date: Fri, 10 Feb 2023 11:31:51 +0100
In-Reply-To: <Y+T3apJYMdQ3nxu2@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 9 Feb 2023 13:38:50 +0000")
Message-ID: <875yc9u7zc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Feb 09, 2023 at 10:23:43AM +0000, Daniel P. Berrang=C3=A9 wrote:

[...]

>> I don't know the backstory on this limitation. Is it something that
>> is very difficult to resolve ? I think it is highly desirable to have
>> 'socket': 'SocketAddress' here. It would be a shame to introduce this
>> better migration API design and then have it complicated by a possibly
>> short term limitation of QAPI.
>
> So to understand this better I did this change on top of Het's
> patch:
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 79acfcfe4e..bbc3e66ad6 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1467,18 +1467,6 @@
>  { 'enum': 'MigrateTransport',
>    'data': ['socket', 'exec', 'rdma'] }
>=20=20
> -##
> -# @MigrateSocketAddr:
> -#
> -# To support different type of socket.
> -#
> -# @socket-type: Different type of socket connections.
> -#
> -# Since 8.0
> -##
> -{ 'struct': 'MigrateSocketAddr',
> -  'data': {'socket-type': 'SocketAddress' } }
> -
>  ##
>  # @MigrateExecAddr:
>   #
> @@ -1487,14 +1475,6 @@
>  { 'struct': 'MigrateExecAddr',
>     'data' : {'data': ['str'] } }
>=20=20
> -##
> -# @MigrateRdmaAddr:
> -#
> -# Since 8.0
> -##
> -{ 'struct': 'MigrateRdmaAddr',
> -   'data' : {'data': 'InetSocketAddress' } }
> -
>  ##
>  # @MigrateAddress:
>  #
> @@ -1506,9 +1486,9 @@
>    'base' : { 'transport' : 'MigrateTransport'},
>    'discriminator' : 'transport',
>    'data' : {
> -    'socket' : 'MigrateSocketAddr',
> +    'socket' : 'SocketAddress',
>      'exec' : 'MigrateExecAddr',
> -    'rdma': 'MigrateRdmaAddr' } }
> +    'rdma': 'InetSocketAddress' } }
>=20=20
>  ##
>  # @MigrateChannelType:
>
>
> That results in a build error
>
>   /home/berrange/src/virt/qemu/scripts/qapi-gen.py: In file included from=
 ../qapi/qapi-schema.json:79:
>   ../qapi/migration.json: In union 'MigrateAddress':
>   ../qapi/migration.json:1505: branch 'socket' cannot use union type 'Soc=
ketAddress'
>
> To understand what the limitation of QAPI generation is, I blindly
> disabled this check
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index cd8661125c..cb5c0385bd 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -653,7 +653,7 @@ def check(self, schema, seen):
>                          "branch '%s' is not a value of %s"
>                          % (v.name, self.tag_member.type.describe()))
>                  if (not isinstance(v.type, QAPISchemaObjectType)
> -                        or v.type.variants):
> +                        or v.type.variants) and False:
>                      raise QAPISemError(
>                          self.info,
>                          "%s cannot use %s"
> @@ -664,7 +664,8 @@ def check_clash(self, info, seen):
>          for v in self.variants:
>              # Reset seen map for each variant, since qapi names from one
>              # branch do not affect another branch
> -            v.type.check_clash(info, dict(seen))
> +            #v.type.check_clash(info, dict(seen))
> +            pass
>=20=20
>=20=20
>  class QAPISchemaMember:
>
>
> After doing that, the QAPI code generated handled the union-inside-union
> case without any problems that I can see. The generated code looks sane
> and it compiles correctly.

As you discovered, the code was designed to treat structs and unions the
same.  But there are holes.

> So is this actually just a case of overly strict input validation  in
> the QAPI schema parser ?  If so, what's the correct way to adapt the
> checks to permit this usage.

The check you disabled guards holes.  There's at least this one in
QAPISchemaObjectType.check_clash():

    # Check that the members of this type do not cause duplicate JSON membe=
rs,
    # and update seen to track the members seen so far. Report any errors
    # on behalf of info, which is not necessarily self.info
    def check_clash(self, info, seen):
        assert self._checked
        assert not self.variants       # not implemented
        for m in self.members:
            m.check_clash(info, seen)


