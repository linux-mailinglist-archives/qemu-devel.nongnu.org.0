Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F76C3910
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 19:20:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pegaC-00009x-4n; Tue, 21 Mar 2023 14:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pega9-00009i-Uq
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 14:19:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pega8-0001GA-9f
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 14:19:37 -0400
Received: by mail-wr1-x431.google.com with SMTP id l12so14665707wrm.10
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679422775;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+vbCniwxS+T5f3BuF/WML/5jHYY6FTwpe186TXhxg8=;
 b=MkGXI19JFSleH+gphY31KT6/HapxOJYALzUAIyvK8jgMN7Q3TVK858c6CamBiU4iPL
 W+baor+yZARO2PxPKHH1fBO0Rm25ocOAipkkURi0UoJnKutoSPY0V7WxAYApbH3o9v7X
 W+XpV8sHVBchMoFO6ywYT+5kryL+H+YOdJ0T38P9Lffiy81p+8F4woajH7ykgDsieaKP
 9578txzeGVLv3kauZ/bCTjySlA0qwcIeDhj0BBd3YlSZBL6mwsVGBT02+Y3TvjbslWdp
 /3zpKxqxYTs6dXN1zj9cbLWYq7rHi3UPlBYs8Y8R/74n8kQBhq/Xy1acrkl2WRMotTIm
 bm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679422775;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p+vbCniwxS+T5f3BuF/WML/5jHYY6FTwpe186TXhxg8=;
 b=AXgBT8xlOU3yINAuIv12CDP6Ud6NfT9B8fdorD8IBJQgY5jF2qGIQDZ0p9ogqpk22t
 NGBOqBHa/RW/1ELrhmKfotDmIxZ2H8pC3yKCvA6XWsmfFn/uP5jvWjS9mevgTFC3NOCj
 6bKD9uung/QIIubFrxL6IHNBKRAWxlr6Ky953YOvDy46aOZUNrQUXOXSEJDiAY3BI+a6
 q8Hw7IaYSVwA/Vsufl6nj4OEdEtOl7Or6n55+YyiAmdheB/R5J5Uf8phBJzW1k8GsDwK
 52dYF15cwAo6uvr/xJxgTLzlwiW8dNVJWCEPn7owjfBH+6nzqzU7Yn6TgGimx4eS26bf
 aTDw==
X-Gm-Message-State: AO0yUKVefyq3TIzX7tpgvJjMITOMb2hriz9TmVglxRV976pKbL3Dzkca
 hs3D7DdR5UEmOUj4c5IM7PPOxg==
X-Google-Smtp-Source: AK7set925OD96uJs8OGm2kDi3ix2WygAa34Z6FfgnYjY79XNosdianzW1HbAknoT/O1mj67S4+UKlQ==
X-Received: by 2002:a5d:62ca:0:b0:2ce:9f35:b645 with SMTP id
 o10-20020a5d62ca000000b002ce9f35b645mr3235557wrv.20.1679422774770; 
 Tue, 21 Mar 2023 11:19:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i7-20020adffc07000000b002c5706f7c6dsm11897699wrr.94.2023.03.21.11.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 11:19:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 10C4E1FFB7;
 Tue, 21 Mar 2023 18:19:34 +0000 (GMT)
References: <20230321111752.2681128-1-alex.bennee@linaro.org>
 <e072cbd3-f497-b384-ab46-16c88c70a12a@linaro.org>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, John G Johnson
 <john.g.johnson@oracle.com>, Cleber Rosa <crosa@redhat.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: probe for multi-process support
 before running test
Date: Tue, 21 Mar 2023 18:19:06 +0000
In-reply-to: <e072cbd3-f497-b384-ab46-16c88c70a12a@linaro.org>
Message-ID: <871qli6k7d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 21/3/23 12:17, Alex Benn=C3=A9e wrote:
>> A recent attempt to let avocado run more tests on the CentOS stream
>> build failed because there was no gating on the multiprocess feature.
>> Like missing accelerators avocado should gracefully skip when the
>> feature is not enabled.
>> In this case we use the existence of the proxy device as a proxy for
>> multi-process support.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Cc: Jagannathan Raman <jag.raman@oracle.com>
>> Cc: John G Johnson <john.g.johnson@oracle.com>
>> ---
>>   tests/avocado/avocado_qemu/__init__.py | 10 ++++++++++
>>   tests/avocado/multiprocess.py          |  1 +
>>   2 files changed, 11 insertions(+)
>
>
>> +        """
>> +        Test for the presence of the x-pci-proxy-dev which is required
>> +        to support multiprocess.
>> +        """
>> +        devhelp =3D run_cmd([self.qemu_bin,
>> +                           '-M', 'none', '-device', 'help'])[0];
>> +        if devhelp.find('x-pci-proxy-dev') < 0:
>> +            self.cancel('no support for multiprocess device emulation')
>
> FYI a more generic alternative to this method:
> https://lore.kernel.org/qemu-devel/20200129212345.20547-14-philmd@redhat.=
com/
>
> But yours just works :)

For now I want to keep it simple. We should replace it with yours once
we get a chance. Are you happy for a r-b?


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

