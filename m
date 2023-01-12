Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9782667154
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:53:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFw97-0002YE-Nm; Thu, 12 Jan 2023 06:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFw8U-0002XE-QM
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:52:48 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFw8S-0000wB-Mf
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 06:52:46 -0500
Received: by mail-wr1-x42b.google.com with SMTP id k8so3324465wrc.9
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 03:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8KPkZOSMXjvN7TBaiDmQ5JbiKxGp6upW7imILa9zOc=;
 b=jsGwlIPEovBYqiZ045BrVH3UFzYIAg6Af9OMTMT/HdQJH0mJLAnPZSMG5QJ2UlE3P1
 3cXw7tXbgWXTU9YNXtPQJlgqsSG0E2ekJS5NQMeixY4DcVY0CaYwatVmYREzgit1q5em
 7SgNHX/sAHVzJf8ekRpEtjXK2ikCSutXgk9FFMuC4SVuFhLcXaHtxLyuwcpyed0FFIoD
 0yMlnjT7uOBsBmpqktg95tFjzOUfAnW23lAxTC3uXabMWeOToDiSrRoymT5/sInCpY9Y
 71NnfYm2lf1vIPK8xDD/75yIvbcEWzqUHOlnd45fpI90EpPZgmmRw9l2XUMsPv6d0e4Y
 So6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p8KPkZOSMXjvN7TBaiDmQ5JbiKxGp6upW7imILa9zOc=;
 b=qfiJ8f3MIoS6oDJApI4+ETlKeNYlj6TjN6VTz5oecUggHBJJa0IYCWHQjXsTvCBPwH
 CCYC4YbklYpzYC+9O6F2+0iQoaXhVoBLI9KbDz9VnnC3GJ9peigHwFvnEffSbsDrYAEm
 bPdUEVm/hQyokESa1sBx/q86XPudFgOe+2tIXj7EKgXZiNyTe1jSjbwbeZcY63T8NIVB
 Wo9oNKTrbhgGfn/DwKM7s6Ou90SA8xgmqd+/vO8kIwVZPYsb8k5DcePLh8YX5WwjQ4dA
 d9I/QHdjR1nHnw1+3HI0md0tLeyIZlYNa94hbMiD0tXDodU7Q1awGZEHizgO+HkJIBwJ
 HCtw==
X-Gm-Message-State: AFqh2kpm6XeW6Nid9+2qWR7YugsSzqLc7rZgEmIVMnCX9d3I29jolHDy
 6E4xPuou5I9p5ikp9JQaKVDoCXbZw2y/ekW0
X-Google-Smtp-Source: AMrXdXsSrGSu+JBIbhhRgmLfuzMKI4A6D79qJFokKTl55SwvvsrisK05Pm9rK8jftSZCuiYJiBtazQ==
X-Received: by 2002:a5d:5a19:0:b0:242:1ef7:9ad5 with SMTP id
 bq25-20020a5d5a19000000b002421ef79ad5mr54254247wrb.68.1673524361881; 
 Thu, 12 Jan 2023 03:52:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bo30-20020a056000069e00b0027a57c1a6fbsm16423498wrb.22.2023.01.12.03.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 03:52:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D69391FFB7;
 Thu, 12 Jan 2023 11:52:40 +0000 (GMT)
References: <fe28e3b9-631c-ddaf-485d-fae345d58d1a@windriver.com>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: He Zhe <zhe.he@windriver.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: qemu-system-i386 and general protection
Date: Thu, 12 Jan 2023 11:48:43 +0000
In-reply-to: <fe28e3b9-631c-ddaf-485d-fae345d58d1a@windriver.com>
Message-ID: <87k01sm0l3.fsf@linaro.org>
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


He Zhe <zhe.he@windriver.com> writes:

(Cc: Paolo)

