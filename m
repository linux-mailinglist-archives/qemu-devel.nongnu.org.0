Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9066E9656
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:51:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUZ4-00034K-QG; Thu, 20 Apr 2023 09:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppUZ2-0002rR-Kz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:43:08 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppUZ0-0006g2-9v
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:43:08 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n43-20020a05600c502b00b003f17466a9c1so3094856wmr.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998184; x=1684590184;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRlH/iBoeQJWAnVTNJLlZLabXcxjsP4ynzrx2OKk73Q=;
 b=k8NcmdVVGZYhodLNx84GTsUkDMsVCjPH96onrw10UbhTdrEpTHrZ7iLB03P4g6ap4y
 zRRDvupxYWbL/Vb6pXnfnUHqC5wL4d1Ek5DU18CZTlYYBwAw6vlEiErzFXiinXh7sbSg
 OY2ZErR5PTJNycBsOl57XARnHNpZc8ZEFsDk4naNFbPL0u31AVSbJh1wCzDThkcNq4j9
 LjKLhjoEp0B2aiJradZW3N0P5NSlw3XMNfS73qqovTqqM5GS1jIrEWG5luo5NGhP5I8K
 powhoHmvZok2lsoX5sgnmstnCFDiViJRTFIKJV3VJqB86WIAhLz8KU9fcoKJx8TH0psB
 4iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998184; x=1684590184;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oRlH/iBoeQJWAnVTNJLlZLabXcxjsP4ynzrx2OKk73Q=;
 b=fnX21sVcWFXtkXzbaywEsbsxbavhL7dw2VElq7vK9Jz1e7RzE+cNogbRlkcq0HcuAC
 SmSc+SAhNh1aSLES3ebOAkQzMpeOdwC1PjXLbYGfcIwQ49TVgtn151Kdr7Vzv5aYFp3p
 NoDxgRBu9LBvf/QkQk9srzZtPTlTKACtSPk+9P0Jke8O/kE2L6MrcPIda/jlqmOU3ruk
 isH8/4hxW51f1KKCjiEFIr3MTdzdCaWOXPq8mYcmvXZpDF5YTBC2pFSOhW6hQnJ96Mh4
 Zmoc0LBo7+2wreHROWiOWMS7q2NbILvFKYbq8mMUNOWmgUmSp049sHpjkm8jqvtqK+tg
 ua8w==
X-Gm-Message-State: AAQBX9f7Pzh+NwotcyTM2FN5kfqRG3mcwLasWqIn8re5GANwitIK/dy3
 tpLPHe6ik7PAbPws1MR3j8ES3g==
X-Google-Smtp-Source: AKy350YbWEFXnhkqt9rnym+aaNsj6SMhUMSp+9k4ij1crcBnsPcwrSBz6B8Bwvf10VscTtq8xEUxWA==
X-Received: by 2002:a1c:ed0b:0:b0:3ee:93d2:c915 with SMTP id
 l11-20020a1ced0b000000b003ee93d2c915mr4780965wmh.6.1681998184314; 
 Thu, 20 Apr 2023 06:43:04 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a5d4bc7000000b002fefe2edb72sm2038422wrt.17.2023.04.20.06.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:43:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6579A1FFB7;
 Thu, 20 Apr 2023 14:43:03 +0100 (BST)
References: <cover.1681993775.git.quic_mathbern@quicinc.com>
 <ec04a0d3cb1c1072703f776624e503ad6257dccd.1681993775.git.quic_mathbern@quicinc.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com, Philippe =?utf-8?Q?Mathie?=
 =?utf-8?Q?u-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 RESEND 1/7] gdbstub: only send stop-reply packets
 when allowed to
Date: Thu, 20 Apr 2023 14:41:08 +0100
In-reply-to: <ec04a0d3cb1c1072703f776624e503ad6257dccd.1681993775.git.quic_mathbern@quicinc.com>
Message-ID: <87wn26d5zs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Matheus Tavares Bernardino <quic_mathbern@quicinc.com> writes:

