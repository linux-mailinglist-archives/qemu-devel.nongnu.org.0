Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2555B3A7987
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:53:19 +0200 (CEST)
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt4ow-0004cA-5D
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lt4n1-0002wj-Gz
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:51:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lt4my-0005N2-NL
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623747074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRO2opk2+Vk/udPQ2WyTHi5eYR4nXTRhUJkDj3S4Zg8=;
 b=GPptvyvJ7LTL8EKheJ6i5+vLAapLIXbYh6rSfKlyoDJzfWWRKcpexJN+7KGMMSBuit8vR9
 JbROwvq9ctykEam2F9qSE6EHBpiXWE0wgf7w+kvE4NY0XAMoaweS9oGJYLvCHilxjq3q+f
 MJvzHCjm9UBVcZZvabqvWKvzr4SpKts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-EoMAHBf1N8mN8DRhyZ35uQ-1; Tue, 15 Jun 2021 04:51:13 -0400
X-MC-Unique: EoMAHBf1N8mN8DRhyZ35uQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59D3B800D55;
 Tue, 15 Jun 2021 08:51:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4084A60877;
 Tue, 15 Jun 2021 08:51:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C9CB9113865F; Tue, 15 Jun 2021 10:51:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 5/5] tpm: Return QMP error when TPM is disabled in build
References: <20210614200940.2056770-1-philmd@redhat.com>
 <20210614200940.2056770-6-philmd@redhat.com>
Date: Tue, 15 Jun 2021 10:51:02 +0200
In-Reply-To: <20210614200940.2056770-6-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 14 Jun 2021 22:09:40
 +0200")
Message-ID: <87tulzse89.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 =?utf-8?Q?Mar?= =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> When the management layer queries a binary built using --disable-tpm
> for TPM devices, it gets confused by getting empty responses:
>
>   { "execute": "query-tpm" }
>   {
>       "return": [
>       ]
>   }
>   { "execute": "query-tpm-types" }
>   {
>       "return": [
>       ]
>   }
>   { "execute": "query-tpm-models" }
>   {
>       "return": [
>       ]
>   }
>
> To make it clearer by returning an error:
> - Make the TPM QAPI schema conditional

All of tpm.json is now 'if': 'defined(CONFIG_TPM)'.  Good.

