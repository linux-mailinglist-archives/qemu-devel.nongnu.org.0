Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E023A3F84
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 11:52:33 +0200 (CEST)
Received: from localhost ([::1]:47796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrdq0-0004Ph-RI
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 05:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrdp9-0003ZE-Bg
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 05:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrdp5-0004CM-7l
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 05:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623405089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MX6wxNhU2clmHdHgg7BT+tcUUBQ5lPem1amsN8qVJCA=;
 b=DksbarhDxsmfMSdQJGCRlW9hEAAwJ2xUNY3qCWbK1hauBwOwNSux8GdqQuog6Y+0nqGCaa
 0tQjPo34WPWi3oFfOvinPgzL454mNen3ERGURHeZ3yDXOZ1O3CtsSValY0LWuB4b6WvEwR
 gIUDw84jpYHrggUNDw8cu7nTAHJ7tFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-BDQUA1E9OUq3Rl2-X6IPIQ-1; Fri, 11 Jun 2021 05:51:28 -0400
X-MC-Unique: BDQUA1E9OUq3Rl2-X6IPIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0016B801B14;
 Fri, 11 Jun 2021 09:51:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 864CD5C1CF;
 Fri, 11 Jun 2021 09:51:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 206E2113865F; Fri, 11 Jun 2021 11:51:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
Date: Fri, 11 Jun 2021 11:51:25 +0200
In-Reply-To: <20210526170432.343588-3-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 26 May 2021 19:04:22
 +0200")
Message-ID: <87czsssp9e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
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

This has become somewhat misleading, I'm afraid.  If memory serves,
earlier versions had union AcceleratorInfo with a common base struct.
This patch has just a struct, which we can grow into a union when we
actually have accelerator-specific information to report.  Perhaps

  - AcceleratorInfo provides information on a specific accelerator.  It
    contains just the accelerator name so far.

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
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v8:
> - Include code snippet from Markus adding to machine-target.json
>   to be able to use enum values or union branches conditional.
> - Use accel_find() on enum to be sure the accelerator is enabled
>   at runtime (chat with jsnow / eblake).
>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/machine-target.json | 54 ++++++++++++++++++++++++++++++++++++++++
>  accel/accel-qmp.c        | 32 ++++++++++++++++++++++++
>  accel/meson.build        |  2 +-
>  3 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 accel/accel-qmp.c
>
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b72..586a61b5d99 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -329,3 +329,57 @@
>  ##
>  { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
>    'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I3=
86) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +
> +##
> +# @Accelerator:
> +#
> +# An enumeration of accelerator names.
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'Accelerator',
> +  'data': [
> +      { 'name': 'hax', 'if': 'defined(CONFIG_HAX)' },
> +      { 'name': 'hvf', 'if': 'defined(CONFIG_HVF)' },
> +      { 'name': 'kvm', 'if': 'defined(CONFIG_KVM)' },
> +      { 'name': 'qtest' },
> +      { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
> +      { 'name': 'whpx', 'if': 'defined(CONFIG_WHPX)' },
> +      { 'name': 'xen', 'if': 'defined(CONFIG_XEN_BACKEND)' } ] }
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
> index 00000000000..0098297caa5
> --- /dev/null
> +++ b/accel/accel-qmp.c
> @@ -0,0 +1,32 @@
> +/*
> + * QEMU accelerators, QMP commands
> + *
> + * Copyright (c) 2021 Red Hat Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/accel.h"
> +#include "qapi/qapi-types-machine-target.h"
> +#include "qapi/qapi-commands-machine-target.h"
> +
> +AcceleratorInfoList *qmp_query_accels(Error **errp)
> +{
> +    AcceleratorInfoList *list =3D NULL, **tail =3D &list;
> +
> +    for (Accelerator accel =3D 0; accel < ACCELERATOR__MAX; accel++) {
> +        AcceleratorInfo *info;
> +
> +        if (!accel_find(Accelerator_str(accel))) {
> +            /* Accelerator available at build time but not at runtime. *=
/
> +            continue;
> +        }
> +
> +        info =3D g_new0(AcceleratorInfo, 1);
> +        info->name =3D accel;
> +        QAPI_LIST_APPEND(tail, info);
> +    }
> +
> +    return list;
> +}

If I read this correctly, there's a subtle difference between the
information returned by query-accels and the information you can get
from introspecting query-accels with query-qmp-schema: the latter gives
you the accelerators compiled into this build of QEMU, the former gives
you the ones that are actually available at run time.  Suggest to
mention that in the commit message.

> diff --git a/accel/meson.build b/accel/meson.build
> index b44ba30c864..7a48f6d568d 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -1,4 +1,4 @@
> -specific_ss.add(files('accel-common.c'))
> +specific_ss.add(files('accel-common.c', 'accel-qmp.c'))
>  softmmu_ss.add(files('accel-softmmu.c'))
>  user_ss.add(files('accel-user.c'))

Preferably with the commit message tweaked to address my remarks:
Acked-by: Markus Armbruster <armbru@redhat.com>


