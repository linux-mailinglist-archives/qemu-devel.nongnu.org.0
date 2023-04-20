Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F566E8C70
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:13:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPPX-00048i-F9; Thu, 20 Apr 2023 04:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppPPV-00043U-Jh
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppPPH-0003As-2N
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681978361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QILz2C97nu7Q3BULJONgA9ASqMCay1EJQc9LwNd2Rw0=;
 b=YjLYB1za3ziNskcLbm2gjzaC/L6oXLeFg25QXmGkqsRamcKNlTtrWTMlxmTw6lGFSQrWcg
 aks5CvoCrlext5B8/lY+QHZYBolD4DsZbDoNjRGsnr7I8FtWDoDdQz93Cr5YMbvEp3/W+q
 iRCQdMxks3SzjZmz1C3M6zc1RDRbkDA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-RoD8OtlcNH6Egqcim3mUNQ-1; Thu, 20 Apr 2023 04:12:40 -0400
X-MC-Unique: RoD8OtlcNH6Egqcim3mUNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay37-20020a05600c1e2500b003f16b58cf01so450357wmb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 01:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681978359; x=1684570359;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QILz2C97nu7Q3BULJONgA9ASqMCay1EJQc9LwNd2Rw0=;
 b=Dr6YOHdN03put5Ml8Yk83e8Du68W8Z3aRDSpMq5LmkLnK12gD3+ZGSK9lAtD6WCz2l
 HMSCKra6UMPPp4vAovQeVG1JT/XUsF/2xmxJLPGd+6T9b7SmvWq5hS1zy6l814ODY41/
 CaYKsUdW5nSIsxlxWqBbvMwJje9DgHXrlP23ac24kVRhZqFOgXumPlO2D0j2B+xGGLGf
 uFYEldg5LzonYTM6cQVkZzX4Biw3ZX0J/pkjpqqixFEhLTlXXDvqtaKKgPWJfsrpFiy3
 Rx46Ia0YaFVKkWPAGN7bwZvujcaEZSfkDjDGUkBwwOiNrJznqYSzvaIH3KgyyAtZ+wnV
 LQKg==
X-Gm-Message-State: AAQBX9c85UAYaMGso2sEn/rW7bCOke08wLV9htX9ILK2oFfv2lBNWmFc
 RXWYAcAcE2nU0PQ2V9BIELLOM1BCkWTDTZ7uOt4n/VvJX7tBpAk7pZ/MOvHxQojmTuCXll7UOq6
 0x8x8FpR6l+wIgOs=
X-Received: by 2002:a1c:7517:0:b0:3f1:7581:bba3 with SMTP id
 o23-20020a1c7517000000b003f17581bba3mr636514wmc.10.1681978359228; 
 Thu, 20 Apr 2023 01:12:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350aiv2faJA6oG+9RNxB8SSfTOvqzCicluw3bT14AhbyUZV9k7Ye5VKapwJBTozq3ik93NrXP2A==
X-Received: by 2002:a1c:7517:0:b0:3f1:7581:bba3 with SMTP id
 o23-20020a1c7517000000b003f17581bba3mr636495wmc.10.1681978358912; 
 Thu, 20 Apr 2023 01:12:38 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c468500b003f18141a016sm4077038wmo.18.2023.04.20.01.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 01:12:38 -0700 (PDT)
Message-ID: <0fdd760a-6415-2e7c-349e-300ab239170a@redhat.com>
Date: Thu, 20 Apr 2023 10:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230419092219.426230-1-kconsul@linux.vnet.ibm.com>
 <eced17f9-387c-ce07-233f-6c398840c936@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <eced17f9-387c-ce07-233f-6c398840c936@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 20/04/2023 09.57, Philippe Mathieu-Daudé wrote:
> Hi Kautuk,
> 
> On 19/4/23 11:22, Kautuk Consul wrote:
>> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
>> boot_linux.py test-case due to which the code coverage for ppc
>> decreased by around 2%. As per the discussion on
>> https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
>> was mentioned that the baseline test for ppc64 could be modified
>> to make up this 2% code coverage. This patch attempts to achieve
>> this 2% code coverage by adding various device command line
>> arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
>> test-case.
>>
>> The code coverage report with boot_linux.py, without it and finally
>> with these tuxrun_baselines.py changes is as follows:
>>
>> With boot_linux.py
>> ------------------
>>    lines......: 13.8% (58006 of 420997 lines)
>>    functions..: 20.7% (7675 of 36993 functions)
>>    branches...: 9.2% (22146 of 240611 branches)
>> Without boot_linux.py (without this patch changes)
>> --------------------------------------------------
>>    lines......: 11.9% (50174 of 420997 lines)
>>    functions..: 18.8% (6947 of 36993 functions)
>>    branches...: 7.4% (17580 of 239017 branches)
>> Without boot_linux.py (with this patch changes)
>> -----------------------------------------------
>>    lines......: 13.8% (58287 of 420997 lines)
>>    functions..: 20.7% (7640 of 36993 functions)
>>    branches...: 8.4% (20223 of 240611 branches)
>>
>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>> Reported-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   tests/avocado/tuxrun_baselines.py | 124 +++++++++++++++++++++++++++++-
>>   1 file changed, 122 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/avocado/tuxrun_baselines.py 
>> b/tests/avocado/tuxrun_baselines.py
>> index d343376faa..f763ee5d50 100644
>> --- a/tests/avocado/tuxrun_baselines.py
>> +++ b/tests/avocado/tuxrun_baselines.py
>> @@ -11,6 +11,8 @@
>>   import os
>>   import time
>> +import string
>> +import random
>>   from avocado import skip, skipIf
>>   from avocado_qemu import QemuSystemTest
>> @@ -308,7 +310,7 @@ def test_ppc64(self):
>>           """
>>           :avocado: tags=arch:ppc64
>>           :avocado: tags=machine:pseries
>> -        :avocado: tags=cpu:POWER8
>> +        :avocado: tags=cpu:POWER10
>>           :avocado: tags=endian:big
>>           :avocado: tags=console:hvc0
>>           :avocado: tags=tuxboot:ppc64
>> @@ -316,21 +318,139 @@ def test_ppc64(self):
>>           :avocado: tags=extradev:driver=spapr-vscsi
>>           :avocado: tags=root:sda
>>           """
>> +        # Generate a random string
>> +        res = ''.join(random.choices(string.ascii_lowercase +
>> +                                     string.digits, k=8))
>> +
>> +        # create qcow2 image to be used later.
>> +        process.run('./qemu-img create -f qcow2 '
> 
> Please take qemu-img from $PATH.

I think it would even be better to provide a function in the base class to 
call qemu-img ... we already have some code in 
tests/avocado/avocado_qemu/__init__.py to find a usable qemu-img binary, I 
think that could be extended?

  Thomas


