Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC63691918
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 08:26:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQNm5-0001wp-Gu; Fri, 10 Feb 2023 02:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQNm0-0001uy-Am
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:24:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQNly-0000JA-GE
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676013881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6whEkzrFReVoJlyh4tl4IiTddZVPkuRyyNKyn2D7h0=;
 b=iGxeutG4WL6mjAHuL6EEUq7Cm/1xP74KkS0OfCIQJ/2bxWzrpFUensWQOrTFJZeKcj4dcS
 nEIyf3XToImaB3Jq+uJjwrkE5XOr1FGs0InNUEQlBhZuQ8V+Jl2s5iCxXPbwcqaVhOI07H
 OXBDA26N/dOjSWEchCFbR/qQYIVblrE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-QUQ98XlANTyGoWmLAceTVA-1; Fri, 10 Feb 2023 02:24:38 -0500
X-MC-Unique: QUQ98XlANTyGoWmLAceTVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 710AE18811F4;
 Fri, 10 Feb 2023 07:24:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C1FC1121315;
 Fri, 10 Feb 2023 07:24:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2FB9421E6A1F; Fri, 10 Feb 2023 08:24:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>,  qemu-devel@nongnu.org,
 prerna.saxena@nutanix.com,  quintela@redhat.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  armbru@redhat.com,  eblake@redhat.com,
 manish.mishra@nutanix.com,  aravind.retnakaran@nutanix.com
Subject: QAPI unions as branches / unifying struct and union types (was:
 [PATCH v2 2/6] migration: Updated QAPI format for 'migrate' qemu monitor
 command)
References: <20230208093600.242665-1-het.gala@nutanix.com>
 <20230208093600.242665-3-het.gala@nutanix.com>
 <Y+TLJ9Ui790bIR3b@redhat.com>
Date: Fri, 10 Feb 2023 08:24:36 +0100
In-Reply-To: <Y+TLJ9Ui790bIR3b@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 9 Feb 2023 10:29:59 +0000")
Message-ID: <87o7q2vv7v.fsf_-_@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

[...]

>> +##
>> +# @MigrateAddress:
>> +#
>> +# The options available for communication transport mechanisms for migr=
ation
>> +#
>> +# Since 8.0
>> +##
>> +{ 'union' : 'MigrateAddress',
>> +  'base' : { 'transport' : 'MigrateTransport'},
>> +  'discriminator' : 'transport',
>> +  'data' : {
>> +    'socket' : 'MigrateSocketAddr',
>> +    'exec' : 'MigrateExecAddr',
>> +    'rdma': 'MigrateRdmaAddr' } }
>
> Ideally this would be
>
>    'data' : {
>      'socket' : 'SocketAddress',
>      'exec' : 'MigrateCommand',
>      'rdma': 'InetSocketAddress' } }
>
> though the first SocketAddress isn't possible unless it is easy to
> lift the QAPI limitation.

Context: SocketAddress is a QAPI union, and "the QAPI limitation" is

    scripts/qapi-gen.py: In file included from ../qapi/qapi-schema.json:79:
    ../qapi/migration.json: In union 'MigrateAddress':
    ../qapi/migration.json:1505: branch 'socket' cannot use union type 'Soc=
ketAddress'

Emitted by schema.py like this:

                if (not isinstance(v.type, QAPISchemaObjectType)
                        or v.type.variants):
                    raise QAPISemError(
                        self.info,
                        "%s cannot use %s"
                        % (v.describe(self.info), v.type.describe()))

This enforces docs/devel/qapi-code-gen.rst's clause

    The BRANCH's value defines the branch's properties, in particular its
    type.  The type must a struct type.  [...]

Next paragraph:

    In the Client JSON Protocol, a union is represented by an object with
    the common members (from the base type) and the selected branch's
    members.  The two sets of member names must be disjoint.

So, we're splicing in the members of the branch's JSON object.  For that
to even make sense, the branch type needs to map to a JSON object.  This
is fundamental.  It's the first part of the condition in the code
snippet above.

We have two kinds of QAPI types that map to a JSON object: struct and
union.  The second part of the condition restricts to struct.  Unless
I'm missing something (imperfect memory...), this is *not* fundamental,
just a matter of implementing it.  But I'd have to try to be sure.


Instead of simply allowing unions in addition to structs here, I'd like
to go one step further, and fuse the two into "objects".  Let me
explain.

If we abstract from syntax, structs have become almost a special kind of
union.  Unions have a set of common members and sets of variant members,
and a special common member (the tag) selects the set of variant
members.  Structs are unions with zero variants and no tag.

The generator code actually represents both structs and unions as a
common QAPISchemaObjectType already.  QAPI/QMP introspection does the
same: it uses a single meta type 'object' for both.


There is another spot where only structs are allowed: a struct or
union's base type.  That restriction will be awkward to lift, as I made
the mistake of baking the assumption "object type has at most one tag
member" into QAPI/QMP introspection .

[...]


