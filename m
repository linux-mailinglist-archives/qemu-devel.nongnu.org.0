Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1EC348DC8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 11:17:33 +0100 (CET)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPN3U-0003xZ-O6
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 06:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lPN1D-00031j-7J; Thu, 25 Mar 2021 06:15:11 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lPN19-0004Ll-SR; Thu, 25 Mar 2021 06:15:10 -0400
Received: by mail-qt1-x834.google.com with SMTP id u8so1183012qtq.12;
 Thu, 25 Mar 2021 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=flzP86q7K5hsKiFz8qeGes0O7HbAHSqsxug5sddhUnI=;
 b=SvLpfKahvYm5ZyRd20KOtuChGFI4r1oKujJkVnHP3yDv548oMqS/dGYTdn22AmtrLS
 0TKKT+IFrVE46TNwc6TXP6H4l+RFnqpQ4MwDVTLmUes7SbVTQDW+T0sF54eM4kqqu7uR
 huQPsxkoQ7asCc01EmFzICQoltppkjBpeE5Lbk3EDEGLXPwJou504b7DNBwWFIaH9/rh
 HjeYssBEbZzx46oD8sUvwxdGarghtyGWrQMHjYnho2s/w3PuEucuB4jUdeDkcfKTiPg7
 M5emAR4lZhDT/oqdDUPNSqd3uRyAlO3HwM+01BVWKCAPkQI3AGgDzf1OGS1KaUGYXLSu
 6I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=flzP86q7K5hsKiFz8qeGes0O7HbAHSqsxug5sddhUnI=;
 b=lBZwEL92BWz6C8s34g4qsRpaF2A4BS8k/RlYmhyE6wUjAAraIajpW2/+0+lEUH5HFH
 RzCFD0fjvC9+Jg+AGYP+aDeehH4ubIpgFSeuiGDg0M4Ow2OcdRDrH964Mz/94pG3EwNr
 ZKjZxWCatDlCxs9dVKp0/oqqwyGoU8hPesDA+hdUg5vRpPdC0A0vejq3fnSsxkOj6bGN
 7jpEPJh3CAQz9PWzlz++mo+yy+EDWPQTbXvCtY6lHikmMmj6bP6yUky1OhagvOrFdfVW
 dLbEEoO9oQfYanZNa1tXkobldMOvR+eLLFE7xp0zprGQ9BCywnG7dKj1pMzY0VHAH+G2
 kRNw==
X-Gm-Message-State: AOAM531Pg0IyJoRxUXhbA6yU+SDj3JzRfpgO9Yao4n/0jlXwoup6o3dG
 dq6Xe3DJb6wUJV8bKEu3Uo0=
