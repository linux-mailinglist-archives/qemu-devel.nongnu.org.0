Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6296CFFB5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 11:20:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phoQm-0003at-Lo; Thu, 30 Mar 2023 05:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phoQk-0003ac-IM
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 05:18:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phoQi-0007XI-N6
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 05:18:50 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso3103348wmo.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680167927;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsFhMcVteVDEsc4CoaRUemTtAtlZ7CVOJ+iZ0h7A8f8=;
 b=Qyc0JLcb+E/gPYEMhSYFfIGLmzOZ3LaFSgxwuNzCRQrEmdVk6edagNQHNm1FuHfV5m
 ykgSsTQIDTg3Vg0/hH+H9gcjeELlqwArPL0HlBYV729DMoa11wBuIanGBIPmPxN30xmW
 HUUmSQnQ1H/cncvm9UrL0E6cVGs2EZaL4hlqINjoQ/hnG2xkVVd5h+7kSISdwo4jLdTw
 CVpwRpzolMMKK9YZBGuGM062Bha5VS6caKrohn0erohUACBoQdk3I9wj0m7Dlk2nnXDC
 kZ9e9zNHWK73WD0PKnqVZ6IeYaN9JLxjLEYlmdzuCNOiHFlkKBVPo6qq0dZCfilZse+4
 hWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680167927;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DsFhMcVteVDEsc4CoaRUemTtAtlZ7CVOJ+iZ0h7A8f8=;
 b=cTQ1grPtjYeC8Yc7jElqeeULAusVR1MmDB543nrzz/r7s334k7Xgtpq4CC6wkD0wWk
 KhGVV4C/NaoNjDNno27O4qhzgldHN4I0+IbIV+l49w1QtAPHqo7t05VeIjVlPInI/Vpg
 sIO3C+jwSJMQYzYvS/29iFrxYC87jK0hHtLvpuMbNwzswR+O9QpeydTn3imASfmwAKPn
 Fk8+X4zwup/LreUggVFOOkeH/YN8rb6/rilX5mh+1OC8KieYOFaaiJkcmcbzgApiN7m9
 xSzpmxbRIG1A1GU02/eTLs1Ke7u+0bguN7Avfk8iEFYNafT/JUDCXluj7dRWUPElD+MC
 xWFA==
X-Gm-Message-State: AO0yUKX7GL1I1Cq2iOz1V19PGmwqMrgiMlsySWztjYq7NP5iHSMrgXNV
 vNabkVHs+9zhsFqMust8o+MUig==
X-Google-Smtp-Source: AK7set9zBWBC95PgIqOMkXPJ3y5WQSZxPy7/ZR7M3Gkf5yV84s5TSbeTxIdT5GIjhIY9u0x9jKEtFg==
X-Received: by 2002:a7b:c3c6:0:b0:3ef:128d:7167 with SMTP id
 t6-20020a7bc3c6000000b003ef128d7167mr16426343wmj.13.1680167927126; 
 Thu, 30 Mar 2023 02:18:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 10-20020a05600c228a00b003ee44b2effasm5157785wmf.12.2023.03.30.02.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 02:18:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 71D9E1FFB7;
 Thu, 30 Mar 2023 10:18:46 +0100 (BST)
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
Date: Thu, 30 Mar 2023 10:18:26 +0100
In-reply-to: <ZCUoKZ7OrEVa4CEN@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Message-ID: <874jq2ppft.fsf@linaro.org>
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

I've queued up just this patch to for-8.0/more-misc-fixes, thanks.

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

