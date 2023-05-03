Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47EF6F5563
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:54:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9Bm-0005FS-Hx; Wed, 03 May 2023 05:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu9Bg-0005El-Ud
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu9Bf-0004Kz-Bi
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683107654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QfDh1HnKMyX+ix+B/1joO88eLFvIU3pV3Zk04H6Q3pM=;
 b=HMmhNTCTG8cCouiAQOJeA2UYkQnj2ozibxXx0D2mToUwGBcRwapjtmKRA5jQ0uJ3g1L09J
 sfv1D+PtTfzsw9d5WsQ/XP711HUrgyPBXDQ7T19Yoim5HiEbFMvVRC46MaZlWBGYa57XmI
 scpIvA3gzCxOIhnJAVwOecGHqPbCPXc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-DCgv_0MgP2C4LSxEt_YMNg-1; Wed, 03 May 2023 05:54:13 -0400
X-MC-Unique: DCgv_0MgP2C4LSxEt_YMNg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2ff4bc7a770so2879304f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107652; x=1685699652;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QfDh1HnKMyX+ix+B/1joO88eLFvIU3pV3Zk04H6Q3pM=;
 b=NJ43ioLK01cEozi0JvxE/My0JMr7+RjSbDmOSGLaAhPbqRa97aWbGOndayOHMgwnU0
 6rYia+NX5hZiH8gN/ogCcCHgvY/0JLzi0NWuZ8OcwHQ1drtu5x2TMK1HglB5ndpJvi3C
 LL3Gqnj7v0jo9zdJY32DCzsCTBugNhZJqXi1WkGJAm9KxtqXRIer2ijvtLvNqtYC9jp8
 gAB1I0PdNufTpifOki2HsI57qLx7yT8FD5Outs2H+fHZrYYZhQGVcC6wgXg2WnrGQKrR
 yvSO5kURl0AzqNXba84a5VVJoUzYkzAEKfq1peRc7Ek12JldENj/nT2Lmgn0xYub78/w
 96Jg==
X-Gm-Message-State: AC+VfDzUb4y1LN/8wm2ugMEaanuZtrPGaAV1aTUpiy5i8lZLKCXk3fPa
 25awaixOXxfMOLek8TgNg2lXXOuql/ndmIc/C9zksbm4mSqBZEIZ/CaTIaKDI83tQpG6WZqnYSV
 Cv6feYx6YCdgQylpwa9emxTQ=
X-Received: by 2002:a5d:6243:0:b0:2fb:bb97:d975 with SMTP id
 m3-20020a5d6243000000b002fbbb97d975mr14157242wrv.47.1683107652094; 
 Wed, 03 May 2023 02:54:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6z8OMMoDCsW7/+VAR/96RegARypnwnMLqZLZrqW6zoadIY7R4GMQEQxDFLLLf8zI2RTNd5pg==
X-Received: by 2002:a5d:6243:0:b0:2fb:bb97:d975 with SMTP id
 m3-20020a5d6243000000b002fbbb97d975mr14157220wrv.47.1683107651806; 
 Wed, 03 May 2023 02:54:11 -0700 (PDT)
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a5d6186000000b003063772a55bsm4221775wru.61.2023.05.03.02.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:54:11 -0700 (PDT)
Message-ID: <669d2181-7429-5c49-aad1-65fb844f2e5a@redhat.com>
Date: Wed, 3 May 2023 11:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v20 01/21] s390x/cpu topology: add s390 specifics to CPU
 topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
 <20230425161456.21031-2-pmorel@linux.ibm.com>
 <45e09800-6a47-0372-5244-16e2dc72370d@redhat.com>
 <47e3a077-0819-e88b-bc49-a580c8939350@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <47e3a077-0819-e88b-bc49-a580c8939350@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 03/05/2023 11.36, Pierre Morel wrote:
> 
> On 4/27/23 10:04, Thomas Huth wrote:
>> On 25/04/2023 18.14, Pierre Morel wrote:
>>> S390 adds two new SMP levels, drawers and books to the CPU
>>> topology.
>>> The S390 CPU have specific topology features like dedication
>>> and entitlement to give to the guest indications on the host
>>> vCPUs scheduling and help the guest take the best decisions
>>> on the scheduling of threads on the vCPUs.
>>>
>>> Let us provide the SMP properties with books and drawers levels
>>> and S390 CPU with dedication and entitlement,
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> 
> 
> [...]
> 
> 
>>>   {
>>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>>>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
>>> +    unsigned drawers = config->has_drawers ? config->drawers : 0;
>>> +    unsigned books   = config->has_books ? config->books : 0;
>>>       unsigned sockets = config->has_sockets ? config->sockets : 0;
>>>       unsigned dies    = config->has_dies ? config->dies : 0;
>>>       unsigned clusters = config->has_clusters ? config->clusters : 0;
>>> @@ -85,6 +98,8 @@ void machine_parse_smp_config(MachineState *ms,
>>>        * explicit configuration like "cpus=0" is not allowed.
>>>        */
>>>       if ((config->has_cpus && config->cpus == 0) ||
>>> +        (config->has_drawers && config->drawers == 0) ||
>>> +        (config->has_books && config->books == 0) ||
>>>           (config->has_sockets && config->sockets == 0) ||
>>>           (config->has_dies && config->dies == 0) ||
>>>           (config->has_clusters && config->clusters == 0) ||
>>> @@ -111,6 +126,19 @@ void machine_parse_smp_config(MachineState *ms,
>>>       dies = dies > 0 ? dies : 1;
>>>       clusters = clusters > 0 ? clusters : 1;
>>>   +    if (!mc->smp_props.books_supported && books > 1) {
>>> +        error_setg(errp, "books not supported by this machine's CPU 
>>> topology");
>>> +        return;
>>> +    }
>>> +    books = books > 0 ? books : 1;
>>
>> Could be shortened to:  book = books ?: 1;
>>
> More thinking about this, all other existing assignments are done so, 
> clusters, dies, sockets, cores and threads.
> 
> to keep the core consistent shouldn't we keep it the same way?

Fine for me, too. It just might happen that I forget about it and suggest it 
again in a future version of the patch ;-)

  Thomas


