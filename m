Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6D61E1E4
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 12:39:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ordyQ-0003QC-MH; Sun, 06 Nov 2022 06:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ordyO-0003Pw-7L
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 06:37:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ordyK-0007Nq-RB
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 06:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667734671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvYtUaq9PZ7P1LfxxWz8L3x7PiJUZo8m0lYyPPjz+XQ=;
 b=hNLkShXKXKaVNR9ylx/mb5AWk5hVXZjSBpcOyjX+TbTbT3H2FoKQdmd2Tigr4CjccO2Sdq
 e0K4UyHksoC/ulRqrAxKcxm1qOeOhJMTstN8fitPkEY5VeKmLgO/ZCL7uVDKh04r+2Sbu1
 TyKIFJdg3sA5m56NF2B+WZb0TH+YHTc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118--SGONIWsO2OnWhlEedcdeg-1; Sun, 06 Nov 2022 06:37:49 -0500
X-MC-Unique: -SGONIWsO2OnWhlEedcdeg-1
Received: by mail-ed1-f69.google.com with SMTP id
 v18-20020a056402349200b004622e273bbbso6390034edc.14
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 03:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hvYtUaq9PZ7P1LfxxWz8L3x7PiJUZo8m0lYyPPjz+XQ=;
 b=tVQuQoai+vHhHkf+GY4xT3rC7k6u/+cvM1zfaf0SF0i81NCXtQfdXJCtICWmOd1LlI
 76gorA7t/rBaex32yNhnVX9gqrVLxwcXHHU6fd0IPNHMO+ogxp/itlneiQnigbVUgtn4
 prTmbnySM07fBHT85orj3Vod58LXxcALPN0hhEeBh/nI/HH2BDJny28WIlQznQ9VjlB5
 iidiQQTp7QY1fG7lkru+rHCj2Gp3ax4rPoYQ4WoP5uc5I462vwb4+YY0CjpguM/Yk/T4
 zVMVOrOQsQLr4OcB2YNsLHKE2s+F8HDC4ziz1nRDhOjwV7MlUtsW6vxboqHaAwy3tqRf
 sijw==
X-Gm-Message-State: ACrzQf0T/z75PixSu+SrldUEdul3gIcmYnv5NszpcZlLS3x5lqIKndLc
 ynnErtqxIAgMMWOZd5uodJVxJIhmEQ4nYx4QIYcQsm1JEV2wuI1K4WF+pKno89iNFZ8ZzmVoqj+
 ZE7auCwW46bJ6Y/0=
X-Received: by 2002:a05:6402:884:b0:461:1ed:579f with SMTP id
 e4-20020a056402088400b0046101ed579fmr44671886edy.413.1667734668664; 
 Sun, 06 Nov 2022 03:37:48 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4ucyvgaAuUDiTySpxjMelcJvAVksqQKfaZH5y4trZWFzfcldn4jy6hLF0HpAM2plHC2lVPdQ==
X-Received: by 2002:a05:6402:884:b0:461:1ed:579f with SMTP id
 e4-20020a056402088400b0046101ed579fmr44671835edy.413.1667734668135; 
 Sun, 06 Nov 2022 03:37:48 -0800 (PST)
Received: from [192.168.8.100] (tmo-067-175.customers.d1-online.com.
 [80.187.67.175]) by smtp.gmail.com with ESMTPSA id
 ca26-20020a170906a3da00b0078b03d57fa7sm2018768ejb.34.2022.11.06.03.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 03:37:47 -0800 (PST)
Message-ID: <5fd39710-902e-bc26-65ec-12cabe24178d@redhat.com>
Date: Sun, 6 Nov 2022 12:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v11 01/11] s390x: Register TYPE_S390_CCW_MACHINE
 properties as class properties
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com
References: <20221103170150.20789-1-pmorel@linux.ibm.com>
 <20221103170150.20789-2-pmorel@linux.ibm.com>
 <3f913a58-e7d0-539e-3bc0-6cbd5608db8e@redhat.com>
 <7d809617-67e0-d233-97b2-8534e2a4610f@linux.ibm.com>
 <6415cf08-e6a1-c72a-1c56-907d3a446a8c@kaod.org>
 <7a3c34dc-2c16-6fdd-e8bc-7a1c623823ae@redhat.com>
 <7177da22-ca19-6510-9bf3-4120140f5431@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <7177da22-ca19-6510-9bf3-4120140f5431@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/11/2022 15.57, Pierre Morel wrote:
> 
> 
> On 11/4/22 15:29, Thomas Huth wrote:
>> On 04/11/2022 11.53, Cédric Le Goater wrote:
>>> On 11/4/22 11:16, Pierre Morel wrote:
>>>>
>>>>
>>>> On 11/4/22 07:32, Thomas Huth wrote:
>>>>> On 03/11/2022 18.01, Pierre Morel wrote:
>>>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>>>> ---
>>>>>>   hw/s390x/s390-virtio-ccw.c | 127 +++++++++++++++++++++----------------
>>>>>>   1 file changed, 72 insertions(+), 55 deletions(-)
>>>>>
>>>>> -EMISSINGPATCHDESCRIPTION
>>>>>
>>>>> ... please add some words *why* this is a good idea / necessary.
>>>>
>>>> I saw that the i386 patch had no description for the same patch so...
>>>>
>>>> To be honest I do not know why it is necessary.
>>>> The only reason I see is to be in sync with the PC implementation.
>>>>
>>>> So what about:
>>>> "
>>>> Register TYPE_S390_CCW_MACHINE properties as class properties
>>>> to be conform with the X architectures
>>>> "
>>>> ?
>>>>
>>>> @Cédric , any official recommendation for doing that?
>>>
>>> There was a bunch of commits related to QOM in this series :
>>>
>>>    91def7b83 arm/virt: Register most properties as class properties
>>>    f5730c69f0 i386: Register feature bit properties as class properties
>>>
>>> which moved property definitions at the class level.
>>>
>>> Then,
>>>
>>>    commit d8fb7d0969 ("vl: switch -M parsing to keyval")
>>>
>>> changed machine_help_func() to use a machine class and not machine
>>> instance anymore.
>>>
>>> I would use the same kind of commit log and add a Fixes tag to get it
>>> merged in 7.2
>>
>> Ah, so this fixes the problem that running QEMU with " -M 
>> s390-ccw-virtio,help" does not show the s390x-specific properties anymore? 
>> ... that's certainly somethings that should be mentioned in the commit 
>> message! What about something like this:
>>
>> "Currently, when running 'qemu-system-s390x -M -M s390-ccw-virtio,help' 
>> the s390x-specific properties are not listed anymore. This happens because 
>> since commit d8fb7d0969 ("vl: switch -M parsing to keyval") the properties 
>> have to be defined at the class level and not at the instance level 
>> anymore. Fix it on s390x now, too, by moving the registration of the 
>> properties to the class level"
>>
>> Fixes: d8fb7d0969 ("vl: switch -M parsing to keyval")
>>
>> ?
>>
>>   Thomas
>>
> 
> That seems really good :)

All right, I've queued this patch (with the updated commit description) and 
the next one on my s390x-branch for QEMU 7.2:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


