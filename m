Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F108067476D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 00:49:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIeeb-0004At-Q6; Thu, 19 Jan 2023 18:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1pIeeZ-0004Aj-H0
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 18:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1pIeeX-0002fD-0l
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 18:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674172141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BOiKhETGH6CSdQorcmHYrntz8tG98WQprGfYAm6czY=;
 b=eJ1jbD9zd2yo1hcTiPf+xd9DIYo8lMecPXFaU8XWSpOYdkwu1Ay/X5p4toU+yWc4CIEcu+
 j8zPyRYNPH6lnMCg63QtgH/CpTo0mOriUqITHPEkOlAkOZR8SppX+QenYvtqMJM8HS/zJ9
 jIwnmFfIJBbx4v6yYPDWkR1iLcgOR7M=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-510-bwL3Q_5YMmaISLuKjTkn8Q-1; Thu, 19 Jan 2023 18:47:32 -0500
X-MC-Unique: bwL3Q_5YMmaISLuKjTkn8Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 a13-20020ac84d8d000000b003b63a85ae73so1693187qtw.21
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 15:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2BOiKhETGH6CSdQorcmHYrntz8tG98WQprGfYAm6czY=;
 b=NryOon+r0rYoZLp6WQujE6PVzO7z+unQPcg9nqrRcUWYGrD6w1h9n4M58eAUTS3bwZ
 sKYEDTrTO2Cso/pm8/hYAlZ5ygwvDuEQzs69ZgjIrz0tp1YLOHlgRgHtaPaLKc725HyZ
 rXL9F6Td8L/NNzFtJNJ0cBm72jiZImuT2Q1FPTxbhakVX0Fn2BgowZ0hxddns60fTi3H
 X4gx8QtZv5S/lIBPaTwJWOJy7M7Sh3Wgzd3L1bgo6NRTM231+A5o7WLpMWt92/pWoPRT
 xpYCTGBWHEt6n0Ze38GdtPa9vHYzEM98Y+eNA+Zch7Va4BJX85zKjsediXO4yMBL+/Ew
 MbyQ==
X-Gm-Message-State: AFqh2kqn8gbaHA4kqXYzoE5inYyN/LLH68sGJXGhfD0bF9LKxYxxMof0
 LTzOVprJ57Z3W5q4S3ZXP/t01kb+bSezcnp0B8VKIZ48TpDcjkN29aAy095080v61r+f2EcnmY/
 f8hXCtpkvirAjksE=
X-Received: by 2002:ac8:4d83:0:b0:3ac:1bd5:b7ad with SMTP id
 a3-20020ac84d83000000b003ac1bd5b7admr15005993qtw.33.1674172052291; 
 Thu, 19 Jan 2023 15:47:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuIyWd4uNXXxR/zyWLlIR3lEMDckuPXaOmoH1PcuBjBD0cV1EQtDCWUBKhJMecihN9Q4ZEiUQ==
X-Received: by 2002:ac8:4d83:0:b0:3ac:1bd5:b7ad with SMTP id
 a3-20020ac84d83000000b003ac1bd5b7admr15005972qtw.33.1674172052025; 
 Thu, 19 Jan 2023 15:47:32 -0800 (PST)
Received: from [10.0.0.97] ([24.225.241.171]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05620a16aa00b006cfc9846594sm15557616qkj.93.2023.01.19.15.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 15:47:31 -0800 (PST)
Message-ID: <bf600fb1-cd7b-d5e3-3596-b675d774457b@redhat.com>
Date: Thu, 19 Jan 2023 18:47:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/2] hw/usb: add configuration flags for emulated and
 passthru usb smartcard
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@gmail.com, pbonzini@redhat.com,
 jasowang@redhat.com, philmd@linaro.com, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221212220949.1278269-1-jmaloy@redhat.com>
 <Y5joc7na7wFJtjt2@fedora>
From: Jon Maloy <jmaloy@redhat.com>
In-Reply-To: <Y5joc7na7wFJtjt2@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 2022-12-13 16:02, Stefan Hajnoczi wrote:
> On Mon, Dec 12, 2022 at 05:09:47PM -0500, Jon Maloy wrote:
>> We add three new configuration flags, LIBCACARD, USB_SMARTCARD_PASSTHRU
>> and USB_SMARTCARD_EMULATED in order to improve configurability of these
>> functionalities.
>>
>> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
>>
>> ---
>> v2: Added a LIBACARD flag, plus reversed 'select' clauses, as suggested
>>      by Paolo Bonzini and Marc-André Lureau.
>>
>> v3: Split in two commits, so that LIBCACARD is added separately, as suggested
>>      by Philippe Mathieu-Daudé.
>>
>>
>> Jon Maloy (2):
>>    hw/usb: add configuration flags for emulated and passthru usb
>>      smartcard
>>    hw/usb: add configuration flag for Common Access Card library code
>>
>>   Kconfig.host       |  3 +++
>>   hw/usb/Kconfig     | 14 ++++++++++++++
>>   hw/usb/meson.build | 11 ++++-------
>>   meson.build        |  1 +
>>   4 files changed, 22 insertions(+), 7 deletions(-)
>>
>> -- 
>> 2.35.3
>>
> I have CCed Gerd Hoffmann since he is the hw/usb/ maintainer.
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Hi Gerd,
It seems this one was forgotten, and never applied.
Could you have a look?

Thanks
///jon


