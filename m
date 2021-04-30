Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD4036FF29
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:06:48 +0200 (CEST)
Received: from localhost ([::1]:33150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWbH-0003d7-BK
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcWCd-00061W-7U
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:41:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcWCX-0008Ec-Fl
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:41:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l189-20020a1cbbc60000b0290140319ad207so2044879wmf.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DwNDrIaY0zYMaT9qEo8qYGGeslKL3xsBdcYo991mi0M=;
 b=zFdGr3xwH8VbWWvzg6dV2p4Maz1QLv6NbXPnJv7f9xzb27uU1mUVmgPWEC34CNiLQE
 66gQCPFJGRDUTnBuhT/V9KHRowsEs+zo9NBS6gTVP2GTGou6S7GkdTgiY7q7KwTYmnwX
 q2fClvdEZSJrmN4dbWMeGcXbMyCUvbII+UoXKwV47no1MDfWd5EqTlbxv+4KXmImqxGc
 u73TCUUUJM9uJB7xRmbJVmlOqlO0WW8/Mr0a30tEx3yueuSaXoYnbgWEPzOjf0AT9vR0
 O6METwjXsFh7zEXCzDm2y/cRAP0xvqfT1ULihSEGv0RIfWaqenT2JvXVSnq5kNK4975W
 iXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DwNDrIaY0zYMaT9qEo8qYGGeslKL3xsBdcYo991mi0M=;
 b=IopeCGLkrAa5zPUmn40ZWoOlbNg2iGg3qPSKNyx9/JqLZD+9nkEWUVeLryUkSjn9mE
 4wptnqHk4ASzRA3vqwgZYapUX9xoAvyRqUHM3X6kbHmlYcKQL7xGIzDNxePYVQlRByHs
 pxLJ0LNDYGVyXVF+ODMI3M8LRB9IZVamqHKBJS4eqiBEWmtRVN4hNglyEbRTPmBWn/UY
 4EPXAzob6WfHZFHeOYcz5xgJ2HJYMkpxhQyzjbzEIg7CGwCRHcdfnU/V3nq2n0j4d3UZ
 uYgIjegXwI7/4kxGO1kkss2P8XuPBgyXa2GNQx5spKg1z21sMUgd76H4oFbhgNsOQ3Kw
 1mjQ==
X-Gm-Message-State: AOAM533dx1qpFUKRJ+zRc8d0dM2f/CUVLoccGbKDKMZIbyAODGqHlNqE
 8ebhxXcQJmXd4G0qzQ6QVO3KuA==
X-Google-Smtp-Source: ABdhPJxDyNUH9UQl2zLjVgMQ761RsNbMjRsRJNTyhKSbVS5lWr3UR1s32lNdcZlYFs8EqPlsCmDQtg==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr11296987wmk.90.1619800870581; 
 Fri, 30 Apr 2021 09:41:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y17sm2899637wrw.90.2021.04.30.09.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:41:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5E9B1FF7E;
 Fri, 30 Apr 2021 17:41:08 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if
 TCG is selected
Date: Fri, 30 Apr 2021 17:37:47 +0100
In-reply-to: <20210415163304.4120052-13-philmd@redhat.com>
Message-ID: <87sg37vi6z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang?= =?utf-8?Q?=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The previous attempt (commit f77147cd4de) doesn't work as
> expected, as we still have CONFIG_TCG=3D1 when using:
>
>   configure --disable-system --disable-user
>
> Now than we have removed the use of CONFIG_TCG from target-dependent
> files in tests/qtest/, we can remove the unconditional definition of
> CONFIG_TCG in config_host.
>
> This avoid to build a bunch of unrequired objects when building with
> --disable-tcg (in particular the softfloat tests):

Hmm something else gets broken because I bisected a check-tcg failure to
this commit:

  timeout --foreground 15  /home/alex.bennee/lsrc/qemu.git/builds/bisect/qe=
mu-system-aarch64 -monitor none -display none -chardev file,path=3Dmemory-r=
ecord.out,id=3Doutput -icount shift=3D5,rr=3Drecord,rrfile=3Drecord.bin  -M=
 virt -cpu max -display none -semihosting-config enable=3Don,target=3Dnativ=
e,chardev=3Doutput -kernel memory
  qemu-system-aarch64: Please enable icount to use record/replay
  /home/alex.bennee/lsrc/qemu.git/tests/tcg/aarch64/Makefile.softmmu-target=
:49: recipe for target 'run-memory-record' failed
  make[2]: *** [run-memory-record] Error 1
  make[2]: Leaving directory '/home/alex.bennee/lsrc/qemu.git/builds/bisect=
/tests/tcg/aarch64-softmmu'
  /home/alex.bennee/lsrc/qemu.git/tests/tcg/Makefile.qemu:102: recipe for t=
arget 'run-guest-tests' failed
  make[1]: *** [run-guest-tests] Error 2
  make[1]: Leaving directory '/home/alex.bennee/lsrc/qemu.git/builds/bisect'
  /home/alex.bennee/lsrc/qemu.git/tests/Makefile.include:63: recipe for tar=
get 'run-tcg-tests-aarch64-softmmu' failed
  make: *** [run-tcg-tests-aarch64-softmmu] Error 2

So it looks like it breaks icount somehow.

>
> Before:
>
>   $ make
>   [1/812] Generating trace-qom.h with a custom command
>   ...
>
> After:
>
>   $ make
>   [1/349] Generating trace-qom.h with a custom command
>   ...
>
> A difference of 463 objects...
>
> Reported-by: Claudio Fontana <cfontana@suse.de>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v3: Include Paolo's feedback:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
> therefore o not include Alex's R-b tag.
>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Emilio G. Cota <cota@braap.org>
> ---
>  meson.build | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e8..623cbe50685 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -262,7 +262,6 @@
>                          language: ['c', 'cpp', 'objc'])
>=20=20
>    accelerators +=3D 'CONFIG_TCG'
> -  config_host +=3D { 'CONFIG_TCG': 'y' }
>  endif
>=20=20
>  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()


--=20
Alex Benn=C3=A9e

