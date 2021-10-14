Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60B42D9E4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 15:13:30 +0200 (CEST)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb0Y5-0006KZ-SS
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 09:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mb0Ud-00030Z-Ds
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:09:55 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mb0Ub-0000cY-Gl
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:09:55 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u18so19415563wrg.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QIbtlGOJmXGPtOL+hl1CYeiTKk1OSNLYz3h+OIJtXNo=;
 b=hGlm14S+nGcBT3tS5R7XolmQsLWCjW5IKtbhNb9MqlEc8FurVRNTXV2rX44kO4Ww1x
 2LMkDNMzTzUOte/fBvozb4DYn98Cwi69xk+4efGE+WoKl6ad0+B9LF7koiq7ot7dIw8m
 WmkI3fb91m6v+ChHsK+FqK9F5aRXI3QEKpd7yWdfvmtQ4aSD8Q5mtKuoX4wapW0RlWD0
 /QLqtCM8jeLG91Erh18dpkodNfZeOUHjIXYWY3VmugpW1FRiv87C4s196JuKKPaEXxY4
 8c73tRb4Dus9lvCECr+MAISB8Sy5kK0DEgTW3Lz4RBe4fLZzggVWe/KmHWtC4wKKP+36
 2IQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QIbtlGOJmXGPtOL+hl1CYeiTKk1OSNLYz3h+OIJtXNo=;
 b=p2dOChSzrX33l+ovydMjt6AQD5ODv8WcFt3y5/ZJ1pTGm9gX9Q5yW2RmulXXokFzUr
 N6hhWZvxM4GIbSzD5WTUvSC5skALHZBIypWJuj9sDlQUidHtBZyB2tSAr3HmXnoww2G+
 CEwLbX1qEPtst62GQ3L5Tp4vpSXoa620Q3UHh9hzA+3XNIm0KwDZzLsGfQbi5p2eaPrK
 TbEQyRnMCUSKlOp10YqVuuDpZnBhWks33ugXkauHPzdRzSprA6SOcls6YD7CPLr6oFJ5
 yTV6upHiCdRI3sSiW/QjjwmH5EGOrrhfDLAxfVNeNekiyRSjGC9ynDfrSDXmWkOf9I6K
 0L7w==
X-Gm-Message-State: AOAM531R5URMv3vcrqa5CeyvjJMP2iF5a1HBqWYEJx9fCVp0d+JndTz3
 1DginytGg3S1gsGKEU2b4wOgZ/uOnXJhHg==
X-Google-Smtp-Source: ABdhPJzB2hj94hZyrra78KqFIPmfCmf3Zi6yiyDpwnhuaYJ1CBQwd7VMCBLkDkzQHeiR8HlaYWGEyA==
X-Received: by 2002:a1c:14b:: with SMTP id 72mr19853070wmb.188.1634216990962; 
 Thu, 14 Oct 2021 06:09:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z8sm2372464wrq.16.2021.10.14.06.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:09:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 406291FF96;
 Thu, 14 Oct 2021 14:09:49 +0100 (BST)
References: <20210914155214.105415-1-mlevitsk@redhat.com>
 <20210914155214.105415-3-mlevitsk@redhat.com> <87v920vs1v.fsf@linaro.org>
 <01068d813041258eba607c38f33f7cb13b1026a4.camel@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 2/3] gdbstub: implement NOIRQ support for single step on
 KVM
Date: Thu, 14 Oct 2021 14:08:53 +0100
In-reply-to: <01068d813041258eba607c38f33f7cb13b1026a4.camel@redhat.com>
Message-ID: <875ytzvjky.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Maxim Levitsky <mlevitsk@redhat.com> writes:

