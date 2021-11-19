Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966B456B89
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:21:13 +0100 (CET)
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnz8y-0006zm-6x
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:21:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnz6l-0004ys-TO
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:18:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnz6i-0002op-C8
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637309931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kNGQ93Ja+wMXM9JJwbiATTbhhQ5cSdli4w7psGzCgI=;
 b=fcid8BDCX3uTU/XEfbtEPuMdhgi+bnOlUIQ/iqvhCmmV+CNhG3PblvT+Tv2Td7KewS8ETG
 Al/crWr7NDxB6sb8N/hI6sLFLAXQQK+lBNzOg8GyOvCbh8Dwn0qsr9m7G93A8ebIpijn5Q
 xIoNNHUAL6J7jvEUO5G1VzdKkVGrTC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-fyro472VNFC5Ez0ZMqqGQg-1; Fri, 19 Nov 2021 03:18:48 -0500
X-MC-Unique: fyro472VNFC5Ez0ZMqqGQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E344618125C4;
 Fri, 19 Nov 2021 08:18:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C3A25C1A1;
 Fri, 19 Nov 2021 08:18:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A155611380A7; Fri, 19 Nov 2021 09:18:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/5] hw/core: Remove use of QERR_FEATURE_DISABLED
References: <20211029230147.2465055-1-philmd@redhat.com>
 <20211029230147.2465055-3-philmd@redhat.com>
Date: Fri, 19 Nov 2021 09:18:44 +0100
In-Reply-To: <20211029230147.2465055-3-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sat, 30 Oct 2021 01:01:44
 +0200")
Message-ID: <874k88sgm3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> QERR_FEATURE_DISABLED definition is obsolete since 2015 (commit
> 4629ed1e989, "qerror: Finally unused, clean up"). Replace it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/core/machine-qmp-cmds.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 216fdfaf3a0..f2eff433bf0 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -138,7 +138,8 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Erro=
r **errp)
>      MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> =20
>      if (!mc->has_hotpluggable_cpus) {
> -        error_setg(errp, QERR_FEATURE_DISABLED, "query-hotpluggable-cpus=
");
> +        error_setg(errp,
> +                   "The feature 'query-hotpluggable-cpus' is not enabled=
");
>          return NULL;
>      }

Again, the error message could use improvement, say "machine does not
support hot-plugging CPUs".

I can't help to wonder why this is an error, though.  What's the
difference to successfully returning an empty list?  David, you added
the command, can you explain?

By the way:

    ##
    # @query-hotpluggable-cpus:
    #
    # TODO: Better documentation; currently there is none.

The TODO is three years old, and the command four.  Can we resolve it,
please?


