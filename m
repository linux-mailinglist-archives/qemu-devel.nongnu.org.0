Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0AE4C77D2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:32:14 +0100 (CET)
Received: from localhost ([::1]:42260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkof-0000zz-59
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:32:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nOkkJ-00053e-Fg
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:27:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nOkkG-0001Zu-C5
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646072859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tAsECNjWAm0ricO6VQicExhtc7bb8/Ks9/STdMPslxw=;
 b=CrVgCBsLvP6ZJOF4uP0Tx6iyD16dw2BzdDhLSyEndf9l7vlU5SVM8TFd8jeYoLxpDE2l1q
 bsdud8trWRT+Atw5mbV2KVGfPNvb0cGUWICVynaO8ZLorZGpG0BasSi1mlatIFx/sQhk1e
 xwuCqhygVTAFskP0Tw/BrxsD8BVrB74=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-WPhkWbvwMtSuQwaWTRWDFw-1; Mon, 28 Feb 2022 13:27:37 -0500
X-MC-Unique: WPhkWbvwMtSuQwaWTRWDFw-1
Received: by mail-qv1-f71.google.com with SMTP id
 j26-20020a0cae9a000000b004332416873fso3746619qvd.21
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=tAsECNjWAm0ricO6VQicExhtc7bb8/Ks9/STdMPslxw=;
 b=RWbhTDs5M5swZYvEf6w4CM1k+C97UxCYGB9vsb01348N8g6OBJ7cAh64CtrIp4QyTu
 2RZ0AG4Ggag3eLWcwonug77QVPwFj3xd0F/l7/cT/To2tanR3Qh4QVDtaszDB+Cf90Qo
 htynbpnsb5cfSl5WjdXjR3ryR3NiIHJADj1m44IqntXR0pI1XHJnkRkBVEEbrS22GoYg
 HhpHGqV/qLStUKZF/zt1VGOnxY6huSBYBOD4l2iAPFmz6XAIyl64ZXcViGH/m099c6dy
 bhGXkMENocCpDAliwOHMmUAnTa0YS4G1dQMYcEwhTqO+L971eFWR8NN1gUMEKwKS48d4
 NZGA==
X-Gm-Message-State: AOAM532zuhbdpnZ/M7tRNf2p94liHndX6VqDISkbDo47Lyiq/yosT5wL
 agbwZbB1Lkaerv25dJk3A1G5T4yYV8bEnVyq8n+9TyDBaakRltBhFF3iNNq0bUp38oPqpSlxb82
 ngd7h6l+OAu/vOgQ=
X-Received: by 2002:ac8:4e4d:0:b0:2de:7a32:a02a with SMTP id
 e13-20020ac84e4d000000b002de7a32a02amr17436094qtw.509.1646072857247; 
 Mon, 28 Feb 2022 10:27:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9NgPfl+dKv5zpv9ML4RVjmL6sFJ1IdMRpCRloGFJ61Fx/6CXdffLLCHNsGbc/fyyVH2fT7Q==
X-Received: by 2002:ac8:4e4d:0:b0:2de:7a32:a02a with SMTP id
 e13-20020ac84e4d000000b002de7a32a02amr17436082qtw.509.1646072856989; 
 Mon, 28 Feb 2022 10:27:36 -0800 (PST)
Received: from [192.168.100.42] ([82.142.17.50])
 by smtp.gmail.com with ESMTPSA id
 c7-20020ac85a87000000b002dff4c183ecsm5461253qtc.29.2022.02.28.10.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 10:27:36 -0800 (PST)
Message-ID: <f269cb2f-1be3-4b98-0ba9-02f908ae9d63@redhat.com>
Date: Mon, 28 Feb 2022 19:27:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/virtio: vdpa: Fix leak of host-notifier memory-region
From: Laurent Vivier <lvivier@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220211170259.1388734-1-lvivier@redhat.com>
 <bef192f5-70b0-8412-388d-e4278ca35747@redhat.com>
In-Reply-To: <bef192f5-70b0-8412-388d-e4278ca35747@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

Thanks,
Laurent

On 22/02/2022 09:53, Laurent Vivier wrote:
> Michael,
> 
> do you plan to merge this soon?
> 
> This is a bugfix for a QEMU coredump.
> 
> Thanks,
> Laurent
> 
> On 11/02/2022 18:02, Laurent Vivier wrote:
>> If call virtio_queue_set_host_notifier_mr fails, should free
>> host-notifier memory-region.
>>
>> This problem can trigger a coredump with some vDPA drivers (mlx5,
>> but not with the vdpasim), if we unplug the virtio-net card from
>> the guest after a stop/start.
>>
>> The same fix has been done for vhost-user:
>>    1f89d3b91e3e ("hw/virtio: Fix leak of host-notifier memory-region")
>>
>> Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
>> Cc: jasowang@redhat.com
>> Resolves: https://bugzilla.redhat.com/2027208
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   hw/virtio/vhost-vdpa.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index 04ea43704f5d..11f696468dc1 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -431,6 +431,7 @@ static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int 
>> queue_index)
>>       g_free(name);
>>       if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
>> +        object_unparent(OBJECT(&n->mr));
>>           munmap(addr, page_size);
>>           goto err;
>>       }
> 


