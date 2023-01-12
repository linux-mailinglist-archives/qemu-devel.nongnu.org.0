Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A067666BFA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 09:02:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFsVz-0006wN-G7; Thu, 12 Jan 2023 03:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFsVn-0006vw-64
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 03:00:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFsVj-0006B2-Vb
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 03:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673510418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bxeZcxobHQBs+caVgx7QtjuGc0zW2B7T+w1D6B7yIs=;
 b=hzPi8dN91BaMEu2SIpJrLvlE6mHj4hVJTHP9hzhEHH4LmJNH0PkxtJ1qefn80yJ207VBtl
 6w2atXDz/YAvW4fDUWOb6wev3d6a7eRk67SnszqTc7BNxABAzEOUSKMn4GVmX0O4ah2pGy
 cnrwxIH2oim4RVbuZmPnlPOwiaxZCY0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-EaKyP5YdM9KB9X1EXvKEpw-1; Thu, 12 Jan 2023 03:00:16 -0500
X-MC-Unique: EaKyP5YdM9KB9X1EXvKEpw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s20-20020adfa294000000b002b81849101eso3230468wra.16
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 00:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4bxeZcxobHQBs+caVgx7QtjuGc0zW2B7T+w1D6B7yIs=;
 b=BAJyudy3cSorZy2zLNBiMpapw0PmKcolS/vNJ0Sy94lSZKcjCHpEanVn2qS2kJ2Dp+
 NCW2DU+V0sUdTfhyYptiqJV8T4Vjk3i/Vza9FJAzGHtPw5oA5sXRfY75ErLeetbfBBAw
 MJPWWFH3KvMKFS9MsXt9IgjmM8D/+Zbpk9IStC7ERvmAENQ655HrVx/6i4h8xHI1pAIY
 Rq88IG6HBRg+VWt/xEmKT2ZdnvgmyBeMfRb8sIbNTvgyHjY6iyBvTqG109wKeg50PMFH
 v4BauaObDcZuYArskwuVCSrj/rCpJArf7reFj/YJ6zOfz/NvqxI+yzb8ZobVCT+85H4/
 m+Xg==
X-Gm-Message-State: AFqh2kqZPnLPFhZwUvtyEdkjd6dqFxcbdr0pIjozgOTKQnAA+e2B1uJz
 XLBnXGlFinMBwf1GX8U19+TS0HrQsG8BLgmAqgQvMjJJUfYJ9LKmPlyXA24jWh0vlBjx8m9pdhz
 xpAYhFpuXxM7zAvU=
X-Received: by 2002:adf:ed02:0:b0:2bc:841d:b831 with SMTP id
 a2-20020adfed02000000b002bc841db831mr6912578wro.55.1673510415399; 
 Thu, 12 Jan 2023 00:00:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuoa4dXhmYE4b3KwciATEgeFMtHH9C0oC/fg2IU8EfNvBezXHmgYthq/F6bTZN3iYm6yCmxyQ==
X-Received: by 2002:adf:ed02:0:b0:2bc:841d:b831 with SMTP id
 a2-20020adfed02000000b002bc841db831mr6912539wro.55.1673510415022; 
 Thu, 12 Jan 2023 00:00:15 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-128.web.vodafone.de.
 [109.43.177.128]) by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b002366e3f1497sm15893339wrm.6.2023.01.12.00.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 00:00:14 -0800 (PST)
Message-ID: <b4469973-1e3d-7efd-f78a-8afc46f4e3bd@redhat.com>
Date: Thu, 12 Jan 2023 09:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 08/11] qapi/s390/cpu topology: change-topology monitor
 command
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-9-pmorel@linux.ibm.com>
 <999a31e0-56f4-6d14-f264-320f51f259af@redhat.com>
In-Reply-To: <999a31e0-56f4-6d14-f264-320f51f259af@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/01/2023 11.09, Thomas Huth wrote:
> On 05/01/2023 15.53, Pierre Morel wrote:
>> The modification of the CPU attributes are done through a monitor
>> commands.
> 
> s/commands/command/
> 
>> It allows to move the core inside the topology tree to optimise
>> the cache usage in the case the host's hypervizor previously
> 
> s/hypervizor/hypervisor/
> 
>> moved the CPU.
>>
>> The same command allows to modifiy the CPU attributes modifiers
> 
> s/modifiy/modify/
> 
>> like polarization entitlement and the dedicated attribute to notify
>> the guest if the host admin modified scheduling or dedication of a vCPU.
>>
>> With this knowledge the guest has the possibility to optimize the
>> usage of the vCPUs.
> 
> Hmm, who is supposed to call this QMP command in the future? Will there be a 
> new daemon monitoring the CPU changes in the host? Or will there be a 
> libvirt addition for this? ... Seems like I still miss the big picture here...

Or if this is just about to provide an API for future experiments, I'd 
rather suggest to introduce the new commands with a "x-" prefix to mark them 
as experimental (so we would also not need to go through the deprecation 
process in case they don't work out as expected in the future).

  Thomas


