Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C886D564FAC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:24:47 +0200 (CEST)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8HNu-0003LE-AL
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8HMM-00028N-Jx
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8HMK-0002or-G6
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656922986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jd90bjIwXtBxKbpLUSO00FGYBYD+Sif4KE7tDDTji3c=;
 b=SYv6bUbRxHui7QQcrMpF47cnd8srXOcls9UWilJZQOM7bDa6AU5fSR4DaT76p+1y2mqs6P
 4ILuuYzV7mtRoHLr6fq/d1fkfDtKanUa40eEOlK7r+/FSC55MbTSeb3YNXfyFMIlamyQgi
 1z8X1HZ9Z91vTlyv98oDr0nWp9ksVbE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-sPFl3ujdNzmGQs5TLa6_LQ-1; Mon, 04 Jul 2022 04:23:05 -0400
X-MC-Unique: sPFl3ujdNzmGQs5TLa6_LQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so5005901wmj.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 01:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jd90bjIwXtBxKbpLUSO00FGYBYD+Sif4KE7tDDTji3c=;
 b=PFX8kfnXeVo6gaIEf5hi6j8s1iatfafa8eq8ZtOt3LbrOjqXwwmYB7hi1qXQUIHB9g
 6atk46sUN2LHy/8F+/ROlauiLDm16IUrkoOlNDVlVRf3kPcAVrLpjEqBs52LoAHwotnj
 V3ktFUB8OMfZJbZhCrQ1GhMSyjR3/FSDnr1ESEryRGaUMZyz765RNvE8sp0hkQaW6o/4
 lVq9gnEyQvFKLEu3o16bqQNYX8xjbJDa2g/3++D7paa1ku5gSsGiTWA1JgI3vCd6W16F
 RYokHygyH9SU4r56NJmeeT4Kip13bHJuPkABWYYFp4EH5KdFFvgwDmzoCVfLvPl1cHb1
 TMUQ==
X-Gm-Message-State: AJIora/YGmaty48N4PfZtLSIsWT5h1OUNEHY5ipEIA62GtX6t0gR4RVy
 BUc7OGO5Cm/UK7VwFHaZDXQ5oliq8fnsX2Zq0eAI11WqZUzabLXFJoo2kdy8FANJQNtgDzvgnVG
 +Fi0nr4N2fMbv3/c=
X-Received: by 2002:adf:f20a:0:b0:21d:6661:41e9 with SMTP id
 p10-20020adff20a000000b0021d666141e9mr6237448wro.604.1656922984614; 
 Mon, 04 Jul 2022 01:23:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGRE5/tILf0gRhn7gggJ1R+ETeyQCQuURPAIVLj+R+tnzTlZrfPzWmmp9K3KgRW6kqnnNERw==
X-Received: by 2002:adf:f20a:0:b0:21d:6661:41e9 with SMTP id
 p10-20020adff20a000000b0021d666141e9mr6237411wro.604.1656922984368; 
 Mon, 04 Jul 2022 01:23:04 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-243.web.vodafone.de.
 [109.43.178.243]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b0039ee391a024sm14508862wms.14.2022.07.04.01.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 01:23:03 -0700 (PDT)
Message-ID: <2358e820-654b-fcf4-1da5-03eccde5efd0@redhat.com>
Date: Mon, 4 Jul 2022 10:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] scripts/make-release: Do not include the edk2 sources
 in the tarball anymore
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Brad Smith <brad@comstyle.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
References: <20220704064254.18187-1-thuth@redhat.com>
 <20220704064254.18187-2-thuth@redhat.com>
 <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJSP0QUx8456jPp4=MOjRwZMPrBYgU1669HnEpC_+gDobhOiCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 04/07/2022 09.26, Stefan Hajnoczi wrote:
> On Mon, 4 Jul 2022 at 07:45, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The edk2 sources are bigger than the sources of QEMU - so they double the
>> size of our release tarballs if we include them. Fortunately, edk2 has a
>> permissive license, so there is no need for us to do this as long as we
>> continue to distribute the edk2 license information in our release tarball.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   scripts/make-release | 27 +++++++++++++++++++++------
>>   1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/scripts/make-release b/scripts/make-release
>> index 05b14ecc95..f79ed7a2ae 100755
>> --- a/scripts/make-release
>> +++ b/scripts/make-release
>> @@ -20,19 +20,34 @@ git checkout "v${version}"
>>   git submodule update --init
>>   (cd roms/seabios && git describe --tags --long --dirty > .version)
>>   (cd roms/skiboot && ./make_version.sh > .version)
>> -# Fetch edk2 submodule's submodules, since it won't have access to them via
>> -# the tarball later.
>> +
>> +# Fetch edk2 submodule's submodules to get their license information.
>> +# Edk2 is distributed under permissive licenses, so we don't have to
>> +# include the full source tree here (which is bigger than QEMU's sources)
>> +# as long as we provide the license information in the tarball.
>>   #
>>   # A more uniform way to handle this sort of situation would be nice, but we
>>   # don't necessarily have much control over how a submodule handles its
>>   # submodule dependencies, so we continue to handle these on a case-by-case
>>   # basis for now.
>> -(cd roms/edk2 && \
>> -    git submodule update --init -- \
>> +cd roms/edk2
>> +git submodule update --init --depth 1 -- \
>>           ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
>>           BaseTools/Source/C/BrotliCompress/brotli \
>> -        CryptoPkg/Library/OpensslLib/openssl \
>> -        MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
>> +        CryptoPkg/Library/OpensslLib/openssl
>> +mv ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3/COPYING.txt \
>> +   License-softfloat.txt
>> +mv BaseTools/Source/C/BrotliCompress/brotli/LICENSE License-brotli.txt
>> +mv CryptoPkg/Library/OpensslLib/openssl/LICENSE License-openssl.txt
>> +edk2rev=$(git rev-parse --short=12 HEAD)
>> +rm -r $(ls | grep -v License) .[a-z]*
>> +cat > sources.txt <<EOF
>> +The edk2 sources can be downloaded from:
>> +
>> +https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
> 
> Please use QEMU's edk2 mirror:
> https://gitlab.com/qemu-project/edk2
> 
> QEMU mirrors all dependencies so that even if upstream projects go
> offline we can still rebuild all of QEMU from source.

Sure, that makes sense, indeed. I'll wait a little bit longer for other 
comments, then I'll respin the series with the URLs updated (also in the 
second patch).

  Thomas


