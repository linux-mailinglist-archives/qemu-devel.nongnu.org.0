Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F2B455B96
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 13:34:20 +0100 (CET)
Received: from localhost ([::1]:60314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mngcN-0004Ju-IU
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 07:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngaQ-0002YB-Kn
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:32:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngaN-0008Rx-WF
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637238735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PIjplUkEp6bYZcYD8o4D2CocCYwmeYNybsQIOFEg50=;
 b=L7BHRJQLRPtc2n2fr4rUXL2iWWl/SMC0/VNmtjiJrquOF9RcwpHNVIdfnhEWkTRKvhLOTa
 04lX1b7rwcYJNpGNa1QbbNOuNq8pnLyZN+Cb0n2iuFLhSGAAgic6faq6HL8Lt7+GPVBulX
 D8/8OmT/7Id/znv7dcheAFxzvtZQ5/s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-kfAJpMcjMfmP1ZYl9-vMEg-1; Thu, 18 Nov 2021 07:32:14 -0500
X-MC-Unique: kfAJpMcjMfmP1ZYl9-vMEg-1
Received: by mail-wm1-f71.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so4265297wmc.7
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 04:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1PIjplUkEp6bYZcYD8o4D2CocCYwmeYNybsQIOFEg50=;
 b=MkkoMcZ/O7evywwxGHL2e1/h+0w5TEImr+6pcZsv3X1J93P4H436NaZmBtdueUFcg3
 HBpnsJDsOq6PKQufkSibcOvUc91gTK2FJLAvq8Nvf1krSvsCZGCf4AmFBv+Irf2zSVC3
 BpICwxrabhxpJBSM752Gzz3IoJVWle/Gy1dw+AJzctK+heF8Kp28eQfiUSkPNi+05Pfs
 1t4JCXRlwALtuTeGO6Dq3e5keUbsCvWhuzv9ZRcdvt7ejrNf6tBu0JludJY3JQRbNCo4
 SxfSG4iAAnGZV6PpudjJexmYfrT0YavO6t8CKDq5wkpVtjZV7BAuDVqvFn3KSdcsX8rY
 lxYg==
X-Gm-Message-State: AOAM531CIfijIhR9Fff9yB1zlOq6j9dggTNCqaPnQx6/vaV7ONwk2D3h
 xA4eMnjBxZClneCbPKxns7Hn2IMl4Oq8Uj2YFcJNhvqmjifbH+yBkkDinw9rJLeTdnu+8AaCNnX
 ER4gk/CLJBwwBWDo=
X-Received: by 2002:a05:6000:1acd:: with SMTP id
 i13mr31555797wry.398.1637238733059; 
 Thu, 18 Nov 2021 04:32:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhD2CTQQvqdEfGzZ18fJKLOZ9iZf33et4S5+kNDOichWhAf43LO19z79yxxVQfkBqiBDXsrQ==
X-Received: by 2002:a05:6000:1acd:: with SMTP id
 i13mr31555767wry.398.1637238732862; 
 Thu, 18 Nov 2021 04:32:12 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n184sm8481659wme.2.2021.11.18.04.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 04:32:12 -0800 (PST)
Message-ID: <a6f1b39a-a9ac-1d5e-7b48-9b886bc3680e@redhat.com>
Date: Thu, 18 Nov 2021 13:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2] net: vmxnet3: validate configuration values
 during activate (CVE-2021-20203)
To: P J P <pj.pandit@yahoo.co.in>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210130131652.954143-1-ppandit@redhat.com>
 <c15f0f4f-dee0-4414-6496-fe4844d34bdf@redhat.com>
 <1881029915.2747345.1634548172221@mail.yahoo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <1881029915.2747345.1634548172221@mail.yahoo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gaoning Pan <pgn@zju.edu.cn>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 10/18/21 11:09, P J P wrote:
> On Monday, 18 October, 2021, 12:20:55 pm IST, Thomas Huth <thuth@redhat.com> wrote:
> On 30/01/2021 14.16, P J P wrote:
>>> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
>>> index eff299f629..4a910ca971 100644
>>> --- a/hw/net/vmxnet3.c
>>> +++ b/hw/net/vmxnet3.c
>>> @@ -1420,6 +1420,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>>       vmxnet3_setup_rx_filtering(s);
>>>       /* Cache fields from shared memory */
>>>       s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
>>> +    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
>>>       VMW_CFPRN("MTU is %u", s->mtu);
>>>   
>>>       s->max_rx_frags =
>>> @@ -1473,6 +1474,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>>           /* Read rings memory locations for TX queues */
>>>           pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.txRingBasePA);
>>>           size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.txRingSize);
>>> +        if (size > VMXNET3_TX_RING_MAX_SIZE) {
>>> +            size = VMXNET3_TX_RING_MAX_SIZE;
>>> +        }
>>>   
>>>           vmxnet3_ring_init(d, &s->txq_descr[i].tx_ring, pa, size,
>>>                             sizeof(struct Vmxnet3_TxDesc), false);
>>> @@ -1483,6 +1487,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>>           /* TXC ring */
>>>           pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.compRingBasePA);
>>>           size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.compRingSize);
>>> +        if (size > VMXNET3_TC_RING_MAX_SIZE) {
>>> +            size = VMXNET3_TC_RING_MAX_SIZE;
>>> +        }
>>>           vmxnet3_ring_init(d, &s->txq_descr[i].comp_ring, pa, size,
>>>                             sizeof(struct Vmxnet3_TxCompDesc), true);
>>>           VMXNET3_RING_DUMP(VMW_CFPRN, "TXC", i, &s->txq_descr[i].comp_ring);
>>> @@ -1524,6 +1531,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>>               /* RX rings */
>>>               pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.rxRingBasePA[j]);
>>>               size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.rxRingSize[j]);
>>> +            if (size > VMXNET3_RX_RING_MAX_SIZE) {
>>> +                size = VMXNET3_RX_RING_MAX_SIZE;
>>> +            }
>>>               vmxnet3_ring_init(d, &s->rxq_descr[i].rx_ring[j], pa, size,
>>>                                 sizeof(struct Vmxnet3_RxDesc), false);
>>>               VMW_CFPRN("RX queue %d:%d: Base: %" PRIx64 ", Size: %d",
>>> @@ -1533,6 +1543,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>>           /* RXC ring */
>>>           pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.compRingBasePA);
>>>           size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.compRingSize);
>>> +        if (size > VMXNET3_RC_RING_MAX_SIZE) {
>>> +            size = VMXNET3_RC_RING_MAX_SIZE;
>>> +        }
>>>           vmxnet3_ring_init(d, &s->rxq_descr[i].comp_ring, pa, size,
>>>                             sizeof(struct Vmxnet3_RxCompDesc), true);
>>>           VMW_CFPRN("RXC queue %d: Base: %" PRIx64 ", Size: %d", i, pa, size);
>>>
>>>
>> Ping!
>>
>> According to 
>> https://gitlab.com/qemu-project/qemu/-/issues/308#note_705736713 this is 
>> still an issue...
>>
>> Patch looks fine to me ... maybe just add some 
>> qemu_log_mask(LOG_GUEST_ERROR, ...) statements before correcting the values?
> 
> 
> * Oops! Not sure how I missed it, thought it was pulled upstream.
>   Will send a revised patch.
> 
> 
> Thank you.
> ---
>   - P J P
> 


