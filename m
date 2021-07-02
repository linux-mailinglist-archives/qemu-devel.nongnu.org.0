Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95073B9CB1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 09:02:45 +0200 (CEST)
Received: from localhost ([::1]:57898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzDCG-0004QZ-H1
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 03:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lzDAu-0003i5-02
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:01:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lzDAp-0004FF-8T
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 03:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625209272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r17yWP4t2AuK+lFFLzu032Te6SzAp9xnkHqPcL8vqiU=;
 b=XenU6canDdi/L0vCA4GhAzPIJ4bP4/GHHaPjJjNQjfYGo6mmmlBVNYzuY7kxpCi+zfASBp
 SSX5cWHv5cZiG1q8e6iFC5NYltGn6qj2bJaC4mjk9S/5EczpDPVL8GgUCP6l6hEXFPjUY+
 UM+eeyXLDxi5EP2+uNRWUXo+fy5B+2A=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-T9f3gOxWPWy2As-04uc2Zw-1; Fri, 02 Jul 2021 03:01:10 -0400
X-MC-Unique: T9f3gOxWPWy2As-04uc2Zw-1
Received: by mail-pg1-f197.google.com with SMTP id
 m13-20020a633f0d0000b0290222ece48979so6000199pga.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 00:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=r17yWP4t2AuK+lFFLzu032Te6SzAp9xnkHqPcL8vqiU=;
 b=Tf8dP8rnfBRKxIvR+cc90IdW7BDHNz0MP/6eKZa+vH3Wb6MieyyW6JSKCM5zo0+Ntg
 36I9/X4TReABjvaDBvX7ksfym0MFB/92gzilKlhy5H519e2qU8RpMesDVBDVhw373iZt
 KDvhor3JSWIpZyGEQJ6ZmDVSxZuvL/Nbs2Q96I7oCoga8H7Af6yZDSH0YJ/UKmKqrJhm
 Ei5aWAbMWMKa0XSExzjmUoBZFK+5FKkSHaHZuVRGGmMbWubRIPzXBzk4KREILNxQELwe
 mWiwaVbiglSmJM2JeK9RJdShxOeQSuIXAbqvJAslE02ELPgJJbk/riEhsQohR3aUEIRS
 kSxQ==
X-Gm-Message-State: AOAM531/krUn6s8ST6dGvTmtx/sscwX14+KIijUe+IuoyBoSEqngA4zP
 WJqI+YWdAMZeRe4DdJ//IRgwh9CLRiBWceQAhikQmgkkPmIbRmh3lqM4t50vIGEMGBpFdrHY5+z
 QjbBdNy9/dPUcSCE=
X-Received: by 2002:a17:90b:3cc:: with SMTP id
 go12mr3578949pjb.232.1625209269355; 
 Fri, 02 Jul 2021 00:01:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/bu/HKIwo2YfPQnQQNZviqYEyLB/T6bIhYIbuDaDCog92IvCXFstGyrx5TY2ZwGPCPXnk1A==
X-Received: by 2002:a17:90b:3cc:: with SMTP id
 go12mr3578930pjb.232.1625209269064; 
 Fri, 02 Jul 2021 00:01:09 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id i1sm9716851pjs.31.2021.07.02.00.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 00:01:08 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/net: e1000e: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210701094651.1258613-1-bmeng.cn@gmail.com>
 <20210701094651.1258613-2-bmeng.cn@gmail.com>
 <005fb7e4-c73b-41f2-a42c-3f416d3508cf@redhat.com>
 <CAEUhbmWcQRP4mH6DQcjx_Wv=d=EcdJzdhWYgQJYXY9MV6YGUJQ@mail.gmail.com>
 <7c799472-9e18-9f82-87db-ea43dae58f86@redhat.com>
 <CAEUhbmUPR1bwECosEJVqM+-xA8nceMW4rfKhHAe2NKOf4cAb6A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4b5b55bc-c9a1-de7b-ff4e-2bbfb543c3d3@redhat.com>
Date: Fri, 2 Jul 2021 15:01:04 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUPR1bwECosEJVqM+-xA8nceMW4rfKhHAe2NKOf4cAb6A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Christina Wang <christina.wang@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/2 下午2:12, Bin Meng 写道:
> On Fri, Jul 2, 2021 at 1:47 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/7/2 下午12:43, Bin Meng 写道:
>>> On Fri, Jul 2, 2021 at 11:29 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2021/7/1 下午5:46, Bin Meng 写道:
>>>>> From: Christina Wang <christina.wang@windriver.com>
>>>>>
>>>>> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
>>>>> the manual and real hardware.
>>>>>
>>>>> While Linux e1000e driver always writes VET register to 0x8100, it is
>>>>> not always the case for everyone. Drivers relying on the reset value
>>>>> of VET won't be able to transmit and receive VLAN frames in QEMU.
>>>>>
>>>>> Unlike e1000 in QEMU, e1000e uses a field 'vet' in "struct E1000Core"
>>>>> to cache the value of VET register, but the cache only gets updated
>>>>> when VET register is written. To always get a consistent VET value
>>>>> no matter VET is written or remains its reset value, drop the 'vet'
>>>>> field and use 'core->mac[VET]' directly.
>>>>>
>>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
>>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>>>> ---
>>>>>
>>>>>     hw/net/e1000e_core.h |  2 --
>>>>>     hw/net/e1000e.c      |  6 ++----
>>>>>     hw/net/e1000e_core.c | 11 ++++++-----
>>>>>     3 files changed, 8 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
>>>>> index 4ddb4d2c39..07d722bc68 100644
>>>>> --- a/hw/net/e1000e_core.h
>>>>> +++ b/hw/net/e1000e_core.h
>>>>> @@ -105,8 +105,6 @@ struct E1000Core {
>>>>>         uint32_t itr_guest_value;
>>>>>         uint32_t eitr_guest_value[E1000E_MSIX_VEC_NUM];
>>>>>
>>>>> -    uint16_t vet;
>>>>> -
>>>>>         uint8_t permanent_mac[ETH_ALEN];
>>>>>
>>>>>         NICState *owner_nic;
>>>>> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
>>>>> index a8a77eca95..1797e4a7cb 100644
>>>>> --- a/hw/net/e1000e.c
>>>>> +++ b/hw/net/e1000e.c
>>>>> @@ -602,8 +602,8 @@ static const VMStateDescription e1000e_vmstate_intr_timer = {
>>>>>
>>>>>     static const VMStateDescription e1000e_vmstate = {
>>>>>         .name = "e1000e",
>>>>> -    .version_id = 1,
>>>>> -    .minimum_version_id = 1,
>>>>> +    .version_id = 2,
>>>>> +    .minimum_version_id = 2,
>>>>>         .pre_save = e1000e_pre_save,
>>>>>         .post_load = e1000e_post_load,
>>>>>         .fields = (VMStateField[]) {
>>>>> @@ -645,8 +645,6 @@ static const VMStateDescription e1000e_vmstate = {
>>>>>             VMSTATE_UINT32_ARRAY(core.eitr_guest_value, E1000EState,
>>>>>                                  E1000E_MSIX_VEC_NUM),
>>>>>
>>>>> -        VMSTATE_UINT16(core.vet, E1000EState),
>>>> This is not the suggested way. We'd better not bump version in this case.
>>>>
>>>> How about update vet during post_load?
>>> But core.vet is removed in this patch. Not sure how to handle this?
>>
>> Keep using core.vet, sync core.vet with mac[VET] during post_load.
>>
> But keeping using core.vet in the e1000e_core.c will cause mismatch
> with mac[VET] as the commit message says.
>
> We can still keep the 'vet' field in the "struct E1000Core", and keep
> the "VMSTATE_UINT16(core.vet, E1000EState)" here, but it is useless in
> the new code.


The point is to unbreak migration to old version.

Thanks


>
> Regards,
> Bin
>


