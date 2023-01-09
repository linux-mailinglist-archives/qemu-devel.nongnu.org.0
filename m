Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F066281C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:09:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsaz-0006fZ-5O; Mon, 09 Jan 2023 08:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pEsal-0006cI-TV
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:53:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pEsai-0001WK-Co
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673272410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skLu4osG9acM+YVKMnSW9QWA9Yrshp2soRErlz7UXc4=;
 b=TP3QNwK/LpzP2IAG36/lAS6T2hqDfGcYrGIrbEMtV2hCM/ap2oVJWYNsECysvjdkeD8lAs
 9AhxUrj5Iqh0A0iDLC3IbeMXpT6uNpjQeHbj9tVrstPhca1V0DOaI5tUWwXah+ApUB0XpP
 vWLUWQCKejPGBXOjxefLIj64i8rP3do=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-ehiTW9S6MFe0H0-aks7Hwg-1; Mon, 09 Jan 2023 08:53:29 -0500
X-MC-Unique: ehiTW9S6MFe0H0-aks7Hwg-1
Received: by mail-qv1-f70.google.com with SMTP id
 cx11-20020a056214188b00b00531cacde854so5180035qvb.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 05:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=skLu4osG9acM+YVKMnSW9QWA9Yrshp2soRErlz7UXc4=;
 b=UNW2LeTw3rgu5hoOwea1yMoq8DDrhpNIGph5yBooUsfAgxhUfW72Izx4JagmyFEubj
 6YvkbBZXeLs4HjFyJar/9J0zh9bVzif7l8NB974Cz8GgUgisTY7uZbR2wDe4CFBajg6v
 0AlWCMio5KnGgGV4326cHXzWw6SJMMchURk3PFmXUfbAFvhtuDzZrMZznOOdkmN+Bsbx
 ja/9rb1h8Toq/n4aTr5gTpYpoTGU2TKwuCK/WjBXpVB9UPcoqyc2+aaUrNubR9G0JBQD
 8kaBVYnZm4V6D2ZN+5ZFgdzcGIWfr53Y+WC/YeE4JIT3MhyrR5WlokCEhALMvOdnDFMN
 loEQ==
X-Gm-Message-State: AFqh2kpauQHb2LYzHCJOl3s9FCEOZGfsQXFXpl2xPweTuG+/zLVSTBNK
 4TVTiC4ao07nFnSchuE3FOAAjAJBpuSoEXnfj+sHHIrP5v8encywdV6mEDSyZAEQETqifNUEon0
 JovTyJYpwraYCAS4=
X-Received: by 2002:ac8:4514:0:b0:3ab:6b9c:7285 with SMTP id
 q20-20020ac84514000000b003ab6b9c7285mr83849782qtn.44.1673272408673; 
 Mon, 09 Jan 2023 05:53:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvajfHujWKhoLO0yTam35Ca/O6TukAN0gVgRcDvAzzcyosxtkpRQ/OAhEcvHnZMei9ufMoZzg==
X-Received: by 2002:ac8:4514:0:b0:3ab:6b9c:7285 with SMTP id
 q20-20020ac84514000000b003ab6b9c7285mr83849754qtn.44.1673272408427; 
 Mon, 09 Jan 2023 05:53:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a05620a448f00b006ea7f9d8644sm5398983qkp.96.2023.01.09.05.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 05:53:28 -0800 (PST)
Message-ID: <c333500f-307b-7521-c768-99e00509dd15@redhat.com>
Date: Mon, 9 Jan 2023 14:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/4] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-4-clg@kaod.org>
 <49bf32c7-4a44-a3c9-29b5-b6580113700c@linux.ibm.com>
 <bc3ec4b4-1c7a-a4a9-01ea-78fca7ad10c6@kaod.org>
 <8e04a10e-8978-494c-5d0f-2507e78134aa@linux.ibm.com>
 <d9194b49-9841-87b5-6355-b7d5f82da6b6@kaod.org>
 <6d121914-9add-88ab-1650-9735e1fada73@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <6d121914-9add-88ab-1650-9735e1fada73@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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

On 1/9/23 14:45, Janosch Frank wrote:
> On 1/9/23 14:30, Cédric Le Goater wrote:
>> On 1/9/23 10:49, Janosch Frank wrote:
>>> On 1/9/23 10:27, Cédric Le Goater wrote:
>>>> On 1/9/23 10:04, Janosch Frank wrote:
>>>>> On 1/6/23 08:53, Cédric Le Goater wrote:
>>>>>> From: Cédric Le Goater <clg@redhat.com>
>>>>>>
>>>>>> If a secure kernel is started in a non-protected VM, the OS will hang
>>>>>> during boot without giving a proper error message to the user.
>>>>>
>>>>> Most of the time you see nothing in the console because libvirt is too slow. If you start the VM in paused mode, attach a console and then resume it, then you'll see a nice error message.
>>>>
>>>> If you wait long enough, the VM fails to mount / and falls into the dracut
>>>> initrams.
>>>
>>> I have the feeling that we're not talking about the same thing here.>
>>    > A PV VM always starts out as a non-PV VM and is put into PV mode via two diag308 subcodes (8 & 10). ALL PV subcodes (8 - 10) are spec exceptions if the host isn't enabled for PV.
>>
>> The corner case this patch is trying to address is for a PV-enabled host,
>> a secure enabled OS and !PV-enabled QEMU.
>>
>> Please run this command on a secure disk image :
>>
>>     qemu-system-s390x -M s390-ccw-virtio -accel kvm -drive file=<file>,if=virtio,format=qcow2 -nographic -nodefaults -serial mon:stdio
>>
>> and tell me what you get.
>>
> 
> qemu-system-s390x -M s390-ccw-virtio -accel kvm -drive file=u2204.qcow2,if=virtio,format=qcow2 -nographic -nodefaults -serial mon:stdio
> LOADPARM=[        ]
> Using virtio-blk.
> Using SCSI scheme.
> .............................................................................................................................
> Secure unpack facility is not available

Yes. That's with a !PV-enabled host. Correct ?

Can you try with prot_virt=1 on the host please ?

Thanks,

C.


