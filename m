Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FC264C74A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:41:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5PB6-0003ag-Hg; Wed, 14 Dec 2022 05:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5PAz-0003Z6-AV
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:39:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5PAx-0000L6-Nv
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671014387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Wkenrs+ujiU8vud5r51m+YKWxnHOKAbgiQrKXuiRzw=;
 b=ajQQ2naKSFuncCvcoqXc34amWVpY6TlFnYdgPRAHn1jWf4mQi6vebP2xTq/Fw2YhL0rtQd
 CDPXT/tixYuRUdYPWPEUVcxeInjH2neLUfUD37bu6CfOs+3qSlj7cdcCPGVNy4u+5tEJtN
 XZhgsyom5N9/zwcjohRQ+PNMeRtjNEc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-W3TDHvqVMV6ipcS7qlj1bw-1; Wed, 14 Dec 2022 05:39:38 -0500
X-MC-Unique: W3TDHvqVMV6ipcS7qlj1bw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso3994276wml.9
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 02:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Wkenrs+ujiU8vud5r51m+YKWxnHOKAbgiQrKXuiRzw=;
 b=yVn3GFy/ck5MJf3e9lvFfQtvwKUCMdGjTDqxXtxNad/FdXXq1nO7k1jPLoYRkirpCU
 mze+YtbOAGTHOTBxHYKntPqFkapfgNAO1JfF9wRBpUgrNjvvmSrN3+o+jRbST4WAHpFi
 AdvHImA0KnHW71OxNioGqji7yGsjk+ImDTZBNntpXpyssmiX1wtPGUYBb0zI9BmCTYD0
 Clpa/n954CjP3OugU5rdxe6si+EgFgsSYM2QPLt8THdfj1LrTJl2Cl/MAPK64W+WK7WY
 5mkicBTF8sZudezK0asGagTw3kO7IISjESVsAqno0oKllycj6+mvaspyOaOdFEb30oiA
 B7JA==
X-Gm-Message-State: ANoB5pnBAOwkMsfMfXoi9fHAImeIZuLPI9v1x/8A5l9Go35wtLdzsOx3
 OCSSlvWCg77sXwGNHDj1TaGWdwiwdEVG75yvNNQOhqUFY50yfqYmiy2y+l0AN2MdlXcGzkaBUcE
 zz4hkMYJSBkApBRA=
X-Received: by 2002:a05:600c:4fd1:b0:3cf:a08f:10a5 with SMTP id
 o17-20020a05600c4fd100b003cfa08f10a5mr18931826wmq.31.1671014377157; 
 Wed, 14 Dec 2022 02:39:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7FyK2kGQ/X8l+u+weZBL218XKoCFtdJ4Gfht+9/c+XnKO+wcYfwK5VwibQ8vabI7GZZbjJ8Q==
X-Received: by 2002:a05:600c:4fd1:b0:3cf:a08f:10a5 with SMTP id
 o17-20020a05600c4fd100b003cfa08f10a5mr18931801wmq.31.1671014376882; 
 Wed, 14 Dec 2022 02:39:36 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-56.web.vodafone.de.
 [109.43.178.56]) by smtp.gmail.com with ESMTPSA id
 l1-20020a5d6681000000b00241c712916fsm3164363wru.0.2022.12.14.02.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 02:39:36 -0800 (PST)
Message-ID: <3283aa30-b43d-88d7-1c89-5ed404e34c37@redhat.com>
Date: Wed, 14 Dec 2022 11:39:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v13 0/7] s390x: CPU Topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, pasic@linux.ibm.com, richard.henderson@linaro.org, 
 david@redhat.com, cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
 <8c0777d2-7b70-51ce-e64a-6aff5bdea8ae@redhat.com>
 <60f006f4-d29e-320a-d656-600b2fd4a11a@linux.ibm.com>
 <864cc127-2dbd-3792-8851-937ef4689503@redhat.com>
 <90514038-f10c-33e7-3600-e3131138a44d@linux.ibm.com>
 <73238c6c-a9dc-9d18-8ffb-92c8a41922d3@redhat.com>
 <b36eef2e-92ed-a0ea-0728-4a5ea5bf25d9@de.ibm.com>
 <5f609d94-52c5-7505-6bce-79103aa9a789@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <5f609d94-52c5-7505-6bce-79103aa9a789@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/12/2022 18.24, Pierre Morel wrote:
