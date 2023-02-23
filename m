Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED036A0CD7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:26:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDUG-0007iz-Vc; Thu, 23 Feb 2023 10:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVDUE-0007iZ-QJ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVDUC-0002Qr-Sb
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677165979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSfquKNTBKcHa/7F9yDnw6DG4zUDcjKkWKA+FmxIBzs=;
 b=Bf/UK5myDg8ei2B5WLganCuUeU8FmKv7RSZcXuRGTUV492Crsw6TouVLDtdIuuoDY16yra
 so30juoUczHZSiOzLBK64BgII+aVYmFgIuAuM04fkpga/MC3dpWIoWmSzHoKtmp/0cuQf9
 O2Yyhy/Pb41s/N5JjImAa/ZI1LIsMn0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-aoFly8FnMV62LOY73HtHHA-1; Thu, 23 Feb 2023 10:26:17 -0500
X-MC-Unique: aoFly8FnMV62LOY73HtHHA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA2F5101AA5F;
 Thu, 23 Feb 2023 15:26:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 722A8492C14;
 Thu, 23 Feb 2023 15:26:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3FE7B21E6A1F; Thu, 23 Feb 2023 16:26:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,  qemu-block@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Helge Deller <deller@gmx.de>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Laurent Vivier <laurent@vivier.eu>,  Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>,  Daniel Henrique Barboza <danielhb413@gmail.com>,  David
 Gibson <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,  Thomas
 Huth <thuth@redhat.com>,  David Hildenbrand <david@redhat.com>,  Ilya
 Leoshkevich <iii@linux.ibm.com>,  Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  Eric Farman
 <farman@linux.ibm.com>
Subject: Re: [PATCH 1/5] hw/nmi: Have nmi_monitor_handler() return a boolean
 indicating error
References: <20230216122524.67212-1-philmd@linaro.org>
 <20230216122524.67212-2-philmd@linaro.org>
Date: Thu, 23 Feb 2023 16:26:14 +0100
In-Reply-To: <20230216122524.67212-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 16 Feb 2023 13:25:20
 +0100")
