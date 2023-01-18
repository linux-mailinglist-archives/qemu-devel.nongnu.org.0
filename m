Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9CD672237
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 16:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIAnP-0004zq-S8; Wed, 18 Jan 2023 10:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIAnL-0004yQ-Gl
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:56:11 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIAnJ-0008VE-Pe
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:56:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so1892390wmq.0
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 07:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u1qdT+bD22cp0eFd4eL+hwKFtJ1bVpbcvbMR2IH7Wmc=;
 b=Sq+o5NZfQgmGcWVMwYZziLgb5G5OYUjIA5/CXO64m7u/jShvPEofEMY9r8KwkVWdid
 ALvZSNeB4UayODPKLuIuBgm9d9otk8zVSE4YKilBoxXXazgINM3UH6GT9Il0p88WqquF
 UzmwItbWHmw77DE34/YvKOWXdHud97wZpYzezDQCGKhCTJBN1IxhuM+UyElkVPHdnC5t
 0q/MiWg9UXnL4jpEAlAlxPF6C0X1ug/brc8OHYI9Ra9FGAmF51u6Fgo3jzp1Iy4oAuFa
 jdlB2LDHnjuZkqSw7dhmVeEMwmqEMldy8nMOAnHgP6gCxAayHy+LAA0Eyrct/QSpeZA7
 xKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u1qdT+bD22cp0eFd4eL+hwKFtJ1bVpbcvbMR2IH7Wmc=;
 b=YbWraN3TZeJEbAzhQoRjjaesu4CtvZPZ+GkCXm/HiGbM6vA184SHPph86wi2JPdo/3
 BzcsSdv3NrP9ZaNZmcjmYVE010V8QG7dKDUlLltq52n+8YjNQ+N19Fxp/2iHUmQV0vJF
 DHSMy+zuY6aIBiqzDf7kIIGJsO7Qp8twXylOOiKRecgiwAWvhOI2oBsErx111KdpjEX7
 WdPxeEpjF+i5XDw673jZXkWIjl/hgRIz68EcOigeletiH0569qv4voR5hIaLYq/vO4bI
 60Qinyx8nTbxTOybcCPa8iQRwkjaWrzE1Fn7xutnUpLlHicXkf9ggvoPJMVWT8Hee3Uf
 rwxQ==
X-Gm-Message-State: AFqh2krcOS3Z3gl0B3GhJ9cOv7jQn9oJwLOv6nGA7SeH/n2zTJPichG9
 vy7DHIrzmlxj8mBSYMFAnhMNrA==
X-Google-Smtp-Source: AMrXdXu07w91zOY3iE8pNQRgB+E4m8qwEaxPhNPWKm4qBNFXl5PpJKygvItSZtV6fzjpO+XEBciT4Q==
X-Received: by 2002:a05:600c:35cf:b0:3d3:49db:d95 with SMTP id
 r15-20020a05600c35cf00b003d349db0d95mr7207504wmq.37.1674057367664; 
 Wed, 18 Jan 2023 07:56:07 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003db16770bc5sm1654373wmi.6.2023.01.18.07.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 07:56:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9DEB1FFB7;
 Wed, 18 Jan 2023 15:56:06 +0000 (GMT)
References: <20221215153036.422362-1-thuth@redhat.com>
 <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
 <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
 <43415e4f-c6bf-31c6-3a2e-cea86c511223@redhat.com>
 <Y8Z8CJoFyxB9uHqU@redhat.com>
 <e4fb93c6-a28d-b45c-5a7d-48d0ae33b994@redhat.com>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org, Laurent Vivier
 <lvivier@redhat.com>
Subject: Re: float tests are too verbose (was: [PATCH v2]
 tests/qtest/qom-test: Do not print tested properties by default)
Date: Wed, 18 Jan 2023 15:51:36 +0000
In-reply-to: <e4fb93c6-a28d-b45c-5a7d-48d0ae33b994@redhat.com>
Message-ID: <87r0vrzvjd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> On 17/01/2023 11.44, Daniel P. Berrang=C3=A9 wrote:
> ...
>> And what i think is test float being overly verbose
>>    >> Testing f16_le_quiet
>>    46464 tests total.
>>      10000
>>      20000
>>      30000
>>      40000
>>    46464 tests performed.
>> Could be written as
>>    >> Testing f16_le_quiet: 46464 tests total .... OK
>> (one '.' for each 10,000 tests run, before final 'OK' is printed)
>
> Unfortunately, the float tests are included via a git submodule, so
> the source code is not under our direct control here ... has anybody a
> good idea how to get this tackled best?

It is under our control. It is a lightly patched version of the
downstream testfloat package so we can patch it some more.

That said reducing 5 lines to one is hardly a massive reduction. If we
just stopped passing V=3D1 you would get:

=E2=9E=9C  make check-softfloat
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berk=
eley-softfloat-3 dtc roms/SLOF
[1/1] Generating qemu-version.h with a custom command (wrapped by meson to =
capture output)
/usr/bin/python3 -B /home/alex/lsrc/qemu.git/meson/meson.py test  --no-rebu=
ild -t 0  --num-processes 1 --print-errorlogs  --suite softfloat
 1/17 qemu:softfloat+softfloat-conv / fp-test-float-to-float           OK  =
            0.02s
 2/17 qemu:softfloat+softfloat-conv / fp-test-int-to-float             OK  =
            0.01s
 3/17 qemu:softfloat+softfloat-conv / fp-test-uint-to-float            OK  =
            0.01s
 4/17 qemu:softfloat+softfloat-conv / fp-test-float-to-int             OK  =
            0.02s
 5/17 qemu:softfloat+softfloat-conv / fp-test-float-to-uint            OK  =
            0.01s
 6/17 qemu:softfloat+softfloat-conv / fp-test-round-to-integer         OK  =
            0.01s
 7/17 qemu:softfloat+softfloat-compare / fp-test-eq_signaling          OK  =
            0.05s
 8/17 qemu:softfloat+softfloat-compare / fp-test-le                    OK  =
            0.05s
 9/17 qemu:softfloat+softfloat-compare / fp-test-le_quiet              OK  =
            0.05s
10/17 qemu:softfloat+softfloat-compare / fp-test-lt_quiet              OK  =
            0.05s
11/17 qemu:softfloat+softfloat-ops / fp-test-add                       OK  =
            0.58s
12/17 qemu:softfloat+softfloat-ops / fp-test-sub                       OK  =
            0.59s
13/17 qemu:softfloat+softfloat-ops / fp-test-mul                       OK  =
            2.83s
14/17 qemu:softfloat+softfloat-ops / fp-test-div                       OK  =
            2.11s
15/17 qemu:softfloat+softfloat-ops / fp-test-rem                       OK  =
            1.27s
16/17 qemu:softfloat+softfloat-ops / fp-test-sqrt                      OK  =
            0.03s
17/17 qemu:softfloat+softfloat-ops / fp-test-log2                      OK  =
            0.02s


Ok:                 17=20=20
Expected Fail:      0=20=20=20
Fail:               0=20=20=20
Unexpected Pass:    0=20=20=20
Skipped:            0=20=20=20
Timeout:            0=20=20=20

Full log written to /home/alex/lsrc/qemu.git/builds/all/meson-logs/testlog.=
txt

with the testlog being:

wc -l meson-logs/testlog.txt
2553 meson-logs/testlog.txt

>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

