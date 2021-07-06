Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F433BC776
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:49:38 +0200 (CEST)
Received: from localhost ([::1]:34570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fpp-0005vu-7p
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0fn0-0003ZO-Ms
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:46:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0fmy-0005rQ-0O
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625557598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V42HAV6mZN+Ni8VzhjlNhDn3Ci6K3dGgSx0E6xQDl14=;
 b=RmJbL17Usq7XUbTbPU3BCZw7+Whg//f+Vq0Kf6mqTIJ8xZe6BPtjlo/HdNQeTRHyRBRFUh
 epoyA3CRGObQXRv+rPx1xDLWoqfZdjUtoFGou1M9snVaE8+XP5An9vX3UqCi4v5XJQfx0G
 URmjy7AC6JSVIwuymnZo9NRNzxQh2BI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-4Q6JwSxEOTS1z6-UnrL05Q-1; Tue, 06 Jul 2021 03:46:37 -0400
X-MC-Unique: 4Q6JwSxEOTS1z6-UnrL05Q-1
Received: by mail-pg1-f199.google.com with SMTP id
 k9-20020a63d1090000b029021091ebb84cso15550619pgg.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 00:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=V42HAV6mZN+Ni8VzhjlNhDn3Ci6K3dGgSx0E6xQDl14=;
 b=Iz+KYJtBI9nkbzjsKT6PMQVgTJ2cPY7n02gdlVLICLQbmHYabTKjcsOyxlKvHoehmg
 1nw9RCRu3zj4kA/OysL2vVTknE/hwh1HO9I5LTr6c9BtdEWXk776Wkq72k1jsv1GED92
 WfklwIipMwRPLic6lYLGYr8k39W9vNcnEzH0363oMeacyQ6r3hCMtmbHyEnHY9exnjcM
 gnyJJ3Af8MXGOiU701RzDXpLD7XBe2VrcC2xpykW3N42GL55jm2FNYQRdj54LicQI1Ce
 Gcrr8Ba7z885M84z/EIMRVxJyIRc9ido5tMu0h9P+ZOeU8bvi2w8pC0QtWuQ3DLc7bUp
 c1uw==
X-Gm-Message-State: AOAM533QcpBxRfwrU3mRNTe4IKCKeRmJQH9tbNVAeTKHnTo/BVcAy7UH
 jF3HqqAfAD6xwlSEgcD0/VYJQO/YM/Bxf80neIVKV1K71pL7zXeaF7GW5NpxIn33AKt0hRo6VdA
 0BzbO4HO7YFLc5Sw=
X-Received: by 2002:a17:90a:ea8a:: with SMTP id
 h10mr19106563pjz.61.1625557596801; 
 Tue, 06 Jul 2021 00:46:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzURnuv0g86m1aJ7iMb2A+Wk3I7Gt/i4dXpTHeT7KO9ziaPBMUH/Tly4FnEV5Gf3tYvDFjjgA==
X-Received: by 2002:a17:90a:ea8a:: with SMTP id
 h10mr19106552pjz.61.1625557596573; 
 Tue, 06 Jul 2021 00:46:36 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b202sm4869801pfb.155.2021.07.06.00.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 00:46:35 -0700 (PDT)
Subject: Re: [PATCH 18/18] vhost-vdpa: multiqueue support
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-19-jasowang@redhat.com>
 <CAJaqyWeT+VhXSzu9VA7UrJMFeOCUwNXUoN9-yWZzp9Rg4pBZWQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9b46d3a4-19e1-b96d-88f2-f1e9f82d5ecc@redhat.com>
Date: Tue, 6 Jul 2021 15:46:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWeT+VhXSzu9VA7UrJMFeOCUwNXUoN9-yWZzp9Rg4pBZWQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Eli Cohen <elic@nvidia.com>, Cindy Lu <lulu@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, lingshan.zhu@intel.com,
 Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/1 下午2:51, Eugenio Perez Martin 写道:
>>        * provide control queue via peers as well.
>>        */
>>       if (n->nic_conf.peers.queues) {
>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> index cc11b2ec40..048344b4bc 100644
>> --- a/net/vhost-vdpa.c
>> +++ b/net/vhost-vdpa.c
>> @@ -18,6 +18,7 @@
>>   #include "qemu/error-report.h"
>>   #include "qemu/option.h"
>>   #include "qapi/error.h"
>> +#include <linux/vhost.h>
>>   #include <sys/ioctl.h>
>>   #include <err.h>
>>   #include "standard-headers/linux/virtio_net.h"
>> @@ -52,6 +53,8 @@ const int vdpa_feature_bits[] = {
>>       VIRTIO_NET_F_HOST_UFO,
>>       VIRTIO_NET_F_MRG_RXBUF,
>>       VIRTIO_NET_F_MTU,
>> +    VIRTIO_NET_F_MQ,
>> +    VIRTIO_NET_F_CTRL_VQ,
> Hi!
>
> I'm not sure if it's qemu the one that must control it, but I cannot
> use vdpa_sim of linux 5.13 (i.e., with no control vq patches) with
> this series applied:
>
> [    3.967421] virtio_net virtio0: device advertises feature
> VIRTIO_NET_F_CTRL_RX but not VIRTIO_NET_F_CTRL_VQ
> [    3.968613] virtio_net: probe of virtio0 failed with error -22
>
> Did you mention it somewhere else and I've missed it? or is it
> actually a bug in the device? In this second case, I think we should
> still workaround it in qemu, because old vdpasim_net with no
> VIRTIO_NET_F_CTRL_VQ still works ok without this patch.
>
> Thanks!


So the problem is we need not only validating MQ but also all the 
features that depends on the CTRL VQ here (rx filters, mac, rss, 
announce etc).

I will fix this in the next version.

Thanks



