Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2974D1628
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:22:33 +0100 (CET)
Received: from localhost ([::1]:43186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXvE-0005RY-Do
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:22:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRXsI-0002uT-0Y
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:19:30 -0500
Received: from [2a00:1450:4864:20::332] (port=41948
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRXsF-0002xQ-Pd
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:19:29 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so1277513wmf.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=i3zhL3Mz9ZuH/lSUEsuZee8ZWW2W9RpZXNfsLPcgN3Q=;
 b=dzoD6pzrJdaoOElCx7lpBrgXaBJmvJWYUgr0MKPiH1lOX7vcwptAIdiHtUdaXkDhC4
 HkuSYp8LfxTtq0ocAyHisEvRPcnbHM4kN507bYG8NuF9YJ6MBLCzJRFM37nYtb+B1qSm
 noIIbLQQZrsAWR6FbW0CVZXpFGWZ4Nzub4xU/XXxlDbEh37SYsRMrwCPZNd8Etn9v1bk
 RaGPiI2ExVxSkcPA8agiBz8vjF9spBNCNQ6p/ZS4Ztpm8N+WkEqIo9vxcfYczRbq6vW6
 ++0fIM9otpA70WmXiTI2JmaxTUmsEJO8EKyswaI8Qbjy0QPyPkhVPvEQ/mZF8mEGqddO
 E4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=i3zhL3Mz9ZuH/lSUEsuZee8ZWW2W9RpZXNfsLPcgN3Q=;
 b=2AyjObZcw9fmFfGjt2EJx8SZxlfyvZHRKqww5psaWPd4ZoCMKIdAfr087ReGV9VG5E
 OOTSjFLC1qpo9NkojZZHWYY0UuvimLTZW3jik+LMCFYlyXTz7PyKTSfgR2MsecxAA3XQ
 JJ/qIa2FQ/W9FAqcNnHhOEb0HFEfaAdK67efd/mGpJXQe4sRq9VEQE3SuH7OvriC1HQL
 +1iwQOMKhxU2XWYFGa12JcLqMOhsd2PKQ7+1BggjOD1BLMKBHZF1Ux0TM73u39AJicDf
 9hJKmknzEnz2Van73RvsfGMk8zJGY4TDwKKJbQgXAM5OTAN22efA3WLVgHlcNYjfDdm4
 LW9A==
X-Gm-Message-State: AOAM532U8VtciTvfd2w+XSnbnU8gqYSt//VESbbIFRm4yuPj4S8VD12r
 WsnACt+7a52xDyyO680LjKmW7w==
X-Google-Smtp-Source: ABdhPJxV2REXrBBaJF8puV0E6/OxzTBA+fex9VRCMVI81IZkuzosXCswC6HsBoo7BLhNSBSiQjyf0w==
X-Received: by 2002:a05:600c:4fcb:b0:389:a82b:8f8a with SMTP id
 o11-20020a05600c4fcb00b00389a82b8f8amr3022948wmq.167.1646738365978; 
 Tue, 08 Mar 2022 03:19:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm2500504wmb.1.2022.03.08.03.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:19:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 487C81FFB7;
 Tue,  8 Mar 2022 11:19:24 +0000 (GMT)
References: <20220221030910.3203063-1-dominik.b.czarnota@gmail.com>
 <87ilsvi5a7.fsf@linaro.org>
 <CABEVAa3-JrLpNgYo0yhKPJ7h-P9u_x-K035MrjOJ=nO57HH8Zw@mail.gmail.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dominik Czarnota <dominik.b.czarnota@gmail.com>
Subject: Re: [PATCH] gdbstub.c: add support for info proc mappings
Date: Tue, 08 Mar 2022 11:06:59 +0000
In-reply-to: <CABEVAa3-JrLpNgYo0yhKPJ7h-P9u_x-K035MrjOJ=nO57HH8Zw@mail.gmail.com>
Message-ID: <87cziwg08z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Dominik Czarnota <dominik.b.czarnota@gmail.com> writes:

> Hey,
>
> I may work on this next week but I will probably not make it until the 8t=
h :(.
>
> On Thu, 3 Mar 2022 at 13:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Disconnect3d <dominik.b.czarnota@gmail.com> writes:
>>
>> > This commit adds support for `info proc mappings` and a few other comm=
ands into
>> > the QEMU user-mode emulation gdbstub.
>> >
>> > For that, support for the following GDB remote protocol commands has b=
een added:
>> > * vFile:setfs: pid
>> > * vFile:open: filename, flags, mode
>> > * vFile:pread: fd, count, offset
>> > * vFile:close: fd
>> > * qXfer:exec-file:read:annex:offset,length
>> >
<snip>
>> > +/*
>> > + *  Set to 1 to enable remote protocol debugging output. This output =
is similar
>> > + *  to the one produced by the gdbserver's --remote-debug flag with s=
ome
>> > + *  additions. Anyway, the main debug prints are:
>> > + * - getpkt ("...") which refers to received data (or, send by the GD=
B client)
>> > + * - putpkt ("...") which refers to sent data
>> > + */
>> > +#define ENABLE_REMOTE_DEBUG 0
>> > +
>> > +#if ENABLE_REMOTE_DEBUG
>> > +#define REMOTE_DEBUG_PRINT printf
>> > +#else
>> > +#define REMOTE_DEBUG_PRINT(...)
>> > +#endif
>>
>> We don't need this. The rest of the gdbstub has been instrumented with
>> tracepoints (try -d trace:gdbstub\* in your command line). See trace-eve=
nts.
>>
>
> It would be convenient to support the gddbserver's --remote-debug flag
> but I understand it may not be wanted as it also means additional &
> unnecessary code in a production binary.
> I will remove this.

If you think the debug information will be useful by all means convert
the bits you need to tracepoints.=20

>
>> > +
>> >  static inline int target_memory_rw_debug(CPUState *cpu, target_ulong =
addr,
>> >                                           uint8_t *buf, int len, bool =
is_write)
>> >  {
>> > @@ -554,6 +573,7 @@ static int gdb_continue_partial(char *newstates)
>> >
>> >  static void put_buffer(const uint8_t *buf, int len)
>> >  {
>> > +    REMOTE_DEBUG_PRINT("putpkt (\"%.*s\");\n", len, buf);
>> >  #ifdef CONFIG_USER_ONLY
>> >      int ret;
>> >
>> > @@ -1982,6 +2002,157 @@ static void handle_v_kill(GArray *params, void=
 *user_ctx)
>> >      exit(0);
>> >  }
>> >
>> > +#ifdef CONFIG_USER_ONLY
>> > +/*
>> > + * Handles the `vFile:setfs: pid` command
>> > + *
>> > + * Example call: vFile:setfs:0
>> > + *
>> > + * --- From the GDB remote protocol documentation ---
>> > + * Select the filesystem on which vFile operations with filename argu=
ments
>> > + * will operate. This is required for GDB to be able to access files =
on
>> > + * remote targets where the remote stub does not share a common files=
ystem with
>> > + * the inferior(s). If pid is nonzero, select the filesystem as seen =
by process
>> > + * pid. If pid is zero, select the filesystem as seen by the remote s=
tub.
>> > + * Return 0 on success, or -1 if an error occurs. If vFile:setfs: ind=
icates
>> > + * success, the selected filesystem remains selected until the next s=
uccessful
>> > + * vFile:setfs: operation.
>> > +*/
>> > +static void handle_v_setfs(GArray *params, void *user_ctx)
>> > +{
>> > +    /*
>> > +     * We do not support different filesystem view for different pids
>> > +     * Return that all is OK, so that GDB can proceed
>> > +     */
>> > +    put_packet("F0");
>> > +}
>> > +
>> > +/*
>> > + * Handle the `vFile:open: filename, flags, mode` command
>> > + *
>> > + * We try to serve the filesystem here from the inferior point of view
>> > +
>> > + * Example call: vFile:open:6a7573742070726f62696e67,0,1c0
>> > + * (tries to open "just probing" with flags=3D0 mode=3D448)
>> > + *
>> > + * --- From the GDB remote protocol documentation ---
>> > + * Open a file at filename and return a file descriptor for it, or re=
turn
>> > + * -1 if an error occurs. The filename is a string, flags is an integ=
er
>> > + * indicating a mask of open flags (see Open Flags), and mode is an i=
nteger
>> > + * indicating a mask of mode bits to use if the file is created
>> > + * (see mode_t Values). See open, for details of the open flags and m=
ode
>> > + * values.
>> > + */
>> > +static void handle_v_file_open(GArray *params, void *user_ctx)
>> > +{
>> > +    uint64_t flags =3D get_param(params, 1)->val_ull;
>> > +    uint64_t mode =3D get_param(params, 2)->val_ull;
>> > +    const char *hex_filename =3D get_param(params, 0)->data;
>> > +
>> > +    /* Decode the filename & append a null byte so we can use it late=
r on */
>> > +    hextomem(gdbserver_state.mem_buf, hex_filename, strlen(hex_filena=
me));
>> > +    const char *null_byte =3D "\0";
>> > +    g_byte_array_append(gdbserver_state.mem_buf, (const guint8 *)null=
_byte, 1);
>> > +
>> > +    const char *filename =3D (const char *)gdbserver_state.mem_buf->d=
ata;
>> > +
>> > +    REMOTE_DEBUG_PRINT("vFile:open: filename=3D\"%s\" flags=3D%ld mod=
e=3D%ld\n",
>> > +                       filename, flags, mode);
>> > +
>> > +    /*
>> > +     * On Linux we call the do_openat syscall on behalf of the inferi=
or as it
>> > +     * handles special filepaths properly like the /proc/$pid files, =
which are
>> > +     * fetched by GDB for certain info (such as `info proc mappings`).
>> > +     */
>>
>> This sounds like a massive security hole to introduce without a
>> specific flag the user can explicitly enable. Semihosting has a similar
>> facility but also needs explicit configuration. Can we add a property to
>> the -gdb command line option to enable this:
>>
>>   -gdb tcp::1234,hostio=3Don
>>
>> ?
>
> It is, but should we really care? Both the execution and debugging of
> qemu-user emulation
> does not protect the host from arbitrary code execution and the
> proposed hostio=3Don flag will
> only make things less convenient and many people will just not use it
> due to not knowing that
> it exists.

Sure - but we are adding potential unexpected behaviour via the debug
stub not the guest program. The user may (although probably not) have
audited the binary they are running without realising the attack vector
the gdbstub introduces.

That said I take your point it's not super different from running
arbitrary guest code in linux-user. I think for system emulation this
functionality should definitely be an opt-in though.

Can we at least document the capability and potential security issues in
docs/system/gdb.rst?
>> > --- a/linux-user/syscall.c
>> > +++ b/linux-user/syscall.c
>> > @@ -8233,7 +8233,7 @@ static int open_hardware(void *cpu_env, int fd)
>> >  }
>> >  #endif
>> >
>> > -static int do_openat(void *cpu_env, int dirfd, const char *pathname, =
int flags, mode_t mode)
>> > +int do_openat(void *cpu_env, int dirfd, const char *pathname, int
>> > flags, mode_t mode)
>>
>>
>> I wonder if this should be renamed to make the sense more clear?
>>
>> do_guest_openat? do_filtered_openat?
>>
>
> We can do, but its already in linux-user/syscall.c and I believe all
> syscalls there are executed
> "on behalf of guest".

Yes - but now you are exposing it to the wider qemu code base so a more
definitive name will prevent accidental misuse elsewhere.

>
>> >  {
>> >      struct fake_open {
>> >          const char *filename;
>>
>> Otherwise it looks fine. Do you have time to re-spin? I would need to
>> post a pull request with it by the 8th to make 7.0.
>>
>> --
>> Alex Benn=C3=A9e
>
> Thanks,
> Dominik 'disconnect3d' Czarnota


--=20
Alex Benn=C3=A9e

