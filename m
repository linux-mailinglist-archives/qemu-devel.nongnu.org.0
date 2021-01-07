Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CC32ED463
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:33:44 +0100 (CET)
Received: from localhost ([::1]:43266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxYEJ-0005cV-90
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxYBK-0004f8-Fr
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:30:38 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxYB6-0001G6-Bs
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:30:37 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a12so6217157wrv.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hQj5SWk54v2v36MN6YcP1coe1ruw8gv4D2qAb1jkwnI=;
 b=Y54J9PSZnakYXNCpKUc8F1ZKujzIZuQVSNDClTB4nRFhd9AurR0Jf7EVa8SpOD7Ifm
 kVpEfi/mfoAvSSS7/wA05ZP4jVJWYcoCp2mnkzza69mbOa5TtwHK+bqXyGUfSa9pOQ8f
 +M1pqU1pKro9D4ZeBGhe+y6d+vSua/I4Kc4QTrTrakqB/Xyv3MxuiAiHBlC9ajpqLZOf
 5sOU61CeIeHnhQw6pX/Y8CKr/xi0F1mZsdm1c0qCTpEvDrZbRZYMwSHXaAFJ+Eco/YVd
 H8scysWNW+D3mZXZGKtnFU1LJJjxE8dLUQhmJEV23zgDMgbY/ktG35EUro3itQxS5hLp
 sx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hQj5SWk54v2v36MN6YcP1coe1ruw8gv4D2qAb1jkwnI=;
 b=Y0vthVfxd4mVKPhFsULQmN9w3atXOzT2wJM5lDaC/b/+7AORNvb13621yShqkdN0qc
 32OLSDS0BDtNwdAdkhdJ0sd0/p6diXChgJ1qO6YVFMvQYwX0BiGNIY5pYPpjP7U6E+pi
 xysI24lMX7/sYcNRKHSRKEhG0jhYciPtkrAaISziWwx7Gmj/ynv3GJqz+uY+7cX8dMeZ
 Yqepzo7eADRZGmYWok2MxmLia7Kg86HNhA3Hjuyh4eHEdqKrk11WLfmTvx/sGm11snLw
 ZxHfpfD8B71zrNbeQNcC+3UWQaaQySyUnkZhwZD/Weu60IgeF4xEwlRiRMXBsgJi8PDW
 WsoA==
X-Gm-Message-State: AOAM530ZMvaV+3ADPTbrR+UElNzjP+IoRnLLaOxRW2cezHW+OnX4iRPD
 f+HiG5ISVscGyQbFnemn80wBqiA7R4K/xg==
X-Google-Smtp-Source: ABdhPJzhgCXcc00gaeTpS/zMFpLNK/S3TvE0b1vVWp11tBGJ05mBPM9HEYFPu0JHSOGNtY4YrZ68mw==
X-Received: by 2002:a05:6000:14b:: with SMTP id
 r11mr9946094wrx.53.1610037019685; 
 Thu, 07 Jan 2021 08:30:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t1sm9837214wro.27.2021.01.07.08.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 08:30:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0DA11FF7E;
 Thu,  7 Jan 2021 16:30:17 +0000 (GMT)
References: <1609963815-417989-1-git-send-email-steven.sistare@oracle.com>
 <87h7ns2a24.fsf@linaro.org>
 <363fd686-aa5f-60ea-f330-1213a32ca031@oracle.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V1] gdbstub: suspended state support
Date: Thu, 07 Jan 2021 16:02:47 +0000
In-reply-to: <363fd686-aa5f-60ea-f330-1213a32ca031@oracle.com>
Message-ID: <87eeiw1zhi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Steven Sistare <steven.sistare@oracle.com> writes:

