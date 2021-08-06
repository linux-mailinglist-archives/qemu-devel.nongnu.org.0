Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1473E2BFB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 15:53:47 +0200 (CEST)
Received: from localhost ([::1]:37000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0ID-0002di-UB
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 09:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC0HR-0001uO-8j
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 09:52:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC0HO-0004D4-7E
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 09:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628257973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+vBKKhl4JUhGuM6MrCHvbS5rzkle9MVB/Z9S+lm8Ke8=;
 b=f5bLVU6zrt3NCyxLoOPJvZv9nA+fZ6z9c2QhUpGGvTUcgyC6RSOGXi4lBSza1mwGO493BY
 ktgJBtIyjMAngQia28wfsTDoEQAbTaj6EY2TEI6QtD6/zhYe+Qc2bJi4MHEKg3CNIcCmqw
 Sn593K2g5IFf8D2OjsLQn1V7wIqvumg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-Fmp6nOSRMReZ1jJAePtfcQ-1; Fri, 06 Aug 2021 09:52:52 -0400
X-MC-Unique: Fmp6nOSRMReZ1jJAePtfcQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so2466303wmr.9
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 06:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+vBKKhl4JUhGuM6MrCHvbS5rzkle9MVB/Z9S+lm8Ke8=;
 b=atXagJ6LTAqBP2mDDBjnOE8J/T57S5CS/osDobuZ0elS84LX4LxxmcWx/M4ayvr5Hw
 6VecgiYT+J4CHkSp7FIp9Vgm8Ybp0ReF06MmwgpVc79i67Z/WcMz5A2RAyOChH9br+jH
 gIHdqqS1mnV4Ht8QSjQUP2B9BaT5cnO7ZWjc01fN0JSdagxfkw5YmOUQjmUPJVcXWwPi
 xUD6XQlXZgNAMs1G89t5GRWxZY17X4br0y1rEJF+BCzJvZ5TeodngOEsG3wzyCfdSRHL
 F9wuXcMzJZ60y59I1s3NuRmewUSSHpRVf9bgFf1g5tnGBV/mkMLzux92VmnsKBep85PT
 nQNQ==
X-Gm-Message-State: AOAM530dt6uyUzlFLNvET4PC/ulTUyKeU1JNJRHen2xDy/KNTwhGr9lE
 th8rUoJH+79R4lNSC/Ji1mn9hhpHdrde9l2t4ghlJkYPGcZ9NPhjZhTc8XejBLQy7dzrLFtBiUz
 o++KiGtROpgJ5SbM=
X-Received: by 2002:a5d:44c7:: with SMTP id z7mr11342414wrr.286.1628257970868; 
 Fri, 06 Aug 2021 06:52:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGBQwMwW9R9wuepFt0KSgc6yfTEvcRshLbQBNsZgmFdjwYU0KfORc8LnJG2+Ua3l7wpreZhg==
X-Received: by 2002:a5d:44c7:: with SMTP id z7mr11342388wrr.286.1628257970582; 
 Fri, 06 Aug 2021 06:52:50 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id m32sm8184583wms.2.2021.08.06.06.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 06:52:50 -0700 (PDT)
Subject: Re: [PATCH v1 12/12] hw/s390x/s390-skeys: lazy storage key enablement
 under TCG
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-13-david@redhat.com>
 <a44f1cd2-215b-a983-c2cb-a524e308eae9@redhat.com>
 <f56f6ad1-1f80-743c-482b-7dbf4cb75360@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0acca1d9-b340-e280-44ad-bc10fc2d4bf3@redhat.com>
Date: Fri, 6 Aug 2021 15:52:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f56f6ad1-1f80-743c-482b-7dbf4cb75360@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/2021 15.18, David Hildenbrand wrote:
> On 06.08.21 11:42, Thomas Huth wrote:
>> On 05/08/2021 17.28, David Hildenbrand wrote:
>>> Let's enable storage keys lazily under TCG, just as we do under KVM.
>>> Only fairly old Linux versions actually make use of storage keys, so it
>>> can be kind of wasteful to allocate quite some memory and track
>>> changes and references if nobody cares.
>>>
>>> We have to make sure to flush the TLB when enabling storage keys after
>>> the VM was already running: otherwise it might happen that we don't
>>> catch references or modifications afterwards.
>>>
>>> Add proper documentation to all callbacks.
>>>
>>> The kvm-unit-tests skey tests keeps on working with this change.
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>    hw/s390x/s390-skeys.c           | 51 +++++++++++++++++++++-----
>>>    include/hw/s390x/storage-keys.h | 63 +++++++++++++++++++++++++++++++++
>>>    target/s390x/mmu_helper.c       |  8 +++++
>>>    target/s390x/tcg/mem_helper.c   |  9 +++++
>>>    4 files changed, 123 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
>>> index 53e16f1b9c..579bdf1d8a 100644
>>> --- a/hw/s390x/s390-skeys.c
>>> +++ b/hw/s390x/s390-skeys.c
>>> @@ -190,18 +190,45 @@ out:
>>>        fclose(f);
>>>    }
>>> -static void qemu_s390_skeys_init(Object *obj)
>>> +static int qemu_s390_skeys_enabled(S390SKeysState *ss)
>>>    {
>>> -    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(obj);
>>> -    MachineState *machine = MACHINE(qdev_get_machine());
>>> +    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(ss);
>>> -    skeys->key_count = machine->ram_size / TARGET_PAGE_SIZE;
>>> -    skeys->keydata = g_malloc0(skeys->key_count);
>>> +    /* Lockless check is sufficient. */
>>> +    return !!skeys->keydata;
>>>    }
>>> -static int qemu_s390_skeys_enabled(S390SKeysState *ss)
>>> +static int qemu_s390_skeys_enable(S390SKeysState *ss)
>>
>> Could you please call this qemu_s390_skeys_activate() so that it's not so
>> easily confused with the ..._enabled() function?
> 
> Well, you enable it and you check if it's enabled ... so using different 
> terminology is more confusing, no?
> 
> I could rename _enabled to is_enabled to make the difference easiert to 
> sport here.
> 
>>
>>> diff --git a/include/hw/s390x/storage-keys.h 
>>> b/include/hw/s390x/storage-keys.h
>>> index 2888d42d0b..8b15809716 100644
>>> --- a/include/hw/s390x/storage-keys.h
>>> +++ b/include/hw/s390x/storage-keys.h
>>> @@ -28,9 +28,72 @@ struct S390SKeysState {
>>>    struct S390SKeysClass {
>>>        DeviceClass parent_class;
>>> +
>>> +    /**
>>> +     * @skeys_enabled:
>>> +     *
>>> +     * Check whether storage keys are enabled. If not enabled, they were 
>>> not
>>> +     * enabled lazily either by the guest via a storage key instruction or
>>> +     * by the host during migration.
>>> +     *
>>> +     * If disabled, everything not explicitly triggered by the guest,
>>> +     * such as outgoing migration or dirty/change tracking, should not 
>>> touch
>>> +     * storage keys and should not lazily enable it.
>>> +     *
>>> +     * @ks: the #S390SKeysState
>>> +     *
>>> +     * Returns 0 if not enabled and 1 if enabled.
>>> +     */
>>>        int (*skeys_enabled)(S390SKeysState *ks);
>>> +
>>> +    /**
>>> +     * @skeys_enable:
>>> +     *
>>> +     * Lazily enable storage keys. If this function is not implemented,
>>> +     * setting a storage key will lazily enable storage keys implicitly
>>> +     * instead. TCG guests have to make sure to flush the TLB of all CPUs
>>> +     * if storage keys were not enabled before this call.
>>> +     *
>>> +     * @ks: the #S390SKeysState
>>> +     *
>>> +     * Returns 0 if storage keys were not enabled before this call and 1 if
>>> +     * they were already enabled.
>>> +     */
>>> +    int (*skeys_enable)(S390SKeysState *ks);
>>> +
>>> +    /**
>>> +     * @get_skeys:
>>> +     *
>>> +     * Get storage keys for the given PFN range. This call will fail if
>>> +     * storage keys have not been lazily enabled yet.
>>
>> Shouldn't there be some modifications to qemu_s390_skeys_get() in that case?
>> Or does "fail" mean that it crashes?
> 
> qemu_s390_skeys_get() should simply return -EINVAL because 
> skeydev->key_count == 0. So don't think we need any modifications.
> 
> Makes sense?

Ah, right, make sense, indeed.

  Thomas


