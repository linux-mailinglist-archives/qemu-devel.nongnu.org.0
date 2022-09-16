Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F935BAC04
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 13:08:44 +0200 (CEST)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ9D6-0003Es-HO
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 07:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oZ98W-0000ND-Mi
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 07:03:56 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oZ98S-0003Vm-2k
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 07:03:54 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z12so17119333wrp.9
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=yWIc2Y0MmjVE0kPRIJG5F0fwxyjWaJnz0+F37xt22As=;
 b=ZLIUQQkOpCQ9DsaZovWCEgxrvP8VrdxMh/JO2wsP9MhufrZW82v4SGIpp6NjdNDZ8S
 3dDMHnkNd7TbccbDUU8r7Iz/m4NQSeCq94KL4wwXGIPfmt8KNRm4ZHSzSYHeykBCNtHy
 o9tl99j0AoWv9d4t0q+9ctR1+XtTVqbkRjuHOSqNvokzH4na/op5b60LDQyLWxlZikqL
 3DTYJ4HyTeosaaw3tOTEqCuoAFa3XNHEeGV7m0kEjXWneU0pG4udtqhumCDAtKoqFVHL
 0SJh8yhjrjOWNArhzoPeTohs+Sd7KD9RlSPY1Gn1a01Q3FdZAxMBhMAyQYUbcbPBW8pc
 FWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=yWIc2Y0MmjVE0kPRIJG5F0fwxyjWaJnz0+F37xt22As=;
 b=z0AWSs2GoLuKpaECkWjh4lWqqCe3vOyTwfpB6nvlhnQ5h18AvqW73Cku0ASLFh0FrN
 lHQSvR85Sn18bY5CKlS4GDonX7nj5NEA/pD2c0TOZnpMhMkUoeRuCVOCg4i1YbFYbxg1
 99749UPRyomnP7dDGhaimNq7pDY0o4bBOBY6XtsyU860V/o0GsVItlf3VAwtvqzwrVYL
 FU0JTUw0NzPJDsyUsqRTXJoAbE7ezi8mysovy8kKjW6h+iO2Nj5+/lzGvL6SvSQiEcJf
 /rRG5Mpt4MQA5SUa7gfG0A9iF0fyPqwmGMZqLXWH4J4icYciub1WWFwWkPxFNv9fsESA
 FCBQ==
X-Gm-Message-State: ACrzQf3Jlqcxft5LXGTreDjQfsaauVmtkUusugtkdjJ5Vx3h4YkCdqvW
 +URC9zcM7ygD7PFCeQO+5sF/vw==
X-Google-Smtp-Source: AMsMyM4IckB98L0W4SpLozj064V/l3Q0CnHopNWPtnSbmFoV4Bp44e8amGP2xL6xmaO/GXklk5L4kA==
X-Received: by 2002:a05:6000:144f:b0:22a:94f1:25d6 with SMTP id
 v15-20020a056000144f00b0022a94f125d6mr2395015wrx.422.1663326212061; 
 Fri, 16 Sep 2022 04:03:32 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a05600c351500b003b491f99a25sm2036213wmq.22.2022.09.16.04.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 04:03:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 78EA91FFB7;
 Fri, 16 Sep 2022 12:03:30 +0100 (BST)
References: <9bb3ec5d407a5278524d54d7ad53db830b35a74c.1661260622.git.quic_mathbern@quicinc.com>
 <ba99db564c3aeb1812bdfbc9116849092334482f.1661362557.git.quic_mathbern@quicinc.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, peter.maydell@linaro.org
Subject: Re: [RFC PATCH v2] gdbstub: only send stop-reply packets when
 allowed to
Date: Fri, 16 Sep 2022 11:33:10 +0100
In-reply-to: <ba99db564c3aeb1812bdfbc9116849092334482f.1661362557.git.quic_mathbern@quicinc.com>
Message-ID: <87edwb8ttp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Matheus Tavares Bernardino <quic_mathbern@quicinc.com> writes:

> GDB's remote serial protocol allows stop-reply messages to be sent by
> the stub either as a notification packet or as a reply to a GDB command
> (provided that the cmd accepts such a response). QEMU currently does not
> implement notification packets, so it should only send stop-replies
> synchronously and when requested. Nevertheless, it may still issue
> unsolicited stop messages through gdb_vm_state_change().
>
> Although this behavior doesn't seem to cause problems with GDB itself,
> it does with other debuggers that implement the GDB remote serial
> protocol, like hexagon-lldb. In this case, the debugger fails upon an
> unexpected stop-reply message from QEMU when lldb attaches to it.

Does this mean we can't have a test case that exercises this behaviour
with gdb? I'm guessing it will be tricky to exercise anyway because we'd
need to trigger a vm state change.

> Instead, let's change gdb_set_stop_cpu() to send stop messages only as a
> response to a previous GDB command, also making sure to check that the
> command accepts such a reply.
>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>
> Thanks Peter for pointing out about the notification packets at v1.
>
> Changes in this version include: improvements in the commit message;
> proper handling of the idle state (so that stop-replies can be sent
> later, e.g. when the program is stopped due to a watchpoint); and
> inclusion of other implemented GDB cmds that accept stop-reply as a
> response.
>
> There are three additional places that I think may send stop-reply
> packages asynchronously, but I haven't touched those as I'm not sure if
> that is really needed:
>
> - gdb_exit() sends a "W" reply.
> - gdb_signalled() sends "X".
> - gdb_handlesig() sends "T".
>
> Should we also restrict the message sending at these functions with the
> same rules added to gdb_vm_state_change()?

