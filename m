Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D252EF604
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:51:01 +0100 (CET)
Received: from localhost ([::1]:50284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuya-0006i6-2n
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxusQ-0002dB-PW
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:44:38 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxusP-00035P-4O
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:44:38 -0500
Received: by mail-wm1-x332.google.com with SMTP id q75so8970585wme.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kdb8NMqpPyDCnMnSDZ6vL77P9DBswHfCw7YzDmXZluc=;
 b=k5a2ltL17Rb9JVMSbOt7Ixoy6EzEjIcKMvtxsGVtHNGKDSzm3JgDdaODrDZaKBYOhj
 lJFmwZ3luwU11Ucr+ZngupLRJTSkcFljJHNAZJCSf56RJztj6OUNVRGyUoXQFZZd/9JF
 zFgY+OpIOrf2WmgTgedf6QX+Qy5CHc5jnQCuyXtLsqs+m+YjUc5xpfl2oxIHs9nS3OY3
 XYSo6tHMwqQNFjwJp5AZ80lGr/x9V3r5oudOD9I+4byhMA4065re7DBmCVUU+eJPjZVv
 Fy7uCVmU4AA2/bjALcbVGC8wd3T4054fQaDdxz9WQzy/ykwmge91lGrigMYkGHKzDfMN
 i8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kdb8NMqpPyDCnMnSDZ6vL77P9DBswHfCw7YzDmXZluc=;
 b=RyXAKLuYiTt0y5T4faHMS4niQiZm9P6CeWpNkb1OztwVuHKUmBC4tChl9N1G5atI7y
 jqC1JnTls4N7ig8+nmofe+wVGjLdEHhjlH+L+hShe2dCO5yGXIiTLtBAKFcEibV6nMmC
 IxCClmkEUH+M9jQdcQRBlNQ6W5x9fVOM/7aWcaMRMY48J1VL/HyF0vPYfog/Gz++RV0j
 e8Y8GbtjMXkEkJxdO2/5Prm86kPa8cprfULgTza+90YzozOm44kud4JE3gI+cHaL1+X5
 h/SJCi82am2bWHRGtvNQJvTPCApjErlMdVxHft72kHzfT759dHX2pHXNS8W5lEUDTCVG
 fwbA==
X-Gm-Message-State: AOAM530aMrTMOiJBUA4GwNXo/9WMVTxSqMDPTakKYSAUSU9aMPQtjbj3
 bl7tamrCeGYSckToIc1ZLxM=
X-Google-Smtp-Source: ABdhPJwNZtl4797ydLDzekz9WseItiPOvLIGcpjNPJnpBerwsl7rFB1AsuSHDkrFeYfPWMbXz3t2dQ==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr3889198wmj.154.1610124274870; 
 Fri, 08 Jan 2021 08:44:34 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id o8sm13991856wrm.17.2021.01.08.08.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 08:44:34 -0800 (PST)
Subject: Re: [PATCH] decodetree: Open files with encoding='utf-8'
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210108151632.277015-1-f4bug@amsat.org>
 <CAFEAcA_5YzU7sGhbVtzP7-=PsaJoe3wMxkCPnO=qdY8q6Bf7rw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9c5d25dd-6b4e-85ac-5e71-36540d1f1525@amsat.org>
Date: Fri, 8 Jan 2021 17:44:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_5YzU7sGhbVtzP7-=PsaJoe3wMxkCPnO=qdY8q6Bf7rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.241,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 4:38 PM, Peter Maydell wrote:
> On Fri, 8 Jan 2021 at 15:16, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> When decodetree.py was added in commit 568ae7efae7, QEMU was
>> using Python 2 which happily reads UTF-8 files in text mode.
>> Python 3 requires either UTF-8 locale or an explicit encoding
>> passed to open(). Now that Python 3 is required, explicit
>> UTF-8 encoding for decodetree sources.
>>
>> This fixes:
>>
>>   $ /usr/bin/python3 scripts/decodetree.py test.decode
>>   Traceback (most recent call last):
>>     File "scripts/decodetree.py", line 1397, in <module>
>>       main()
>>     File "scripts/decodetree.py", line 1308, in main
>>       parse_file(f, toppat)
>>     File "scripts/decodetree.py", line 994, in parse_file
>>       for line in f:
>>     File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>>       return codecs.ascii_decode(input, self.errors)[0]
>>   UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 80:
>>   ordinal not in range(128)
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  scripts/decodetree.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
>> index 47aa9caf6d1..fa40903cff1 100644
>> --- a/scripts/decodetree.py
>> +++ b/scripts/decodetree.py
>> @@ -1304,7 +1304,7 @@ def main():
>>
>>      for filename in args:
>>          input_file = filename
>> -        f = open(filename, 'r')
>> +        f = open(filename, 'r', encoding='utf-8')
>>          parse_file(f, toppat)
>>          f.close()
> 
> Should we also be opening the output file explicitly as
> utf-8 ? (How do we say "write to sys.stdout as utf-8" for
> the case where we're doing that?)

I have been wondering about it, but the content written
in the output file is plain C code using only ASCII,
which any locale is able to process. But indeed maybe
we prefer ignore the user locale... I'm not sure.

