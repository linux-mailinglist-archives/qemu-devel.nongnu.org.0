Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C696603AB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 16:46:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDou0-0005Px-GO; Fri, 06 Jan 2023 10:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDotx-0005P0-62
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:45:01 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDotv-0000Z4-F5
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:45:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h16so1598985wrz.12
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 07:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JBax4Ap1grJMHOujTPX1wX/nAmUfPjyp/4vKgwGAREs=;
 b=UXBPPfDZdackrddCwDiDe0qMREq3BhVNNHtvUPeWA1aQMcDerfvZUbT8A9/VseGXFC
 untgX8u7oSZjp9LKhvhjfEe5nghyMzrRKQ7gsuonobKWhfxGWPrQWAB9kvQABPJqoXmV
 yFPsfKRG5FzRHeXRs1By/eGqBLCHKLIiXuMruaHvSn+tmSJOm1dYDTdUsxloenJtPOL3
 7NLiB3QDq5ioRk6Yndb/tkajJYg+XHvArQ5mS4+rLYWWfojMEyANnv9Wphg5zHVHwKAA
 S1vQZHr6HFS1F4jqP4S1LMIhkavt12OSMtDYKfXmkSc0Txhra4F7k0pbVz7eMZVGI9PO
 BFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JBax4Ap1grJMHOujTPX1wX/nAmUfPjyp/4vKgwGAREs=;
 b=jcjAI/r1IjNNoMDJxR1r2I9AsZ+tVM/gBdA0xBdB02S4g1nEkao/0opdaT1GHICHeE
 ZGuVJftlGYWj1Apg4S5PE5/eGSWbSy4hx2KecqTsf4r74pQahSzWbOfwR2Az3V2v803p
 nxVO9EWo61erQE31C26lLw3UXzIGkWpju+rI8vkGUUUUtVRBGzIN5f1mOZG77xnYiaUI
 ZVZeBy1qrdBwIhQBiN8A+Lze/0pgLBaiLNkNqURNNNCuXNNjVhs7WDxV/BGnAvpxmVpw
 5sdit8xY++xVoHQazbscrnOZT/sLy0oNNx4qf79nWetAN2BN2hiY1dxiwlS6hI1wsRqp
 18uw==
X-Gm-Message-State: AFqh2koAfpgPSbgDIW4hl9JZ85Krv+K7yVYHe8RVB8k7CvovCHgiV3XZ
 8oNlT1JeWfPwx/CKJc/EUi9v2A==
X-Google-Smtp-Source: AMrXdXtIdh+HSRPwu8N5JiTejEPljPr0JVtX5oR7/wvIshYmfqm8L8CtdEDY+LUA55T2s8QpHLxYFQ==
X-Received: by 2002:adf:e883:0:b0:254:e300:df10 with SMTP id
 d3-20020adfe883000000b00254e300df10mr34934303wrm.0.1673019897437; 
 Fri, 06 Jan 2023 07:44:57 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j3-20020adfea43000000b00241b5af8697sm1507516wrn.85.2023.01.06.07.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 07:44:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5829B1FFB7;
 Fri,  6 Jan 2023 15:44:56 +0000 (GMT)
References: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
 <CAFEAcA-z7+X9-c43EmhoRBTrOYC9RtyHc5sgPamGRd_o+-tT_Q@mail.gmail.com>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-devel@nongnu.org,
 bmeng.cn@gmail.com, philmd@linaro.org
Subject: Re: [PATCH v2] semihosting: add O_BINARY flag in host_open for NT
 compatibility
Date: Fri, 06 Jan 2023 15:33:12 +0000
In-reply-to: <CAFEAcA-z7+X9-c43EmhoRBTrOYC9RtyHc5sgPamGRd_o+-tT_Q@mail.gmail.com>
Message-ID: <871qo7pszr.fsf@linaro.org>
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 6 Jan 2023 at 10:21, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
>>
>> Windows open(2) implementation opens files in text mode by default and
>> needs a Windows-only O_BINARY flag to open files as binary. QEMU already
>> knows about that flag in osdep and it is defined to 0 on non-Windows,
>> so we can just add it to the host_flags for better compatibility.
>>
>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> ---
>>  semihosting/syscalls.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
>> index 508a0ad88c..b621d78c2d 100644
>> --- a/semihosting/syscalls.c
>> +++ b/semihosting/syscalls.c
>> @@ -253,7 +253,7 @@ static void host_open(CPUState *cs, gdb_syscall_comp=
lete_cb complete,
>>  {
>>      CPUArchState *env G_GNUC_UNUSED =3D cs->env_ptr;
>>      char *p;
>> -    int ret, host_flags;
>> +    int ret, host_flags =3D O_BINARY;
>
> The semihosting API, at least for Arm, has a modeflags string so the
> guest can say whether it wants to open O_BINARY or not:
> https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.=
rst#sys-open-0x01
>
> So we need to plumb that down through the common semihosting code
> into this function and set O_BINARY accordingly. Otherwise guest
> code that asks for a text-mode file won't get one.

We used to, in fact we still have a remnant of the code where we do:

  #ifndef O_BINARY
  #define O_BINARY 0
  #endif

I presume because the only places it exists in libc is wrapped in stuff
like:

  #if defined (__CYGWIN__)
  #define O_BINARY	_FBINARY

So the mapping got removed in a1a2a3e609 (semihosting: Remove
GDB_O_BINARY) because GDB knows nothing of this and as far as I can tell
neither does Linux whatever ISO C might say about it.

Is this a host detail leakage to the guest? Should a semihosting app be
caring about what fopen() modes the underlying host supports? At least a
default O_BINARY for windows is most likely to DTRT.

> I don't know about other semihosting APIs, so those would need
> to be checked to see what they should do.
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