> On Wed, 2021-10-13 at 16:50 +0100, Alex Benn=C3=A9e wrote:
>> Maxim Levitsky <mlevitsk@redhat.com> writes:
>>=20
>> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
>> > ---
>> >  accel/kvm/kvm-all.c  | 25 ++++++++++++++++++
>> >  gdbstub.c            | 60 ++++++++++++++++++++++++++++++++++++--------
>> >  include/sysemu/kvm.h | 13 ++++++++++
>> >  3 files changed, 88 insertions(+), 10 deletions(-)
>> >=20
>> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> > index 6b187e9c96..e141260796 100644
>> > --- a/accel/kvm/kvm-all.c
>> > +++ b/accel/kvm/kvm-all.c
>> > @@ -169,6 +169,8 @@ bool kvm_vm_attributes_allowed;
>> >  bool kvm_direct_msi_allowed;
>> >  bool kvm_ioeventfd_any_length_allowed;
>> >  bool kvm_msi_use_devid;
>> > +bool kvm_has_guest_debug;
>> > +int kvm_sstep_flags;
>> >  static bool kvm_immediate_exit;
>> >  static hwaddr kvm_max_slot_size =3D ~0;
>> >=20=20
>> > @@ -2559,6 +2561,25 @@ static int kvm_init(MachineState *ms)
>> >      kvm_sregs2 =3D
>> >          (kvm_check_extension(s, KVM_CAP_SREGS2) > 0);
>> >=20=20
>> > +    kvm_has_guest_debug =3D
>> > +        (kvm_check_extension(s, KVM_CAP_SET_GUEST_DEBUG) > 0);
>> > +
>> > +    kvm_sstep_flags =3D 0;
>> > +
>> > +    if (kvm_has_guest_debug) {
>> > +        /* Assume that single stepping is supported */
>> > +        kvm_sstep_flags =3D SSTEP_ENABLE;
>> > +
>> > +        int guest_debug_flags =3D
>> > +            kvm_check_extension(s, KVM_CAP_SET_GUEST_DEBUG2);
>> > +
>> > +        if (guest_debug_flags > 0) {
>> > +            if (guest_debug_flags & KVM_GUESTDBG_BLOCKIRQ) {
>> > +                kvm_sstep_flags |=3D SSTEP_NOIRQ;
>> > +            }
>> > +        }
>> > +    }
>> > +
>> >      kvm_state =3D s;
>> >=20=20
>> >      ret =3D kvm_arch_init(ms, s);
>> > @@ -3188,6 +3209,10 @@ int kvm_update_guest_debug(CPUState *cpu, unsig=
ned long reinject_trap)
>> >=20=20
>> >      if (cpu->singlestep_enabled) {
>> >          data.dbg.control |=3D KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_SING=
LESTEP;
>> > +
>> > +        if (cpu->singlestep_enabled & SSTEP_NOIRQ) {
>> > +            data.dbg.control |=3D KVM_GUESTDBG_BLOCKIRQ;
>> > +        }
>> >      }
>> >      kvm_arch_update_guest_debug(cpu, &data.dbg);
>> >=20=20
>> > diff --git a/gdbstub.c b/gdbstub.c
>> > index 5d8e6ae3cd..48bb803bae 100644
>> > --- a/gdbstub.c
>> > +++ b/gdbstub.c
>> > @@ -368,12 +368,11 @@ typedef struct GDBState {
>> >      gdb_syscall_complete_cb current_syscall_cb;
>> >      GString *str_buf;
>> >      GByteArray *mem_buf;
>> > +    int sstep_flags;
>> > +    int supported_sstep_flags;
>> >  } GDBState;
>> >=20=20
>> > -/* By default use no IRQs and no timers while single stepping so as to
>> > - * make single stepping like an ICE HW step.
>> > - */
>> > -static int sstep_flags =3D SSTEP_ENABLE|SSTEP_NOIRQ|SSTEP_NOTIMER;
>> > +static GDBState gdbserver_state;
>> >=20=20
>> >  /* Retrieves flags for single step mode. */
>> >  static int get_sstep_flags(void)
>> > @@ -385,11 +384,10 @@ static int get_sstep_flags(void)
>> >      if (replay_mode !=3D REPLAY_MODE_NONE) {
>> >          return SSTEP_ENABLE;
>> >      } else {
>> > -        return sstep_flags;
>> > +        return gdbserver_state.sstep_flags;
>> >      }
>> >  }
>> >=20=20
>> > -static GDBState gdbserver_state;
>> >=20=20
>> >  static void init_gdbserver_state(void)
>> >  {
>> > @@ -399,6 +397,23 @@ static void init_gdbserver_state(void)
>> >      gdbserver_state.str_buf =3D g_string_new(NULL);
>> >      gdbserver_state.mem_buf =3D g_byte_array_sized_new(MAX_PACKET_LEN=
GTH);
>> >      gdbserver_state.last_packet =3D g_byte_array_sized_new(MAX_PACKET=
_LENGTH + 4);
>> > +
>> > +
>> > +    if (kvm_enabled()) {
>> > +        gdbserver_state.supported_sstep_flags =3D kvm_get_supported_s=
step_flags();
>> > +    } else {
>> > +        gdbserver_state.supported_sstep_flags =3D
>> > +            SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
>> > +    }
>>=20
>> This fails to build:
>>=20
>> o -c ../../gdbstub.c
>> ../../gdbstub.c: In function =E2=80=98init_gdbserver_state=E2=80=99:
>> ../../gdbstub.c:403:49: error: implicit declaration of function =E2=80=
=98kvm_get_supported_sstep_flags=E2=80=99 [-Werror=3Dimplicit-function-decl=
aration]
>>   403 |         gdbserver_state.supported_sstep_flags =3D kvm_get_suppor=
ted_sstep_flags();
>>       |                                                 ^~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
>> ../../gdbstub.c:403:49: error: nested extern declaration of =E2=80=98kvm=
_get_supported_sstep_flags=E2=80=99 [-Werror=3Dnested-externs]
>> ../../gdbstub.c: In function =E2=80=98gdbserver_start=E2=80=99:
>> ../../gdbstub.c:3531:27: error: implicit declaration of function
>> =E2=80=98kvm_supports_guest_debug=E2=80=99; did you mean =E2=80=98kvm_up=
date_guest_debug=E2=80=99?
>> [-Werror=3Dimplicit-function-declaration]
>>  3531 |     if (kvm_enabled() && !kvm_supports_guest_debug()) {
>>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~
>>       |                           kvm_update_guest_debug
>> ../../gdbstub.c:3531:27: error: nested extern declaration of =E2=80=98kv=
m_supports_guest_debug=E2=80=99 [-Werror=3Dnested-externs]
>> cc1: all warnings being treated as errors
>>=20
>> In fact looking back I can see I mentioned this last time:
>>=20
>>   Subject: Re: [PATCH 2/2] gdbstub: implement NOIRQ support for single s=
tep on
>>    KVM, when kvm's KVM_GUESTDBG_BLOCKIRQ debug flag is supported.
>>   Date: Mon, 19 Apr 2021 17:29:25 +0100
>>   In-reply-to: <20210401144152.1031282-3-mlevitsk@redhat.com>
>>   Message-ID: <871rb69qqk.fsf@linaro.org>
>>=20
>> Please in future could you include a revision number for your spin and
>> mention bellow the --- what changes have been made since the last
>> posting.
>
> You mean it fails to build without KVM? I swear I tested build with TTG o=
nly after you mentioned this=20
> (or as it seems I only tried to).
>
> Could you give me the ./configure parameters you used?

That's with the standard parameters on an x86 host (which will disable
KVM and be TCG only for ARM). I suspect you could get the same results
with --disable-kvm on a native ARM system but I haven't tested that.

>
> Sorry for this!
> Best regards,
> 	Maxim Levitsky
>
>>=20
>>=20


--=20
Alex Benn=C3=A9e

