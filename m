Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4773E604BCE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:40:38 +0200 (CEST)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBBN-0004OW-9r
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olB2d-0004Tg-Mn
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:31:35 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olB2b-0004K5-1b
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:31:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id b4so29692686wrs.1
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iChGCjT0xd5xeEzt6XMgBuW8+y72oXEHx1nAoQhesQY=;
 b=S0AVoy62rLIwG6BszlGMvkwnPrqh1/FPSDJgYBfQDdJHeowOV9Iqfb6RJ2+z4IdUG8
 WNe9XRlS7+k++c2zgg1SVPfkAOdj6QS9VHTOBoER8sn+XrFGhlxPUw9xC5j6Vzsv928Y
 YhKLlDqFsS2TVQe3N9rq/28c6T7aT7vdAMfEXmSeb1qBv7ojhk+J1lm3oz/8fWHnKTEi
 8jxoItmpVoEcK1u6EwHZn36oPDoeq3MsHTkZSzcW/pndAuySA18q7WAgxd9KbaLrAoeN
 P/7kIHkmU1qwF6lf65Pv2uhVCPKwwdKDCU5AQ4sCXVMt8Rddk6B90Liwv7SshjAA31hu
 Qdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iChGCjT0xd5xeEzt6XMgBuW8+y72oXEHx1nAoQhesQY=;
 b=Jq+hSih659KPb0OLw6mSGA6nk8NMaWQOSQex0LI/63ZXSYUdhguOteVvxyq31a4+Be
 fRmejSoArhmO8m0XBIYcwEYvMxyw42u5Tugd/9/2IgsMMAe1e6TKHEaFwmlyNjJ4PcyT
 t4jtZ89gxpT53+Gac2LGC3bU5GygrSJ3TX8h64tYeJG9Z4J9gVkzm6ORlIR1HpXIfDHQ
 0wJB0CbNYq11jtnbpLpC1ChsR3iw2ZkNd2OjKdbc54uAKge0fY9iQF+0dS+IWIPssGUF
 tkCiFwBf/X+7Dw8RewI6Bq0n1baDv4ZlZULGcRFnrqyHVuy0JuhAXBV453RJTF20HFYQ
 Ov7g==
X-Gm-Message-State: ACrzQf17m7qz06/WNbziRvhSVaJLEO71D/emQPIrtRWVHhUCd4/CJ3Dz
 rZuEQCuqlJvlR8Tr+KiuPU+f8w==
X-Google-Smtp-Source: AMsMyM7C674/T+BM8kTqvHZ1ocIRpn8edH8QLuhZAAkTPaolP5Ebl+M1Uxd7PHkiQe32VDIRutORfA==
X-Received: by 2002:a5d:4887:0:b0:226:ed34:7bbd with SMTP id
 g7-20020a5d4887000000b00226ed347bbdmr5310259wrq.561.1666193490747; 
 Wed, 19 Oct 2022 08:31:30 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v1-20020adfedc1000000b00228daaa84aesm14161592wro.25.2022.10.19.08.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 08:31:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA60A1FFB7;
 Wed, 19 Oct 2022 16:31:29 +0100 (BST)
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-4-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 03/10] acpi/tests/avocado/bits: disable acpi PSS
 tests that are failing in biosbits
Date: Wed, 19 Oct 2022 16:30:57 +0100
In-reply-to: <20221019025828.683113-4-ani@anisinha.ca>
Message-ID: <877d0vbzji.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Ani Sinha <ani@anisinha.ca> writes:

> PSS tests in acpi test suite seems to be failing in biosbits. This is bec=
ause
> the test is unable to find PSS support in QEMU bios. Let us disable
> them for now so that make check does not fail. We can fix the tests and
> re-enable them later.
>
> Example failure:
>
> ---- ACPI _PSS (Pstate) table conformance tests ----
> [assert] _PSS must exist FAIL
>   \_SB_.CPUS.C000
>   No _PSS exists
> Summary: 1 passed, 1 failed
> ---- ACPI _PSS (Pstate) runtime tests ----
> [assert] _PSS must exist FAIL
>   \_SB_.CPUS.C000
>   No _PSS exists
> Summary: 0 passed, 1 failed
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/avocado/acpi-bits/bits-tests/testacpi.py2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avoc=
ado/acpi-bits/bits-tests/testacpi.py2
> index 18dc818d62..f818a9cce6 100644
> --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> @@ -40,8 +40,8 @@ import time
>=20=20
>  def register_tests():
>      testsuite.add_test("ACPI _MAT (Multiple APIC Table Entry) under Proc=
essor objects", test_mat, submenu=3D"ACPI Tests")
> -    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", tes=
t_pss, submenu=3D"ACPI Tests")
> -    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates,=
 submenu=3D"ACPI Tests")
> +#    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", te=
st_pss, submenu=3D"ACPI Tests")
> +#    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates=
, submenu=3D"ACPI Tests")
>      testsuite.add_test("ACPI DSDT (Differentiated System Description Tab=
le)", test_dsdt, submenu=3D"ACPI Tests")
>      testsuite.add_test("ACPI FACP (Fixed ACPI Description Table)", test_=
facp, submenu=3D"ACPI Tests")
>      testsuite.add_test("ACPI HPET (High Precision Event Timer Table)", t=
est_hpet, submenu=3D"ACPI Tests")

I think this breaks bisection so should probably be included in the
commit that add the test with a comment in the commit message.

--=20
Alex Benn=C3=A9e

