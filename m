Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663F42CDF75
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 21:14:09 +0100 (CET)
Received: from localhost ([::1]:37594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkuzQ-0004f8-27
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 15:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkuyE-0004Bi-Bl
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 15:12:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkuyB-0001Ms-VB
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 15:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607026370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RASYWdf8NMSiAIUtqpJCsWOV+GA6wfqcM05fte4l8uM=;
 b=OWsXhzroo1G5yHyUiGnCMXNYSlafIBkNZQCru+Lo4MGwwPZnPduyLpeh/bjxUqQlrl8ioE
 73LEF0CyJCdX2cld2fNcSBC5ACqAUuXp/rVa1LCShHk0/fj1R6zmtknmnylMFWMSpJ4fm6
 Whiciockhhi8Kmoa3t3/NQA3cC9JeFw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-WDgnfw5aOFCMVVQMQLiw8A-1; Thu, 03 Dec 2020 15:12:48 -0500
X-MC-Unique: WDgnfw5aOFCMVVQMQLiw8A-1
Received: by mail-ed1-f70.google.com with SMTP id e11so501316edn.11
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 12:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RASYWdf8NMSiAIUtqpJCsWOV+GA6wfqcM05fte4l8uM=;
 b=Ss+VcGn+K9/eeEcKftSYrLfFOOzWxLXiqnXrcgZJy3QyJgAKnp0/vcMXbGasQsNy9R
 LAy/IblhS0jONILaethNWe0rrUb6x+esjnU1nPNVWxm/wIq6liLULSTXYQYmCwkNOVO+
 3fxR6PV7+HNKI6ZialDcKoKohaJrT31vqbXcVHljWcXhU4Ux7USHdngKuhvBijjINNn3
 nBKreXOA88kKfojp1r7FL+Hnj7XQaNu98EFsb0elwPGXB4Q99AEjXNEidqOG+8D2HLYc
 8Y7qZAFQtR7husJ7uUMaodSRpCv36UbpXN0+MgafEWsAxMWMu40eqQRzRUVZTp8UxIlF
 VnJQ==
X-Gm-Message-State: AOAM5303HY38yjlinwF8ndEb/B4PFKZZjaRBJ5AZZOwbt5v1O3Q4HYO+
 /nWd7NmX94kGtUg7iH6EKdzzwHAHkYfgzuQKqIUWhN2zo2avXB3BmKgR2zywOL3I3IQUTNgaPwS
 3OnA+P1Av7eHIvd8=
X-Received: by 2002:aa7:c58a:: with SMTP id g10mr4368732edq.315.1607026367239; 
 Thu, 03 Dec 2020 12:12:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOmNXTEFPpj7S48AmwojGnuxDSHQS5DUg0ELi8Bdk2D1fPB34OALH+tSvIEBrFqyijb93/QA==
X-Received: by 2002:aa7:c58a:: with SMTP id g10mr4368710edq.315.1607026366994; 
 Thu, 03 Dec 2020 12:12:46 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id q5sm1516288ejr.89.2020.12.03.12.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 12:12:46 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: test hot(un)plug of ccw devices
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
References: <20201203153917.66685-1-cohuck@redhat.com>
 <71a7ee0f-8ca1-e3d0-8817-e51d0cb4c02c@redhat.com>
 <4c4c7adf-4152-2f83-082f-f208aa8d7f7d@redhat.com>
 <74310bfd-ec45-7ec0-ed7b-02fe49f71de0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cc9b088b-3b1a-ee43-2ff6-a003f12ce65a@redhat.com>
Date: Thu, 3 Dec 2020 21:12:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <74310bfd-ec45-7ec0-ed7b-02fe49f71de0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/20 7:14 PM, Thomas Huth wrote:
> On 03/12/2020 19.11, Philippe Mathieu-Daudé wrote:
>> On 12/3/20 6:22 PM, Thomas Huth wrote:
>>> On 03/12/2020 16.39, Cornelia Huck wrote:
>>>> Hotplug a virtio-net-ccw device, and then hotunplug it again.
>>>
>>> Good idea! ... is it also possible with a pci device?
>>>
>>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>>> ---
>> ...
>>>> +        exec_command_and_wait_for_pattern(self, 'dmesg | tail -n 1', 'CRW')
>>>
>>> That looks like it could be a little bit racy ... what if the kernel outputs
>>> another log message by chance, so that tail -n 1 reports that instead.
>>>
>>> I think it would be better to clear the dmesg log ("dmesg -c") before
>>> plugging, and then look at all the new output of "dmesg" without using
>>> "tail" afterwards.
>>
>> "dmesg --follow"?
> 
> Then you'd need to send control-c afterwards to stop it? ... not sure
> whether that's such a better solution...

Oh indeed, I missed there is further interaction.

Thanks,

Phil.


