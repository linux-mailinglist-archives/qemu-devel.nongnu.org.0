Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B06C477F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 11:22:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pevbl-0001rE-J8; Wed, 22 Mar 2023 06:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pevbk-0001qr-8v
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:22:16 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pevbi-0005k4-Ng
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:22:16 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso12676340wmb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679480533;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2lsPvuM16C7YPmnNtWCsZWTO2bltduIS9413g4IxjIk=;
 b=SoCfcstLki5S9T8CpybDGqmsLOUyrD26FL0gc34XtEQFApv3nKLYN7xOU3SZV5biuB
 tTPOMqeaMsU5i/w+iITOSc5V4ooAYoLnoGPPqBr+HYTBSHRYTleb6RZVpZV/JtFqNFsw
 NenMlFOW9YTr4faiyY1gm/qXr+DYd9FrmFy4YQ7Iv+1xZ6iLP3Y6BFytKlgpJw+V1giV
 Sd2jETMUfPBraCoh75rU9bkRHD7uAfeIWcWkxqDnH+4uxzGj1ndMgb1Ywew/dfpqlokr
 iIprDTHArBDB0rYKm+2F45Fo+qIBIMb1po8OFPR181QJGj9WoD+a9hWVsWLStmq0Ffsr
 Rs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679480533;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2lsPvuM16C7YPmnNtWCsZWTO2bltduIS9413g4IxjIk=;
 b=qxEez4WpZr1Cud7GlmGMuaYInA7g2rbnZpaTNYhWqeOMlOW9tP0ITU3tl+u+TZY1xb
 sMmgbmn1TGIDtuHaNYGmnNWw9CpGnZmJRZU6t03qVhrcslxicUESfouyyH3a2HYMgNhV
 BGJqa1cOVMrwy1TCXwfbInL9xuvago83a8/wsqQREWO0N8DyhQFpJtAYDlx4hFUd4zQI
 bNar8l4akJkYzyamwGHDUblZr+pc/y1G2+1YhzdKF2VnowumEboyVnDSUKVJprFSoHNl
 xL7j73E7SGVzZpoauA+QtrwWv34jYLEJ9Tfac8pf+VfrbUa828JNcHhHInd/LGqOGJ3r
 JS0w==
X-Gm-Message-State: AO0yUKVRukQ6GLyTSaLlFPVY041SZv74kjTMWiO0t1+f86dnP1DnWCVM
 8tW4ootWq2xFSl7Qbq+aSC+4aA==
X-Google-Smtp-Source: AK7set+sVSKAIfzzGSto3ObXRZfJGecuqHT5XOFTHjcNCTVZE3HPEbtYd+jkmkif23mgzb3WQKvkTw==
X-Received: by 2002:a05:600c:2199:b0:3ee:7022:5eda with SMTP id
 e25-20020a05600c219900b003ee70225edamr296366wme.7.1679480533140; 
 Wed, 22 Mar 2023 03:22:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c35c600b003ed29189777sm23018743wmq.47.2023.03.22.03.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:22:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 72F301FFB7;
 Wed, 22 Mar 2023 10:22:12 +0000 (GMT)
References: <20230321235102.3832417-1-alex.bennee@linaro.org>
 <ZBrLIXvb3KrXQFzC@redhat.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [RFC PATCH] tests/qemu-iotests: serialise all the qemu-iotests
Date: Wed, 22 Mar 2023 10:21:15 +0000
In-reply-to: <ZBrLIXvb3KrXQFzC@redhat.com>
Message-ID: <87sfdx5bmz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Mar 21, 2023 at 11:51:02PM +0000, Alex Benn=C3=A9e wrote:
>> Something on OpenBSD fails with multiple tests running at once and
>> fiddling with J=3D1 on invocation just made everything else very slow.
>>=20
>> Based-on: 20230318114644.1340899-1-alex.bennee@linaro.org
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> ---
>>  tests/qemu-iotests/meson.build | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.b=
uild
>> index a162f683ef..d572205a60 100644
>> --- a/tests/qemu-iotests/meson.build
>> +++ b/tests/qemu-iotests/meson.build
>> @@ -64,6 +64,7 @@ foreach format, speed: qemu_iotests_formats
>>             depends: qemu_iotests_binaries,
>>             env: qemu_iotests_env,
>>             protocol: 'tap',
>> +           is_parallel : false,
>>             timeout: 180,
>>             suite: suites)
>>    endforeach
>
> This will be a massive regression for all platforms though.
>
> The iotests run a few 100 tests. Previously the iotests harness was
> serialized against all other QEMU tests, but the individual iotests
> were all parallelized.
>
> With this proposed change all 100 individual iotests are serialized,
> both with each other, and with all other QEMU tests.

What about Phillipe's suggestion of doing it just for openbsd?

>
> With regards,
> Daniel


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

