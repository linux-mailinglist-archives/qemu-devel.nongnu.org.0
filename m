Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6FF6BD28B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:40:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcom1-00081e-2g; Thu, 16 Mar 2023 10:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcoly-00081Q-CB
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcolw-00057p-TB
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678977603;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PuzKy3EfMHRUHAq/bG+Dhf9fE3WJ9sH8STtzSoHZ9ko=;
 b=gghNOZ0KxnnVPLeytwtex5W+CEdS//0j4BRgeFWtvU5rkyJ1mb08Aex39vebcQvXYOP6zG
 s32e1Q9ADNfxr05gHFqktUR/3EPe80vR9fMO9DqVOZfmb9jYmZHewilhK4/aNgu6FqMcpU
 VK2/vtSdOasHD4CQkTje6WbadSb89t4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-HIAwzUheOTGVjOINkcMTDQ-1; Thu, 16 Mar 2023 10:40:02 -0400
X-MC-Unique: HIAwzUheOTGVjOINkcMTDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v8-20020a05600c470800b003ed3b575374so844202wmo.7
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 07:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678977601;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PuzKy3EfMHRUHAq/bG+Dhf9fE3WJ9sH8STtzSoHZ9ko=;
 b=7d+TJmNmrgORWacmgFfH/SWbOplKsMEMNzz4jWKCmvCcOO0I7rx7yxm2961TdcfGaX
 1hAH6WKLp3nhfs9VAXk492fq8JUUWx0eEbcwEJTKHdAvKFgchvuIu/C5N0urP2yYC+UK
 Pgtyws71RGWfNcwDwqjoG+f0x9ljsEWMv/wz4d1EaXEvvIcDnFDY86CgJrP7s+hFZle/
 tp+K0lG1rhoaYxtTl4CWQKqQd/OQeEroGWY7XHgJagdlWTHZ3dGuOoRPXfy+cE+RZKlS
 Ks8YGrhNiGmL2Gkh0WnXY+82N88m/Njb5ygt1pTWmb7/vnc0Rm6BHzStB21WbOg8jcbn
 ODiw==
X-Gm-Message-State: AO0yUKXRKaE3o6DCexXay5fvhYTC5vvYfkA9Cq5q3rgBhbMGyBxDpI4K
 BeZH1qw8byS2aegzWuoH/Yeajx9MqdzUUL/5NH0R1GtXFJRGitd7aSJRS73CSYVel2L3X1RRGl4
 hTnqxt+mxcEEtYww=
X-Received: by 2002:adf:decb:0:b0:2ce:a096:3ff2 with SMTP id
 i11-20020adfdecb000000b002cea0963ff2mr4480387wrn.63.1678977601450; 
 Thu, 16 Mar 2023 07:40:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set9oxpRRlMLs7+d+l1yRjgJsST+VE8g3BhtNjUBKx6l8z61+TlOQ9C+OnA1F5MmrUs5ECKRMUQ==
X-Received: by 2002:adf:decb:0:b0:2ce:a096:3ff2 with SMTP id
 i11-20020adfdecb000000b002cea0963ff2mr4480377wrn.63.1678977601135; 
 Thu, 16 Mar 2023 07:40:01 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adfef4f000000b002c55ec7f661sm7582402wrp.5.2023.03.16.07.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:40:00 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Dau?=
 =?utf-8?Q?d=C3=A9?=
 <philmd@linaro.org>,  qemu-devel@nongnu.org,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Stefan
 Berger <stefanb@linux.vnet.ibm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
In-Reply-To: <ZBMfosr0JDyfjhqs@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 16 Mar 2023 13:54:42 +0000")
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org>
 <87cz58ubcn.fsf@pond.sub.org> <ZBMfosr0JDyfjhqs@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Mar 2023 15:39:59 +0100
Message-ID: <87lejwlpz4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Thu, Mar 16, 2023 at 01:31:04PM +0100, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>> > Per the C++ standard, empty enum are ill-formed. Do not generate
>> > them in order to avoid:
>> >
>> >   In file included from qga/qga-qapi-emit-events.c:14:
>> >   qga/qga-qapi-emit-events.h:20:1: error: empty enum is invalid
>> >      20 | } qga_QAPIEvent;
>> >         | ^
>> >
>> > Reported-by: Markus Armbruster <armbru@redhat.com>
>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>=20
>> Two failures in "make check-qapi-schema" (which is run by "make check"):
>>=20
>> 1. Positive test case qapi-schema-test
>>=20
>>     --- /work/armbru/qemu/bld-x86/../tests/qapi-schema/qapi-schema-test.=
out
>>     +++=20
>>     @@ -19,7 +19,6 @@
>>          member enum2: EnumOne optional=3DTrue
>>          member enum3: EnumOne optional=3DFalse
>>          member enum4: EnumOne optional=3DTrue
>>     -enum MyEnum
>>      object Empty1
>>      object Empty2
>>          base Empty1
>>=20
>>    You forgot to update expected test output.  No big deal.
>>=20
>> 2. Negative test case union-empty
>>=20
>>     --- /work/armbru/qemu/bld-x86/../tests/qapi-schema/union-empty.err
>>     +++=20
>>     @@ -1,2 +1,2 @@
>>     -union-empty.json: In union 'Union':
>>     -union-empty.json:4: union has no branches
>>     +union-empty.json: In struct 'Base':
>>     +union-empty.json:3: member 'type' uses unknown type 'Empty'
>>     stderr:
>>     qapi-schema-test FAIL
>>     union-empty FAIL
>>=20
>>    The error message regresses.
>>=20
>>    I can see two ways to fix this:
>>=20
>>    (A) You can't just drop empty enumeration types on the floor.  To not
>>        generate code for them, you need to skip them wherever we
>>        generate code for enumeration types.
>>=20
>>    (B) Outlaw empty enumeration types.
>>=20
>> I recommend to give (B) a try, it's likely simpler.
>
> Possible trap-door with (B), if we have any enums where *every*
> member is conditionalized on a CONFIG_XXX rule, there might be
> certain build scenarios where an enum suddenly becomes empty.

Do we have an example for this?
Because it looks really weird.  I would expect that the "container" unit
of that enumeration is #ifdef out of compilation somehow.

Later, Juan.


