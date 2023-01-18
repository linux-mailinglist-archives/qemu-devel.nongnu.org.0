Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A46719B3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 11:55:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI64b-0005Cu-0L; Wed, 18 Jan 2023 05:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI64U-0005BG-Td
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:53:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI64T-0003k7-10
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 05:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674039211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGXmpUwAeTH/kxtJIZHfySccA2It9oZAfAEMfDSJlm4=;
 b=Q28uy6yp5ZUf19s9uhQcZkireQEy+8XExi5sLjuIlR0S/M5w3B2wf5troFSl3OMXlCVSeR
 auLFStmXN2zX2pk26D4laK5atGW1SoTzLL9qCgwMVPLFLc56yK+5Ntx3brYCWrBWr5c8rc
 pvQYdslZqXHQig+VRYhVytDb345boHs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-cTVceyQKNsqiPbSZ1qrdlw-1; Wed, 18 Jan 2023 05:53:30 -0500
X-MC-Unique: cTVceyQKNsqiPbSZ1qrdlw-1
Received: by mail-qv1-f69.google.com with SMTP id
 df6-20020a056214080600b00534fe2ad5a3so4007666qvb.11
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 02:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qGXmpUwAeTH/kxtJIZHfySccA2It9oZAfAEMfDSJlm4=;
 b=b5HXN3haghVQ5WqcjXXO0RJK3Zwb1atcRjiUGR7InPuDtACCvHuqJA4uqpdATMTKPC
 pKstYedkg9F0THChNxZzvWgkvn0GKVtPpG8wfMV/h0qi2Yy5zhYpLwZ69iKJ6tYiKkwc
 qOmBHhjqvctTxc51wXBNdZzGGy9fnihcVGR4z50sqInKEPkGhcnIAt7S0oKxYrWkrwTr
 dpt3CYVN7HTQ56n/CuiL+ZX268RsRuDtr28Bo+m7Z40AEc6QIfsbg2TrRo695/U6TRx5
 HUjiePDm8lSa6MiAPm2fe0kldcv/i//VnNt++gU0k9fWmTFVrdhr+hX+gAqOCLrvT2To
 7IOQ==
X-Gm-Message-State: AFqh2krJGX7c4S1Z/vAtdaz7Yd4eH3jumPA13w9vvXNKck1gxDXflwmB
 zs1sUjq2yLsy7k+IUrTdG5JJts9xmJf7I9amIBk2NJlqTSP8wb7e7WocMVZ+ea4Dj1lBPQitJ+c
 AKjS5SpkvZVrr6bI=
X-Received: by 2002:a05:6214:3993:b0:532:2cb5:33e4 with SMTP id
 ny19-20020a056214399300b005322cb533e4mr10833150qvb.14.1674039210227; 
 Wed, 18 Jan 2023 02:53:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucfllY5mmpVeqsTi+ztYzxHjtf/bPaSXptzqeiXdz3lUyMxozOucyeHKbgmIQrNCd3houxgQ==
X-Received: by 2002:a05:6214:3993:b0:532:2cb5:33e4 with SMTP id
 ny19-20020a056214399300b005322cb533e4mr10833129qvb.14.1674039209978; 
 Wed, 18 Jan 2023 02:53:29 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 k19-20020a05620a415300b006fbaf9c1b70sm6940822qko.133.2023.01.18.02.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 02:53:29 -0800 (PST)
Message-ID: <91566c93-a422-7969-1f7e-80c6f3d214f1@redhat.com>
Date: Wed, 18 Jan 2023 11:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-9-pmorel@linux.ibm.com>
 <72baa5b42abe557cdf123889b33b845b405cc86c.camel@linux.ibm.com>
 <cd9e0c88-c2a8-1eca-d146-3fd6639af3e7@redhat.com>
 <5654d88fb7d000369c6cfdbe0213ca9d2bfe013b.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v14 08/11] qapi/s390/cpu topology: change-topology monitor
 command
In-Reply-To: <5654d88fb7d000369c6cfdbe0213ca9d2bfe013b.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17/01/2023 14.31, Nina Schoetterl-Glausch wrote:
> On Tue, 2023-01-17 at 08:30 +0100, Thomas Huth wrote:
>> On 16/01/2023 22.09, Nina Schoetterl-Glausch wrote:
>>> On Thu, 2023-01-05 at 15:53 +0100, Pierre Morel wrote:
>>>> The modification of the CPU attributes are done through a monitor
>>>> commands.
>>>>
>>>> It allows to move the core inside the topology tree to optimise
>>>> the cache usage in the case the host's hypervizor previously
>>>> moved the CPU.
>>>>
>>>> The same command allows to modifiy the CPU attributes modifiers
>>>> like polarization entitlement and the dedicated attribute to notify
>>>> the guest if the host admin modified scheduling or dedication of a vCPU.
>>>>
>>>> With this knowledge the guest has the possibility to optimize the
>>>> usage of the vCPUs.
>>>>
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> ---
...
>>>> +    s390_topology.sockets[s390_socket_nb(id)]--;
>>>
>>> I suppose this function cannot run concurrently, so the same CPU doesn't get removed twice.
>>
>> QEMU has the so-called BQL - the Big Qemu Lock. Instructions handlers are
>> normally called with the lock taken, see qemu_mutex_lock_iothread() in
>> target/s390x/kvm/kvm.c.
> 
> That is good to know, but is that the relevant lock here?
> We don't want to concurrent qmp commands. I looked at the code and it's pretty complicated.

Not sure, but I believe that QMP commands are executed from the main 
iothread, so I think this should be safe? ... CC:-ing some more people who 
might know the correct answer.

  Thomas