X-Google-Smtp-Source: ABdhPJyV5+xkdz8OLbV5EUp+JDtRTTkO7IFVQwF7cUdY9/79vr+u9ZqViPDFvdGkPZ3I2rC5z5x6ZQ==
X-Received: by 2002:ac8:750a:: with SMTP id u10mr6689703qtq.351.1616667306334; 
 Thu, 25 Mar 2021 03:15:06 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c?
 ([2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c])
 by smtp.gmail.com with ESMTPSA id c73sm3864738qkg.6.2021.03.25.03.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 03:15:05 -0700 (PDT)
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <8554397d-9449-bf31-e52c-702eb88b9e6b@gmail.com>
Date: Thu, 25 Mar 2021 07:15:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/25/21 5:56 AM, Cédric Le Goater wrote:
> On 3/25/21 3:10 AM, David Gibson wrote:
>> On Tue, Mar 23, 2021 at 02:21:33PM -0300, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 3/22/21 10:03 PM, David Gibson wrote:
>>>> On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboza wrote:
>>>>> Kernel commit 4bce545903fa ("powerpc/topology: Update
>>>>> topology_core_cpumask") cause a regression in the pseries machine when
>>>>> defining certain SMP topologies [1]. The reasoning behind the change is
>>>>> explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop updating
>>>>> cpu_core_mask"). In short, cpu_core_mask logic was causing troubles with
>>>>> large VMs with lots of CPUs and was changed by cpu_cpu_mask because, as
>>>>> far as the kernel understanding of SMP topologies goes, both masks are
>>>>> equivalent.
>>>>>
>>>>> Further discussions in the kernel mailing list [2] shown that the
>>>>> powerpc kernel always considered that the number of sockets were equal
>>>>> to the number of NUMA nodes. The claim is that it doesn't make sense,
>>>>> for Power hardware at least, 2+ sockets being in the same NUMA node. The
>>>>> immediate conclusion is that all SMP topologies the pseries machine were
>>>>> supplying to the kernel, with more than one socket in the same NUMA node
>>>>> as in [1], happened to be correctly represented in the kernel by
>>>>> accident during all these years.
>>>>>
>>>>> There's a case to be made for virtual topologies being detached from
>>>>> hardware constraints, allowing maximum flexibility to users. At the same
>>>>> time, this freedom can't result in unrealistic hardware representations
>>>>> being emulated. If the real hardware and the pseries kernel don't
>>>>> support multiple chips/sockets in the same NUMA node, neither should we.
>>>>>
>>>>> Starting in 6.0.0, all sockets must match an unique NUMA node in the
>>>>> pseries machine. qtest changes were made to adapt to this new
>>>>> condition.
>>>>
>>>> Oof.  I really don't like this idea.  It means a bunch of fiddly work
>>>> for users to match these up, for no real gain.  I'm also concerned
>>>> that this will require follow on changes in libvirt to not make this a
>>>> really cryptic and irritating point of failure.
>>>
>>> Haven't though about required Libvirt changes, although I can say that there
>>> will be some amount to be mande and it will probably annoy existing users
>>> (everyone that has a multiple socket per NUMA node topology).
>>>
>>> There is not much we can do from the QEMU layer aside from what I've proposed
>>> here. The other alternative is to keep interacting with the kernel folks to
>>> see if there is a way to keep our use case untouched.
>>
>> Right.  Well.. not necessarily untouched, but I'm hoping for more
>> replies from Cédric to my objections and mpe's.  Even with sockets
>> being a kinda meaningless concept in PAPR, I don't think tying it to
>> NUMA nodes makes sense.
> 
> I did a couple of replies in different email threads but maybe not
> to all. I felt it was going nowhere :/ Couple of thoughts,
> 
> Shouldn't we get rid of the socket concept, die also, under pseries
> since they don't exist under PAPR ? We only have numa nodes, cores,
> threads AFAICT.

I don't think we work with 'die'.

Getting rid of the 'socket' representation is sensible regarding PAPR,
but the effect for pseries will be similar to what this patch is already
doing: users could have multiple sockets in the same NUMA node, and then
they won't. Either because we got rid of the 'socket' representation or
because socket == NUMA node.

> 
> Should we diverged from PAPR and add extra DT properties "qemu,..." ?
> There are a couple of places where Linux checks for the underlying
> hypervisor already.
> 
>>> This also means that
>>> 'ibm,chip-id' will probably remain in use since it's the only place where
>>> we inform cores per socket information to the kernel.
>>
>> Well.. unless we can find some other sensible way to convey that
>> information.  I haven't given up hope for that yet.
> 
> Well, we could start by fixing the value in QEMU. It is broken today.


I'll look into it. It makes more sense to talk about keeping it when
it's working properly.



DHB


> 
> 
> This is all coming from some work we did last year to evaluate our HW
> (mostly for XIVE) on 2s, 4s, 16s systems on baremetal, KVM and PowerVM.
> We saw some real problems because Linux did not have a clear view of the
> topology. See the figures here :
> 
> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210303174857.1760393-9-clg@kaod.org/
> 
> The node id is a key parameter for system resource management, memory
> allocation, interrupt affinity, etc. Linux scales much better if used
> correctly.
> 
> C.
> 

