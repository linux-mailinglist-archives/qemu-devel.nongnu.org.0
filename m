Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B83E2B3E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 15:19:47 +0200 (CEST)
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBzlK-0000m9-OK
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 09:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBzkD-0008OB-RR
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 09:18:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBzkA-00050x-BA
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 09:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628255913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDqs45YvsjmjRZXAcxLBeeA+GC6LVGH8rlVJxU2R9qY=;
 b=GTPPQ4HDSkjYAiEdMt8cuR+dXCVOMi7nH7CbYMk1Rz2CX9afSszJBwRE2oyrSk/ICtGJpN
 c369EjCtk3wMCzMmYT9YLNgBpyc6KYKIlnLbRhRkHTU4AwNeMKSz3k6S2JsrekebPaQEVY
 Tw3ZcowuNRKR/1d+x/OK3J8EJCYAduE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-oAS1moApOpuArYrsA7cylw-1; Fri, 06 Aug 2021 09:18:32 -0400
X-MC-Unique: oAS1moApOpuArYrsA7cylw-1
Received: by mail-wr1-f69.google.com with SMTP id
 o10-20020a5d684a0000b0290154758805bcso3122481wrw.3
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 06:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rDqs45YvsjmjRZXAcxLBeeA+GC6LVGH8rlVJxU2R9qY=;
 b=QlRzzlghm+h+jqKoCvvHzUv36dQaFsbr+K6XfNbw5UYujqK0QgFyHIOo/nid2gVQ5K
 HmlCDIHWe6uiWApLIAB6h1m/0MxWncEka3OJ/pBOkybhy3CaOr/1W+qbVcb0LtnBwgUM
 Vgr/MJMU3t7RogzOg8ZWLrT3XWW435YljD5wEHIC2iQkchwO8YZ5b4ym99HvwOiGqkt/
 OAqZZpmEP4+uBBa4xMgAQhBspcFOgSwYD6QwCc5kunXhVFX1BMYw8aN43jUK+wuXJuks
 KAjvLfQzRwWQyXaeORl130KFY746M0dnr/LQXhpN4Wv5RVVyNK3vc8ihIBb2ALHPA5ye
 RgPA==
X-Gm-Message-State: AOAM532mhqR3Yy25sYRKNT6Lm1ro/2tw8ml34fygjrwM2LffjIafAk2n
 aR3065i8iRals3CPXZA/zYxdnQMoLMajVi0TlzAqh4g4J6PDLQFvYL8smyfNm5wIDLy5uEBYkWD
 VlwNLh6C8h38d0ZM=
X-Received: by 2002:adf:fc10:: with SMTP id i16mr10836765wrr.229.1628255910844; 
 Fri, 06 Aug 2021 06:18:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZQupTkpHOSExuo/R5zRz5CK+Qh9APBhnZmsYiLPYVyJTDs8CbWkQfuZkCppYr84PjDHVgbw==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr10836737wrr.229.1628255910557; 
 Fri, 06 Aug 2021 06:18:30 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id q14sm9063924wrs.8.2021.08.06.06.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 06:18:30 -0700 (PDT)
Subject: Re: [PATCH v1 12/12] hw/s390x/s390-skeys: lazy storage key enablement
 under TCG
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-13-david@redhat.com>
 <a44f1cd2-215b-a983-c2cb-a524e308eae9@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <f56f6ad1-1f80-743c-482b-7dbf4cb75360@redhat.com>
