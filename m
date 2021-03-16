Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE233D41E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:43:11 +0100 (CET)
Received: from localhost ([::1]:55188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM92U-0008WA-IO
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM918-0007Nh-6Y
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM916-0007h0-1p
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615898503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdIBiSSk1ITCKFMZX0sTLsqG8NotVayE5GqnG32SN/I=;
 b=fRmmWMlO0glD22Pj1QpN/kXWytKMRyy32gg3IPIp6yQLXqtat6xu7AFbM1sP1yZXI3mL0g
 iDFKBMk9NSid3Vqnqed3++70JzM/rROBqyRbxuodCiZfzoXunDD80kV+9CyVpNkobo6Fza
 mBMVUIPdUNM2GKwvSZZgQprFtchfud0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-jvPLb0UkN9WQrEiwTcNy1w-1; Tue, 16 Mar 2021 08:41:41 -0400
X-MC-Unique: jvPLb0UkN9WQrEiwTcNy1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB2C91934100;
 Tue, 16 Mar 2021 12:41:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D4EF5D74F;
 Tue, 16 Mar 2021 12:41:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E06481132C12; Tue, 16 Mar 2021 13:41:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
 <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
 <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
 <74d442cd-5e39-f9a4-6ca5-e2656280aa73@redhat.com>
Date: Tue, 16 Mar 2021 13:41:34 +0100
In-Reply-To: <74d442cd-5e39-f9a4-6ca5-e2656280aa73@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 16 Mar 2021 11:55:45
 +0100")
Message-ID: <875z1rl18h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 3/16/21 11:26 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 3/16/21 10:02 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 3/16/21 7:51 AM, Markus Armbruster wrote:
>>>> Eric Blake <eblake@redhat.com> writes:
>>>>
>>>>> On 3/11/21 5:11 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> [...]
>>>>>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>>>>>> new file mode 100644
>>>>>> index 00000000000..f16e49b8956
>>>>>> --- /dev/null
>>>>>> +++ b/accel/accel-qmp.c
>>>>>> @@ -0,0 +1,47 @@
>>>>>> +/*
>>>>>> + * QEMU accelerators, QMP commands
>>>>>> + *
>>>>>> + * Copyright (c) 2021 Red Hat Inc.
>>>>>> + *
>>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>>> + */
>>>>>> +
>>>>>> +#include "qemu/osdep.h"
>>>>>> +#include "qapi/qapi-commands-machine.h"
>>>>>> +
>>>>>> +static const Accelerator accel_list[] =3D {
>>>>>> +    ACCELERATOR_QTEST,
>>>>>> +#ifdef CONFIG_TCG
>>>>>> +    ACCELERATOR_TCG,
>>>>>> +#endif
>>>>>> +#ifdef CONFIG_KVM
>>>>>> +    ACCELERATOR_KVM,
>>>>>> +#endif
>>>>>
>>>>> ...would it be worth compiling the enum to only list enum values that
>>>>> were actually compiled in?  That would change it to:
>>>>>
>>>>> { 'enum': 'Accelerator',
>>>>>   'data': [ 'qtest',
>>>>>             { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>>>>> ...
>>>
>>> These accelerator definitions are supposed to be poisoned in generic
>>> code... But I like the simplicity of your suggestion, so I'll give it
>>> a try and see what happens with removing the poisoned definitions.
>>=20
>> This is actually quite interesting :) Accelerator definitions are
>> declared in config-target.h, but acceleration is host specific...
>
> Thomas, I guess I hit Claudio's reported bug again...
>
> 1/ generic libqemuutil.a is built without any CONFIG_accel definition.
>
> So this qapi-generated enum ... :
>
> typedef enum Accelerator {
>     ACCELERATOR_QTEST,
> #if defined(CONFIG_TCG)
>     ACCELERATOR_TCG,
> #endif /* defined(CONFIG_TCG) */
> #if defined(CONFIG_KVM)
>     ACCELERATOR_KVM,
> #endif /* defined(CONFIG_KVM) */
> #if defined(CONFIG_HAX)
>     ACCELERATOR_HAX,
> #endif /* defined(CONFIG_HAX) */
> #if defined(CONFIG_HVF)
>     ACCELERATOR_HVF,
> #endif /* defined(CONFIG_HVF) */
> #if defined(CONFIG_WHPX)
>     ACCELERATOR_WHPX,
> #endif /* defined(CONFIG_WHPX) */
> #if defined(CONFIG_XEN_BACKEND)
>     ACCELERATOR_XEN,
> #endif /* defined(CONFIG_XEN_BACKEND) */
>     ACCELERATOR__MAX,
> } Accelerator;
>
> ... is expanded to:
>
> typedef enum Accelerator {
>     ACCELERATOR_QTEST,
>     ACCELERATOR__MAX,
> } Accelerator;

CONFIG_KVM, CONFIG_TCG, ...  are defined in ${target}-config-target.h,
and may only be used in target-specific code.

If the enum ends up in libqemuutil.a, there are uses outside
target-specific code.

exec/poison.h lacks CONFIG_KVM, CONFIG_TCG, ...  Should they be added?

[...]


