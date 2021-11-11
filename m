Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CA144DB01
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:13:33 +0100 (CET)
Received: from localhost ([::1]:35954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDdk-0003fv-AN
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:13:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlDcU-0002Hg-G4
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:12:15 -0500
Received: from [2a00:1450:4864:20::436] (port=34727
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlDcR-0002Os-UR
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:12:14 -0500
Received: by mail-wr1-x436.google.com with SMTP id d5so10993524wrc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 09:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sG6hmOZWw/COgOckqadnFMti3gF+IkrkSuaBah3XhLc=;
 b=a3xtm3FlshNYrqXdt8hKG6RFLAnj5vvZvIsxRRR7jaV6lccaLi5tPAAbQ49Lk2ppNE
 NYXwgi8jDB3SbXAqfWZrYSlblMtEfF4VYoEk808nWJsIiVGgL10UwCNdx/nlr7xiRMbh
 dajeLsDt9shroZg3pfQLe7PnTnUbH8SwB5dmEcGOicF+BxDrWu/8i1iCnMumkGaQiPJ+
 GN0ZHoZ7OqW7MX0rTZpHlDFX+xiNiXEMG7pTFIXwZrF8Xt98vvWXgG2lIBtvIwp1a/7T
 7ZwM7FDWeSrkWjBuGsSsRAx1aqwWeEK8j5vwH0QCh/8k2VoHQZ9OXa+cHV8mv02VrGbO
 bdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sG6hmOZWw/COgOckqadnFMti3gF+IkrkSuaBah3XhLc=;
 b=qcr62uJAIdyu94v+x6OlDdgkJV60cowsl/HPZrScuoiOslkP53m/ypcc4Q+qmL7TCK
 SrTUIrH2Vmz4kInhxAuhYoRu07yf3ghXzm6NxVJZN35S+EV8TtBm9S4Na8Hnd+bmytjo
 5IgX9Ko+jtB6s2kCWFk4HBegBIet0AfsI2nBFs5+sJTJkHRC3uZxSEZGDhEl6nEPkJLs
 gXle8q+vybXlTeGT6MavX0gTd9fTtD0YnSkQnjiJ/VfbREkJO11IZ3bWL8Z1KocBRNEK
 yStRs+oQb8kXh7pPdW6aQMsY4J7lLgrdHgxo77BHz+ec19mULsMFXrmE+WmxjnB0s6m3
 pL6Q==
X-Gm-Message-State: AOAM5339CNXDxQCioTZXWK9NCQVPcyNuQh3eYDSdsoWNSWGIwuRibvf7
 FysYONahYIN0EGj/pwiM2LvDnKWHh7nmQA==
X-Google-Smtp-Source: ABdhPJwPMXi/r0A1p8cGnKot5Q4qeqqR/TrbI1uzuNWx6EAFoSrqRdsLynDBtOECsGYs9ULQXsMcYA==
X-Received: by 2002:a5d:6347:: with SMTP id b7mr10334076wrw.36.1636650727215; 
 Thu, 11 Nov 2021 09:12:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m36sm3796344wms.25.2021.11.11.09.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 09:12:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D3161FF96;
 Thu, 11 Nov 2021 17:12:05 +0000 (GMT)
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-4-pbonzini@redhat.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/5] gdbstub: reject unsupported flags in
 handle_set_qemu_sstep
Date: Thu, 11 Nov 2021 17:08:54 +0000
In-reply-to: <20211111110604.207376-4-pbonzini@redhat.com>
Message-ID: <878rxuiplm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: cohuck@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> From: Maxim Levitsky <mlevitsk@redhat.com>
>
> handle_query_qemu_sstepbits is reporting NOIRQ and NOTIMER bits
> even if they are not supported (as is the case with record/replay).
> Instead, store the supported singlestep flags and reject
> any unsupported bits in handle_set_qemu_sstep.  This removes
> the need for the get_sstep_flags() wrapper.
>
> While at it, move the variables in GDBState, instead of using
> global variables.
>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> [Extracted from Maxim's patch into a separate commit. - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  gdbstub.c | 73 +++++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 47 insertions(+), 26 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 23baaef40e..960b9fbcd0 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -368,27 +368,10 @@ typedef struct GDBState {
>      gdb_syscall_complete_cb current_syscall_cb;
>      GString *str_buf;
>      GByteArray *mem_buf;
> +    int sstep_flags;
> +    int supported_sstep_flags;
>  } GDBState;
>=20=20
> -/* By default use no IRQs and no timers while single stepping so as to
> - * make single stepping like an ICE HW step.
> - */
> -static int sstep_flags =3D SSTEP_ENABLE|SSTEP_NOIRQ|SSTEP_NOTIMER;
> -
> -/* Retrieves flags for single step mode. */
> -static int get_sstep_flags(void)
> -{
> -    /*
> -     * In replay mode all events written into the log should be replayed.
> -     * That is why NOIRQ flag is removed in this mode.
> -     */
> -    if (replay_mode !=3D REPLAY_MODE_NONE) {
> -        return SSTEP_ENABLE;
> -    } else {
> -        return sstep_flags;
> -    }
> -}
> -
>  static GDBState gdbserver_state;
>=20=20
>  static void init_gdbserver_state(void)
> @@ -399,6 +382,24 @@ static void init_gdbserver_state(void)
>      gdbserver_state.str_buf =3D g_string_new(NULL);
>      gdbserver_state.mem_buf =3D g_byte_array_sized_new(MAX_PACKET_LENGTH=
);
>      gdbserver_state.last_packet =3D g_byte_array_sized_new(MAX_PACKET_LE=
NGTH + 4);
> +
> +    /*
> +     * In replay mode all events written into the log should be replayed.
> +     * That is why NOIRQ flag is removed in this mode.

I guess if we were being complete we could say something like:

  In replay mode all events will come from the log and can't be
  suppressed otherwise we would break determinism. However as those
  events are tied to the number of executed instructions we won't see
  them occurring every time we single step.=20

> +     */
> +    if (replay_mode !=3D REPLAY_MODE_NONE) {
> +        gdbserver_state.supported_sstep_flags =3D SSTEP_ENABLE;
> +    } else {
> +        gdbserver_state.supported_sstep_flags =3D
> +            SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
> +    }
> +
> +    /*
> +     * By default use no IRQs and no timers while single stepping so as =
to
> +     * make single stepping like an ICE HW step.
> +     */
> +    gdbserver_state.sstep_flags =3D gdbserver_state.supported_sstep_flag=
s;
> +
>  }
>=20=20
>  #ifndef CONFIG_USER_ONLY
> @@ -505,7 +506,7 @@ static int gdb_continue_partial(char *newstates)
>      CPU_FOREACH(cpu) {
>          if (newstates[cpu->cpu_index] =3D=3D 's') {
>              trace_gdbstub_op_stepping(cpu->cpu_index);
> -            cpu_single_step(cpu, sstep_flags);
> +            cpu_single_step(cpu, gdbserver_state.sstep_flags);
>          }
>      }
>      gdbserver_state.running_state =3D 1;
> @@ -524,7 +525,7 @@ static int gdb_continue_partial(char *newstates)
>                  break; /* nothing to do here */
>              case 's':
>                  trace_gdbstub_op_stepping(cpu->cpu_index);
> -                cpu_single_step(cpu, get_sstep_flags());
> +                cpu_single_step(cpu, gdbserver_state.sstep_flags);
>                  cpu_resume(cpu);
>                  flag =3D 1;
>                  break;
> @@ -1883,7 +1884,7 @@ static void handle_step(GArray *params, void *user_=
ctx)
>          gdb_set_cpu_pc((target_ulong)get_param(params, 0)->val_ull);
>      }
>=20=20
> -    cpu_single_step(gdbserver_state.c_cpu, get_sstep_flags());
> +    cpu_single_step(gdbserver_state.c_cpu, gdbserver_state.sstep_flags);
>      gdb_continue();
>  }
>=20=20
> @@ -2017,24 +2018,44 @@ static void handle_v_commands(GArray *params, voi=
d *user_ctx)
>=20=20
>  static void handle_query_qemu_sstepbits(GArray *params, void *user_ctx)
>  {
> -    g_string_printf(gdbserver_state.str_buf, "ENABLE=3D%x,NOIRQ=3D%x,NOT=
IMER=3D%x",
> -                    SSTEP_ENABLE, SSTEP_NOIRQ, SSTEP_NOTIMER);
> +    g_string_printf(gdbserver_state.str_buf, "ENABLE=3D%x", SSTEP_ENABLE=
);
> +
> +    if (gdbserver_state.supported_sstep_flags & SSTEP_NOIRQ) {
> +        g_string_append_printf(gdbserver_state.str_buf, ",NOIRQ=3D%x",
> +                               SSTEP_NOIRQ);
> +    }
> +
> +    if (gdbserver_state.supported_sstep_flags & SSTEP_NOTIMER) {
> +        g_string_append_printf(gdbserver_state.str_buf, ",NOTIMER=3D%x",
> +                               SSTEP_NOTIMER);
> +    }
> +
>      put_strbuf();
>  }
>=20=20
>  static void handle_set_qemu_sstep(GArray *params, void *user_ctx)
>  {
> +    int new_sstep_flags;
> +
>      if (!params->len) {
>          return;
>      }
>=20=20
> -    sstep_flags =3D get_param(params, 0)->val_ul;
> +    new_sstep_flags =3D get_param(params, 0)->val_ul;
> +
> +    if (new_sstep_flags  & ~gdbserver_state.supported_sstep_flags) {
> +        put_packet("E22");
> +        return;
> +    }
> +
> +    gdbserver_state.sstep_flags =3D new_sstep_flags;
>      put_packet("OK");
>  }
>=20=20
>  static void handle_query_qemu_sstep(GArray *params, void *user_ctx)
>  {
> -    g_string_printf(gdbserver_state.str_buf, "0x%x", sstep_flags);
> +    g_string_printf(gdbserver_state.str_buf, "0x%x",
> +                    gdbserver_state.sstep_flags);
>      put_strbuf();
>  }

Otherwise LGTM:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

