Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558EE6F470B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:24:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrrB-0002fq-TQ; Tue, 02 May 2023 11:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ptrr9-0002ff-KY
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:23:55 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ptrr6-0007C7-Rp
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:23:55 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso40988265e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683041028; x=1685633028;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sIM35jzKED3mMrx8j+jeQ0hrfGDMMvjf7sb3RVQRKLU=;
 b=rUiyQ5KiVG5nzVqEMyHep5M2APMG5jpoIV2WrVrYgtnuyLTsU589otTiDZEi+1BIVe
 JTPUQL7PCMELIFkDkCsAhpRRqdVJyW4loJTo0hLtKPUOHkxjzOJ8Dg3mMsaCu1FUdn0U
 F5273blEEaOtcKpWOrkiTxb2GEmHkoEHsIgXpR73mrzZh3tTBUZNePKomQgQQgQxByO/
 tSylHgZOpWTDR3KwV/DmxlunuYw8gd6+vxJD/BMXhj5Ny8pLtHJbFI3Xp39g7T1GSrbu
 lq/xMHkdiOBG2qVFyQQ/1M9iy6pruDq50GePNbafXdPUV9HiDQRGKoXC2bRSpsFshOwc
 HeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683041028; x=1685633028;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sIM35jzKED3mMrx8j+jeQ0hrfGDMMvjf7sb3RVQRKLU=;
 b=QkZbUq/6LbAY5z5Hr9Q1vNNy76/iblJyfyxNPl8lSAmL9CC63pjoPBqqNwS01hFFsc
 ENJE/P+HKjRVpx6lDRuaH+t+XxNwMC3b19iwZc419Llh2/4dpYYBZ1mGtanEDmMbdOxK
 VbaoRQ8oWL82yTC4VG6xZLtcqKlwtbnbqWZqvNGE5CK1wP+bQCZFbqxEU2roGpTIJXyI
 iHkWm2E/m21UtqCPk4YhtnJN66nqBe0kt0SNLgB2wUOL3JNhpYjhg55C9U24+54w0jZI
 95AppD07dq4toNHZOiTEYSFE+YiP99kiUp9iKhKp5ygpB8pjJsOzpeS+IBZ0G2dhorB1
 15sw==
X-Gm-Message-State: AC+VfDz3pnI/0SdJbb+ZtFGOKVl5qLpApgt4265iIwXJw8+sIzIIjCzM
 pODf/+jwDx+fUVP8MaW0GwWe5Q==
X-Google-Smtp-Source: ACHHUZ5J3R1DwgmG3tpTUPXBCYN6FQuk46DQLU2JiEpbu9Bk058pAvDua5f4xOyuOISMsVE0Dm/brg==
X-Received: by 2002:a7b:c40f:0:b0:3f0:8034:f77e with SMTP id
 k15-20020a7bc40f000000b003f08034f77emr12187788wmi.20.1683041028388; 
 Tue, 02 May 2023 08:23:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d6e07000000b003048084a57asm21731395wrz.79.2023.05.02.08.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:23:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D1BE41FFBA;
 Tue,  2 May 2023 16:23:46 +0100 (BST)
References: <20230208192654.8854-1-farosas@suse.de>
 <f859ba36-c39a-4f86-741d-7920d28c9aaf@linaro.org>
 <5f6a831e-016b-ce13-3e55-722944161c4d@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, qemu-devel@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v2 00/10] Kconfig vs. default devices
Date: Tue, 02 May 2023 16:20:09 +0100
In-reply-to: <5f6a831e-016b-ce13-3e55-722944161c4d@redhat.com>
Message-ID: <87fs8eu58d.fsf@linaro.org>
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


Thomas Huth <thuth@redhat.com> writes:

> On 08/02/2023 20.43, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 8/2/23 20:26, Fabiano Rosas wrote:
>>=20
>>> We currently have a situation where disabling a Kconfig might result
>>> in a runtime error when QEMU selects the corresponding device as a
>>> default value for an option. But first a disambiguation:
>>>
>>> Kconfig default::
>>> =C2=A0=C2=A0 a device "Foo" for which there's "config FOO default y" or=
 "config X
>>> =C2=A0=C2=A0 imply FOO" in Kconfig.
>>>
>>> QEMU hardcoded default::
>>> =C2=A0=C2=A0 a fallback; a device "Foo" that is chosen in case no corre=
sponding
>>> =C2=A0=C2=A0 option is given in the command line.
>>>
>>> The issue I'm trying to solve is that there is no link between the two
>>> "defaults" above, which means that when the user at build time
>>> de-selects a Kconfig default, either via configs/devices/*/*.mak or
>>> --without-default-devices, the subsequent invocation at runtime might
>>> continue to try to create the missing device due to QEMU defaults.
>> This will keep bitrotting if we don't cover such configs in our CI.
>> Why do you want to get this fixed BTW? I'm not sure there is a big
>> interest (as in "almost no users").
>> I tried to do that few years ago [*] and Thomas said:
>> "in our CI, we should test what users really need,
>>  =C2=A0and not each and every distantly possible combination."
>
> You're mis-quoting me here. That comment was made when we were talking
> about very arbitrary configs that likely nobody is going to use.
> Fabiano's series here is about the --without-default-devices configure
> option which everybody could add to their set of "configure" options
> easily.

Indeed - while trying to reduce the compile time I ran into this with a
plain --without-default-devices check. We also have in the meantime
introduced --with-devices-FOO so we can do minimal builds.

>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

