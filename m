Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B97C52430E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 05:11:27 +0200 (CEST)
Received: from localhost ([::1]:41378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nozEc-0008AP-4f
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 23:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nozDZ-0007Eu-Jd
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:10:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nozDX-0001m8-1P
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:10:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so3715545pjm.1
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 20:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nnEv4kehf2zGjDfi2QO4n4Fm/XUiS4mNyzxpiGKUmu4=;
 b=LNAn1D/3OXZXsWkhXvri0gJz47CwaUfVotVuAz7CBQK0xZZhXeR9RfOzQYqJ8Pmdwy
 jn/GV4Phom8ULzLKJ2Pm94YlJxowX7PuaZ6jEo6zvTpNSAS/CZtw3AGwzWwEmIrsSdi6
 6LlZL22YwEGv6dTCLdYYxNgH6Gp/IKpjDwpy27OFu9+KexmS2n3cwE1aGM3BqjwwtcsR
 jQ8+XltMIOXHtfB3+V6jXt8rv2KZIjTvi7/EX/m6RntMdcPgY6+lHKdVKHMwq9CuB2RH
 LDrtjCt3VeJVRJVbLoKbz898RGilJy9PYpyU7fWfnA/0dL1JNsn/B0sFXei+pq/kUTOg
 0PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nnEv4kehf2zGjDfi2QO4n4Fm/XUiS4mNyzxpiGKUmu4=;
 b=f+Ex6+p0AhpylMdAjE0+Sy0+3AKF9cOvACgKPfv/Jtd94QR633uAoTsuv79YnOcTN1
 ACQ0Q3/WfcPNM5lZ9Us1dTdurAZm1hQHrZzmWgzWWboDXKOn0degI3aAQSQAGaQG5+nA
 vJRrnGb/Xx3jUhu77yse33CxCVK049vxefWwGxH2g2eyNA8B18nmAQUH6sIRiciimq1S
 mHkI/EOmsTJOpuasow31b9NnMfeQSIRPbTgKL+pj9/131yODupPWjtQk0WJKIzssMfDO
 ecxqRn/p9mPgd0C1XRYzHphXzZo0MXBKmJrQlMHAD3SBZITPVm+lrhICEW9dTc9A5H/y
 ioCw==
X-Gm-Message-State: AOAM533js54Dzr794AE6DeGS55A0/xtMjmcL8PXJYXi33OPwxIgzL0h7
 ls+inDSijWEbudMJcRrVn/4+IA==
X-Google-Smtp-Source: ABdhPJyprzdL1ROk67WE+dOQUUSN3tNGeFrleW7pi22F3GsrWK8BZsrAlbcK6Q+b7xqzPNyRZeGbHQ==
X-Received: by 2002:a17:902:710c:b0:15e:e759:c907 with SMTP id
 a12-20020a170902710c00b0015ee759c907mr28354630pll.140.1652325014893; 
 Wed, 11 May 2022 20:10:14 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 o1-20020a170902bcc100b0015e8d4eb1fdsm2354246pls.71.2022.05.11.20.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 20:10:14 -0700 (PDT)
Message-ID: <980eb62c-55e1-d6fc-78da-c4e4e517f30a@ozlabs.ru>
Date: Thu, 12 May 2022 13:10:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [RFC PATCH qemu] spapr/docs: Add a few words about x-vof
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
References: <20220506055124.3822112-1-aik@ozlabs.ru>
 <7008431e-6813-a763-f6fe-30088f1b519b@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <7008431e-6813-a763-f6fe-30088f1b519b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/12/22 06:42, Daniel Henrique Barboza wrote:
> 
> 
> On 5/6/22 02:51, Alexey Kardashevskiy wrote:
>> The alternative small firmware needs a few words of what it can and
>> absolutely cannot do; this adds those words.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>   docs/system/ppc/pseries.rst | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
>> index d9b65ad4e850..4c98a94f9add 100644
>> --- a/docs/system/ppc/pseries.rst
>> +++ b/docs/system/ppc/pseries.rst
>> @@ -32,14 +32,42 @@ Missing devices
>>   Firmware
>>   ========
>> +The pSeries platform in QEMU comes with 2 firmwares:
>> +
>>   `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
>>   implementation of the `IEEE 1275-1994, Standard for Boot 
>> (Initialization
>>   Configuration) Firmware: Core Requirements and Practices
>>   <https://standards.ieee.org/standard/1275-1994.html>`_.
>> +SLOF performs bus scanning, PCI resource allocation, provides the client
>> +interface to boot from block devices and network.
>> +
>>   QEMU includes a prebuilt image of SLOF which is updated when a more 
>> recent
>>   version is required.
>> +VOF (Virtual Open Firmware) is a minimalistic firmware to work with
>> +``-machine pseries,x-vof=on``. When enabled, the firmware acts as a slim
>> +shim and QEMU implements parts of the IEEE 1275 Open Firmware interface.
>> +
>> +VOF does not have device drivers, does not do PCI resource allocation 
>> and
>> +relies on ``-kernel`` used with Linux kernels recent enough (v5.4+)
>> +to PCI resource assignment. It is ideal to use with petitboot.
>> +
>> +Booting via ``-kernel`` supports the following:
>> ++-------------------+-------------------+------------------+
>> +| kernel            | pseries,x-vof=off | pseries,x-vof=on |
>> ++===================+===================+==================+
>> +| vmlinux BE        |     ✓             |     ✓            |
>> ++-------------------+-------------------+------------------+
>> +| vmlinux LE        |     ✓             |     ✓            |
>> ++-------------------+-------------------+------------------+
>> +| zImage.pseries BE |     x             |     ✓¹           |
>> ++-------------------+-------------------+------------------+
>> +| zImage.pseries LE |     ✓             |     ✓            |
>> ++-------------------+-------------------+------------------+
> 
> You need an empty line at the start and at the end of the table. 
> Otherwise it'll
> be rendered as regular text.

How do you build htmls from these btw?

> 
>> +Notes:
> 
> I also don't believe you need the "Notes:" addendum here. It's clear 
> that you're
> making an observation about the zImage.pseries BE and x-vof=on case.

But only this combination needs kernel-addr=0, other images do not need 
that with SLOF or VOF.


> 
> Everything else LGTM. If no one else has any comment, and you're ok with 
> these
> changes I mentioned, I can amend it myself with my R-b.

I'll probably repost after the other patch with kernel-addr is merged 
into your tree. Thanks,


> 
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
>> +¹ must set kernel-addr=0
>> +
>>   Build directions
>>   ================

-- 
Alexey