Message-ID: <87a614s8rt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have the nmi_monitor_handler
> return a boolean indicating whether an error is set or not and
> convert its implementations.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/core/nmi.c              | 3 +--
>  hw/hppa/machine.c          | 3 ++-
>  hw/i386/x86.c              | 3 ++-
>  hw/intc/m68k_irqc.c        | 4 +++-
>  hw/m68k/q800.c             | 4 +++-
>  hw/misc/macio/gpio.c       | 4 +++-
>  hw/ppc/pnv.c               | 3 ++-
>  hw/ppc/spapr.c             | 3 ++-
>  hw/s390x/s390-virtio-ccw.c | 4 +++-
>  include/hw/nmi.h           | 3 ++-
>  10 files changed, 23 insertions(+), 11 deletions(-)
>
> diff --git a/hw/core/nmi.c b/hw/core/nmi.c
> index 481c4b3c7e..76cb3ba3b0 100644
> --- a/hw/core/nmi.c
> +++ b/hw/core/nmi.c
> @@ -43,8 +43,7 @@ static int do_nmi(Object *o, void *opaque)
>          NMIClass *nc =3D NMI_GET_CLASS(n);
>=20=20
>          ns->handled =3D true;
> -        nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err);
> -        if (ns->err) {
> +        if (!nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err)) {
>              return -1;
>          }
>      }
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index 7ac68c943f..da7c36c554 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -437,13 +437,14 @@ static void hppa_machine_reset(MachineState *ms, Sh=
utdownCause reason)
>      cpu[0]->env.gr[19] =3D FW_CFG_IO_BASE;
>  }
>=20=20
> -static void hppa_nmi(NMIState *n, int cpu_index, Error **errp)
> +static bool hppa_nmi(NMIState *n, int cpu_index, Error **errp)
>  {
>      CPUState *cs;
>=20=20
>      CPU_FOREACH(cs) {
>          cpu_interrupt(cs, CPU_INTERRUPT_NMI);
>      }
> +    return true;
>  }
>=20=20
>  static void hppa_machine_init_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index eaff4227bd..8bd0691705 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -501,7 +501,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(Machin=
eState *ms)
>      return ms->possible_cpus;
>  }
>=20=20
> -static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
> +static bool x86_nmi(NMIState *n, int cpu_index, Error **errp)
>  {
>      /* cpu index isn't used */
>      CPUState *cs;
> @@ -515,6 +515,7 @@ static void x86_nmi(NMIState *n, int cpu_index, Error=
 **errp)
>              apic_deliver_nmi(cpu->apic_state);
>          }
>      }
> +    return true;
>  }
>=20=20
>  static long get_file_size(FILE *f)
> diff --git a/hw/intc/m68k_irqc.c b/hw/intc/m68k_irqc.c
> index 0c515e4ecb..e05083e756 100644
> --- a/hw/intc/m68k_irqc.c
> +++ b/hw/intc/m68k_irqc.c
> @@ -70,9 +70,11 @@ static void m68k_irqc_instance_init(Object *obj)
>      qdev_init_gpio_in(DEVICE(obj), m68k_set_irq, M68K_IRQC_LEVEL_NUM);
>  }
>=20=20
> -static void m68k_nmi(NMIState *n, int cpu_index, Error **errp)
> +static bool m68k_nmi(NMIState *n, int cpu_index, Error **errp)
>  {
>      m68k_set_irq(n, M68K_IRQC_LEVEL_7, 1);
> +
> +    return true;
>  }
>=20=20
>  static const VMStateDescription vmstate_m68k_irqc =3D {
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 9d52ca6613..8631a226cd 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -227,13 +227,15 @@ static void glue_auxmode_set_irq(void *opaque, int =
irq, int level)
>      s->auxmode =3D level;
>  }
>=20=20
> -static void glue_nmi(NMIState *n, int cpu_index, Error **errp)
> +static bool glue_nmi(NMIState *n, int cpu_index, Error **errp)
>  {
>      GLUEState *s =3D GLUE(n);
>=20=20
>      /* Hold NMI active for 100ms */
>      GLUE_set_irq(s, GLUE_IRQ_IN_NMI, 1);
>      timer_mod(s->nmi_release, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 10=
0);
> +
> +    return true;
>  }
>=20=20
>  static void glue_nmi_release(void *opaque)
> diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
> index c8ac5633b2..0a7214421c 100644
> --- a/hw/misc/macio/gpio.c
> +++ b/hw/misc/macio/gpio.c
> @@ -182,10 +182,12 @@ static void macio_gpio_reset(DeviceState *dev)
>      macio_set_gpio(s, 1, true);
>  }
>=20=20
> -static void macio_gpio_nmi(NMIState *n, int cpu_index, Error **errp)
> +static bool macio_gpio_nmi(NMIState *n, int cpu_index, Error **errp)
>  {
>      macio_set_gpio(MACIO_GPIO(n), 9, true);
>      macio_set_gpio(MACIO_GPIO(n), 9, false);
> +
> +    return true;
>  }
>=20=20
>  static void macio_gpio_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 44b1fbbc93..38e69f3b39 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -2309,13 +2309,14 @@ static void pnv_cpu_do_nmi_on_cpu(CPUState *cs, r=
un_on_cpu_data arg)
>      }
>  }
>=20=20
> -static void pnv_nmi(NMIState *n, int cpu_index, Error **errp)
> +static bool pnv_nmi(NMIState *n, int cpu_index, Error **errp)
>  {
>      CPUState *cs;
>=20=20
>      CPU_FOREACH(cs) {
>          async_run_on_cpu(cs, pnv_cpu_do_nmi_on_cpu, RUN_ON_CPU_NULL);
>      }
> +    return true;
>  }
>=20=20
>  static void pnv_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4921198b9d..d298068169 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3464,13 +3464,14 @@ void spapr_do_system_reset_on_cpu(CPUState *cs, r=
un_on_cpu_data arg)
>      }
>  }
>=20=20
> -static void spapr_nmi(NMIState *n, int cpu_index, Error **errp)
> +static bool spapr_nmi(NMIState *n, int cpu_index, Error **errp)
>  {
>      CPUState *cs;
>=20=20
>      CPU_FOREACH(cs) {
>          async_run_on_cpu(cs, spapr_do_system_reset_on_cpu, RUN_ON_CPU_NU=
LL);
>      }
> +    return true;
>  }
>=20=20
>  int spapr_lmb_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index f22f61b8b6..af7e6c632a 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -570,11 +570,13 @@ static HotplugHandler *s390_get_hotplug_handler(Mac=
hineState *machine,
>      return NULL;
>  }
>=20=20
> -static void s390_nmi(NMIState *n, int cpu_index, Error **errp)
> +static bool s390_nmi(NMIState *n, int cpu_index, Error **errp)
>  {
>      CPUState *cs =3D qemu_get_cpu(cpu_index);
>=20=20
>      s390_cpu_restart(S390_CPU(cs));
> +
> +    return true;
>  }
>=20=20
>  static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
> diff --git a/include/hw/nmi.h b/include/hw/nmi.h
> index fff41bebc6..3e827a254a 100644
> --- a/include/hw/nmi.h
> +++ b/include/hw/nmi.h
> @@ -37,7 +37,8 @@ typedef struct NMIState NMIState;
>  struct NMIClass {
>      InterfaceClass parent_class;
>=20=20
> -    void (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **errp=
);
> +    /** Returns: %true on success, %false on error. */
> +    bool (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **errp=
);
>  };
>=20=20
>  void nmi_monitor_handle(int cpu_index, Error **errp);

None of the handlers can actually fail.  Evidence: you add only return
true, never return false.  Correct (I checked).

I think I'd make it official and drop the handler's Error ** parameter
instead of changing its return type.

You decide.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


