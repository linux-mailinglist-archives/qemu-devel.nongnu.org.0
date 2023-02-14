Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E1E695FE0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRs0x-0007jJ-7l; Tue, 14 Feb 2023 04:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRs0d-0007gS-WA
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:54:00 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRs0c-0001kJ-4x
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:53:59 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so11095738wms.1
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 01:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvGyRyg+zXijT0rF1O1fhyr11UchgNhsT0YBka4ihbY=;
 b=sLQnhF7xqNNAWOdsWfngaG3Jl1hJewlqS3jy+ZQ7cj47NZv/VHYiReq9ED8V40Mj+T
 2wyIJXTzvy53fAiAY7/SQ4VLcf/7vVx6h3j6y0pncC0Z7gDhE3QQGG/fAuphYmBJXcs9
 agK5ACE89TYA1ykm40ssWW08WELsD0W2q48e+nPiqgtfxtpyAxnPmHBAGU8q9cWOw/WW
 mMwHgfYN3N0oyJNR4s6KgY3496gp/5mcLaj/rVRIh8cx8eTS3LfoyL0nau0FOvDvkKOy
 WpzvpDp66O35PJBQxnFKpq9dyqn1TmwQV6uVx3lDnRkKTV/uIuKlj8W27kgJ6B4n3tY2
 xUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xvGyRyg+zXijT0rF1O1fhyr11UchgNhsT0YBka4ihbY=;
 b=JIKuN6ICBdQnAOx7ZPggaH5VL1lPVozZPnSOrciOELXXJFrwKx606V3QTxgqCKtcnp
 F7MlGTUj72MWYCBSS40pVjHIutrAa18BKfZW+RBhZfHFyFG6QqlxK1K8FhHEPWWda8sP
 87ZhIHbeG6z2urPPB/+vSk6yC+HcH6LPGO7eGsbvWGi/xbyo9+zvUp7HhoDFFbYtu2fK
 XhaimvLwKutFAzPTCJ/Ygx45af8HQ8HCLRuMcbB3VsJ4ZIoS9+9SSwERVom+AnQAxQxd
 To9sVWu5E5W7yrKNfStXABHUX2Sn96vTKKgJnrVmTCwyy6mqF8/d/ov25dLNNz1SPt7B
 mgwQ==
X-Gm-Message-State: AO0yUKUbOkS5wJSZom+x+dfO0g0Yc1PJfSTor9G+ZahHxVRm1y6Nf/sK
 6lH8CncUa3kOKQqouuELS/cVww==
X-Google-Smtp-Source: AK7set9Cp+TFNjz/4TQ0caOD5XQczArXPFPeVlHl3vCzJcT21bxSInwR6k6byqXf+XcaCD80lwxzyA==
X-Received: by 2002:a05:600c:2ac8:b0:3df:f2a5:49e0 with SMTP id
 t8-20020a05600c2ac800b003dff2a549e0mr2096183wme.40.1676368436079; 
 Tue, 14 Feb 2023 01:53:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c348100b003db0ee277b2sm20089050wmq.5.2023.02.14.01.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 01:53:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36BDC1FFB7;
 Tue, 14 Feb 2023 09:53:55 +0000 (GMT)
References: <20230213125238.331881-1-iii@linux.ibm.com>
 <20230213125238.331881-5-iii@linux.ibm.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier
 <laurent@vivier.eu>, qemu-devel@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Subject: Re: [PATCH v2 4/4] tests/tcg/linux-test: Add linux-fork-trap test
Date: Tue, 14 Feb 2023 09:51:31 +0000
In-reply-to: <20230213125238.331881-5-iii@linux.ibm.com>
Message-ID: <878rh0bmj0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Check that dying due to a signal does not deadlock.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/multiarch/linux/linux-fork-trap.c | 48 +++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c
>
> diff --git a/tests/tcg/multiarch/linux/linux-fork-trap.c b/tests/tcg/mult=
iarch/linux/linux-fork-trap.c
> new file mode 100644
> index 00000000000..a921f875380
> --- /dev/null
> +++ b/tests/tcg/multiarch/linux/linux-fork-trap.c
> @@ -0,0 +1,48 @@
> +/*
> + * Test that a fork()ed process terminates after __builtin_trap().
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include <assert.h>
> +#include <stdlib.h>
> +#include <sys/resource.h>
> +#include <sys/wait.h>
> +#include <unistd.h>
> +
> +int main(void)
> +{
> +    struct rlimit nodump;
> +    pid_t err, pid;
> +    int wstatus;
> +
> +    pid =3D fork();
> +    assert(pid !=3D -1);
> +    if (pid =3D=3D 0) {
> +        /* We are about to crash on purpose; disable core dumps. */

I think we could benefit from two printfs in the test so the following:

  =E2=9E=9C  ./qemu-aarch64 ./tests/tcg/aarch64-linux-user/linux-fork-trap=
=20
  qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
  =F0=9F=95=9909:50:14 alex@zen:qemu.git/builds/arm.all  on =EE=82=A0 testi=
ng/next [$!?]=20
  =E2=9E=9C  echo $status
  0

is a little less confusing.

> +        if (getrlimit(RLIMIT_CORE, &nodump)) {
> +            return EXIT_FAILURE;
> +        }
> +        nodump.rlim_cur =3D 0;
> +        if (setrlimit(RLIMIT_CORE, &nodump)) {
> +            return EXIT_FAILURE;
> +        }
> +        /*
> +         * An alternative would be to dereference a NULL pointer, but th=
at
> +         * would be an UB in C.
> +         */

 printf("about to trigger fault...\n");

> +#if defined(__MICROBLAZE__)
> +        /*
> +         * gcc emits "bri 0", which is an endless loop.
> +         * Take glibc's ABORT_INSTRUCTION.
> +         */
> +        asm volatile("brki r0,-1");
> +#else
> +        __builtin_trap();
> +#endif
> +    }
> +    err =3D waitpid(pid, &wstatus, 0);
> +    assert(err =3D=3D pid);
> +    assert(WIFSIGNALED(wstatus));
> +

  printf("faulting thread exited cleanly\n");

Othwerwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>



> +    return EXIT_SUCCESS;
> +}


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