> GDB's remote serial protocol allows stop-reply messages to be sent by
> the stub either as a notification packet or as a reply to a GDB command
> (provided that the cmd accepts such a response). QEMU currently does not
> implement notification packets, so it should only send stop-replies
> synchronously and when requested. Nevertheless, it still issues
> unsolicited stop messages through gdb_vm_state_change().
>
> Although this behavior doesn't seem to cause problems with GDB itself
> (the messages are just ignored), it can impact other debuggers that
> implement the GDB remote serial protocol, like hexagon-lldb. Let's
> change the gdbstub to send stop messages only as a response to a
> previous GDB command that accepts such a reply.
>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  gdbstub/internals.h |  5 +++++
>  gdbstub/gdbstub.c   | 37 ++++++++++++++++++++++++++++---------
>  gdbstub/softmmu.c   | 13 +++++++++++--
>  gdbstub/user.c      | 17 +++++++++++------
>  4 files changed, 55 insertions(+), 17 deletions(-)
>
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index 94ddff4495..33d21d6488 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -65,6 +65,11 @@ typedef struct GDBState {
>      GByteArray *mem_buf;
>      int sstep_flags;
>      int supported_sstep_flags;
> +    /*
> +     * Whether we are allowed to send a stop reply packet at this moment.
> +     * Must be set off after sending the stop reply itself.
> +     */
> +    bool allow_stop_reply;
>  } GDBState;
>=20=20
>  /* lives in main gdbstub.c */
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 0760d78685..be18568d0a 100644
<snip>
>  /*
> @@ -139,6 +140,10 @@ static void gdb_vm_state_change(void *opaque, bool r=
unning, RunState state)
>          return;
>      }
>=20=20
> +    if (!gdbserver_state.allow_stop_reply) {
> +        return;
> +    }
> +
>      gdb_append_thread_id(cpu, tid);
>=20=20
>      switch (state) {
> @@ -205,6 +210,7 @@ static void gdb_vm_state_change(void *opaque, bool ru=
nning, RunState state)
>=20=20
>  send_packet:
>      gdb_put_packet(buf->str);
> +    gdbserver_state.allow_stop_reply =3D false;
>=20=20
>      /* disable single step if it was enabled */
>      cpu_single_step(cpu, 0);
> @@ -422,8 +428,11 @@ void gdb_exit(int code)
>=20=20
>      trace_gdbstub_op_exiting((uint8_t)code);
>=20=20
> -    snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
> -    gdb_put_packet(buf);
> +    if (gdbserver_state.allow_stop_reply) {
> +        snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
> +        gdb_put_packet(buf);
> +        gdbserver_state.allow_stop_reply =3D false;
> +    }
>=20=20
>      qemu_chr_fe_deinit(&gdbserver_system_state.chr, true);
>  }
> diff --git a/gdbstub/user.c b/gdbstub/user.c
> index 80488b6bb9..bb03622c83 100644
> --- a/gdbstub/user.c
> +++ b/gdbstub/user.c
> @@ -127,11 +127,14 @@ int gdb_handlesig(CPUState *cpu, int sig)
>=20=20
>      if (sig !=3D 0) {
>          gdb_set_stop_cpu(cpu);
> -        g_string_printf(gdbserver_state.str_buf,
> -                        "T%02xthread:", gdb_target_signal_to_gdb(sig));
> -        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
> -        g_string_append_c(gdbserver_state.str_buf, ';');
> -        gdb_put_strbuf();
> +        if (gdbserver_state.allow_stop_reply) {
> +            g_string_printf(gdbserver_state.str_buf,
> +                            "T%02xthread:", gdb_target_signal_to_gdb(sig=
));
> +            gdb_append_thread_id(cpu, gdbserver_state.str_buf);
> +            g_string_append_c(gdbserver_state.str_buf, ';');
> +            gdb_put_strbuf();
> +            gdbserver_state.allow_stop_reply =3D false;
> +        }
>      }
>      /*
>       * gdb_put_packet() might have detected that the peer terminated the
> @@ -174,12 +177,14 @@ void gdb_signalled(CPUArchState *env, int sig)
>  {
>      char buf[4];
>=20=20
> -    if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
> +    if (!gdbserver_state.init || gdbserver_user_state.fd < 0 ||
> +        !gdbserver_state.allow_stop_reply) {
>          return;
>      }
>=20=20
>      snprintf(buf, sizeof(buf), "X%02x", gdb_target_signal_to_gdb(sig));
>      gdb_put_packet(buf);
> +    gdbserver_state.allow_stop_reply =3D false;

Did I miss an equivalent for softmmu mode here?

Anyway:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

