Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D38040B800
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 21:31:09 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQE96-0002sE-61
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 15:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQE73-0001UG-MN
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:29:01 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:28907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQE71-0008TV-3W
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:29:01 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-1I6aUjcDNc6A8MGHErAHNA-1; Tue, 14 Sep 2021 15:28:53 -0400
X-MC-Unique: 1I6aUjcDNc6A8MGHErAHNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27BFF18A072C;
 Tue, 14 Sep 2021 19:28:49 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E67B11001281;
 Tue, 14 Sep 2021 19:28:28 +0000 (UTC)
Date: Tue, 14 Sep 2021 21:28:27 +0200
From: Greg Kurz <groug@kaod.org>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH v2 06/53] hw/core: introduce 'format_state' callback to
 replace 'dump_state'
Message-ID: <20210914212827.65559b21@bahia.huguette>
In-Reply-To: <20210914142042.1655100-7-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-7-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sep 2021 15:19:55 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> The 'dump_state' callback assumes it will be outputting to a FILE
> object. This is fine for HMP, but not so useful for QMP. Introduce
> a new 'format_state' callback that returns a formatted GString
> instead.
>=20
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/core/cpu-common.c  | 15 +++++++++++++++
>  include/hw/core/cpu.h | 13 ++++++++++++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index e2f5a64604..c2cd33a817 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -106,6 +106,21 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flag=
s)
>      if (cc->dump_state) {
>          cpu_synchronize_state(cpu);
>          cc->dump_state(cpu, f, flags);
> +    } else if (cc->format_state) {
> +        g_autoptr(GString) buf =3D g_string_new("");
> +        cpu_synchronize_state(cpu);
> +        cc->format_state(cpu, buf, flags);
> +        qemu_fprintf(f, "%s", buf->str);
> +    }
> +}
> +
> +void cpu_format_state(CPUState *cpu, GString *buf, int flags)
> +{
> +    CPUClass *cc =3D CPU_GET_CLASS(cpu);
> +
> +    if (cc->format_state) {
> +        cpu_synchronize_state(cpu);
> +        cc->format_state(cpu, buf, flags);
>      }
>  }
> =20
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index bc864564ce..1599ef9df3 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -91,7 +91,8 @@ struct SysemuCPUOps;
>   * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
>   * @has_work: Callback for checking if there is work to do.
>   * @memory_rw_debug: Callback for GDB memory access.
> - * @dump_state: Callback for dumping state.
> + * @dump_state: Callback for dumping state. Deprecated, use @format_stat=
e.
> + * @format_state: Callback for formatting state.
>   * @get_arch_id: Callback for getting architecture-dependent CPU ID.
>   * @set_pc: Callback for setting the Program Counter register. This
>   *       should have the semantics used by the target architecture when
> @@ -136,6 +137,7 @@ struct CPUClass {
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>                             uint8_t *buf, int len, bool is_write);
>      void (*dump_state)(CPUState *cpu, FILE *, int flags);
> +    void (*format_state)(CPUState *cpu, GString *buf, int flags);
>      int64_t (*get_arch_id)(CPUState *cpu);
>      void (*set_pc)(CPUState *cpu, vaddr value);
>      int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
> @@ -537,6 +539,15 @@ enum CPUDumpFlags {
>   */
>  void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> =20
> +/**
> + * cpu_format_state:
> + * @cpu: The CPU whose state is to be formatted.
> + * @buf: buffer to format state into
> + *
> + * Formats the CPU state.
> + */
> +void cpu_format_state(CPUState *cpu, GString *buf, int flags);
> +
>  #ifndef CONFIG_USER_ONLY
>  /**
>   * cpu_get_phys_page_attrs_debug:


