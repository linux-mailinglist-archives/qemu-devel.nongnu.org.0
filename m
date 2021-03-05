Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C069232EBC7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 14:02:46 +0100 (CET)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIA6P-0004gX-92
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 08:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIA54-000497-Cv
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:01:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIA52-0007F0-4o
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614949279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWV/nHfy0n+Z3cNKt3c9W2ULoWT8Qak1zEhVK1vfmzk=;
 b=CrntiG9fmIdV7AucCdVrqlHx2WMf9/SEC1Hrff1UvsiEu3SOq6QIhYK8vbvQAvq4MRPP9V
 oWeQ9VOtiXNbv9t6jgAPsFdbJET6ECEmn1aODKunZsMtc3so6YfPqfXgJ2joWHmmrOTUp3
 IO2a2tO59OUGJ9l0XtVBzbqBv7R9s8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-0FFyurfxOdmWMEMXMEegjw-1; Fri, 05 Mar 2021 08:01:17 -0500
X-MC-Unique: 0FFyurfxOdmWMEMXMEegjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 439CE87A826;
 Fri,  5 Mar 2021 13:01:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEE4D5D9C0;
 Fri,  5 Mar 2021 13:01:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 77F5A1132C12; Fri,  5 Mar 2021 14:01:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/3] qapi, audio: add query-audiodev command
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-2-berrange@redhat.com>
Date: Fri, 05 Mar 2021 14:01:14 +0100
In-Reply-To: <20210302175524.1290840-2-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 2 Mar 2021 17:55:22
 +0000")
Message-ID: <87a6rh3gbp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Way back in QEMU 4.0, the -audiodev command line option was introduced
> for configuring audio backends. This CLI option does not use QemuOpts
> so it is not visible for introspection in 'query-command-line-options',
> instead using the QAPI Audiodev type.  Unfortunately there is also no
> QMP command that uses the Audiodev type, so it is not introspectable
> with 'query-qmp-schema' either.

This is a gap that will only widen.

By design, query-qmp-schema covers just QMP.  It doesn't cover the
QAPIfied parts of the CLI.  They have been growing slowly, and this
trend will continue.  We need schema introspection to cover the CLI,
too.  Observation, not demand.

Work-arounds:

1. When a QMP command equivalent to a QAPIfied CLI option exists,
introspect that.  Involves hardcoding the connection between the two.
Example: -blockdev and blockdev-add.

2. When a QMP query exists that returns the CLI option argument,
introspect that.  Involves hardcoding the connection between the two.
Example: -display and query-display-options.

3. When neither exists, create a suitable query just to enable
introspection.  Example: query-display-options.  Commit e1ca8f7e19
"qapi: add query-display-options command" explains this clearly:

    Add query-display-options command, which allows querying the qemu
    display configuration.  This isn't particularly useful, except it
    exposes QAPI type DisplayOptions in query-qmp-schema, so that libvirt
    can discover recently added -display parameter rendernode (commit
    d4dc4ab133b).  Works around lack of sufficiently powerful command line
    introspection.

> This introduces a 'query-audiodev' command that simply reflects back
> the list of configured -audiodev command line options. This in turn
> makes Audiodev introspectable via 'query-qmp-schema'.

Is the query just for enabling introspection, or does it have other
uses?

If the former, please steal from Gerd's explanation for your commit
message.

>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  audio/audio.c   | 19 +++++++++++++++++++
>  qapi/audio.json | 13 +++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 6734c8af70..40a4bbd7ce 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -28,8 +28,10 @@
>  #include "monitor/monitor.h"
>  #include "qemu/timer.h"
>  #include "qapi/error.h"
> +#include "qapi/clone-visitor.h"
>  #include "qapi/qobject-input-visitor.h"
>  #include "qapi/qapi-visit-audio.h"
> +#include "qapi/qapi-commands-audio.h"
>  #include "qemu/cutils.h"
>  #include "qemu/module.h"
>  #include "sysemu/replay.h"
> @@ -2201,3 +2203,20 @@ size_t audio_rate_get_bytes(struct audio_pcm_info =
*info, RateCtl *rate,
>      rate->bytes_sent +=3D ret;
>      return ret;
>  }
> +
> +AudiodevList *qmp_query_audiodevs(Error **errp)
> +{
> +    AudiodevList *ret =3D NULL, *prev =3D NULL, *curr;
> +    AudiodevListEntry *e;
> +    QSIMPLEQ_FOREACH(e, &audiodevs, next) {
> +        curr =3D g_new0(AudiodevList, 1);
> +        curr->value =3D QAPI_CLONE(Audiodev, e->dev);
> +        if (prev) {
> +            prev->next =3D curr;
> +            prev =3D curr;
> +        } else {
> +            ret =3D prev =3D curr;
> +        }

Please use QAPI_LIST_APPEND().

> +    }
> +    return ret;
> +}
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 9cba0df8a4..d7b91230d7 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -419,3 +419,16 @@
>      'sdl':       'AudiodevSdlOptions',
>      'spice':     'AudiodevGenericOptions',
>      'wav':       'AudiodevWavOptions' } }
> +
> +##
> +# @query-audiodevs:
> +#
> +# Returns information about audiodev configuration
> +#
> +# Returns: array of @Audiodev
> +#
> +# Since: 6.0
> +#
> +##
> +{ 'command': 'query-audiodevs',
> +  'returns': ['Audiodev'] }


