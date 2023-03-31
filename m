Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0559B6D1DDA
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 12:21:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piBrv-0001Af-Cl; Fri, 31 Mar 2023 06:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1piBrs-0001AS-Jn
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:20:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1piBrq-0007Bt-Om
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:20:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id n19so12595490wms.0
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 03:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680258021;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WmEQCeCTXeZhHdbuEMP79HEnE/U6lDpAiMnb2a3RWgk=;
 b=ecglU8O8swIJKfmnX8cLKIZPgopkZjsv88QsPRn1WYPF+rVSj3018a6VAQD/sH+U8b
 Gu4ET0Fbreyhji0MfnwF0Ap4/wS6+ZyaleC1WWj9JWmLHu2GhJeAjMkj6qk1x1YBMVaT
 U9Pnk0Ahi4g4Jk/CHBFAoXbxRiM7mOAnlFXaktj3va9zaERwSvakcBrhzIW//LtgpVq/
 wRSd/9lm2YT132Ue++oaln1+Vk16DMtUfB+NqA/aPA3AfuiiyNyGBpv76aUkrXa8epRq
 8lprpDbc/ZSWjxPdn3q1iYd5e2sRXBXvQ6iPDGT5YB7g1uKW8RSnnF7GZbRxtf0NKQUg
 KLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680258021;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WmEQCeCTXeZhHdbuEMP79HEnE/U6lDpAiMnb2a3RWgk=;
 b=0TkiuWCeX1Hjisa+hsdqW2Iz2wLGaqGZ2/eZNLzI3aiPiOo4aJN8ixaPV8B5DskUtb
 C8THc8fUS0BWyfYpVVSUaShvaaxk4u1kw2af5ga8JdYuqG4SDQdLX2OnG5RsU/E1c/55
 gAA4CAUkX8j2T7JTba6FnXvY+JtiRtyt05eCBeMDVB6piULd/Bs/+sDxOWgmmCIOZOv3
 lQP/hHVS4y811yx0MYwYmIfMpackwNfm1b8BaUy8JUgQYnxCAa7+7goA/psMj1hij7wC
 3gEyM3SCBAxzsL0g3L0NF+rHlv9HFpeRdXztQP4E7U5nxGmbCAuCOD/hD+TMEQHK7DLq
 J5Bw==
X-Gm-Message-State: AO0yUKXlcGqqqKxfBkQYr3oiclUvpjQl529fbGj0ImuZb7Qrgle1cbls
 avsbqR7ifET4RPTtCzcv5U/nWQ==
X-Google-Smtp-Source: AK7set8+tx1OCHq/+kYE1aNVxgylxthNKtgIFzFZS0NbINUVoOiha9S/2dNyS9mMHPCKMiJA3yghXQ==
X-Received: by 2002:a7b:cbd0:0:b0:3ed:2a8f:e6dd with SMTP id
 n16-20020a7bcbd0000000b003ed2a8fe6ddmr18878507wmi.6.1680258020925; 
 Fri, 31 Mar 2023 03:20:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c470800b003ef71d7d64asm9501310wmo.6.2023.03.31.03.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 03:20:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 318051FFB7;
 Fri, 31 Mar 2023 11:20:20 +0100 (BST)
References: <20230327115030.3418323-1-kconsul@linux.vnet.ibm.com>
 <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
 <ZCUoKZ7OrEVa4CEN@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Hariharan T S
 <hariharan.ts@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Date: Fri, 31 Mar 2023 11:19:18 +0100
In-reply-to: <ZCUoKZ7OrEVa4CEN@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Message-ID: <87wn2xmdcr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

> Hi,
> On 2023-03-27 07:50:29, Kautuk Consul wrote:
>> Avocado version 101.0 has a fix to re-compute the checksum
>> of an asset file if the algorithm used in the *-CHECKSUM
>> file isn't the same as the one being passed to it by the
>> avocado user (i.e. the avocado_qemu python module).
>> In the earlier avocado versions this fix wasn't there due
>> to which if the checksum wouldn't match the earlier
>> checksum (calculated by a different algorithm), the avocado
>> code would start downloading a fresh image from the internet
>> URL thus making the test-cases take longer to execute.
>>=20
>> Bump up the avocado-framework version to 101.0.
> Any comments on this ? I have tested this patch and it seems to work
> fine with the avocado test-cases.

I'm dropping this from the for-8.0 series as it causes a bunch of
failures in tests. I'll keep it in testing/next for when the tree
re-opens.

>>=20
>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>> ---
>>  tests/requirements.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>> index 0ba561b6bd..a6f73da681 100644
>> --- a/tests/requirements.txt
>> +++ b/tests/requirements.txt
>> @@ -2,5 +2,5 @@
>>  # in the tests/venv Python virtual environment. For more info,
>>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>  # Note that qemu.git/python/ is always implicitly installed.
>> -avocado-framework=3D=3D88.1
>> +avocado-framework=3D=3D101.0
>>  pycdlib=3D=3D1.11.0
>> --=20
>> 2.39.2
>>=20
>>=20


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

