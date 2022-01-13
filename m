Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E420548D2F4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:37:57 +0100 (CET)
Received: from localhost ([::1]:42130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ugG-00035j-VY
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:37:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7uOI-0000oJ-E0
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:19:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n7uOF-0004Ge-8K
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642058358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mK1Qetf/IICT31lP9OOGp5T3YASOcyqJW9P3+c3I7M4=;
 b=a5QHqie+MaCx+z5ufdXj9dJZAeV2Izi+PUc1/ETXhE6jNc6gKMDDMTc3+4INMwU8c9q+zQ
 8goCT+yiEyMF743FSRmmH9BuXQAlsrL+l9BumMWqF/e+3LN6BbuWdPnhsBN+T99yVmYt22
 Wgay3cUrN+gleJocO5uNVT0tWJrESzs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-PFwVhWt8MxqUVId047HsQg-1; Thu, 13 Jan 2022 02:19:11 -0500
X-MC-Unique: PFwVhWt8MxqUVId047HsQg-1
Received: by mail-wm1-f70.google.com with SMTP id
 20-20020a05600c22d400b00349067fe7b7so988110wmg.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 23:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mK1Qetf/IICT31lP9OOGp5T3YASOcyqJW9P3+c3I7M4=;
 b=2fKsQhTiagpDc5eSg2RNUdlX4EUK0PQpjjWHn4awUIPGKvQDSpSHRl9g15HxT3zPHy
 6QhXQzvdpuq7ce9E5eJCsK3S46mj1D2s7HwVIlvn76332GPqI5O5BGJMYEVUot+ODFDE
 F9U+EatQGfvpPe3xVBOG20ZmX73pdRsix3HozjMCjdfapQyB6b5EqUC3Ar9ELOFpDzy4
 UdQaQ+Z+mKBMThpffalXzaeoBc0/xjb/tJNhBvQS/1hn+C1d1Lu3BLp0nku/WZWDz87Q
 I+gv7itFdyL/u2Ngk6KQ8UCXFUfHO4obctKlbqdrF58XooUu3MpdzSdmnfLNlI/pZPjY
 ExMQ==
X-Gm-Message-State: AOAM532De145oE0gY7GavRNtTfeKficaxNtN1VvRvJm2PpgCgukMcy0j
 oYqt29NsItBNj7TGOnkK9aOPa3eX79I23qL1WRVAlcx9rfKu3YH9/Lo2xC1Z1cNhvUXhPufoF9X
 w2e112REqGuXMkNI=
X-Received: by 2002:a7b:c747:: with SMTP id w7mr2562720wmk.89.1642058350295;
 Wed, 12 Jan 2022 23:19:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytHB3sXNqG5am0a/92O5J5EkRSe+CbaPfmnxdRUl8LgXaLeaD5Hx2gMX2UOa3y0gMmdLHf/w==
X-Received: by 2002:a7b:c747:: with SMTP id w7mr2562709wmk.89.1642058350099;
 Wed, 12 Jan 2022 23:19:10 -0800 (PST)
Received: from [192.168.42.76] (tmo-065-240.customers.d1-online.com.
 [80.187.65.240])
 by smtp.gmail.com with ESMTPSA id a20sm1595449wmb.27.2022.01.12.23.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 23:19:09 -0800 (PST)
Message-ID: <a1c2ebd6-1aca-f03e-e55c-f697ed244a06@redhat.com>
Date: Thu, 13 Jan 2022 08:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/sensor: Add SB-TSI Temperature Sensor Interface
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Patrick Venture <venture@google.com>, lvivier@redhat.com, pbonzini@redhat.com
References: <20220108030451.3867815-1-venture@google.com>
 <eaea55f9-71f8-4810-70a7-63aadf252f20@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <eaea55f9-71f8-4810-70a7-63aadf252f20@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Hao Wu <wuhaotsh@google.com>, qemu-devel@nongnu.org,
 Corey Minyard <minyard@acm.org>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2022 10.35, Philippe Mathieu-Daudé wrote:
> Hi Patrick,
> 
> On 1/8/22 04:04, Patrick Venture wrote:
>> From: Hao Wu <wuhaotsh@google.com>
>>
>> SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
>> interface that reports AMD SoC's Ttcl (normalized temperature),
>> and resembles a typical 8-pin remote temperature sensor's I2C interface
>> to BMC.
>>
>> This patch implements a basic AMD SB-TSI sensor that is
>> compatible with the open-source data sheet from AMD and Linux
>> kernel driver.
>>
>> Reference:
>> Linux kernel driver:
>> https://lkml.org/lkml/2020/12/11/968
>> Register Map:
>> https://developer.amd.com/wp-content/resources/56255_3_03.PDF
>> (Chapter 6)
>>
>> Signed-off-by: Hao Wu <wuhaotsh@google.com>
>> Reviewed-by: Doug Evans <dje@google.com>
>> ---
>>   hw/sensor/Kconfig            |   4 +
>>   hw/sensor/meson.build        |   1 +
>>   hw/sensor/tmp_sbtsi.c        | 393 +++++++++++++++++++++++++++++++++++
>>   hw/sensor/trace-events       |   5 +
>>   hw/sensor/trace.h            |   1 +
>>   meson.build                  |   1 +
> 
>>   tests/qtest/meson.build      |   1 +
>>   tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++
> 
> Up to Thomas for qtest, but I'd rather split in 2 patches since
> different set of maintainers / reviewers.

I don't mind too much - but anyway, I'd prefer if we could stick to "-" in 
file names here - mixing underscores and "-" in file names looks somewhat 
weird (I know, there are already some files like this, but I'd prefer if 
we'd not extend that list).

  Thomas