> Hi All,
>
> We are experiencing a general protection fault with qemu-system-i386 as f=
ollow.
> This can be reproduced with kernel v5.15 and latest v6.2-rc3 as we found =
so far.
>
> It would work well if we reverted the commit
> 2f8a21d8ff3af484a37edc8ea61d127ec1529ab5 ("target/i386: Enable AVX cpuid =
bits when using TCG")
> introduced since qemu 7.2.
>
> We also tried setting cpu to Broadwell and Icelake-Server and got the sam=
e error.
>
> ./qemu-system-i386 -object rng-random,filename=3D/dev/urandom,id=3Drng0
> -device virtio-rng-pci,rng=3Drng0 -drive
> file=3D/tmp/rootfs.ext4,if=3Dvirtio,format=3Draw -usb -device usb-tablet
> -usb -device usb-kbd=C2=A0=C2=A0 -cpu Haswell -machine q35,i8042=3Doff -s=
mp 4 -m
> 8192=C2=A0 -m 8192 -smp cpus=3D8 -serial mon:stdio -serial null -nographi=
c=C2=A0
> -kernel /tmp/bzImage -append 'root=3D/dev/vda rw=C2=A0 ip=3Ddhcp console=
=3DttyS0
> console=3DttyS1 oprofile.timer=3D1 tsc=3Dreliable no_timer_check
> rcupdate.rcu_expedited=3D1 '
>
> [=C2=A0 OK=C2=A0 ] Started System Logging Service.
> [=C2=A0 204.194033] traps: named[280] general protection fault ip:b7ef854=
5 sp:bf8d5a1c error:0
> [=C2=A0 204.198913] audit: type=3D1701 audit(1673507379.204:2):
> auid=3D4294967295 uid=3D997 gid=3D996 ses=3D4294967295 subj=3Dkernel pid=
=3D280
> comm=3D"named" ex1
> [=C2=A0 204.219923] ------------[ cut here ]------------
> [=C2=A0 204.220455] Bad FPU state detected at
> restore_fpregs_from_fpstate+0x3a/0x78, reinitializing FPU
> registers.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0
> [=C2=A0 204.221442] WARNING: CPU: 4 PID: 274 at ../arch/x86/mm/extable.c:=
127 fixup_exception+0x3f0/0x41c
> [=C2=A0 204.223147] Modules linked in:
> [=C2=A0 204.223945] CPU: 4 PID: 274 Comm: rs:main Q:Reg Not tainted 6.2.0=
-rc3 #1
> [=C2=A0 204.224769] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
> BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
> [=C2=A0 204.226061] EIP: fixup_exception+0x3f0/0x41c
> [=C2=A0 204.226533] Code: ff ff 8d 74 26 00 0f 0b ba 4c c9 dc d1 e9 10 fd
> ff ff b1 01 89 44 24 04 c7 04 24 e0 44 98 d1 88 0d 69 87 cc d1 e8 8c
> bf
> [=C2=A0 204.228038] EAX: 0000005e EBX: d1aee764 ECX: 00000027 EDX: 000000=
01
> [=C2=A0 204.228498] ESI: c18efee4 EDI: 0000000d EBP: c18efe58 ESP: c18efd=
dc
> [=C2=A0 204.229102] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: =
00000086
> [=C2=A0 204.229662] CR0: 80050033 CR2: bf8d5d54 CR3: 02aaf000 CR4: 001506=
d0
> [=C2=A0 204.230408] Call Trace:
> [=C2=A0 204.232101]=C2=A0 ? restore_fpregs_from_fpstate+0x3a/0x78
> [=C2=A0 204.232733]=C2=A0 ? __switch_to_asm+0x1c/0xe4
> [=C2=A0 204.233028]=C2=A0 ? __schedule+0x28c/0x844
> [=C2=A0 204.233362]=C2=A0 ? _raw_spin_lock+0x10/0x34
> [=C2=A0 204.233829]=C2=A0 exc_general_protection+0x81/0x340
> [=C2=A0 204.234403]=C2=A0 ? futex_wait+0xb4/0x190
> [=C2=A0 204.234818]=C2=A0 ? exc_bounds+0xa4/0xa4
> [=C2=A0 204.235054]=C2=A0 handle_exception+0x133/0x133
> [=C2=A0 204.235629] EIP: restore_fpregs_from_fpstate+0x3a/0x78

It looks like this is failing on:

/*
 * Use XRSTORS to restore context if it is enabled. XRSTORS supports compact
 * XSAVE area format.
 */
#define XSTATE_XRESTORE(st, lmask, hmask)				\
	asm volatile(ALTERNATIVE(XRSTOR,				\
				 XRSTORS, X86_FEATURE_XSAVES)		\
		     "\n"						\
		     "3:\n"						\
		     _ASM_EXTABLE_TYPE(661b, 3b, EX_TYPE_FPU_RESTORE)	\
		     :							\
		     : "D" (st), "m" (*st), "a" (lmask), "d" (hmask)	\
		     : "memory")

possibly triggering an exception when doing XRSTORS (but its hard to
follow the alternative code). The xrstors instruction is tested by
check-tcg but maybe there is a kernel mode subtly that is missed.

Hopefully Paolo can see better than me.

> [=C2=A0 205.769853] EIP: entry_SYSENTER_32+0xe0/0xf1
> [=C2=A0 205.769887] Code: 8b 54 24 30 8b 4c 24 3c 8e 64 24 24 5b 83 c4 08
> 5e 5f 5d 89 c4 eb 0b 0f 20 d8 0d 00 10 00 00 0f 22 d8 0f ba 34 24 09
> 96
> [=C2=A0 205.769913] EAX: 00000000 EBX: 012b373c ECX: b69feff0 EDX: b7f595=
49
> [=C2=A0 205.769933] ESI: 00000000 EDI: 00000000 EBP: ffffffff ESP: ff8b00=
00
> [=C2=A0 205.769952] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: =
00000282
> [=C2=A0 205.769975] CR0: 80050033 CR2: bf602e00 CR3: 02aaf000 CR4: 001506=
d0
> [=C2=A0 205.799858] systemd (1) used greatest stack depth: 5568 bytes left
> [=C2=A0 205.799994] Kernel panic - not syncing: Attempted to kill init! e=
xitcode=3D0x0000000b
> [=C2=A0 205.805801] Kernel Offset: disabled
> [=C2=A0 205.806723] ---[ end Kernel panic - not syncing: Attempted to kil=
l init! exitcode=3D0x0000000b ]---
>
> System hangs...
>
>
> Regards,
> Zhe


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