> On 1/7/2021 7:40 AM, Alex Benn=C3=A9e wrote:
>> Steve Sistare <steven.sistare@oracle.com> writes:
>>=20
>>> Modify the gdb server so a continue command appears to resume execution
>>> when in RUN_STATE_SUSPENDED.  Do not print the next gdb prompt, but do =
not
>>> actually resume instruction fetch.  While in this "fake" running mode, a
>>> ctrl-C returns the user to the gdb prompt.
>>=20
>> What exactly is the purpose of this? To hide the details of the runstate
>> as controlled by the user? I wouldn't expect someone using gdb debugging
>> not to also have control of the HMP/QMP interface.
>
> Without this fix, a user that attaches gdb to a suspended guest breaks the
> guest.  The state is RUN_STATE_SUSPENDED.  After attaching gdb and typing
> continue or quit, qemu transitions to RUN_STATE_RUNNING (wrong) and the
> guest continues execution (wrong).  The guest loops polling on an acpi po=
rt,
> deep in a call stack under acpi_suspend_enter().  Sending a system_wakeup
> request via qmp or hmp fails with the message "Error: Unable to wake up:
> guest is not in suspended state".
>
> With the fix, the state remains RUN_STATE_SUSPENDED throughout, until the
> system_wakeup request, and the guest pc does not change.  gdb interprets=
=20
> RUN_STATE_SUSPENDED as "target is running", without causing instruction=20
> fetch to resume.
>
> If you are satisfied, I will add this explanation to the commit
> message.

I'm satisfied with the explanation going in the commit message. However
I'm not convinced the implementation of pretending we worked. I think if
we are not going to start we should probably reply with an O packet
explaining why we don't start followed by a S (stop) packet so GDB
doesn't get confused.

I would also be happier if we could add a test case that works through
all the potential state transitions so we don't have test manually (i.e.
not). I think we need at least:

   - -S -> stop -> continue -> start -> Ctrl-C
   - -S -> continue -> stop -> start -> Ctrl-C
   - Ctrl-C -> stop -> continue -> start
   - stop -> Ctrl-C -> start -> continue=20

I suspect it would need to use the acceptance tests given you'll want to
change two control points. The reverse debugging tests already do
something similar (see tests/acceptance/reverse_debugging.py).

>
> - Steve
>
>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>> ---
>>>  gdbstub.c | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/gdbstub.c b/gdbstub.c
>>> index f3a318c..2f0d9ff 100644
>>> --- a/gdbstub.c
>>> +++ b/gdbstub.c
>>> @@ -461,7 +461,9 @@ static inline void gdb_continue(void)
>>>  #else
>>>      if (!runstate_needs_reset()) {
>>>          trace_gdbstub_op_continue();
>>> -        vm_start();
>>> +        if (!runstate_check(RUN_STATE_SUSPENDED)) {
>>> +            vm_start();
>>> +        }
>>>      }
>>>  #endif
>>>  }
>>> @@ -490,7 +492,7 @@ static int gdb_continue_partial(char *newstates)
>>>      int flag =3D 0;
>>>=20=20
>>>      if (!runstate_needs_reset()) {
>>> -        if (vm_prepare_start()) {
>>> +        if (!runstate_check(RUN_STATE_SUSPENDED) && vm_prepare_start()=
) {
>>>              return 0;
>>>          }
>>>=20=20
>>> @@ -2835,6 +2837,9 @@ static void gdb_read_byte(uint8_t ch)
>>>          /* when the CPU is running, we cannot do anything except stop
>>>             it when receiving a char */
>>>          vm_stop(RUN_STATE_PAUSED);
>>> +    } else if (runstate_check(RUN_STATE_SUSPENDED) && ch =3D=3D 3) {
>>> +        /* Received ctrl-c from gdb */
>>> +        gdb_vm_state_change(0, 0, RUN_STATE_PAUSED);
>>>      } else
>>>  #endif
>>>      {
>>> @@ -3282,6 +3287,8 @@ static void gdb_sigterm_handler(int signal)
>>>  {
>>>      if (runstate_is_running()) {
>>>          vm_stop(RUN_STATE_PAUSED);
>>> +    } else if (runstate_check(RUN_STATE_SUSPENDED)) {
>>> +        gdb_vm_state_change(0, 0, RUN_STATE_PAUSED);
>>>      }
>>>  }
>>>  #endif
>>=20
>>=20


--=20
Alex Benn=C3=A9e

