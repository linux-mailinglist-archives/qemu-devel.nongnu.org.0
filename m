Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01DE4BF2A4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 08:30:46 +0100 (CET)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMPdF-0000Ek-Kx
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 02:30:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMPZR-0006kH-UB
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMPZP-0003Or-5C
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645514805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSgLTHt2PShYy/c40Sx83Rs/A6YQkQ1rRo49MyA5y1c=;
 b=Jj0UkdBr4Jz1IkpvNHym2Hi9Nbh9dajNy86ckPgt+/1Y7P3p8msfTBH08FMcWA8UqLM42r
 y/L33PBdb1jLWjPbtA/tL3Stz9UxaD370uAbWb2C3nSEYe86yhCFuL+mf0OmIAeLo4wKKw
 d+FXMA6yHozegHTILaNKl2kXVQ++A28=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-2SpWeweKM5SOg-yTKIne7Q-1; Tue, 22 Feb 2022 02:26:44 -0500
X-MC-Unique: 2SpWeweKM5SOg-yTKIne7Q-1
Received: by mail-pl1-f197.google.com with SMTP id
 d7-20020a170902654700b0014fd2313fd2so758668pln.13
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 23:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lSgLTHt2PShYy/c40Sx83Rs/A6YQkQ1rRo49MyA5y1c=;
 b=0arPWe38Zp/nmgfgrofy8gxUv8f23Sw6pPx5edm2aD8awyf3kATojQWeHT9yZjmvgU
 mLv5dIF9NwMabGVJYwnKVv+yz+9jicbQpTaeEVrz//fTEx+UjtKKqlCcTFhN5Rr+f42c
 cC+qVttlV4yjnjarUM8a42+rpN1TX0bf1oehiIDP5L9tUi/nOIsDwX5gTE0eUUdwgUer
 lZGR6Q9/z6Gqt21VMHnG+QeudvYIh4uPnjFlskMri0H7munnpCUE7SY35POIqx8UFEaO
 EJx/g3j0a2x8JkpWxkBpChDiBWho051C03PfQDEq84KeeC7LAqKZotffbN7uXWG8zM1t
 gRKA==
X-Gm-Message-State: AOAM5304GG6l/s7lsbvMXJsDOM5AUqp6stAwaRfzvmDWpi48BuaWeyCm
 1TiNidiwmMV5YiB7M2RwTphku15Q6JKSP6RWoP3eXSWt5Z3qDwjVzYKZkiJOpvtvzvFN224Kq7s
 PbU2JDjL+BaE7M2w=
X-Received: by 2002:a17:903:31cd:b0:14d:bb40:2a17 with SMTP id
 v13-20020a17090331cd00b0014dbb402a17mr21733818ple.1.1645514803408; 
 Mon, 21 Feb 2022 23:26:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvVYyyfok9o/m2xgJK+AvfLAkwo4kCJOT5iqgb7ZlXLCMRgUCTTprxVoojziuhwzxQBNlr3A==
X-Received: by 2002:a17:903:31cd:b0:14d:bb40:2a17 with SMTP id
 v13-20020a17090331cd00b0014dbb402a17mr21733784ple.1.1645514803117; 
 Mon, 21 Feb 2022 23:26:43 -0800 (PST)
Received: from [10.72.13.199] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b21sm1554336pji.22.2022.02.21.23.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 23:26:42 -0800 (PST)
Message-ID: <24717b73-7aca-dd75-22d4-2b8d9e6bd737@redhat.com>
Date: Tue, 22 Feb 2022 15:26:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 18/31] vhost: Shadow virtqueue buffers forwarding
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-19-eperezma@redhat.com>
 <62e877ca-51d7-da85-13c9-d469a85f33c9@redhat.com>
 <CAJaqyWfF01k3LntM7RLEmFcej=EY2d4+2MARKXPptQ2J7VnB9A@mail.gmail.com>
 <7c52e50a-4c8e-7865-1c3d-8b156986c13a@redhat.com>
 <CAJaqyWedqtzRW=ur7upchneSc-oOkvkr3FUph_BfphV3zTmnkw@mail.gmail.com>
 <7e72def5-a1e9-ad92-2c83-fda72ffd7b60@redhat.com>
 <CAJaqyWcHhMpjJ4kde1ejV5c_vP7_8PvfXpi5u9rdWuaORFt_zg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWcHhMpjJ4kde1ejV5c_vP7_8PvfXpi5u9rdWuaORFt_zg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/21 下午4:15, Eugenio Perez Martin 写道:
