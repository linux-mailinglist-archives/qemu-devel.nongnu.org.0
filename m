Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BA649AD0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:13:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4en0-0001LR-8o; Mon, 12 Dec 2022 04:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4emo-0001If-BG
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4emj-0008Do-RY
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670836060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sBPYy4SSrrjZw+jrVOMWp6jQwmm3JH0xQisWa/AP0s=;
 b=Nf9YrT1B1qVQzukGRJDWlB1wNFhSjbzCgEWl73RP3bJZ7GnfrRketHacgNDAoEcUALKGDe
 XWdDx33Qo7Napk0+Fi5GUxqDIh/+jzzV/8/ZSBpLAmowjxioS4bUPHWMV/RLDJnx+0SZ2v
 UXebCmJ4o62OwcGjj39XUV7e2BB/E8Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-159-0PjmKi2wNFKL-XXeraWwYg-1; Mon, 12 Dec 2022 04:07:24 -0500
X-MC-Unique: 0PjmKi2wNFKL-XXeraWwYg-1
Received: by mail-wm1-f70.google.com with SMTP id
 b47-20020a05600c4aaf00b003d031aeb1b6so3872383wmp.9
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 01:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0sBPYy4SSrrjZw+jrVOMWp6jQwmm3JH0xQisWa/AP0s=;
 b=CICu5+ButzVFbYkd9ao3Tzfe2gdPjqM2ctO2DJaBc0eSMiFOgR2PXljTMPZ2VpR2/v
 lCI5NYj7JgK8As7C+msPRHJu1W8IwbdK6zQSWVo8Q0UgaJnSzeoGFNOpjPU+yFb3VghS
 mt2U1RPOaPWg0vxyAUfmxBf80Ej/ZSeStoPUvj/z66Z3KRF4V9M5f3gOBBM3dErTYA6f
 X4lX7LFHS8H5AWJYcGzCppJRYNK2YaYmPZt9xCs4uMyLhEUsQdc1T2fXueJeJ51IY3tY
 15/B4oW/v4JhxQOKkxAw5+yBLf9ty0MXcoKN6NmmqbxDLRv4arO27sU5CqqOlFOnuDly
 ZJ9Q==
X-Gm-Message-State: ANoB5pn8jHKh/Kkapn+8W4eDVSx9gnNZ2+NxRcCr+2IbJNNmAnjyrpex
 jlsPGOcraN0XNlRqna+DIWIACBv+EBFTATOhrso/f5r4JA9nFHjXIFj9B95X/VONO9Q2fL9Azw7
 RfdUzenPDXrBrCog=
X-Received: by 2002:a1c:6a17:0:b0:3cf:7031:bdcc with SMTP id
 f23-20020a1c6a17000000b003cf7031bdccmr11708035wmc.11.1670836042944; 
 Mon, 12 Dec 2022 01:07:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7sxv4VwcGxfQEfikpi6mNn4cuetCJzNaAH/YbFwkvO1oDoL/87hj0D7aTF883KxWU5Rv1LFQ==
X-Received: by 2002:a1c:6a17:0:b0:3cf:7031:bdcc with SMTP id
 f23-20020a1c6a17000000b003cf7031bdccmr11708010wmc.11.1670836042743; 
 Mon, 12 Dec 2022 01:07:22 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c154900b003d2157627a8sm9127452wmg.47.2022.12.12.01.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:07:22 -0800 (PST)
Message-ID: <864cc127-2dbd-3792-8851-937ef4689503@redhat.com>
Date: Mon, 12 Dec 2022 10:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v13 0/7] s390x: CPU Topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
 <8c0777d2-7b70-51ce-e64a-6aff5bdea8ae@redhat.com>
 <60f006f4-d29e-320a-d656-600b2fd4a11a@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <60f006f4-d29e-320a-d656-600b2fd4a11a@linux.ibm.com>
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

On 12/12/2022 09.51, Pierre Morel wrote:
> 
> 
> On 12/9/22 14:32, Thomas Huth wrote:
>> On 08/12/2022 10.44, Pierre Morel wrote:
>>> Hi,
>>>
>>> Implementation discussions
>>> ==========================
>>>
>>> CPU models
>>> ----------
>>>
>>> Since the S390_FEAT_CONFIGURATION_TOPOLOGY is already in the CPU model
>>> for old QEMU we could not activate it as usual from KVM but needed
>>> a KVM capability: KVM_CAP_S390_CPU_TOPOLOGY.
>>> Checking and enabling this capability enables
>>> S390_FEAT_CONFIGURATION_TOPOLOGY.
>>>
>>> Migration
>>> ---------
>>>
>>> Once the S390_FEAT_CONFIGURATION_TOPOLOGY is enabled in the source
>>> host the STFL(11) is provided to the guest.
>>> Since the feature is already in the CPU model of older QEMU,
>>> a migration from a new QEMU enabling the topology to an old QEMU
>>> will keep STFL(11) enabled making the guest get an exception for
>>> illegal operation as soon as it uses the PTF instruction.
>>
>> I now thought that it is not possible to enable "ctop" on older QEMUs 
>> since the don't enable the KVM capability? ... or is it still somehow 
>> possible? What did I miss?
>>
>>   Thomas
> 
> Enabling ctop with ctop=on on old QEMU is not possible, this is right.
> But, if STFL(11) is enable in the source KVM by a new QEMU, I can see that 
> even with -ctop=off the STFL(11) is migrated to the destination.

Is this with the "host" CPU model or another one? And did you explicitly 
specify "ctop=off" at the command line, or are you just using the default 
setting by not specifying it?

  Thomas