> - Adapt the HMP command
> - Remove stubs which became unnecessary
>
> The management layer now gets a 'CommandNotFound' error:
>
>   { "execute": "query-tpm" }
>   {
>       "error": {
>           "class": "CommandNotFound",
>           "desc": "The command query-tpm has not been found"
>       }
>   }
>
> Suggested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  qapi/tpm.json      | 28 +++++++++++++++++++---------
>  monitor/hmp-cmds.c |  4 ++++
>  stubs/tpm.c        | 25 -------------------------
>  stubs/meson.build  |  1 -
>  4 files changed, 23 insertions(+), 35 deletions(-)
>  delete mode 100644 stubs/tpm.c
>
> diff --git a/qapi/tpm.json b/qapi/tpm.json
> index 6a10c9ed8d2..75590979fde 100644
> --- a/qapi/tpm.json
> +++ b/qapi/tpm.json
> @@ -17,7 +17,9 @@
>  #
>  # Since: 1.5
>  ##
> -{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ] }
> +{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ],
> +  'if': 'defined(CONFIG_TPM)' }
> +
>  ##
>  # @query-tpm-models:
>  #
> @@ -33,7 +35,8 @@
>  # <- { "return": [ "tpm-tis", "tpm-crb", "tpm-spapr" ] }
>  #
>  ##
> -{ 'command': 'query-tpm-models', 'returns': ['TpmModel'] }
> +{ 'command': 'query-tpm-models', 'returns': ['TpmModel'],
> +  'if': 'defined(CONFIG_TPM)' }
> =20
>  ##
>  # @TpmType:
> @@ -46,7 +49,8 @@
>  #
>  # Since: 1.5
>  ##
> -{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ] }
> +{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ],
> +  'if': 'defined(CONFIG_TPM)' }
> =20
>  ##
>  # @query-tpm-types:
> @@ -63,7 +67,8 @@
>  # <- { "return": [ "passthrough", "emulator" ] }
>  #
>  ##
> -{ 'command': 'query-tpm-types', 'returns': ['TpmType'] }
> +{ 'command': 'query-tpm-types', 'returns': ['TpmType'],
> +  'if': 'defined(CONFIG_TPM)' }
> =20
>  ##
>  # @TPMPassthroughOptions:
> @@ -79,7 +84,8 @@
>  ##
>  { 'struct': 'TPMPassthroughOptions',
>    'data': { '*path': 'str',
> -            '*cancel-path': 'str' } }
> +            '*cancel-path': 'str' },
> +  'if': 'defined(CONFIG_TPM)' }
> =20
>  ##
>  # @TPMEmulatorOptions:
> @@ -90,7 +96,8 @@
>  #
>  # Since: 2.11
>  ##
> -{ 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' } }
> +{ 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
> +  'if': 'defined(CONFIG_TPM)' }
> =20
>  ##
>  # @TpmTypeOptions:
> @@ -104,7 +111,8 @@
>  ##
>  { 'union': 'TpmTypeOptions',
>     'data': { 'passthrough' : 'TPMPassthroughOptions',
> -             'emulator': 'TPMEmulatorOptions' } }
> +             'emulator': 'TPMEmulatorOptions' },
> +  'if': 'defined(CONFIG_TPM)' }
> =20
>  ##
>  # @TPMInfo:
> @@ -122,7 +130,8 @@
>  { 'struct': 'TPMInfo',
>    'data': {'id': 'str',
>             'model': 'TpmModel',
> -           'options': 'TpmTypeOptions' } }
> +           'options': 'TpmTypeOptions' },
> +  'if': 'defined(CONFIG_TPM)' }
> =20
>  ##
>  # @query-tpm:
> @@ -152,4 +161,5 @@
>  #    }
>  #
>  ##
> -{ 'command': 'query-tpm', 'returns': ['TPMInfo'] }
> +{ 'command': 'query-tpm', 'returns': ['TPMInfo'],
> +  'if': 'defined(CONFIG_TPM)' }
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index d10ee141109..f6cadede40f 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -901,6 +901,9 @@ void hmp_info_pci(Monitor *mon, const QDict *qdict)
> =20
>  void hmp_info_tpm(Monitor *mon, const QDict *qdict)
>  {
> +#ifndef CONFIG_TPM
> +    monitor_printf(mon, "TPM device not supported\n");
> +#else

I dislike #ifndef ... #else.  Matter of taste.

>      TPMInfoList *info_list, *info;
>      Error *err =3D NULL;
>      unsigned int c =3D 0;
> @@ -946,6 +949,7 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
>          c++;
>      }
>      qapi_free_TPMInfoList(info_list);
> +#endif /* CONFIG_TPM */
>  }
> =20
>  void hmp_quit(Monitor *mon, const QDict *qdict)
> diff --git a/stubs/tpm.c b/stubs/tpm.c
> deleted file mode 100644
> index e79bd2a6c2d..00000000000
> --- a/stubs/tpm.c
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/*
> - * TPM stubs
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#include "qemu/osdep.h"
> -#include "qapi/qapi-commands-tpm.h"
> -#include "hw/acpi/tpm.h"
> -
> -TPMInfoList *qmp_query_tpm(Error **errp)
> -{
> -    return NULL;
> -}
> -
> -TpmTypeList *qmp_query_tpm_types(Error **errp)
> -{
> -    return NULL;
> -}
> -
> -TpmModelList *qmp_query_tpm_models(Error **errp)
> -{
> -    return NULL;
> -}
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 65c22c0568c..d4e9549dc99 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -38,7 +38,6 @@
>  stub_ss.add(files('sysbus.c'))
>  stub_ss.add(files('target-get-monitor-def.c'))
>  stub_ss.add(files('target-monitor-defs.c'))
> -stub_ss.add(files('tpm.c'))
>  stub_ss.add(files('trace-control.c'))
>  stub_ss.add(files('uuid.c'))
>  stub_ss.add(files('vmgenid.c'))

Reviewed-by: Markus Armbruster <armbru@redhat.com>


