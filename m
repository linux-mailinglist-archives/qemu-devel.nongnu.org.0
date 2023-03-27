Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53E96CAA09
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 18:12:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgpR7-0003YM-Gn; Mon, 27 Mar 2023 12:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgpR4-0003Xx-Tw
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:11:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgpR2-00050m-7q
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:11:06 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 m6-20020a05600c3b0600b003ee6e324b19so5693828wms.1
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679933462;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VtJrsC4cfh6h61c7vfc9NPq1fBlfSchOx6wOaYtspxE=;
 b=tR3d3FNE0OgkG7mIsifFLMZjilBBqi9It0zqlTQ/XAmaHto74z5CfquGPaMS8bpHeq
 cLWyfh+/2g7md/L7j0Sh3jKBje1irtn3Xqq931WZYAPDSswz1iQUTY97mOsd2uEJ1hLi
 3OA8vVAkyTmwdvap1l5gwglx1TOirwHKJB3wrTAhh+cGQXzvJMrRjqJfzw8SMUrIUzCe
 4JlY1kx6c/3n67KmIeb22usLqbB0ustUEvwWD2mJLX9pxF/TsklMjv8YcGRjfkhdJx+Y
 JyHmuSNe3KKHrrVnmRLfmA7aWxs9K5aRC0PcewQPojo/EGmd2hmL92iZFWMSEmL/m64K
 xE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679933462;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VtJrsC4cfh6h61c7vfc9NPq1fBlfSchOx6wOaYtspxE=;
 b=KqjSpLL9mgUmSVU1mys6/TQYCsGUf/KHJjKCC5HneveYsmn1VhMl5nCapBmc7/zlF2
 GNqq7a25jCmlh/4Yj0cL6ceY5ZbTcSv/c+E94d1SMXhS7Rnc2aJd/leiDdIizlZtSJvJ
 RU9WyH2Sh03F5F+LPAp89vVPB2IbfNUzc2R4wDgGKUncJ+FQ4dKvPPUSFGvSQg/eLYXc
 APjPHJBpijbKcFVCQ5OpukH0bjg+YqvSK0WSYvnLlTkIdCBPcSPQaP3txfOd03L8q9yb
 djcqLhq9RomcdTE72hFaJxIadi//dnufwWnTpv00OszgHEQty0Ex3MeZg9VPHLYH+BF6
 aNhw==
X-Gm-Message-State: AO0yUKXvzyl8yePt8z30GPjeEDz78at+pQF1CjZaNbNQCnZwa1B0t3rE
 y1VLFX7YfdTn03h/SXT4jxf7NQ==
X-Google-Smtp-Source: AK7set8GFz1NXe/YH+59fT5qQusLpzsz8hpSeBDKYGLewx3F8iKhbRz1v/15xwG6AgiGLGqz35zWfA==
X-Received: by 2002:a7b:c04a:0:b0:3ee:7f0b:388f with SMTP id
 u10-20020a7bc04a000000b003ee7f0b388fmr9986800wmc.40.1679933462128; 
 Mon, 27 Mar 2023 09:11:02 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c204400b003ee4e99a8f6sm14117288wmg.33.2023.03.27.09.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 09:11:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 756D21FFB7;
 Mon, 27 Mar 2023 17:11:01 +0100 (BST)
References: <20230327115030.3418323-1-kconsul@linux.vnet.ibm.com>
 <20230327115030.3418323-3-kconsul@linux.vnet.ibm.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] tests/avocado/boot_linux.py: re-enable test-case
 for ppc64
Date: Mon, 27 Mar 2023 17:07:30 +0100
In-reply-to: <20230327115030.3418323-3-kconsul@linux.vnet.ibm.com>
Message-ID: <87r0tarx7u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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


Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:

> Fixes c0c8687ef0("tests/avocado: disable BootLinuxPPC64 test in CI").
>
> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the test-case
> for PPC64. On investigation, this turns out to be an issue with the
> time taken for downloading the Fedora 31 qcow2 image being included
> within the test-case timeout.
> Re-enable this test-case by setting the timeout to 360 seconds just
> before launching the downloaded VM image.
>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Hariharan T S hariharan.ts@linux.vnet.ibm.com

It doesn't really address the principle problem that the
boot_linux.py:BootLinuxPPC64.test_pseries_tcg is super heavyweight for
only 2% extra coverage of the executed lines.

What we really need is a script so we can compare the output between the
two jsons:

  gcovr --json --exclude-unreachable-branches --print-summary -o coverage.j=
son --root ../../ . *.p

because I suspect we could make up that missing few % noodling the
baseline test a bit more.

> ---
>  tests/avocado/boot_linux.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index be30dcbd58..c3869a987c 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -91,9 +91,9 @@ class BootLinuxPPC64(LinuxTest):
>      :avocado: tags=3Darch:ppc64
>      """
>=20=20
> +    # timeout for downloading new VM image.
>      timeout =3D 360
>=20=20
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>      def test_pseries_tcg(self):
>          """
>          :avocado: tags=3Dmachine:pseries
> @@ -101,6 +101,10 @@ def test_pseries_tcg(self):
>          """
>          self.require_accelerator("tcg")
>          self.vm.add_args("-accel", "tcg")
> +
> +        # timeout for actual Linux PPC boot test
> +        self.timeout =3D 360
> +
>          self.launch_and_wait(set_up_ssh_connection=3DFalse)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

