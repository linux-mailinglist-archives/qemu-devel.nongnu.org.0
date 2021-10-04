Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609AB4208A6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:46:47 +0200 (CEST)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKYY-0001Vd-Cq
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXKFi-0003K9-9c
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXKFg-0001Zz-Rn
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633339636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K57AEnNbvFK07HbUkC2JPJ2RtmE3uXD5CZ1M+8RrZuY=;
 b=GD5NliAeoOb0Nl4/KSKBJ2Ew1Ur5Q0p53tKGpbEZocaiQeKUziP/3Qkqc1F9Xc3c8NxunJ
 rvxIQD3Qjr9Fg0CDBX/c2ePxGqfYgFJswSWRLOWEbU5XTun7hhgfPcb9Wr6jBgZbW1h+Qt
 2T42ogUpkBOP4l10fvyUXTD5gTU17Dw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-4dcbSgy9MSaZi2Rbwf_Ldw-1; Mon, 04 Oct 2021 05:27:15 -0400
X-MC-Unique: 4dcbSgy9MSaZi2Rbwf_Ldw-1
Received: by mail-wm1-f71.google.com with SMTP id
 d12-20020a1c730c000000b0030b4e0ecf5dso4599242wmb.9
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K57AEnNbvFK07HbUkC2JPJ2RtmE3uXD5CZ1M+8RrZuY=;
 b=4LPxDdk56JlQWyl5BNs0sZF6rKCULfGYVFrdiIyn6wfVfrdgMeAr/afs1ekihkpMa7
 93nmlO/Vm7J8657zFR+KEflydrOwx2nL74gwYNm6sHl5XLOAQGmbkb4do+0VzIXQ//UH
 dNsah3lN3ueNsItVQ+Ws3e8LcKD1cm2xJZmWorlmQxIBvNVsnOgiP8WQO1g/OLcyFo/a
 rFKr81Ijzn55efGnyCxBvoIf8HO+e2S/RAo+vL5GPzExz1aldt68dGYMJIeN7YK1uS9T
 jDhLveoUdXePtsUHMfaGS+kBcxTneoGFtK1xAiTN/tVxsPt0vU85MfHOG+cnKImKURUL
 HU7w==
X-Gm-Message-State: AOAM531n4Wio68MH/y0eUd2kxw1T6v61mVo+5ps/XVV+1saLOHqZYQjB
 Q349gKGLSDK3o2+wUzWptNTfLBcJki+VDnsR9zuETkYwYYULcCRuf6bHcExXowO4vT7MUmg3ZEN
 sa6UScu+tkDS+pw0=
X-Received: by 2002:adf:8b41:: with SMTP id v1mr9457261wra.255.1633339633989; 
 Mon, 04 Oct 2021 02:27:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVepT3FFktgZw/kHcPz8fhtMFHO5BDI7MSuz89B312IKcG1DCV5Vb2Hq+smzNEcMgXx9Ti0Q==
X-Received: by 2002:adf:8b41:: with SMTP id v1mr9457248wra.255.1633339633817; 
 Mon, 04 Oct 2021 02:27:13 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y15sm7243884wrp.44.2021.10.04.02.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 02:27:13 -0700 (PDT)
Message-ID: <b761eef0-83b3-ce88-493a-3611f3a7c870@redhat.com>
Date: Mon, 4 Oct 2021 11:27:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 2/3] hw/virtio: Acquire RCU read lock in
 virtqueue_packed_drop_all()
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210906104318.1569967-1-philmd@redhat.com>
 <20210906104318.1569967-3-philmd@redhat.com>
 <YVrIBqT2gXAwhNF3@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YVrIBqT2gXAwhNF3@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 11:23, Stefan Hajnoczi wrote:
> On Mon, Sep 06, 2021 at 12:43:17PM +0200, Philippe Mathieu-Daudé wrote:
>> vring_get_region_caches() must be called with the RCU read lock
>> acquired. virtqueue_packed_drop_all() does not, and uses the
>> 'caches' pointer. Fix that by using the RCU_READ_LOCK_GUARD()
>> macro.
> 
> Is this a bug that has been encountered, is it a latent bug, a code
> cleanup, etc? The impact of this isn't clear but it sounds a little
> scary so I wanted to check.

I'll defer to Stefano, but IIUC it is a latent bug discovered
during code audit.

> 
>>
>> Reported-by: Stefano Garzarella <sgarzare@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/virtio/virtio.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 97f60017466..7d3bf9091ee 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -1704,6 +1704,8 @@ static unsigned int virtqueue_packed_drop_all(VirtQueue *vq)
>>      VirtIODevice *vdev = vq->vdev;
>>      VRingPackedDesc desc;
>>  
>> +    RCU_READ_LOCK_GUARD();
>> +
>>      caches = vring_get_region_caches(vq);
>>      if (!caches) {
>>          return 0;
>> -- 
>> 2.31.1
>>


