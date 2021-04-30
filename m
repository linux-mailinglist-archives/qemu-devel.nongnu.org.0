Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005C636FDE8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:38:57 +0200 (CEST)
Received: from localhost ([::1]:49560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVEH-0001oD-48
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcVCH-0000r7-G4
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:36:55 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcVCE-0004Op-Ey
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:36:53 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so1888121wmi.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kgc4/a4m64SJoZaaIyINvvlEfXk588HVfBX1BWddK+o=;
 b=D8NTbTAY5QrDqWMC64PNXzKe5e5XaELz3AJIK3bRS2s77D0Bt6z1nxa7Nzystjx7q2
 FINHeu2gX6Kc5bHq9+ADyt0g6b3C0yyOv6w5eyw12agqge122/7J/dUh2ZKFsngYvN7h
 GIb5RXpq3eakaW+YuuhtlgRsdXcujWVKzKTt35zTVXpD+E0bji0WXea6pL/MbZZ4mpCi
 2ZWvTe83weVMyjhwYZo+LN5COqh2kcwOuW/hRxhDPSIAgT31++UzCzmquAJ4LCUz/BE4
 d+e9IYFntHgmmjyEbqbYy3uEKBAhg7mxQ0A974Dg7q7CdpauKxJxAbwgw0xXQqBZTC+B
 iRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kgc4/a4m64SJoZaaIyINvvlEfXk588HVfBX1BWddK+o=;
 b=U0NIunN5rKzVmr6I6o+VFYdATsa/r4FuWZbpWRcofFYkzur8XbUM4WljVfHRQka0ES
 2fmgF7wo0lfW5j5gXtolquzaYUG4XPecHBZlnLIWhH7GhFhfelAOpBhaMgXfgjgJkCLy
 XP7RQRj7qS2ACqj5ObgYurYN7IyCmRf8GlW3NAL6kP+Ob9WPT3AhzP5UWc52gXrN6fLO
 THVNz3PQiytujkqke5Noa1WAuVE3JoJbjbyultrEmEqYgq5QcELUbQfyzvIuBhwT01pr
 pRQSBNuALMJYj2ctF+lFL8e2opwN4JM8XIfpw8Nr41eWqQTXCH1jI6c603I0EQa/bi+G
 +8IA==
X-Gm-Message-State: AOAM533AxiHd/VkP5EN3mQK6Cu4wdPpSNElpS+fTY2LGgivFaVcTraex
 WL5PsWKjUkggbx/XFkNJddBHlw==
X-Google-Smtp-Source: ABdhPJymfuTh7qKB8pSP+bPnA9/aE3Kl0JYgoe89/siDmh92zgYg31qlbBD3yHZdFhBrtC33jp60Sg==
X-Received: by 2002:a1c:804a:: with SMTP id b71mr6874141wmd.82.1619797007879; 
 Fri, 30 Apr 2021 08:36:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v17sm2599717wrd.89.2021.04.30.08.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 08:36:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F07441FF7E;
 Fri, 30 Apr 2021 16:36:45 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-9-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 08/12] qtest/bios-tables-test: Make test
 build-independent from accelerator
Date: Fri, 30 Apr 2021 16:35:34 +0100
In-reply-to: <20210415163304.4120052-9-philmd@redhat.com>
Message-ID: <87y2czvl6a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Since v1: use global tcg_accel_available, call qtest_has_accel() once
> ---
>  tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
>  1 file changed, 52 insertions(+), 47 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 156d4174aa3..a4c7bddf6f3 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -97,6 +97,7 @@ typedef struct {
>      QTestState *qts;
>  } test_data;
>=20=20
> +static bool tcg_accel_available;
>  static char disk[] =3D "tests/acpi-test-disk-XXXXXX";
>  static const char *data_dir =3D "tests/data/acpi";
>  #ifdef CONFIG_IASL
> @@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_=
data *data)
>      char *args;
>      bool use_uefi =3D data->uefi_fl1 && data->uefi_fl2;
>=20=20
> -#ifndef CONFIG_TCG
> -    if (data->tcg_only) {
> -        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
> -        return;
> -    }
> -#endif /* CONFIG_TCG */
> +    assert(!data->tcg_only || tcg_accel_available);

I find it odd that we need TCG here (especially on an x86 system) to
test what are essentially device models we use in KVM. On the other hand
it maintains the current effect with less ifdef hacks so:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

