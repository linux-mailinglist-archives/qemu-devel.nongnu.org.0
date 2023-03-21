Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E26C39B1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 20:01:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pehDo-0001qJ-4g; Tue, 21 Mar 2023 15:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pehDm-0001os-Ds
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 15:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pehDk-0002fM-JC
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 15:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679425230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSyIvqukSd6Kae/xrVp+ejiuL/qYCtQbflG0NksnfCY=;
 b=C3Z5cib2dPj0HV7wJEIQm8oOr8B/26Y3iY4gIcixU0QyKmOngTgDhHu33YbGAoqr//xMp6
 S6UvYKEsFY2oIs3fiImSpoNeB0pXPFJkLh9VFC+FH9cvN1nqA34jCngm/t+YXRY9IWj0C6
 I8eoEouWksTAnn27uYFib/833VZ1qL4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-DB1AlVcANA-dyAFek3T0Nw-1; Tue, 21 Mar 2023 15:00:27 -0400
X-MC-Unique: DB1AlVcANA-dyAFek3T0Nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CA2C185A78F;
 Tue, 21 Mar 2023 19:00:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A801121314;
 Tue, 21 Mar 2023 19:00:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1EBC321E6926; Tue, 21 Mar 2023 20:00:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,  Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Stefan
 Berger <stefanb@linux.vnet.ibm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Juan
 Quintela <quintela@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org>
 <87cz58ubcn.fsf@pond.sub.org> <ZBMfosr0JDyfjhqs@redhat.com>
 <873564spze.fsf@pond.sub.org>
 <d312145c-8af2-c8ca-ec45-4f6f060b3b07@linaro.org>
Date: Tue, 21 Mar 2023 20:00:25 +0100
In-Reply-To: <d312145c-8af2-c8ca-ec45-4f6f060b3b07@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 21 Mar 2023 15:48:12
 +0100")
Message-ID: <87sfdyaq0m.fsf@pond.sub.org>
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Can we meet half-way only generating the MAX definitions for
> unconditional enums, keeping the conditional ones as is?
>
> -- >8 --
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> @@ -88,16 +88,18 @@ def gen_enum(name: str,
>               members: List[QAPISchemaEnumMember],
>               prefix: Optional[str] =3D None) -> str:
>      assert members
> -    # append automatically generated _MAX value
> -    enum_members =3D members + [QAPISchemaEnumMember('_MAX', None)]
> -
>      ret =3D mcgen('''
>
>  typedef enum %(c_name)s {
>  ''',
>                  c_name=3Dc_name(name))
>
> -    for memb in enum_members:
> +    has_cond =3D any(memb.ifcond.is_present() for memb in members)
> +    if has_cond:
> +        # append automatically generated _MAX value
> +        members +=3D [QAPISchemaEnumMember('_MAX', None)]
> +
> +    for memb in members:
>          ret +=3D memb.ifcond.gen_if()
>          ret +=3D mcgen('''
>      %(c_enum)s,
> @@ -105,6 +107,13 @@ def gen_enum(name: str,
>                       c_enum=3Dc_enum_const(name, memb.name, prefix))
>          ret +=3D memb.ifcond.gen_endif()
>
> +    if not has_cond:
> +        ret +=3D mcgen('''
> +#define %(c_name)s %(c_length)s
> +''',
> +                     c_name=3Dc_enum_const(name, '_MAX', prefix),
> +                     c_length=3Dlen(members))
> +
>      ret +=3D mcgen('''
>  } %(c_name)s;
>  ''',
> ---

I doubt the benefit "we need a silly case FOO__MAX only sometimes" is
worth the special case.

We could generate something like

    #if [last_member's condition]
    #define FOO__MAX (FOO_last_member + 1)
    #elif [second_to_last_member's condition]
    #define FOO__MAX (FOO_second_to_last_member + 1)
    ...
    #else
    #define FOO__MAX (FOO_last_unconditional_member + 1)
    #endif

but whether that is worth the additional complexity seems doubtful, too.


