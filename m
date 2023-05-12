Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A18C700DB7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 19:11:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxWHq-0004wN-08; Fri, 12 May 2023 13:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pxWHo-0004w6-1Q
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:10:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pxWHm-0003ZE-3L
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:10:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3075e802738so9288592f8f.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683911427; x=1686503427;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CowaXsTytpLcpAQBhAKBeZa2GQOPKs3Zx4x6XRv10Ts=;
 b=sfY1GYqqYhgM3RK6DKuQ+tPl/D8WCMh9w02oD1ZeO0njq9/JPaiSiaLl+UZsUqiApe
 4XLJmKLF+DfV6Xu/ElvFx5UaMyv//FqFX9QODr5fSYQ+GGsd71d4Igs9CPe7dUVSDw2M
 3e1dU10AWOtW8pMlPJszDGOWc8EBxSZ8KGaHxx98o3ePwekxqm8uAQ+sSJaotgW9VzqM
 pExDrS5bZRIP57nwDwfR/JKj9hUYoCWQR/4vCvS97s1U62EDgk47dn+aywfn7/018RGa
 ARvO0L3jaPxHl7h3CoFCh5Z8H7PKA8DfJfIm/xw8MjsGFhLpDLcMogeyMCEpi8VgWNQQ
 XRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683911427; x=1686503427;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CowaXsTytpLcpAQBhAKBeZa2GQOPKs3Zx4x6XRv10Ts=;
 b=aCMiYsXrMUPjlFTiC3T0HxANIcyF+AD6m1YiSJWNQ8ODuy3IuaodgzAu0WHL9/jfOF
 Qw3N4y7YQouutmbeCe+b9dO3zTtoibLQIPN/CuwuWfN3oW9jpnybllapYdcBsG3I0+3P
 9Iv5V6JJa32Tb1RyKfEne2yM4on7Mv/OJl6rRvGA8G+MLJ1hIY67AA3L4MY3BfKG7ZWP
 a9UQXofZjwkfMYX4SRwbuKE7OOO0+NQT6rlfDcJ8gbDfQKlP5pSXSkCuw7mrkG9TldgO
 E1e7MsUfbzbirLSjZgEj/lG6tLSDBjTEhSFZvY0hPPJYjn3cTwSNtiqZSLkWmyiwfuJq
 8/Bg==
X-Gm-Message-State: AC+VfDyZvfVrTK0XWsk32yrulI+OP08Vy62xP3NBUdiZO/wL/Na+FkDR
 V3f/JpKn1f+xbGHIJsiIa9TR1g==
X-Google-Smtp-Source: ACHHUZ7sELweoZ6KDCT2N5Nzu8MtFgNn3APKT3uqoOUleLe9XAaJTdZFsmi1vKxbR3yVo4z42Jod2A==
X-Received: by 2002:adf:f142:0:b0:306:36b5:8ada with SMTP id
 y2-20020adff142000000b0030636b58adamr19510447wro.29.1683911426822; 
 Fri, 12 May 2023 10:10:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a5d6803000000b00307a83ea722sm10918594wru.58.2023.05.12.10.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 10:10:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08F8C1FFBB;
 Fri, 12 May 2023 18:10:26 +0100 (BST)
References: <CAFEAcA8rZDtUFTM7Ya6aTTZw0bHYL0y-6Akjoru1SS=qeh+KWA@mail.gmail.com>
 <CAFEAcA_jbxsKrG0T_3Wi1Q-LZePqNqgVsdS8okQP1ADzqrL0hw@mail.gmail.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Phil =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: command line, guest console output missing from avocado log
Date: Fri, 12 May 2023 18:03:56 +0100
In-reply-to: <CAFEAcA_jbxsKrG0T_3Wi1Q-LZePqNqgVsdS8okQP1ADzqrL0hw@mail.gmail.com>
Message-ID: <87r0rlwk5a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> On Tue, 9 May 2023 at 19:58, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>>
>> I just noticed that the guest console output seems to no longer
>> be in the avocado log file. Can it be reinstated, please?
>> The console logs are typically the most useful clue to "why did this
>> test fail" and without it you're just guessing in the dark...
>> The details of what QEMU command line avocado is running
>> also seem to have vanished : that also is among the most
>> useful items of information to have in the log.
>
> Ping? Where can I find these bits of the log for avocado
> test runs now? I tried looking in the individual per-test
> directories but they're not there either...

Hmm they have indeed disappeared. According to the docs doing:

  ./tests/venv/bin/avocado --show console:DEBUG run tests/avocado/tuxrun_ba=
selines.py:TuxRunBaselineTest.test_arm64

should be enough, and there is another option --store-logging-stream
which takes the format. However I wasn't able to get this to work.
However moving the logging into the avocado name space with the
following:

--8<---------------cut here---------------start------------->8---
modified   tests/avocado/avocado_qemu/__init__.py
@@ -138,7 +138,7 @@ def _console_interaction(test, success_message, failure=
_message,
     if vm is None:
         vm =3D test.vm
     console =3D vm.console_socket.makefile(mode=3D'rb', encoding=3D'utf-8')
-    console_logger =3D logging.getLogger('console')
+    console_logger =3D logging.getLogger('avocado.guest.console')
     while True:
         if send_string:
             vm.console_socket.sendall(send_string.encode())
@@ -407,7 +407,7 @@ class LinuxSSHMixIn:
     """Contains utility methods for interacting with a guest via SSH."""
=20
     def ssh_connect(self, username, credential, credential_is_key=3DTrue):
-        self.ssh_logger =3D logging.getLogger('ssh')
+        self.ssh_logger =3D logging.getLogger('avocado.guest.ssh')
         res =3D self.vm.command('human-monitor-command',
                               command_line=3D'info usernet')
         port =3D get_info_usernet_hostfwd_port(res)
--8<---------------cut here---------------end--------------->8---

then makes things work with --show avocado.guest.console:DEBUG and the
job log automatically get the output in the logs.

I note that:

  https://avocado-framework.readthedocs.io/en/101.0/guides/writer/chapters/=
logging.html

has a big TODO note in it.

Cleber,

Is this the change we should make or should we be able to pick arbitary
name-spaces for logging?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

