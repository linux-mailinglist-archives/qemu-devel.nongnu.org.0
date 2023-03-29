Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCCF6CF016
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:05:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZDH-0005m3-IU; Wed, 29 Mar 2023 13:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phZDD-0005lM-Rs
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:03:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phZDB-0004Ie-Kg
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:03:51 -0400
Received: by mail-wm1-x329.google.com with SMTP id o32so9370477wms.1
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680109427;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JoCrTUdZjzUijMj/c+a1FP5B9Y/v4/IGP4XB7rcbrc0=;
 b=uk6EotQL5Koc1cIAGYkRzx0kDSVhAH1BCMWO3PtgE+ovDWfaW3Oqb/FNM23v+oSXxM
 VOgHV0QN1ZbdmE/+LEH+Gy4mA6lbGKdtXZTmJnCLUJBDR2k85Cc7+uMmdEFwSGDZZ6tH
 w8sM/9o5tTOz0frPWqyfjdbh8z07XPTPbXDuXZpktsex1lENLzRwIsWCdgSZDg+xwy+s
 qYUkGEZqd2cY7Dg6vOtv2AH992duDkEDFfyLdAvAE/01S/n8PUmJcEYfU4/XDQ5aB8qb
 wC9peOMEoIjfo/t4LVisWKz+DBEfZzJv/YjVYvrW+VETHZw/e2W5lVjTHbQud17RigYi
 h5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680109427;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JoCrTUdZjzUijMj/c+a1FP5B9Y/v4/IGP4XB7rcbrc0=;
 b=Y2YWpHmRFbkbyHUy/RBy4b2dtXazUbbm5/IYCOXOImvccIO7tEHZ5G1icROSbi02k6
 l4wCZ0FUyxZxnfKQoYSGwJ5lASa6sfCr78zXyinVHfPo7ddQfOlEDwLXdDn6YasPAB9t
 v/9Eyc3gIqaqoUHM5vWv6BH92UH8OzBblGWV6KwotQd8dufMUfrK2nVys5NJXPX5N7JU
 YiNxfqcpFC5Gfy+hoCky8G4eCN4uT6u/vPXAewNT6x3At6pXxanw9mqMXpzrk9ym7d8k
 GMI0Hpq0iDfJABeDKKcAs/l3INPUAwc13Hfb3jCdKevTFrvzWU0Hy0Rnb/x1eEEq8XsA
 eQrw==
X-Gm-Message-State: AO0yUKXxp6TyLmX5yJsyg9vSn0QZd4VYkNn4t8PCLShAOHK+HvpoTaI3
 JsqhC0x6kdvTjmZWcWKlEzJWZQ==
X-Google-Smtp-Source: AK7set9tjGpXo7MbmpCzYUOLLRglhq+AKw3/bbQagqybpJ7wQBx46ui8Rcs9SYuZ86NilBiF4oSzwA==
X-Received: by 2002:a7b:c3c7:0:b0:3ed:fddf:b771 with SMTP id
 t7-20020a7bc3c7000000b003edfddfb771mr15687614wmj.12.1680109427478; 
 Wed, 29 Mar 2023 10:03:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d6903000000b002e105c017adsm7189842wru.44.2023.03.29.10.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:03:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC4691FFB7;
 Wed, 29 Mar 2023 18:03:46 +0100 (BST)
References: <20230329161852.84992-1-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] gdbstub: Only build libgdb_user.fa / libgdb_softmmu.fa
 if necessary
Date: Wed, 29 Mar 2023 18:03:40 +0100
In-reply-to: <20230329161852.84992-1-philmd@linaro.org>
Message-ID: <87bkkbqykt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> It is pointless to build libgdb_user.fa in a system-only build
> (or libgdb_softmmu.fa in a user-only build). Besides, in some
> restricted build configurations, some APIs might be restricted /
> not available. Example in a KVM-only builds where TCG is disabled:
>
>   $ ninja qemu-system-x86_64
>   [99/2187] Compiling C object gdbstub/libgdb_user.fa.p/user.c.o
>   FAILED: gdbstub/libgdb_user.fa.p/user.c.o
>   ../../gdbstub/user.c: In function =E2=80=98gdb_breakpoint_insert=E2=80=
=99:
>   ../../gdbstub/user.c:438:19: error: implicit declaration of function =
=E2=80=98cpu_breakpoint_insert=E2=80=99; did you mean =E2=80=98gdb_breakpoi=
nt_insert=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>     438 |             err =3D cpu_breakpoint_insert(cpu, addr, BP_GDB, NU=
LL);
>         |                   ^~~~~~~~~~~~~~~~~~~~~
>         |                   gdb_breakpoint_insert
>   ../../gdbstub/user.c:438:19: error: nested extern declaration of
> =E2=80=98cpu_breakpoint_insert=E2=80=99 [-Werror=3Dnested-externs]
>   ../../gdbstub/user.c: In function =E2=80=98gdb_breakpoint_remove=E2=80=
=99:
>   ../../gdbstub/user.c:459:19: error: implicit declaration of function
> =E2=80=98cpu_breakpoint_remove=E2=80=99; did you mean =E2=80=98gdb_breakp=
oint_remove=E2=80=99?
> [-Werror=3Dimplicit-function-declaration]
>     459 |             err =3D cpu_breakpoint_remove(cpu, addr, BP_GDB);
>         |                   ^~~~~~~~~~~~~~~~~~~~~
>         |                   gdb_breakpoint_remove
>   ../../gdbstub/user.c:459:19: error: nested extern declaration of =E2=80=
=98cpu_breakpoint_remove=E2=80=99 [-Werror=3Dnested-externs]
>   cc1: all warnings being treated as errors
>   ninja: build stopped: subcommand failed.
>
> Fixes: 61b2e136db ("gdbstub: only compile gdbstub twice for whole build")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Queued to for-8.0/more-misc-fixes, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

