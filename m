Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C7735D10A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 21:29:58 +0200 (CEST)
Received: from localhost ([::1]:48084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW2Fw-00006u-P7
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 15:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lW2E1-0007Kg-3o; Mon, 12 Apr 2021 15:27:57 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:38873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lW2Dv-00053t-5T; Mon, 12 Apr 2021 15:27:56 -0400
Received: by mail-qt1-x82c.google.com with SMTP id j7so10860431qtx.5;
 Mon, 12 Apr 2021 12:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a/OV2LWi+yaLpvjiEM+Xz/EqXBuFKqX34zNrHmYxuQY=;
 b=bbMuQtKJHtBUKnZmlo3vBz6WUkgYO9iHcN6qZmMCBVpYv1LZZynSfEXkUN5Uo4zFll
 r5VZgms2wraXZ9WH+902ZHDIM5mURrSPYTGObpkI/4mW3T2FszePf1NoQFjox8BR3V+j
 ZFhnq0wSTrX9B5FEtOhYdA4yJQ6OxrUiWKyX+CPdlGIXNzxXgVbQ26QrKxm3RGTEaqiS
 xjISFqqYsd8u/1si9kZAP7cvM+SAI5K/OMVgNhezJm+j1II2dsUZr6j6BO0vxqmFCvPD
 083FrJptOt3GzF1BobSYEGSm+4hO2HUROOxzSgd+xXlVC99gM/TXnu7hD32pkq89p+ZK
 8jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a/OV2LWi+yaLpvjiEM+Xz/EqXBuFKqX34zNrHmYxuQY=;
 b=EUTuYKgUPEaxGkGzaYkBxkwcVMZZwxydqcV6/EXYXpMLLhieihMixszAL7GxSwwTtw
 6kRn4zKMuP5+YVPI/1tZgKOnlDxrCuBmbVMaHmf4Y9kelq8JlIEaZBcpa9pO85t7ymdC
 25ydB+0y9J5uFUTTdftb0uHrJ9XsR8vvbEKwgECOvuyitIV+M/OAXgvZdVUyeCv5vkgK
 p5mCtK7xZLKbaaveISA1bKtplRdFqmmAWGQfdhuk+xxB6l9lQb6U7g3uy0BAMUyknM3X
 tHz6L/cpwOzVMQCdXv6I/3MilEA6iOwYrutGhc0mMXpJxWOt5EYgMSdU+rF32m3a4kDW
 MXxA==
X-Gm-Message-State: AOAM5303FH/2X7mwmj6GwTL3rI+6W8O+Q2nskZXlLHBH1JXpdg8YLDhP
 8sNyCdqV5TRE+DmVaYpSPc1i1HBUWpE=
X-Google-Smtp-Source: ABdhPJzEcObwQkyv9kWiQIvSPB3zYZM9GGnxX+63FfBr6TM4xSoJdrjDaViFUCznvyyXQ4DCAxUPLw==
X-Received: by 2002:ac8:6789:: with SMTP id b9mr26355965qtp.103.1618255668218; 
 Mon, 12 Apr 2021 12:27:48 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:92e9:c7f0:1492:45b3:f90e?
 ([2804:431:c7c7:92e9:c7f0:1492:45b3:f90e])
 by smtp.gmail.com with ESMTPSA id t63sm7248431qkh.6.2021.04.12.12.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 12:27:47 -0700 (PDT)
Subject: Re: [PATCH 2/2] spapr.c: always pulse guest IRQ in
 spapr_core_unplug_request()
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210401000437.131140-1-danielhb413@gmail.com>
 <20210401000437.131140-3-danielhb413@gmail.com>
 <YGUx1+bNSR2IFFSV@yekko.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <d8ef1891-6ec6-bacf-e29e-5a4891780c2e@gmail.com>
Date: Mon, 12 Apr 2021 16:27:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YGUx1+bNSR2IFFSV@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/31/21 11:37 PM, David Gibson wrote:
> On Wed, Mar 31, 2021 at 09:04:37PM -0300, Daniel Henrique Barboza wrote:
>> Commit 47c8c915b162 fixed a problem where multiple spapr_drc_detach()
>> requests were breaking QEMU. The solution was to just spapr_drc_detach()
>> once, and use spapr_drc_unplug_requested() to filter whether we already
>> detached it or not. The commit also tied the hotplug request to the
>> guest in the same condition.
>>
>> Turns out that there is a reliable way for a CPU hotunplug to fail. If a
>> guest with one CPU hotplugs a CPU1, then offline CPU0s via 'echo 0 >
>> /sys/devices/system/cpu/cpu0/online', then attempts to hotunplug CPU1,
>> the kernel will refuse it because it's the last online CPU of the
>> system. Given that we're pulsing the IRQ only in the first try, in a
>> failed attempt, all other CPU1 hotunplug attempts will fail, regardless
>> of the online state of CPU1 in the kernel, because we're simply not
>> letting the guest know that we want to hotunplug the device.
>>
>> Let's move spapr_hotplug_req_remove_by_index() back out of the "if
>> (!spapr_drc_unplug_requested(drc))" conditional, allowing for multiple
>> 'device_del' requests to the same CPU core to reach the guest, in case
>> the CPU core didn't fully hotunplugged previously.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> I've applied these to ppc-for-6.0, but..
> 
>> ---
>>   hw/ppc/spapr.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 05a765fab4..e4be00b732 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -3777,8 +3777,17 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
>>   
>>       if (!spapr_drc_unplug_requested(drc)) {
>>           spapr_drc_unplug_request(drc);
>> -        spapr_hotplug_req_remove_by_index(drc);
>>       }
>> +
>> +    /*
>> +     * spapr_hotplug_req_remove_by_index is left unguarded, out of the
>> +     * "!spapr_drc_unplug_requested" check, to allow for multiple IRQ
>> +     * pulses removing the same CPU. Otherwise, in an failed hotunplug
>> +     * attempt (e.g. the kernel will refuse to remove the last online
>> +     * CPU), we will never attempt it again because unplug_requested
>> +     * will still be 'true' in that case.
>> +     */
>> +    spapr_hotplug_req_remove_by_index(drc);
> 
> I think we need similar changes for all the other unplug types (LMB,
> PCI, PHB) - basically retries should always be allowed, and at worst
> be a no-op, rather than generating an error like they do now.


For PHBs should be straightforward. Not so sure about PCI because there is
all the PCI function logic around the hotunplug of function 0.

As for LMBs, we block further attempts because there is no way we can tell
if the hotunplug is being executed but it is taking some time (it is not
uncommon for a DIMM unplug to take 20-30 seconds to complete), versus
an error scenario. What we do ATM is check is the pending DIMM unplug
state exists, and if it does, assume that a hotunplug is pending. I have
no idea what would happen if an unplug request for a LMB DRC reaches the
kernel in the middle of an error rollback (when the kernel reconnects all
the LMBs again) and the same DRC that was rolled back is disconnected
again.

We would need to check not only if the pending dimm unplug state exists, but
also if partially exists. In other words, if there are DRCs of that DIMM that
were unplugged already. That way we can prevent to issue a removal while
the unplug is still running.


Thanks,


DHB

> 
>>   }
>>   
>>   int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
> 

