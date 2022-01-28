Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6593F49F336
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 07:01:26 +0100 (CET)
Received: from localhost ([::1]:47856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDKK5-0007Cs-8n
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 01:01:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKF3-0005pP-LK
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 00:56:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDKF0-0002go-2j
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 00:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643349368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmvUTogdu9baspfBfX4rGdD/WSBa3qyhLpro0p4Kf88=;
 b=abBjW/InIN25RN0YtYWsBVkqIdQ/As1WAkCz2gZVpNGXrhNqjr68RFhEGn7jL57+CiXeZ9
 PuZNgpSBhA/3/ipRfEl83G1vOgsQQVax0UxS7CWSopFR4g//lzqOJcDIAx/NVArM5pHAb/
 L1ci8lUgUwuGhePu0oSbhtaAp1IyoLY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-2K1qAeUUPryF-RhxqkXsbA-1; Fri, 28 Jan 2022 00:56:06 -0500
X-MC-Unique: 2K1qAeUUPryF-RhxqkXsbA-1
Received: by mail-pj1-f72.google.com with SMTP id
 k2-20020a17090a658200b001b399622095so3280338pjj.9
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 21:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NmvUTogdu9baspfBfX4rGdD/WSBa3qyhLpro0p4Kf88=;
 b=B+TuxpQ0/Iw2G4QXDpY3cZVO+RsHuuVLvvGAFu5Yso0+7xGdI0RP+I8K3f0Qic2bsP
 9l5Oz7XTORHTLSLitkPGrK59hqYW+d9T/5/mJBKJU35x0x7rfQ/nFqrSRjzE32JJMy6n
 CW+BwCD0Xznu00tJZrtS4QlrcgI8IEYkyNbcaxiL104HzgiwdON42wohPpnC9hnBlfRL
 AjiLRsxy+fTf6JzB6LD72tZMHSk7Inqun8m9xb+yyegIbRVfg2saXrzPD1/NkmJBhU+M
 JjYx9KBO8kuRCtsFkN3/Sx9QvL5qKrj9HC39avGtjjKb56KO/y6zT/HLRxxqh35ViHF9
 bhuA==
X-Gm-Message-State: AOAM531+UegordxqX6tbxCRbevvFwfRwB+Q6wDcl0xBp48azKbk8VQHn
 ehUAcABKn5+vgpXjybcwJX5LG9LOwKe50owcyShV/m8cQySDnOv5/Mv/7BJ1T7clqIxdpHpoCyi
 ZUxrpxCBfQmsFPgg=
X-Received: by 2002:a17:903:2093:: with SMTP id
 d19mr6880871plc.29.1643349365500; 
 Thu, 27 Jan 2022 21:56:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz95qaukLEbZr8VsmgQvFlsKXiWASwMyW6mr5bfmyA0korfMYDb0Bp7tw8WKU55Q0DHPgjCcg==
X-Received: by 2002:a17:903:2093:: with SMTP id
 d19mr6880836plc.29.1643349365189; 
 Thu, 27 Jan 2022 21:56:05 -0800 (PST)
Received: from [10.72.13.185] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d22sm960881pfl.71.2022.01.27.21.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 21:56:04 -0800 (PST)
Message-ID: <345cd684-0cc2-a685-0611-e2fcf0dfc52b@redhat.com>
Date: Fri, 28 Jan 2022 13:55:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 21/31] util: Add iova_tree_alloc
To: Peter Xu <peterx@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-22-eperezma@redhat.com> <Ye4r7tKFhP9VaT5/@xz-m1.local>
 <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
 <Ye6IhLCe6NDKO6+E@xz-m1.local>
 <CAJaqyWcdpTr2X4VuAN2NLmpviCjDoAaY269+VQGZ7-F6myOhSw@mail.gmail.com>
 <YfJSezhQv1kXa1x8@xz-m1.local>
 <CAJaqyWczZ7C_vbwugyN9bEgOVuRokGqVMb_g5UK_R4F8O+qKOA@mail.gmail.com>
 <YfNprA3OLUqj8LSG@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <YfNprA3OLUqj8LSG@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/28 上午11:57, Peter Xu 写道:
> On Thu, Jan 27, 2022 at 10:24:27AM +0100, Eugenio Perez Martin wrote:
>> On Thu, Jan 27, 2022 at 9:06 AM Peter Xu <peterx@redhat.com> wrote:
>>> On Tue, Jan 25, 2022 at 10:40:01AM +0100, Eugenio Perez Martin wrote:
>>>> So I think that the first step to remove complexity from the old one
>>>> is to remove iova_begin and iova_end.
>>>>
>>>> As Jason points out, removing iova_end is easier. It has the drawback
>>>> of having to traverse all the list beyond iova_end, but a well formed
>>>> iova tree should contain none. If the guest can manipulate it, it's
>>>> only hurting itself adding nodes to it.
>>>>
>>>> It's possible to extract the check for hole_right (or this in Jason's
>>>> proposal) as a special case too.
>>>>
>>>> But removing the iova_begin parameter is more complicated. We cannot
>>>> know if it's a valid hole without knowing iova_begin, and we cannot
>>>> resume traversing. Could we assume iova_begin will always be 0? I
>>>> think not, the vdpa device can return anything through syscall.
>>> Frankly I don't know what's the syscall you're talking about,
>> I meant VHOST_VDPA_GET_IOVA_RANGE, which allows qemu to know the valid
>> range of iova addresses. We get a pair of uint64_t from it, that
>> indicates the minimum and maximum iova address the device (or iommu)
>> supports.
>>
>> We must allocate iova ranges within that address range, which
>> complicates this algorithm a little bit. Since the SVQ iova addresses
>> are not GPA, qemu needs extra code to be able to allocate and free
>> them, creating a new custom iova as.
>>
>> Please let me know if you want more details or if you prefer me to
>> give more context in the patch message.
> That's good enough, thanks.
>
>>> I mean this one:
>>>
>>> https://lore.kernel.org/qemu-devel/20211029183525.1776416-24-eperezma@redhat.com/
>>>
>>> Though this time I have some comments on the details.
>>>
>>> Personally I like that one (probably with some amendment upon the old version)
>>> more than the current list-based approach.  But I'd like to know your thoughts
>>> too (including Jason).  I'll further comment in that thread soon.
>>>
>> Sure, I'm fine with whatever solution we choose, but I'm just running
>> out of ideas to simplify it. Reading your suggestions on old RFC now.
>>
>> Overall I feel list-based one is both more convenient and easy to
>> delete when qemu raises the minimal glib version, but it adds a lot
>> more code.
>>
>> It could add less code with this less elegant changes:
>> * If we just put the list entry in the DMAMap itself, although it
>> exposes unneeded implementation details.
>> * We force the iova tree either to be an allocation-based or an
>> insertion-based, but not both. In other words, you can only either use
>> iova_tree_alloc or iova_tree_insert on the same tree.


This seems an odd API I must say :(


> Yeah, I just noticed it yesterday that there's no easy choice on it.  Let's go
> with either way; it shouldn't block the rest of the code.  It'll be good if
> Jason or Michael share their preferences too.


(Havne't gone through the code deeply)

I wonder how about just copy-paste gtree_node_first|last()? A quick 
google told me it's not complicated.

Thanks


>
>> I have a few tests to check the algorithms, but they are not in the
>> qemu test format. I will post them so we all can understand better
>> what is expected from this.
> Sure.  Thanks.
>


