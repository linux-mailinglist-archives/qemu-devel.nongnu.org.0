Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52293E2C60
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:18:53 +0200 (CEST)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0gW-0001xG-TN
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC0fK-0000QH-7s
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:17:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC0fI-0004nj-F4
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628259454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SprEDJyralXoFMpF99VYyyGMBR19sEIvwIQDL2nnwM=;
 b=crIaZJHWf+17gu52w6J79N5/PO3VzxyYrUwsPkatuAbDkazWpsUHCws/Pg4Urzda52TILr
 B0dwMVtz94ES+c/Gu8r+KxGVqPny+fvhMbFXiocXSngjfOg+2iKH/Ox01IhsWpDiRHfEHj
 hobMurG0CrCoO9dibfvEMgCndZLETek=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-fQXygKCNPZSLnJUAyvmJow-1; Fri, 06 Aug 2021 10:17:31 -0400
X-MC-Unique: fQXygKCNPZSLnJUAyvmJow-1
Received: by mail-wm1-f71.google.com with SMTP id
 25-20020a05600c0219b029024ebb12928cso2497684wmi.3
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3SprEDJyralXoFMpF99VYyyGMBR19sEIvwIQDL2nnwM=;
 b=o+czCyiFP8wdOkafMkdmlutRBSYAX3+I1hAiHq7mm2FA6OJ144VxR8G1jSiosBqExT
 5N/CDH32VUNLxhXRVMWFf4xgLdr0IGXzhNnFe2KIreJlFokg5HRaTp7zWSpyMSyanYvz
 t9E98+dbsn4Xxbj5S1S02tAGUsjfGm++rpbxSf6rraPRqP1QdPdJZAF047aHIyJZCdVk
 AfIM69Bg17TEADEfwtRgeKAorh6Sn1pnWteww032DV1UcxA33XQk/0jcJQlZ0SZKBvuD
 phUvlm7Jeke+P3oa1RZbkbJboTPcmvZ/AWMqgneKpLESnnOhEDw8mpLSlKbZ4hnvgTPu
 5KuQ==
X-Gm-Message-State: AOAM533Uk639NEsZPVlD4gX5vRMJWgDyqlwKRTyCOSyknfnZH6dVaRNe
 Jh4TuuARwxUYTNNDNJnsbuuXoCxKYkZGAUFY+9Gr2OcRA8v+8fkfC0x6EV186ZpGycoUDpgUU0R
 iUngVtBU3cZGlQCc=
X-Received: by 2002:a5d:4c92:: with SMTP id z18mr11345792wrs.228.1628259450495; 
 Fri, 06 Aug 2021 07:17:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWvDiM5ClJfn2cqSVLQVdQVjGafczC5L0AleZUhbmBJ93YAVLhYpNe9KY70YatonfUYV/KZg==
X-Received: by 2002:a5d:4c92:: with SMTP id z18mr11345772wrs.228.1628259450288; 
 Fri, 06 Aug 2021 07:17:30 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id i5sm9626797wrs.85.2021.08.06.07.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 07:17:29 -0700 (PDT)
Subject: Re: [PATCH v1 12/12] hw/s390x/s390-skeys: lazy storage key enablement
 under TCG
To: Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-13-david@redhat.com>
 <a44f1cd2-215b-a983-c2cb-a524e308eae9@redhat.com>
 <f56f6ad1-1f80-743c-482b-7dbf4cb75360@redhat.com> <87r1f6y82x.fsf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <effd4c81-a48c-9e72-aa99-964e582327e3@redhat.com>
Date: Fri, 6 Aug 2021 16:17:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <87r1f6y82x.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/08/2021 16.13, Cornelia Huck wrote:
> On Fri, Aug 06 2021, David Hildenbrand <david@redhat.com> wrote:
> 
>> On 06.08.21 11:42, Thomas Huth wrote:
>>> On 05/08/2021 17.28, David Hildenbrand wrote:
>>>> -static void qemu_s390_skeys_init(Object *obj)
>>>> +static int qemu_s390_skeys_enabled(S390SKeysState *ss)
>>>>     {
>>>> -    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(obj);
>>>> -    MachineState *machine = MACHINE(qdev_get_machine());
>>>> +    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(ss);
>>>>     
>>>> -    skeys->key_count = machine->ram_size / TARGET_PAGE_SIZE;
>>>> -    skeys->keydata = g_malloc0(skeys->key_count);
>>>> +    /* Lockless check is sufficient. */
>>>> +    return !!skeys->keydata;
>>>>     }
>>>>     
>>>> -static int qemu_s390_skeys_enabled(S390SKeysState *ss)
>>>> +static int qemu_s390_skeys_enable(S390SKeysState *ss)
>>>
>>> Could you please call this qemu_s390_skeys_activate() so that it's not so
>>> easily confused with the ..._enabled() function?
>>
>> Well, you enable it and you check if it's enabled ... so using different
>> terminology is more confusing, no?
>>
>> I could rename _enabled to is_enabled to make the difference easiert to
>> sport here.
> 
> is_enabled certainly is better than just enabled; otherwise, the two
> function names are just way too similar.
> 

Fine for me, too.

  Thomas


