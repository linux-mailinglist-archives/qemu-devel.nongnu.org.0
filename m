Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6D33CE1F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 07:52:37 +0100 (CET)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM3ZE-0006hH-Bo
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 02:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM3YC-00067w-JE
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 02:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lM3Y9-0007mX-N5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 02:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615877488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0KstcLZ8b+Vwye/WH21Tr7axtgIfcSX4dC1DtbDifc=;
 b=NQMmz8i8LbzgFlDgySiTTeieksXFtoYDX/GR5ubjY+ufSxCaZy/DY7lXZuV0xtEPkimvCP
 T7PIYWVJ8qidRxGsCbIOIGPQiD0/aEMuQkRCKJ9Y/TFW5UL2J8olR3FEqKZOSKPhiT3Cak
 01+q3xUcr/zHmkcPCWO0ju7z/AKOMMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-R7NRjLM5NuKHOC_2dHvUuA-1; Tue, 16 Mar 2021 02:51:24 -0400
X-MC-Unique: R7NRjLM5NuKHOC_2dHvUuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C77C319057A2;
 Tue, 16 Mar 2021 06:51:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1B310016DB;
 Tue, 16 Mar 2021 06:51:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 004FA1132C12; Tue, 16 Mar 2021 07:51:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
Date: Tue, 16 Mar 2021 07:51:18 +0100
In-Reply-To: <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com> (Eric Blake's
 message of "Mon, 15 Mar 2021 12:53:01 -0500")
Message-ID: <87ft0va8wp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/11/21 5:11 PM, Philippe Mathieu-Daud=C3=A9 wrote:
[...]
>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>> new file mode 100644
>> index 00000000000..f16e49b8956
>> --- /dev/null
>> +++ b/accel/accel-qmp.c
>> @@ -0,0 +1,47 @@
>> +/*
>> + * QEMU accelerators, QMP commands
>> + *
>> + * Copyright (c) 2021 Red Hat Inc.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/qapi-commands-machine.h"
>> +
>> +static const Accelerator accel_list[] =3D {
>> +    ACCELERATOR_QTEST,
>> +#ifdef CONFIG_TCG
>> +    ACCELERATOR_TCG,
>> +#endif
>> +#ifdef CONFIG_KVM
>> +    ACCELERATOR_KVM,
>> +#endif
>
> ...would it be worth compiling the enum to only list enum values that
> were actually compiled in?  That would change it to:
>
> { 'enum': 'Accelerator',
>   'data': [ 'qtest',
>             { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
> ...

Makes introspection more useful.  Management applications can get the
information the list of compiled-in accelerators from query-qmp-schema.
They don't have to be taught to use query-accels.

In fact, query-accels becomes useless except as a tool to force
visibility of Accelerator in query-qmp-schema.  We wouldn't have to
force if we had CLI introspection that shows the type of -accel's
parameter @accel.  Adding a query command is a common work-around for
our anemic CLI introspection capabilities.

The query command could be made more useful than introspection if it
reflected run time state, i.e. it showed an accelerator only when the
host system actually supports it.  Can't say how practical that would
be.

>>
>> +AcceleratorInfoList *qmp_query_accels(Error **errp)
>> +{
>> +    AcceleratorInfoList *list =3D NULL, **tail =3D &list;
>> +
>> +    for (unsigned i =3D 0; i < ARRAY_SIZE(accel_list); i++) {
>> +        AcceleratorInfo *info =3D g_new0(AcceleratorInfo, 1);
>> +
>> +        info->name =3D accel_list[i];
>> +
>> +        QAPI_LIST_APPEND(tail, info);
>> +    }
>> +
>> +    return list;
>> +}

You could then use something like

        for (accel =3D 0; accel < ACCELERATOR__MAX; accel++) {
            AcceleratorInfo *info =3D g_new0(AcceleratorInfo, 1);

            info->name =3D Accelerator_str(accel);

            QAPI_LIST_APPEND(tail, info);
        }


