Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00DA4D2E28
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:34:49 +0100 (CET)
Received: from localhost ([::1]:52462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRuae-0008Ri-Om
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:34:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRuKQ-00056T-CT
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:18:02 -0500
Received: from [2a00:1450:4864:20::335] (port=35393
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRuKO-0006ac-NU
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:18:01 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so3177497wmj.0
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Qbp4jrtYSpqTY44mYLWBrlkfZqRYRDhnvID3wrbCH/Q=;
 b=KsfolYm9vMec1S/Pzs/Oz3YRrfuufRv34uonjI0qpik7ImUI1Jh3g7pL7ZQU4YQSms
 Z8yvUjusrYn1bF2GM8YaDs/X6BhtCFDZzv/Wmj5iFNGi7+jTQaRcOcCK84EjW3H4QMK4
 5336fVN22EFXaEF09rOcP+ZvKvFlzt3A8P5umGlDccLCl9e4KSeaIHibyMN3ISihUdYY
 GW8Dd9Vw+IAfHw21iOGlk+PRc/1tB2v8eN10hMSjIVjFF352QbzT7VUMaQbA3LHRFfcb
 ZmyOqNo5wI+Grsi/thqhV0fIQVHuVw4S8jSIR0gvcwJTM4OROwcBfO1mfeP4QnJ8gt4p
 5Dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Qbp4jrtYSpqTY44mYLWBrlkfZqRYRDhnvID3wrbCH/Q=;
 b=craOGj964C/2mkto25L3l5fkQ1Hz95k6AbA+CqOOdBa8Rl3W0GPNAy+tJ0F9LP6U9T
 AV3vN6jbmW7vlBsIhxeu6dTuWkiFau3HbtIj70I/TxJm2GeWePmKrhvYaasx94TGYwAF
 XXLs5K7hS2Kh8DabukY3G1P4IjBnRI5kqwhV5QzVmUQ9R1xt7gwc6YGQXbXjLcDY0QRt
 TFI/PVUsbV6eXtp8V+RoViLkZpL+9m3HbX8m9JGltezZ2Aw+INLTDGYgXa38Zk7NyM68
 pRjMYSoHz7fBQ9cXMxfxofTy2sIGULRSOOWJAEb5j55m6PGH93hEr4VMC/ULR9srMJSQ
 xfjQ==
X-Gm-Message-State: AOAM531Mqi8UyYgvIkWQENOZKQ33990T+0PcsNukAEB8AGz5UZ5lOsdn
 gu7oSet8uygI8RoCXi/xDdqAUQ==
X-Google-Smtp-Source: ABdhPJyhGH14QHdQg7ysZCAxGCo0h5QDDawZSodB2DQUOzFZNxT/mjrIrkG3jSpvvDualnGMACOPKQ==
X-Received: by 2002:a7b:c5d0:0:b0:355:482a:6f44 with SMTP id
 n16-20020a7bc5d0000000b00355482a6f44mr2948236wmk.58.1646824677379; 
 Wed, 09 Mar 2022 03:17:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b0038688a67568sm5170833wmq.21.2022.03.09.03.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 03:17:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D87C91FFB7;
 Wed,  9 Mar 2022 11:17:54 +0000 (GMT)
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-3-philippe.mathieu.daude@gmail.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v7 02/22] tests/fp/berkeley-testfloat-3: Ignore ignored
 #pragma directives
Date: Wed, 09 Mar 2022 11:17:32 +0000
In-reply-to: <20220306231753.50277-3-philippe.mathieu.daude@gmail.com>
Message-ID: <878rtj74t9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <roman@roolebo.dev>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Since we already use -Wno-unknown-pragmas, we can also use
> -Wno-ignored-pragmas. This silences hundred of warnings using
> clang 13 on macOS Monterey:
>
>   [409/771] Compiling C object tests/fp/libtestfloat.a.p/berkeley-testflo=
at-3_source_test_az_f128_rx.c.o
>   ../tests/fp/berkeley-testfloat-3/source/test_az_f128_rx.c:49:14: warnin=
g: '#pragma FENV_ACCESS' is not supported on this target - ignored [-Wignor=
ed-pragmas]
>   #pragma STDC FENV_ACCESS ON
>                ^
>   1 warning generated.
>
> Having:
>
>   $ cc -v
>   Apple clang version 13.0.0 (clang-1300.0.29.30)
>
> Reported-by: Roman Bolshakov <roman@roolebo.dev>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

