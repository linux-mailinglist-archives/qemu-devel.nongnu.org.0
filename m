Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF644AD526
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:44:32 +0100 (CET)
Received: from localhost ([::1]:40904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHN31-0007gA-3Z
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:44:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHLfu-0002GT-Jn
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHLfR-0001Ij-4I
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644308162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPUhepJnZFvIynAYCQmnRqPG0WoeBnyxmrDrFwKAF+M=;
 b=UVDFNXUbanNgqRNQd2D/8ZWnmrc4tW76on042ab+q8DBuRbjSK45sto3oatS/0g7qFzqUZ
 isz8rnlsXfFhRU17lZzmjGiN4XC9AVeBEMAHmB/gLKOKC/vQGso+3qCFZy/DNEbD1NBVJP
 nTFv3FRdneToqjIggl3vJ1ZdKxlJOE4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-YpO8EZ8HOcieVsD-xScB2w-1; Tue, 08 Feb 2022 03:15:59 -0500
X-MC-Unique: YpO8EZ8HOcieVsD-xScB2w-1
Received: by mail-pl1-f200.google.com with SMTP id
 z14-20020a170902ccce00b0014d7a559635so2704707ple.16
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lPUhepJnZFvIynAYCQmnRqPG0WoeBnyxmrDrFwKAF+M=;
 b=2OB64Ah5wdVS+KV17yE04t4RMm/JNFE3deydMorHeWpX63yB2glq0iRUdPaBTFlgh5
 CfKkgjiL/Z7lIruEgh28G9jzq7T2SWPtimeYNfF08jPhzEuv4mS/Ntj3BWDtT/CQVQWZ
 5LMmRucFqtzf4N5Ji6dtuVk0H/jyAtw2YR3F+GgO1KP/k8NgWbgvUye3yobJ02xcJONk
 wpjwk11EIBax1T/E6Oa1KIlBunQbUk8FitShtcEEOd8FcpXKkb7IXzsbYu7j6eBnAix6
 n+u81cl/bqTS28cWfGIauB3DLqULUavs7D9nYhH1raHFNSQevMg/b4qgX9UiAu/DJgdy
 BmUA==
X-Gm-Message-State: AOAM532UJHGvwlIqmV1++U+55qz6GMNccqamGAZ3NWytnDFpdIT8FuiI
 usZIX+rAAdkYx3iJG5upHJlq8fPEHe4jCe+LKuWZw6Qtr0nd3IpXBqUEGJFwIzpEZ/Sm0dCFKtz
 NaS5q8DWAuXjN3nw=
X-Received: by 2002:aa7:880d:: with SMTP id c13mr3323675pfo.3.1644308157733;
 Tue, 08 Feb 2022 00:15:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnzYYG0ci5jutgI+Tglk0FOxWgNFgcSVn2e7M0dV6Cvx73rMXZnbaQyaR7OSg2rkav1rXvIA==
X-Received: by 2002:aa7:880d:: with SMTP id c13mr3323649pfo.3.1644308157482;
 Tue, 08 Feb 2022 00:15:57 -0800 (PST)
Received: from [10.72.13.12] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 38sm10583060pgl.82.2022.02.08.00.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 00:15:56 -0800 (PST)
Message-ID: <7c52e50a-4c8e-7865-1c3d-8b156986c13a@redhat.com>
Date: Tue, 8 Feb 2022 16:15:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 18/31] vhost: Shadow virtqueue buffers forwarding
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-19-eperezma@redhat.com>
 <62e877ca-51d7-da85-13c9-d469a85f33c9@redhat.com>
 <CAJaqyWfF01k3LntM7RLEmFcej=EY2d4+2MARKXPptQ2J7VnB9A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWfF01k3LntM7RLEmFcej=EY2d4+2MARKXPptQ2J7VnB9A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2022/2/1 下午7:25, Eugenio Perez Martin 写道:
> On Sun, Jan 30, 2022 at 7:47 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>> @@ -272,6 +590,28 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>>>    void vhost_svq_stop(VhostShadowVirtqueue *svq)
>>>    {
>>>        event_notifier_set_handler(&svq->svq_kick, NULL);
>>> +    g_autofree VirtQueueElement *next_avail_elem = NULL;
>>> +
>>> +    if (!svq->vq) {
>>> +        return;
>>> +    }
>>> +
>>> +    /* Send all pending used descriptors to guest */
>>> +    vhost_svq_flush(svq, false);
>>
>> Do we need to wait for all the pending descriptors to be completed here?
>>
> No, this function does not wait, it only completes the forwarding of
> the *used* descriptors.
>
> The best example is the net rx queue in my opinion. This call will
> check SVQ's vring used_idx and will forward the last used descriptors
> if any, but all available descriptors will remain as available for
> qemu's VQ code.
>
> To skip it would miss those last rx descriptors in migration.
>
> Thanks!


So it's probably to not the best place to ask. It's more about the 
inflight descriptors so it should be TX instead of RX.

I can imagine the migration last phase, we should stop the vhost-vDPA 
before calling vhost_svq_stop(). Then we should be fine regardless of 
inflight descriptors.

Thanks


>
>> Thanks
>>
>>
>>> +
>>> +    for (unsigned i = 0; i < svq->vring.num; ++i) {
>>> +        g_autofree VirtQueueElement *elem = NULL;
>>> +        elem = g_steal_pointer(&svq->ring_id_maps[i]);
>>> +        if (elem) {
>>> +            virtqueue_detach_element(svq->vq, elem, elem->len);
>>> +        }
>>> +    }
>>> +
>>> +    next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
>>> +    if (next_avail_elem) {
>>> +        virtqueue_detach_element(svq->vq, next_avail_elem,
>>> +                                 next_avail_elem->len);
>>> +    }
>>>    }


