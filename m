Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CADA33ECB9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:16:18 +0100 (CET)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSHp-0006eN-D5
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lMSGl-00068e-J0
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lMSGk-0000ap-4b
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615972509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AodeYLFbdy9zVypmDg3OxeQf4CuPV8hPW5mQzmdpOp0=;
 b=goGNbi+vcH/TFkmpleF0WKSHM/xt/vNnjBWkd0wDwYNF2a8yQLKHI97Hgqjro2wg9CwO4v
 jBwsJbDLFuVBqdKSetuVc+PI58l1XogcWngCtktXKt/2mMixo6W/ZFA4Ijtc/kfF4cGSto
 cYEnq3KFzXjoPATLrflmH6dJxGKwESw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-8OATVKOoNla0hXPyAhyvuQ-1; Wed, 17 Mar 2021 05:15:05 -0400
X-MC-Unique: 8OATVKOoNla0hXPyAhyvuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5256B18C8C04;
 Wed, 17 Mar 2021 09:15:04 +0000 (UTC)
Received: from [10.36.112.124] (ovpn-112-124.ams2.redhat.com [10.36.112.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 331DF60CCE;
 Wed, 17 Mar 2021 09:14:53 +0000 (UTC)
Subject: Re: [PATCH] virtio-pmem: fix virtio_pmem_resp assign problem
To: wangliangzz@126.com, qemu-devel@nongnu.org
References: <20210317024145.271212-1-wangliangzz@126.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <66936339-ae1b-9468-4e91-149f2b0b4e15@redhat.com>
Date: Wed, 17 Mar 2021 10:14:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317024145.271212-1-wangliangzz@126.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: mst@redhat.com, armbru@redhat.com,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, stefanha@redhat.com,
 pbonzini@redhat.com, dan.j.williams@intel.com,
 Wang Liang <wangliangzz@inspur.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.03.21 03:41, wangliangzz@126.com wrote:
> From: Wang Liang <wangliangzz@inspur.com>
> 
> ret in virtio_pmem_resp is a uint32_t variable, which should be assigned
> using virtio_stl_p.
> 
> The kernel side driver does not guarantee virtio_pmem_resp to be initialized
> to zero in advance, So sometimes the flush operation will fail.
> 
> Signed-off-by: Wang Liang <wangliangzz@inspur.com>
> ---
>   hw/virtio/virtio-pmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index a3e0688a89..d1aeb90a31 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -47,7 +47,7 @@ static int worker_cb(void *opaque)
>           err = 1;
>       }
>   
> -    virtio_stw_p(req_data->vdev, &req_data->resp.ret, err);
> +    virtio_stl_p(req_data->vdev, &req_data->resp.ret, err);
>   
>       return 0;
>   }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


