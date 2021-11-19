Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161A456BB2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:32:12 +0100 (CET)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzJW-0002DF-KV
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:32:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnzFd-0007SY-32
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:28:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnzFZ-0004Ed-Jx
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637310480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9De5JuaLBktMnHPLM7lgZNJ6stlaW7b9JFVd8qCZGBQ=;
 b=Ut7yUcY8ZGzrA6E0P+yZXnF8rdFjfi+ljwH44K1K19lo10HRIQ/SPWXHoNI5VBpFWgLnpb
 ZAuA5KTG0tzzvqzfcVMH4rLRnOL+J+R/K/g8HWYOngDe1tiAqwuPPvhmQPwAHjk71n70T0
 VXQgcM0V98VpXYpPZ9SxsCDo+fDbnrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-24-jW06mGKCO6mR11PeAFjOaQ-1; Fri, 19 Nov 2021 03:27:58 -0500
X-MC-Unique: jW06mGKCO6mR11PeAFjOaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45D29871803;
 Fri, 19 Nov 2021 08:27:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 687045D6B1;
 Fri, 19 Nov 2021 08:27:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C7BB411380A7; Fri, 19 Nov 2021 09:27:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/5] hw/core: Remove uses of QERR_INVALID_PARAMETER_VALUE
References: <20211029230147.2465055-1-philmd@redhat.com>
 <20211029230147.2465055-6-philmd@redhat.com>
Date: Fri, 19 Nov 2021 09:27:40 +0100
In-Reply-To: <20211029230147.2465055-6-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sat, 30 Oct 2021 01:01:47
 +0200")
Message-ID: <87tug8r1mr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> QERR_INVALID_PARAMETER_VALUE definition is obsolete since 2015
> (commit 4629ed1e989, "qerror: Finally unused, clean up").
> Replace the definitions used in hw/core/.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/core/qdev-properties-system.c | 2 +-
>  monitor/misc.c                   | 3 +--
>  softmmu/cpus.c                   | 3 +--
>  softmmu/qdev-monitor.c           | 7 +++----
>  4 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-s=
ystem.c
> index a91f60567aa..91b322fe372 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -749,7 +749,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, co=
nst char *name,
>              return;
>          }
>          if (value < -1 || value > 255) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
> +            error_setg(errp, "Parameter '%s' expects %s",
>                         name ? name : "null", "a value between -1 and 255=
");
>              return;
>          }

Not this patch's problem, but here goes anyway: if @name can be null,
the error message is crap.  If it can't, the code is crap.

> diff --git a/monitor/misc.c b/monitor/misc.c
> index ffe79668706..5a33458173e 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -125,8 +125,7 @@ char *qmp_human_monitor_command(const char *command_l=
ine, bool has_cpu_index,
>      if (has_cpu_index) {
>          int ret =3D monitor_set_cpu(&hmp.common, cpu_index);
>          if (ret < 0) {
> -            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cpu-index",
> -                       "a CPU number");
> +            error_setg(errp, "Parameter 'cpu-index' expects a CPU number=
");
>              goto out;
>          }
>      }
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 071085f840b..0e7f44154fa 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -741,8 +741,7 @@ void qmp_memsave(int64_t addr, int64_t size, const ch=
ar *filename,
> =20
>      cpu =3D qemu_get_cpu(cpu_index);
>      if (cpu =3D=3D NULL) {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cpu-index",
> -                   "a CPU number");
> +        error_setg(errp, "Parameter 'cpu-index' expects a CPU number");
>          return;
>      }
> =20
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 35a885a6623..27f3a1248ac 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -241,16 +241,15 @@ static DeviceClass *qdev_get_device_class(const cha=
r **driver, Error **errp)
>      }
> =20
>      if (object_class_is_abstract(oc)) {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
> -                   "a non-abstract device type");
> +        error_setg(errp,
> +                   "Parameter 'driver' expects a non-abstract device typ=
e");
>          return NULL;
>      }
> =20
>      dc =3D DEVICE_CLASS(oc);
>      if (!dc->user_creatable ||
>          (phase_check(PHASE_MACHINE_READY) && !dc->hotpluggable)) {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
> -                   "a pluggable device type");
> +        error_setg(errp, "Parameter 'driver' expects a pluggable device =
type");
>          return NULL;
>      }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


