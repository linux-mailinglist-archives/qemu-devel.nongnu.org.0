Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42073B7FD5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 11:18:47 +0200 (CEST)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyWMo-0002hO-OV
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 05:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyWLH-000174-Ph
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:17:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyWLB-0007N1-NF
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625044624;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgFgSzEusYQshQUJd19+Sc+ka73Na/R/Yka7TYpoofc=;
 b=U3+uEs1sR83AaZJuwlFvpo+rIe/PN5WqaQmMfY+x8vSqGzj0UndEyKm4I8iYkGAVsNvVQx
 z6VXi4uLOhgcccgrZCCIGf46WPR7XvmL63BvNVvvjbFJlOi1j0IBypBbB2liD1SdQ57NYB
 kmnNwHt3SD79fOgJAhkJVInfN2w4340=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-tdodsIdwMZazr5Yk3TcSTg-1; Wed, 30 Jun 2021 05:17:03 -0400
X-MC-Unique: tdodsIdwMZazr5Yk3TcSTg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j2-20020a05600c1c02b02901cecbe55d49so277815wms.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 02:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XgFgSzEusYQshQUJd19+Sc+ka73Na/R/Yka7TYpoofc=;
 b=F0lVUKKdfWMBCewMlhGDjZVYyx29vftx07SnQXUbsZ2BQaQ5ugFMJvnkBjy+oF19Pt
 mZPVl5U6gqM/OrGxu46qd9KItRGK3YXlqROH7buAiuqFpsKfGjGLdj8CqLR/BiqxJ9mT
 cH8CPuZFoUE24JFNi7rjedPgLfmMC+BtYyUD7+gLgq/xhKqpp4dRZJa8HhwLEq8ZbR/1
 9okXWh04hgtKnJSdHHZXh9/2hvPiyxmXaCVt91vFnvmWGNHnZLPuv94y75oJOQjXow0+
 wsUe8AhsP6jE4S9a+wfUrxacT0sMljuXhG0xuHP678ChDeSGwraJeMh1kkJ8P1Yo9qaY
 i/Hg==
X-Gm-Message-State: AOAM530Lj4vfdRqB4/iuK34CErFmIfVBmWA00UR/Kffk6A0ZOiWGcPhe
 VV8V5OdxeULVh5OPt/AvYEWqX5NwE15aZbzycHtXQ7AD2rjkSqq4PTQ6YfPgB4fG1DSYx7QcZ5m
 RktKOCTN8kcIrLW4=
X-Received: by 2002:a5d:4564:: with SMTP id a4mr819241wrc.409.1625044620971;
 Wed, 30 Jun 2021 02:17:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgiYguaDT0QWH97Om9dEm7IouRgAgZstYjwZrVk4pB3kc3fCmA+6q1NeBrU+TuudCZ1xmyqg==
X-Received: by 2002:a5d:4564:: with SMTP id a4mr819224wrc.409.1625044620792;
 Wed, 30 Jun 2021 02:17:00 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id s1sm5576432wmj.8.2021.06.30.02.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 02:17:00 -0700 (PDT)
Subject: Re: [question] Shall we flush ITS tables into guest RAM when shutdown
 the VM?
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
 <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
 <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1d9123e9-705a-36ef-3286-b2f347ec5894@redhat.com>
Date: Wed, 30 Jun 2021 11:16:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: wanghaibin.wang@huawei.com, lushenming@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/30/21 3:38 AM, Kunkun Jiang wrote:
> On 2021/6/30 4:14, Eric Auger wrote:
>> Hi Kunkun,
>>
>> On 6/29/21 11:33 AM, Kunkun Jiang wrote:
>>> Hi all,
>>>
>>> Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
>>> our original intention is to flush the ITS tables into guest RAM at
>>> the point
>>> RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
>>> migration launch so let's simply flush the tables each time the VM gets
>>> stopped.
>>>
>>> But I encountered an error when I shut down the virtual machine.
>>>
>>>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr
>>>> 0x0000000000000001: Permission denied
>>> Shall we need to flush ITS tables into guest RAM when 'shutdown' the
>>> VM?
>>> Or do you think this error is normal?
>> yes we determined in the past this was the right moment do save the
>> tables
>>
>> "with a live migration the guest is still running after
>> the RAM has been first saved, and so the tables may still change
>> during the iterative RAM save. You would actually need to do this
>> at just the point we stop the VM before the final RAM save; that *might*
>> be possible by using a notifier hook a vm run state change to
>> RUN_STATE_FINISH_MIGRATE
>> - if you can do the changes just as the migration flips into that mode
>> it *should* work. " said David.
>>
>> But sometimes as the commit msg says, the VM is stopped before the
>> migration launch - I do not remember the exact scenario tbh -.
> Well, I initially wanted to know more about this scenario to determine
> whether
> a normal shutdown would fall into it.😂
I think it was for save/restore use case. In that case you need to flush
the KVM cache in memory on VM shutdown.
> In my opinion, when the virtual machine is normally shutdown, flushing
> the
> ITS tables is not necessary. If we can't tell the difference between
> 'normal shutdown'
> and the above scenario, then this 'error' is inevitable.
>> So each time the VM is stopped we flush the caches into guest RAM.
>>
>>
>>
>>> This error occurs in the following scenario:
>>> Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC to
>>> the VM.
>>>
>>> The flow is as follows:
>>>
>>> QEMU:
>>> vm_shutdown
>>>      do_vm_stop(RUN_STATE_SHUTDOWN)
>>>          vm_state_notify
>>>              ...
>>>              vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
>>>                  kvm_device_access
>>>
>>> Kernel:
>>>      vgic_its_save_tables_v0
>>>          vgic_its_save_device_tables
>>>              vgic_its_save_itt
>>>
>>> There is such a code in vgic_its_save_itt():
>>>> /*
>>>>   * If an LPI carries the HW bit, this means that this
>>>>   * interrupt is controlled by GICv4, and we do not
>>>>   * have direct access to that state without GICv4.1.
>>>>   * Let's simply fail the save operation...
>>>>   */
>>>> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
>>>>            return -EACCES;
Maybe we miss a piece of code for 4.0 that unsets the forwarding. The
only way to handle this is to make sure  ite->irq->hw is not set on
shutdown, no?

Thanks

Eric
>> As far as I understand you need a v4.1 to migrate,
>> following Shenming's series
>> [PATCH v5 0/6] KVM: arm64: Add VLPI migration support on GICv4.1
>> Maybe sync with him?
> Yes, GICv4 does not support live migrate.
>
> Thanks,
> Kunkun Jiang
>>
>> Thanks
>>
>> Eric
>>
>>
>>> Looking forward to your reply.
>>>
>>> Thanks,
>>> Kunkun Jiang
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>> .
>
>


