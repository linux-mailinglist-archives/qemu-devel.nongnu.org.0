Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF963C6B0A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 09:13:29 +0200 (CEST)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Cbg-0008B7-LC
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 03:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3CRu-0001wN-NS
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 03:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3CRp-0004kQ-Ah
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 03:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626159794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koKdVjo2QqaZo96dRBCfvYG2LdBqxiCmnymcDVoaY7o=;
 b=B53tIUsBf70fBE+/6r2XkaLAO0VDdVvAW5BWgV2g/j7K7VlmgznFbzRdAPB2dmJBx48HVb
 foDMTjunz1nVm0l1UROi/JwicKMSPgnZ/4XLA357TbtyW3/V628I6FK4ZxR7VF4HwxAZyW
 fv77KTqXlRDM/xRwLHSZf/Zzli8oYFs=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-DbGjONSaNXeLljArH7K1gg-1; Tue, 13 Jul 2021 03:03:12 -0400
X-MC-Unique: DbGjONSaNXeLljArH7K1gg-1
Received: by mail-pg1-f198.google.com with SMTP id
 b15-20020a631b4f0000b029022ca62fda1aso4024413pgm.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 00:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=koKdVjo2QqaZo96dRBCfvYG2LdBqxiCmnymcDVoaY7o=;
 b=iUq2kUt9kVTGd476Jfh7iFvBPw8SBYKO/yOV8T+JCfdzUJjiBoSsbUAwRylvL9l1Fu
 9QdHiLFjntuA+v6oVTwExSmyzcGFB0O2fhbegJTqEnUKl/FrHNAt9tC1YU1QfPh/m64X
 OdLu3qJ2ycGmp2tFmBg4s+i/ci7YPtsFZmV2k7q/X2BvWAizxiSV2mCOQTe067GhZ8Un
 CROM2ULoRp9hM+50dil8gOZyCWOQn3aBBu6+B3iEq1npc/XVye8WgbWjumDBUUdQNaWB
 fkV/gIAgAQmxD2IehIZCP2mNFGQdAUT2o0tF5zudzU8rTNok9iOmphwVk5FbUuzFPz6I
 6FZA==
X-Gm-Message-State: AOAM530nHnzz4Y+UR0iB1V/qS0/bY4d6rYs2KjS12/V+PiY5XqVPdvG6
 mNWrnKslbvkLq0/d6m9ZLiC7EUy8L5/Txd/WxNwgteOku9cJn6zNjvXJVrFmO0yjYcE/024+3iR
 /ekzBX75Rx4WCAcQ=
X-Received: by 2002:a17:902:8ec7:b029:11b:acb4:ac43 with SMTP id
 x7-20020a1709028ec7b029011bacb4ac43mr2364380plo.1.1626159791361; 
 Tue, 13 Jul 2021 00:03:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIYGFyhnWsahtuIOYKDIHdviYElgw9GwdNk/gneYKdnIbMrzE5/VHAnZcYthHpmKjZcOoE0g==
X-Received: by 2002:a17:902:8ec7:b029:11b:acb4:ac43 with SMTP id
 x7-20020a1709028ec7b029011bacb4ac43mr2364364plo.1.1626159791068; 
 Tue, 13 Jul 2021 00:03:11 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p40sm16925509pfw.79.2021.07.13.00.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 00:03:10 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
 <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
 <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <63ff5849-d830-87cc-486c-7fc292220424@redhat.com>
Date: Tue, 13 Jul 2021 15:03:05 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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


在 2021/7/13 上午7:06, Bin Meng 写道:
> On Mon, Jul 5, 2021 at 1:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> On Mon, Jul 5, 2021 at 12:21 PM Jason Wang <jasowang@redhat.com> wrote:
>>>
>>> 在 2021/7/2 下午5:24, Bin Meng 写道:
>>>> From: Christina Wang <christina.wang@windriver.com>
>>>>
>>>> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
>>>> the manual and real hardware.
>>>>
>>>> While Linux e1000 driver always writes VET register to 0x8100, it is
>>>> not always the case for everyone. Drivers relying on the reset value
>>>> of VET won't be able to transmit and receive VLAN frames in QEMU.
>>>>
>>>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
>>>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>> ---
>>>>
>>>> (no changes since v1)
>>>>
>>>>    hw/net/e1000.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
>>>> index 4f75b44cfc..20cbba6411 100644
>>>> --- a/hw/net/e1000.c
>>>> +++ b/hw/net/e1000.c
>>>> @@ -29,6 +29,7 @@
>>>>    #include "hw/pci/pci.h"
>>>>    #include "hw/qdev-properties.h"
>>>>    #include "migration/vmstate.h"
>>>> +#include "net/eth.h"
>>>>    #include "net/net.h"
>>>>    #include "net/checksum.h"
>>>>    #include "sysemu/sysemu.h"
>>>> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] = {
>>>>        [MANC]    = E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN |
>>>>                    E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
>>>>                    E1000_MANC_RMCP_EN,
>>>> +    [VET]     = ETH_P_VLAN,
>>>
>>> I wonder if we need a compat flag for this, since we change the behavior.
>>>
>>> (See e1000_properties[])
>>>
>> No we don't need to since it does not break migration.
> Ping?


I admit migration "works" but it doesn't mean it's not broken. It 
changes the guest visible default value of VET register, so it may break 
things silently for the guest.

For old machine types, we should stick the value to the one without this 
fix.

Thanks


>


