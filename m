Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F84038C2E1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 11:17:39 +0200 (CEST)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk1Hm-0003oM-47
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 05:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk1G2-00036b-36
 for qemu-devel@nongnu.org; Fri, 21 May 2021 05:15:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk1Fx-0000xW-GF
 for qemu-devel@nongnu.org; Fri, 21 May 2021 05:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621588544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1a/k/nmSqc4m1dDi+O755clasA2mtCQOonr+SZ3qPo=;
 b=V7F2R2sWnnWTDvBBV4XTYmAI17BCu8u/I56JaZE8M/VBR9/4KjD5EwUIxsBQyuaaIWYScI
 vFOqvxjl0nxnlgjcZ6h6wNYgLj47kBtLh24hFasy53ElDBpdKeTRFKghe5yrinVIKJzePY
 aNpsOJ0T9jEggFEkl5fwB31zXYAFQ3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-yPkVIJIJMDGecmd4TNzLGQ-1; Fri, 21 May 2021 05:15:40 -0400
X-MC-Unique: yPkVIJIJMDGecmd4TNzLGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06FCA8015F8;
 Fri, 21 May 2021 09:15:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 911945B687;
 Fri, 21 May 2021 09:15:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2DDC2113865F; Fri, 21 May 2021 11:15:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 02/12] accel: Introduce 'query-accels' QMP command
References: <20210505125806.1263441-1-philmd@redhat.com>
 <20210505125806.1263441-3-philmd@redhat.com>
Date: Fri, 21 May 2021 11:15:37 +0200
In-Reply-To: <20210505125806.1263441-3-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 5 May 2021 14:57:56
 +0200")
Message-ID: <875yzcjvly.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
>
> - Accelerator is a QAPI enum of all existing accelerators,
>
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
>
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>
> For example on a KVM-only build we get:
>
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "name": "qtest"
>             },
>             {
>                 "name": "kvm"
>             }
>         ]
>     }
>
> Note that we can't make the enum values or union branches conditional
> because of target-specific poisoning of accelerator definitions.

I second Eduardo's plea to explain this more clearly.  It's important,
because if a properly conditionalized enum is feasible, then query-accel
isn't needed.

> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qapi/machine.json | 47 +++++++++++++++++++++++++++++++++++++++++++++
>  accel/accel-qmp.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
>  accel/meson.build |  2 +-
>  3 files changed, 97 insertions(+), 1 deletion(-)
>  create mode 100644 accel/accel-qmp.c
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 6e90d463fc9..6dd3b765248 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1274,3 +1274,50 @@
>  ##
>  { 'event': 'MEM_UNPLUG_ERROR',
>    'data': { 'device': 'str', 'msg': 'str' } }
> +
> +##
> +# @Accelerator:
> +#
> +# An enumeration of accelerator names.
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'Accelerator',
> +  'data': [ 'hax', 'hvf', 'kvm', 'qtest', 'tcg', 'whpx', 'xen' ] }
> +
> +##
> +# @AcceleratorInfo:
> +#
> +# Accelerator information.
> +#
> +# @name: The accelerator name.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'AcceleratorInfo',
> +  'data': { 'name': 'Accelerator' } }
> +
> +##
> +# @query-accels:
> +#
> +# Get a list of AcceleratorInfo for all built-in accelerators.

"built-in" means compiled in.  See accel_builtin_list[] below.

> +#
> +# Returns: a list of @AcceleratorInfo describing each accelerator.
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "query-accels" }
> +# <- { "return": [
> +#        {
> +#            "name": "qtest"
> +#        },
> +#        {
> +#            "name": "kvm"
> +#        }
> +#    ] }
> +#
> +##
> +{ 'command': 'query-accels',
> +  'returns': ['AcceleratorInfo'] }
> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
> new file mode 100644
> index 00000000000..426737b3f9a
> --- /dev/null
> +++ b/accel/accel-qmp.c
> @@ -0,0 +1,49 @@
> +/*
> + * QEMU accelerators, QMP commands
> + *
> + * Copyright (c) 2021 Red Hat Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-commands-machine.h"
> +
> +static const bool accel_builtin_list[ACCELERATOR__MAX] =3D {
> +    [ACCELERATOR_QTEST] =3D true,
> +#ifdef CONFIG_TCG
> +    [ACCELERATOR_TCG] =3D true,
> +#endif
> +#ifdef CONFIG_KVM
> +    [ACCELERATOR_KVM] =3D true,
> +#endif
> +#ifdef CONFIG_HAX
> +    [ACCELERATOR_HAX] =3D true,
> +#endif
> +#ifdef CONFIG_HVF
> +    [ACCELERATOR_HVF] =3D true,
> +#endif
> +#ifdef CONFIG_WHPX
> +    [ACCELERATOR_WHPX] =3D true,
> +#endif
> +#ifdef CONFIG_XEN_BACKEND
> +    [ACCELERATOR_XEN] =3D true,
> +#endif
> +};
> +
> +AcceleratorInfoList *qmp_query_accels(Error **errp)
> +{
> +    AcceleratorInfoList *list =3D NULL, **tail =3D &list;
> +
> +    for (Accelerator accel =3D 0; accel < ACCELERATOR__MAX; accel++) {
> +        if (accel_builtin_list[accel]) {
> +            AcceleratorInfo *info =3D g_new0(AcceleratorInfo, 1);
> +
> +            info->name =3D accel;
> +
> +            QAPI_LIST_APPEND(tail, info);
> +        }
> +    }
> +
> +    return list;
> +}

CLI -accel help also lists the available accelerators, but finds them
differently.  Whereas query-accel relies on hard-coded
accel_builtin_list[], that one instead finds the concrete subtypes of
TYPE_ACCEL.

Any particular reason for the difference?

> diff --git a/accel/meson.build b/accel/meson.build
> index b44ba30c864..7a48f6d568d 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -1,4 +1,4 @@
> -specific_ss.add(files('accel-common.c'))
> +specific_ss.add(files('accel-common.c', 'accel-qmp.c'))
>  softmmu_ss.add(files('accel-softmmu.c'))
>  user_ss.add(files('accel-user.c'))