Date: Fri, 6 Aug 2021 15:18:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a44f1cd2-215b-a983-c2cb-a524e308eae9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 06.08.21 11:42, Thomas Huth wrote:
> On 05/08/2021 17.28, David Hildenbrand wrote:
>> Let's enable storage keys lazily under TCG, just as we do under KVM.
>> Only fairly old Linux versions actually make use of storage keys, so it
>> can be kind of wasteful to allocate quite some memory and track
>> changes and references if nobody cares.
>>
>> We have to make sure to flush the TLB when enabling storage keys after
>> the VM was already running: otherwise it might happen that we don't
>> catch references or modifications afterwards.
>>
>> Add proper documentation to all callbacks.
>>
>> The kvm-unit-tests skey tests keeps on working with this change.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>    hw/s390x/s390-skeys.c           | 51 +++++++++++++++++++++-----
>>    include/hw/s390x/storage-keys.h | 63 +++++++++++++++++++++++++++++++++
>>    target/s390x/mmu_helper.c       |  8 +++++
>>    target/s390x/tcg/mem_helper.c   |  9 +++++
>>    4 files changed, 123 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
>> index 53e16f1b9c..579bdf1d8a 100644
>> --- a/hw/s390x/s390-skeys.c
>> +++ b/hw/s390x/s390-skeys.c
>> @@ -190,18 +190,45 @@ out:
>>        fclose(f);
>>    }
>>    
>> -static void qemu_s390_skeys_init(Object *obj)
>> +static int qemu_s390_skeys_enabled(S390SKeysState *ss)
>>    {
>> -    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(obj);
>> -    MachineState *machine = MACHINE(qdev_get_machine());
>> +    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(ss);
>>    
>> -    skeys->key_count = machine->ram_size / TARGET_PAGE_SIZE;
>> -    skeys->keydata = g_malloc0(skeys->key_count);
>> +    /* Lockless check is sufficient. */
>> +    return !!skeys->keydata;
>>    }
>>    
>> -static int qemu_s390_skeys_enabled(S390SKeysState *ss)
>> +static int qemu_s390_skeys_enable(S390SKeysState *ss)
> 
> Could you please call this qemu_s390_skeys_activate() so that it's not so
> easily confused with the ..._enabled() function?

Well, you enable it and you check if it's enabled ... so using different 
terminology is more confusing, no?

I could rename _enabled to is_enabled to make the difference easiert to 
sport here.

> 
>> diff --git a/include/hw/s390x/storage-keys.h b/include/hw/s390x/storage-keys.h
>> index 2888d42d0b..8b15809716 100644
>> --- a/include/hw/s390x/storage-keys.h
>> +++ b/include/hw/s390x/storage-keys.h
>> @@ -28,9 +28,72 @@ struct S390SKeysState {
>>    
>>    struct S390SKeysClass {
>>        DeviceClass parent_class;
>> +
>> +    /**
>> +     * @skeys_enabled:
>> +     *
>> +     * Check whether storage keys are enabled. If not enabled, they were not
>> +     * enabled lazily either by the guest via a storage key instruction or
>> +     * by the host during migration.
>> +     *
>> +     * If disabled, everything not explicitly triggered by the guest,
>> +     * such as outgoing migration or dirty/change tracking, should not touch
>> +     * storage keys and should not lazily enable it.
>> +     *
>> +     * @ks: the #S390SKeysState
>> +     *
>> +     * Returns 0 if not enabled and 1 if enabled.
>> +     */
>>        int (*skeys_enabled)(S390SKeysState *ks);
>> +
>> +    /**
>> +     * @skeys_enable:
>> +     *
>> +     * Lazily enable storage keys. If this function is not implemented,
>> +     * setting a storage key will lazily enable storage keys implicitly
>> +     * instead. TCG guests have to make sure to flush the TLB of all CPUs
>> +     * if storage keys were not enabled before this call.
>> +     *
>> +     * @ks: the #S390SKeysState
>> +     *
>> +     * Returns 0 if storage keys were not enabled before this call and 1 if
>> +     * they were already enabled.
>> +     */
>> +    int (*skeys_enable)(S390SKeysState *ks);
>> +
>> +    /**
>> +     * @get_skeys:
>> +     *
>> +     * Get storage keys for the given PFN range. This call will fail if
>> +     * storage keys have not been lazily enabled yet.
> 
> Shouldn't there be some modifications to qemu_s390_skeys_get() in that case?
> Or does "fail" mean that it crashes?

qemu_s390_skeys_get() should simply return -EINVAL because 
skeydev->key_count == 0. So don't think we need any modifications.

Makes sense?

-- 
Thanks,

David / dhildenb