> 
> 
> On 12/13/22 14:41, Christian Borntraeger wrote:
>>
>>
>> Am 12.12.22 um 11:17 schrieb Thomas Huth:
>>> On 12/12/2022 11.10, Pierre Morel wrote:
>>>>
>>>>
>>>> On 12/12/22 10:07, Thomas Huth wrote:
>>>>> On 12/12/2022 09.51, Pierre Morel wrote:
>>>>>>
>>>>>>
>>>>>> On 12/9/22 14:32, Thomas Huth wrote:
>>>>>>> On 08/12/2022 10.44, Pierre Morel wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Implementation discussions
>>>>>>>> ==========================
>>>>>>>>
>>>>>>>> CPU models
>>>>>>>> ----------
>>>>>>>>
>>>>>>>> Since the S390_FEAT_CONFIGURATION_TOPOLOGY is already in the CPU model
>>>>>>>> for old QEMU we could not activate it as usual from KVM but needed
>>>>>>>> a KVM capability: KVM_CAP_S390_CPU_TOPOLOGY.
>>>>>>>> Checking and enabling this capability enables
>>>>>>>> S390_FEAT_CONFIGURATION_TOPOLOGY.
>>>>>>>>
>>>>>>>> Migration
>>>>>>>> ---------
>>>>>>>>
>>>>>>>> Once the S390_FEAT_CONFIGURATION_TOPOLOGY is enabled in the source
>>>>>>>> host the STFL(11) is provided to the guest.
>>>>>>>> Since the feature is already in the CPU model of older QEMU,
>>>>>>>> a migration from a new QEMU enabling the topology to an old QEMU
>>>>>>>> will keep STFL(11) enabled making the guest get an exception for
>>>>>>>> illegal operation as soon as it uses the PTF instruction.
>>>>>>>
>>>>>>> I now thought that it is not possible to enable "ctop" on older QEMUs 
>>>>>>> since the don't enable the KVM capability? ... or is it still somehow 
>>>>>>> possible? What did I miss?
>>>>>>>
>>>>>>>   Thomas
>>>>>>
>>>>>> Enabling ctop with ctop=on on old QEMU is not possible, this is right.
>>>>>> But, if STFL(11) is enable in the source KVM by a new QEMU, I can see 
>>>>>> that even with -ctop=off the STFL(11) is migrated to the destination.
>>
>> This does not make sense. the cpu model and stfle values are not migrated. 
>> This is re-created during startup depending on the command line parameters 
>> of -cpu.
>> Thats why source and host have the same command lines for -cpu. And 
>> STFLE.11 must not be set on the SOURCE of ctop is off.
> 
> OK, so it is a feature
> 
>>
>>
>>>>>
>>>>> Is this with the "host" CPU model or another one? And did you 
>>>>> explicitly specify "ctop=off" at the command line, or are you just 
>>>>> using the default setting by not specifying it?
>>>>
>>>> With explicit cpumodel and using ctop=off like in
>>>>
>>>> sudo /usr/local/bin/qemu-system-s390x_master \
>>>>       -m 512M \
>>>>       -enable-kvm -smp 4,sockets=4,cores=2,maxcpus=8 \
>>>>       -cpu z14,ctop=off \
>>>>       -machine s390-ccw-virtio-7.2,accel=kvm \
>>>>       ...
>>>
>>> Ok ... that sounds like a bug somewhere in your patches or in the kernel 
>>> code ... the guest should never see STFL bit 11 if ctop=off, should it?
>>
>> Correct. If ctop=off then QEMU should disable STFLE.11 for the CPU model.
> 
> Sorry but not completely correct in the case of migration.
> 
> After a migration if the source host specifies ctop=on and target host 
> specifies ctop=off it does see the STFL bit 11.
>
> The admin should not, but can, specify ctop=off on target if the source set 
> ctop=on. Then the target will start and run in a degraded mode.
> 
> Admin should specify the same flags on both ends, as you said above the STFL 
> bits are not migrated and target QEMU can not verify what the original flags 
> were.
> 
> However, isn't it a bug?
> Is there a reason to not prevent QEMU to start with a wrong cpu model like 
> specifying different flags on both ends or even different cpu?

It's clearly an user error if the two QEMUs are started with different flags 
on the source and destination ends. But it would be great if there was a 
generic way to check for this error condition and bail out early instead of 
doing the migration and let the user run into weird problems later... Does 
anybody have an idea whether there is a good and easy way to implement such 
a check?

  Thomas