> On Mon, Feb 21, 2022 at 8:44 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/2/17 下午8:48, Eugenio Perez Martin 写道:
>>> On Tue, Feb 8, 2022 at 9:16 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2022/2/1 下午7:25, Eugenio Perez Martin 写道:
>>>>> On Sun, Jan 30, 2022 at 7:47 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>>>>>> @@ -272,6 +590,28 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>>>>>>>      void vhost_svq_stop(VhostShadowVirtqueue *svq)
>>>>>>>      {
>>>>>>>          event_notifier_set_handler(&svq->svq_kick, NULL);
>>>>>>> +    g_autofree VirtQueueElement *next_avail_elem = NULL;
>>>>>>> +
>>>>>>> +    if (!svq->vq) {
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* Send all pending used descriptors to guest */
>>>>>>> +    vhost_svq_flush(svq, false);
>>>>>> Do we need to wait for all the pending descriptors to be completed here?
>>>>>>
>>>>> No, this function does not wait, it only completes the forwarding of
>>>>> the *used* descriptors.
>>>>>
>>>>> The best example is the net rx queue in my opinion. This call will
>>>>> check SVQ's vring used_idx and will forward the last used descriptors
>>>>> if any, but all available descriptors will remain as available for
>>>>> qemu's VQ code.
>>>>>
>>>>> To skip it would miss those last rx descriptors in migration.
>>>>>
>>>>> Thanks!
>>>> So it's probably to not the best place to ask. It's more about the
>>>> inflight descriptors so it should be TX instead of RX.
>>>>
>>>> I can imagine the migration last phase, we should stop the vhost-vDPA
>>>> before calling vhost_svq_stop(). Then we should be fine regardless of
>>>> inflight descriptors.
>>>>
>>> I think I'm still missing something here.
>>>
>>> To be on the same page. Regarding tx this could cause repeated tx
>>> frames (one at source and other at destination), but never a missed
>>> buffer not transmitted. The "stop before" could be interpreted as "SVQ
>>> is not forwarding available buffers anymore". Would that work?
>>
>> Right, but this only work if
>>
>> 1) a flush to make sure TX DMA for inflight descriptors are all completed
>>
>> 2) just mark all inflight descriptor used
>>
> It currently trusts on the reverse: Buffers not marked as used (by the
> device) will be available in the destination, so expect
> retransmissions.


I may miss something but I think we do migrate last_avail_idx. So there 
won't be a re-transmission, since we depend on qemu virtqueue code to 
deal with vring base?

Thanks


>
> Thanks!
>
>> Otherwise there could be buffers that is inflight forever.
>>
>> Thanks
>>
>>
>>> Thanks!
>>>
>>>> Thanks
>>>>
>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +    for (unsigned i = 0; i < svq->vring.num; ++i) {
>>>>>>> +        g_autofree VirtQueueElement *elem = NULL;
>>>>>>> +        elem = g_steal_pointer(&svq->ring_id_maps[i]);
>>>>>>> +        if (elem) {
>>>>>>> +            virtqueue_detach_element(svq->vq, elem, elem->len);
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
>>>>>>> +    if (next_avail_elem) {
>>>>>>> +        virtqueue_detach_element(svq->vq, next_avail_elem,
>>>>>>> +                                 next_avail_elem->len);
>>>>>>> +    }
>>>>>>>      }


