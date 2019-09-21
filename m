Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE75B9D1C
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Sep 2019 11:08:50 +0200 (CEST)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBbNp-00084Z-Bj
	for lists+qemu-devel@lfdr.de; Sat, 21 Sep 2019 05:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39351)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iBbMm-0007Pe-Tm
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 05:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iBbMl-0006NV-Mp
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 05:07:44 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32361
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iBbMl-0006N9-JU
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 05:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569056863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=ZmsBUqBu95w2Q1QkYm2Oohbc1OmY7sfN4d84AnTp5/U=;
 b=Bzq4V4ruyhaTAnHRjD3wlVBXp3tqU1HVZk0t0+8jMGEoCInL1YS1B7k09+e26tuTL7cVTX
 VwW9CnHcqLRDYpFdx6m2bfdPbRP6Wzl2lUQm88P+ZKReQbzHC/vUbU7ykZiSmqQxJXBNLW
 sbo/MewZhVJaHEisDI5iVoZr87V9YWA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-c6qkY9keN_eVBFyXPJwqUA-1; Sat, 21 Sep 2019 05:07:40 -0400
Received: by mail-wm1-f72.google.com with SMTP id g82so2789733wmg.9
 for <qemu-devel@nongnu.org>; Sat, 21 Sep 2019 02:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PS6dYxyjw10w3gp2XbvlLGRJQ2hp0KWQZbM4RVf8yho=;
 b=S+tKB5bJ2fyBmKHYd90irxjsBf+Zy/7TesS3KDcdOe+NLpLAJfb7AGHFZ5gIYnx+dB
 Zf6MCuzcxmkVo9RQXaDoC+IIfLZCglnVYFaVAceGvVkqIzj6BnzVAS+y0mVmFZ40oPL/
 73dKfQ3xtXDUseCkNh+33qxi7ebwbDHExotFl92VDiXnS6EVVl5UqQROgzSMyAhopydi
 iojJ8jPaJ2IbGi2YGADdEBXBHFlk4RUyTPErcvUDPnHFfNpmaYzxiAtjw85CCncKzITD
 6ObKeENzw8StVlps8IWMMq7mzCylB0s8MZda+1mPZk+JyjTcNvA/e+QCACkZoFTpl/Yf
 Qmsw==
X-Gm-Message-State: APjAAAXYw0jPyzT/wYYbEISvVmuShKKAJe0O9vNcKNuh1+4ruz5Ebys5
 P3baVaykZMLqR7a0QrYnwLCRu5k8T9H6HW/bCKbwCMuf0iFhu3fePNWXjB485sp891D/P7eNt6u
 iMu7oR4T/D0crjeE=
X-Received: by 2002:adf:de0d:: with SMTP id b13mr9617874wrm.140.1569056859715; 
 Sat, 21 Sep 2019 02:07:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBwitTo+wxClBKU/wt2r46gvz1+PgItSSCrezB4SXMJHhOR1NGwm0ZtrSkRxp5bQXUg9qE2g==
X-Received: by 2002:adf:de0d:: with SMTP id b13mr9617852wrm.140.1569056859419; 
 Sat, 21 Sep 2019 02:07:39 -0700 (PDT)
Received: from [192.168.1.40] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id u22sm7914068wru.72.2019.09.21.02.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Sep 2019 02:07:38 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 2/2] RISC-V: Implement
 cpu_do_transaction_failed
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1568762497.git.alistair.francis@wdc.com>
 <62b87f2ee604c437cc59e82b84853c6f02a83372.1568762497.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6e094f8a-84f7-0201-d1c3-ead8b725dff5@redhat.com>
Date: Sat, 21 Sep 2019 11:07:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <62b87f2ee604c437cc59e82b84853c6f02a83372.1568762497.git.alistair.francis@wdc.com>
Content-Language: en-US
X-MC-Unique: c6qkY9keN_eVBFyXPJwqUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, palmer@sifive.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/19 1:23 AM, Alistair Francis wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>=20
> This converts our port over from cpu_do_unassigned_access to
> cpu_do_transaction_failed, as cpu_do_unassigned_access has been
> deprecated.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        |  2 +-
>  target/riscv/cpu.h        |  7 +++++--
>  target/riscv/cpu_helper.c | 11 +++++++----
>  3 files changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f13e298a36..3939963b71 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -484,7 +484,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
 *data)
>      cc->gdb_stop_before_watchpoint =3D true;
>      cc->disas_set_info =3D riscv_cpu_disas_set_info;
>  #ifndef CONFIG_USER_ONLY
> -    cc->do_unassigned_access =3D riscv_cpu_unassigned_access;
> +    cc->do_transaction_failed =3D riscv_cpu_do_transaction_failed;
>      cc->do_unaligned_access =3D riscv_cpu_do_unaligned_access;
>      cc->get_phys_page_debug =3D riscv_cpu_get_phys_page_debug;
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 124ed33ee4..8c64c68538 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -264,8 +264,11 @@ void  riscv_cpu_do_unaligned_access(CPUState *cs, va=
ddr addr,
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool probe, uintptr_t retaddr);
> -void riscv_cpu_unassigned_access(CPUState *cpu, hwaddr addr, bool is_wri=
te,
> -                                 bool is_exec, int unused, unsigned size=
);
> +void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> +                                     vaddr addr, unsigned size,
> +                                     MMUAccessType access_type,
> +                                     int mmu_idx, MemTxAttrs attrs,
> +                                     MemTxResult response, uintptr_t ret=
addr);
>  char *riscv_isa_string(RISCVCPU *cpu);
>  void riscv_cpu_list(void);
> =20
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index c82e7ed52b..917252f71b 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -408,20 +408,23 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, =
vaddr addr)
>      return phys_addr;
>  }
> =20
> -void riscv_cpu_unassigned_access(CPUState *cs, hwaddr addr, bool is_writ=
e,
> -                                 bool is_exec, int unused, unsigned size=
)
> +void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> +                                     vaddr addr, unsigned size,
> +                                     MMUAccessType access_type,
> +                                     int mmu_idx, MemTxAttrs attrs,
> +                                     MemTxResult response, uintptr_t ret=
addr)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
> =20
> -    if (is_write) {
> +    if (access_type =3D=3D MMU_DATA_STORE) {
>          cs->exception_index =3D RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
>      } else {
>          cs->exception_index =3D RISCV_EXCP_LOAD_ACCESS_FAULT;
>      }
> =20
>      env->badaddr =3D addr;
> -    riscv_raise_exception(&cpu->env, cs->exception_index, GETPC());
> +    riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
>  }
> =20
>  void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


