Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83263647FBE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:01:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ZFi-0003b5-GK; Fri, 09 Dec 2022 04:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3ZFg-0003at-Gn
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:01:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3ZFe-0000wv-Ta
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670576462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OZWpqANGDDJLJeGy6UtoVUaA4KgbfQimFBGB2nfyjyk=;
 b=Y8uKtFQqzsP04K6w089TP8tm9zLsvlGMRDx1izTQ40dZS6t+em+pmDCsQFXT6TWdgi7Nvy
 1B6iikPkTnhoMErDVNrWVra8wgyBvV+LpgYIhedqMHLvE9X8Mbmw/Oy5m14hh43JNBMDu/
 +wYCW5sFGqIEJ99QxsiXRaqz/Drn5ho=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-6HnqXOH1NM6imXIuRF5pgQ-1; Fri, 09 Dec 2022 04:01:00 -0500
X-MC-Unique: 6HnqXOH1NM6imXIuRF5pgQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m38-20020a05600c3b2600b003d1fc5f1f80so3039538wms.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 01:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OZWpqANGDDJLJeGy6UtoVUaA4KgbfQimFBGB2nfyjyk=;
 b=IJgWJFyq6/tbGwsb3dh4JzxGVdTqDZHP8mHK9VuTmPr+ohXLvaRfle3Nwxj4oN924t
 COpPN+nRFk8sSzA+pPpOX9E5b+JZGIB3x0z0DXnczwqMU+gd8pSSLVt5qUzi1ST0JGuC
 ztAvBbzqTaihitMdSgc3cuOCeBbsUSl8sp4owcj3nVPWxawJ9VrGAaynnkqdBRPit8KB
 x3aLNY8B5A4Kh0Jznwlvpd788g7zJvzBRo5W08RHZvfPAQZUbge/I8Si+lTel9fcwe8S
 oAguzM447HgeN9j/rFAhGC3jAmDXyAi+8N486kMCU1UymjOYLA9x2GAW5yuualhY52EG
 c1Vg==
X-Gm-Message-State: ANoB5pkEsz8LsJzvnF87yQMRy2eD3nNinaEpkpZxl3MuMQ+hjAnzezaw
 EZrefOWr61x1/Q0Inr8DF0VqIxk9uy601kjA1T2CGetlxdehg5HhwWJo6u1pa1I+Ayt26G5/YQ3
 UIyD7d20h0nYOMzc=
X-Received: by 2002:a1c:720f:0:b0:3c6:e63e:23e6 with SMTP id
 n15-20020a1c720f000000b003c6e63e23e6mr4077630wmc.21.1670576459691; 
 Fri, 09 Dec 2022 01:00:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7unNUzDlRS53iJtjzRd9Dp0Ylxv2hqprYsqriQID6wj+gfdPgaP9PuwlQsktpX5wxAZuK/pQ==
X-Received: by 2002:a1c:720f:0:b0:3c6:e63e:23e6 with SMTP id
 n15-20020a1c720f000000b003c6e63e23e6mr4077612wmc.21.1670576459436; 
 Fri, 09 Dec 2022 01:00:59 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-15.web.vodafone.de.
 [109.43.177.15]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b003cf6e1df4a8sm1250556wmq.15.2022.12.09.01.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 01:00:58 -0800 (PST)
Message-ID: <4e62e8a4-7ffe-bd6c-83dc-14edd370f9ac@redhat.com>
Date: Fri, 9 Dec 2022 10:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0] hw/rtc/mc146818rtc: Make this rtc device target
 independent
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221206200641.339116-1-thuth@redhat.com>
 <FA330EEE-29A4-41CF-B4E8-13E5DED680B3@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <FA330EEE-29A4-41CF-B4E8-13E5DED680B3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.266, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/12/2022 15.47, Bernhard Beschow wrote:
> 
> 
> Am 6. Dezember 2022 20:06:41 UTC schrieb Thomas Huth <thuth@redhat.com>:
>> The only code that is really, really target dependent is the apic-related
>> code in rtc_policy_slew_deliver_irq(). By moving this code into the hw/i386/
>> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing this
>> function as parameter to mc146818_rtc_init(), we can make the RTC completely
>> target-independent.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>> include/hw/rtc/mc146818rtc.h |  7 +++++--
>> hw/alpha/dp264.c             |  2 +-
>> hw/hppa/machine.c            |  2 +-
>> hw/i386/microvm.c            |  3 ++-
>> hw/i386/pc.c                 | 10 +++++++++-
>> hw/mips/jazz.c               |  2 +-
>> hw/ppc/pnv.c                 |  2 +-
>> hw/rtc/mc146818rtc.c         | 34 +++++++++++-----------------------
>> hw/rtc/meson.build           |  3 +--
>> 9 files changed, 32 insertions(+), 33 deletions(-)
>>
>> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
>> index 1db0fcee92..c687953cc4 100644
>> --- a/include/hw/rtc/mc146818rtc.h
>> +++ b/include/hw/rtc/mc146818rtc.h
>> @@ -46,14 +46,17 @@ struct RTCState {
>>      Notifier clock_reset_notifier;
>>      LostTickPolicy lost_tick_policy;
> 
> This lost_tick_policy attribute along with its enum is now redundant and can be removed. Removing it avoids an error condition (see below).

lost_tick_policy is used for a property of the device which gets set from 
softmmu/rtc.c, so I would not say that it is unused ... or do I miss something?

  Thomas