Hmm probably - that is certainly the implication of:

  https://sourceware.org/gdb/onlinedocs/gdb/Stop-Reply-Packets.html#Stop-Re=
ply-Packets

>
>  gdbstub.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index cf869b10e3..23507f21ca 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -350,6 +350,7 @@ typedef struct GDBState {
>      int line_buf_inde;
>      int line_sum; /* running checksum */
>      int line_csum; /* checksum at the end of the packet */
> +    char last_cmd[MAX_PACKET_LENGTH];
>      GByteArray *last_packet;
>      int signal;
>  #ifdef CONFIG_USER_ONLY
> @@ -412,6 +413,7 @@ static void reset_gdbserver_state(void)
>      g_free(gdbserver_state.processes);
>      gdbserver_state.processes =3D NULL;
>      gdbserver_state.process_num =3D 0;
> +    gdbserver_state.last_cmd[0] =3D '\0';

I'm not super keen on adding another static buffer to the gdb state
especially as we've been slowly removing the others in favour of
GString's where appropriate. More over isn't this really a boolean state
we want, maybe .allow_stop_reply?

>  }
>  #endif
>=20=20
> @@ -2558,7 +2560,7 @@ static void handle_target_halt(GArray *params, void=
 *user_ctx)
>      gdb_breakpoint_remove_all();
>  }
>=20=20
> -static int gdb_handle_packet(const char *line_buf)
> +static void gdb_handle_packet(const char *line_buf)
>  {
>      const GdbCmdParseEntry *cmd_parser =3D NULL;
>=20=20
> @@ -2800,8 +2802,6 @@ static int gdb_handle_packet(const char *line_buf)
>      if (cmd_parser) {
>          run_cmd_parser(line_buf, cmd_parser);
>      }
> -
> -    return RS_IDLE;
>  }

I guess this is changed to allow the later check against RS_IDLE. May I
suggest a better place would be to extend GdbCmdParseEntry to contain
the value of .allow_stop_reply which we could set on successful handling
of a packet in process_string_cmd, something like:

        cmd->handler(params, user_ctx);
        gdbserver_state.allow_stop_reply =3D cmd.allow_stop_reply;
        return 0;

And then just annotate the command table entries for commands that
explicitly allow it.

>=20=20
>  void gdb_set_stop_cpu(CPUState *cpu)
> @@ -2821,8 +2821,14 @@ void gdb_set_stop_cpu(CPUState *cpu)
>  }
>=20=20
>  #ifndef CONFIG_USER_ONLY
> +static inline bool char_in(char c, const char *str)
> +{
> +    return strchr(str, c) !=3D NULL;
> +}
> +

We can then drop this.

>  static void gdb_vm_state_change(void *opaque, bool running, RunState sta=
te)
>  {
> +    const char *cmd =3D gdbserver_state.last_cmd;
>      CPUState *cpu =3D gdbserver_state.c_cpu;
>      g_autoptr(GString) buf =3D g_string_new(NULL);
>      g_autoptr(GString) tid =3D g_string_new(NULL);
> @@ -2843,6 +2849,18 @@ static void gdb_vm_state_change(void *opaque, bool=
 running, RunState state)
>          return;
>      }
>=20=20
> +    /*
> +     * We don't implement notification packets, so we should only send a
> +     * stop-reply in response to a previous GDB command. Commands that a=
ccept
> +     * stop-reply packages are: C, c, S, s, ?, vCont, vAttach, vRun, and
> +     * vStopped. We don't implement vRun, and vStopped. For vAttach and =
?, the
> +     * stop-reply is already sent from their respective cmd handler func=
tions.
> +     */
> +    if (gdbserver_state.state !=3D RS_IDLE || /* still parsing the cmd */
> +        !(startswith(cmd, "vCont;") || (strlen(cmd) =3D=3D 1 && char_in(=
cmd[0], "cCsS")))) {
> +        return;
> +    }
> +

Then this becomes a simple test of

       if (!gdbserver_state.allow_stop_reply) {
          return;
       }

>      gdb_append_thread_id(cpu, tid);
>=20=20
>      switch (state) {
> @@ -3130,11 +3148,14 @@ static void gdb_read_byte(uint8_t ch)
>                  reply =3D '-';
>                  put_buffer(&reply, 1);
>                  gdbserver_state.state =3D RS_IDLE;
> +                gdbserver_state.last_cmd[0] =3D '\0';
>              } else {
>                  /* send ACK reply */
>                  reply =3D '+';
>                  put_buffer(&reply, 1);
> -                gdbserver_state.state =3D gdb_handle_packet(gdbserver_st=
ate.line_buf);
> +                strcpy(gdbserver_state.last_cmd, gdbserver_state.line_bu=
f);
> +                gdbserver_state.state =3D RS_IDLE;
> +                gdb_handle_packet(gdbserver_state.line_buf);
>              }
>              break;
>          default:

Please post the next revision as a standalone patch rather than a reply
to previous versions. It tends to confuse tooling.

Thanks,

--=20
Alex Benn=C3=A9e

