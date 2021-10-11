Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94121428D1F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:35:20 +0200 (CEST)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZuWU-0003vj-Mn
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mZuVF-0003DX-B9
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:34:01 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:55047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mZuVD-00031T-MT
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:34:01 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-Fh-qR1-gM0m71UnHC6do5g-1; Mon, 11 Oct 2021 08:33:47 -0400
X-MC-Unique: Fh-qR1-gM0m71UnHC6do5g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EDC61927807;
 Mon, 11 Oct 2021 12:33:46 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7318B60938;
 Mon, 11 Oct 2021 12:33:37 +0000 (UTC)
Date: Mon, 11 Oct 2021 14:33:36 +0200
From: Greg Kurz <groug@kaod.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] Trim some trailing space from human-readable output
Message-ID: <20211011143336.5367892c@bahia.huguette>
In-Reply-To: <20211009152401.2982862-1-armbru@redhat.com>
References: <20211009152401.2982862-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: jcmvbkbc@gmail.com, david@redhat.com, jiri@resnulli.us,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat,  9 Oct 2021 17:24:01 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> I noticed -cpu help printing enough trailing spaces to make the output
> at least 84 characters wide.  Looks ugly unless the terminal is wider.
> Ugly or not, trailing spaces are stupid.
>=20
> The culprit is this line in x86_cpu_list_entry():
>=20
>     qemu_printf("x86 %-20s  %-58s\n", name, desc);
>=20
> This prints a string with minimum field left-justified right before a
> newline.  Change it to
>=20
>     qemu_printf("x86 %-20s  %s\n", name, desc);
>=20
> which avoids the trailing spaces and is simpler to boot.
>=20
> A search for the pattern with "git-grep -E '%-[0-9]+s\\n'" found a few
> more instances.  Change them similarly.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  monitor/hmp-cmds.c         | 2 +-
>  target/i386/cpu-dump.c     | 4 ++--
>  target/i386/cpu.c          | 2 +-
>  target/ppc/cpu_init.c      | 2 +-

ppc part

Acked-by: Greg Kurz <groug@kaod.org>

>  target/s390x/cpu_models.c  | 4 ++--
>  target/xtensa/mmu_helper.c | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index bcaa41350e..9e45a138a5 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1945,7 +1945,7 @@ void hmp_rocker_ports(Monitor *mon, const QDict *qd=
ict)
>      monitor_printf(mon, "      port  link    duplex neg?\n");
> =20
>      for (port =3D list; port; port =3D port->next) {
> -        monitor_printf(mon, "%10s  %-4s   %-3s  %2s  %-3s\n",
> +        monitor_printf(mon, "%10s  %-4s   %-3s  %2s  %s\n",
>                         port->value->name,
>                         port->value->enabled ? port->value->link_up ?
>                         "up" : "down" : "!ena",
> diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
> index 02b635a52c..08ac957e99 100644
> --- a/target/i386/cpu-dump.c
> +++ b/target/i386/cpu-dump.c
> @@ -464,13 +464,13 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int =
flags)
>              snprintf(cc_op_name, sizeof(cc_op_name), "[%d]", env->cc_op)=
;
>  #ifdef TARGET_X86_64
>          if (env->hflags & HF_CS64_MASK) {
> -            qemu_fprintf(f, "CCS=3D%016" PRIx64 " CCD=3D%016" PRIx64 " C=
CO=3D%-8s\n",
> +            qemu_fprintf(f, "CCS=3D%016" PRIx64 " CCD=3D%016" PRIx64 " C=
CO=3D%s\n",
>                           env->cc_src, env->cc_dst,
>                           cc_op_name);
>          } else
>  #endif
>          {
> -            qemu_fprintf(f, "CCS=3D%08x CCD=3D%08x CCO=3D%-8s\n",
> +            qemu_fprintf(f, "CCS=3D%08x CCD=3D%08x CCO=3D%s\n",
>                           (uint32_t)env->cc_src, (uint32_t)env->cc_dst,
>                           cc_op_name);
>          }
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index a7b1b6aa93..8d2c0ded10 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4876,7 +4876,7 @@ static void x86_cpu_list_entry(gpointer data, gpoin=
ter user_data)
>          desc =3D g_strdup_printf("%s", model_id);
>      }
> =20
> -    qemu_printf("x86 %-20s  %-58s\n", name, desc);
> +    qemu_printf("x86 %-20s  %s\n", name, desc);
>  }
> =20
>  /* list available CPU models and flags */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6aad01d1d3..8ab81dd1ed 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -8734,7 +8734,7 @@ void ppc_cpu_list(void)
> =20
>  #ifdef CONFIG_KVM
>      qemu_printf("\n");
> -    qemu_printf("PowerPC %-16s\n", "host");
> +    qemu_printf("PowerPC %s\n", "host");
>  #endif
>  }
> =20
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 4e4598cc77..11e06cc51f 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -398,14 +398,14 @@ void s390_cpu_list(void)
>      for (feat =3D 0; feat < S390_FEAT_MAX; feat++) {
>          const S390FeatDef *def =3D s390_feat_def(feat);
> =20
> -        qemu_printf("%-20s %-50s\n", def->name, def->desc);
> +        qemu_printf("%-20s %s\n", def->name, def->desc);
>      }
> =20
>      qemu_printf("\nRecognized feature groups:\n");
>      for (group =3D 0; group < S390_FEAT_GROUP_MAX; group++) {
>          const S390FeatGroupDef *def =3D s390_feat_group_def(group);
> =20
> -        qemu_printf("%-20s %-50s\n", def->name, def->desc);
> +        qemu_printf("%-20s %s\n", def->name, def->desc);
>      }
>  }
> =20
> diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
> index b01ff9399a..57e319a1af 100644
> --- a/target/xtensa/mmu_helper.c
> +++ b/target/xtensa/mmu_helper.c
> @@ -1098,7 +1098,7 @@ static void dump_tlb(CPUXtensaState *env, bool dtlb=
)
>                      qemu_printf("\tVaddr       Paddr       ASID  Attr RW=
X Cache\n"
>                                  "\t----------  ----------  ----  ---- --=
- -------\n");
>                  }
> -                qemu_printf("\t0x%08x  0x%08x  0x%02x  0x%02x %c%c%c %-7=
s\n",
> +                qemu_printf("\t0x%08x  0x%08x  0x%02x  0x%02x %c%c%c %s\=
n",
>                              entry->vaddr,
>                              entry->paddr,
>                              entry->asid,


