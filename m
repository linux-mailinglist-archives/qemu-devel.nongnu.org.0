Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2808537FF77
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 22:51:32 +0200 (CEST)
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhIIs-000274-5o
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 16:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lhIHn-0000r7-HR
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lhIHi-0002kc-Mz
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620939016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXT9zQ1jLuCwOpZn7BDUey2qucuB1UeRuRguaT5CKiQ=;
 b=AXMLc8jgPhVtRucAYdmlZ/G4kzoa4l5BHyt/R+T60ag0XJ0TS8syzr1zMNBy1TdSR5zlfX
 mTAMQILVOuQxZkm9M/Nj7XIHS89zZRmfY6h1zeG3YoWPQH+vLREG5P2aWMdjS5rCfUmvLB
 6pA5NGRvFrYWJqu2pzdkUtP1n6sCc1A=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-rGZ8lE8xPvOmnO2r4J6qww-1; Thu, 13 May 2021 16:50:15 -0400
X-MC-Unique: rGZ8lE8xPvOmnO2r4J6qww-1
Received: by mail-ot1-f72.google.com with SMTP id
 k7-20020a9d4b870000b02902a5bfbbbd3bso17693536otf.18
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 13:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bXT9zQ1jLuCwOpZn7BDUey2qucuB1UeRuRguaT5CKiQ=;
 b=llI5fr3/amOpRN3MvZBdLTyLqLLvgU6x5hI4QTyt3G8yUv3GpR0/bsIANTg7PT0V9v
 UjLtJLx5yPN2JqYBvHmy8f/B8TywtbCaUawIJuigpz7l3C1vL+g9F8I9JYI0IHqjlqi2
 dvBUJrIq+kWn5ESO5RfgYABBuHGTvi7wEnfqYHx5TX/Xlmt4CHckWMie3McyKJUvZKEK
 TdWzAFRtFsoyOhr2fL5ltUonZ7AH01/oxLupbseF9sqZCesXWr+vCLo4vm5rZV0V6qg6
 c6e8EyYytCfR0rE0UoSHn0dikxTLqoeniZHFz7rtyAnMxGDlrvIjNV9W9YzVbgdXw2Ox
 C7qg==
X-Gm-Message-State: AOAM533qBJUksuTgyBdqfIbk7Yn3TayNSE1vsYIbqG483fbZuDxObshA
 CMehvbFiwUOQxvbuj9rfEajC0SZppubPr5806o+g7rEQAlJLKTt0ptATEVOaRnoVsb/sioHuDgs
 2g+5EHNIRhhDhgR8=
X-Received: by 2002:a05:6830:4103:: with SMTP id
 w3mr32816362ott.27.1620939014711; 
 Thu, 13 May 2021 13:50:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyojLTWHFLuE9MhbSR8+GYXwr2HUNBdJ/my2r+LpVqQYSHNWkTHMo39cnq8oJZ+8q4ObPpO9A==
X-Received: by 2002:a05:6830:4103:: with SMTP id
 w3mr32816352ott.27.1620939014547; 
 Thu, 13 May 2021 13:50:14 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 g9sm847700oop.30.2021.05.13.13.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 13:50:14 -0700 (PDT)
Subject: Re: [Virtio-fs] [PATCH 7/7] virtiofsd: Set req->reply_sent right
 after sending reply
To: Vivek Goyal <vgoyal@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com
References: <20210511213736.281016-1-vgoyal@redhat.com>
 <20210511213736.281016-8-vgoyal@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <5ad6f5e9-0a12-54ce-163a-532f916cc8e8@redhat.com>
Date: Thu, 13 May 2021 15:50:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511213736.281016-8-vgoyal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 4:37 PM, Vivek Goyal wrote:
> There is no reason to set it in label "err". We should be able to set
> it right after sending reply. It is easier to read.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index aa53808ef9..b1767dd5b9 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -446,12 +446,9 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>      vu_queue_notify(dev, q);
>      pthread_mutex_unlock(&qi->vq_lock);
>      vu_dispatch_unlock(qi->virtio_dev);
> +    req->reply_sent = true;
>  
>  err:

Just a really minor comment: after all these changes, I would venture
that "out" is a more appropriate label name than "err" at this point.

> -    if (ret == 0) {
> -        req->reply_sent = true;
> -    }
> -
>      return ret;
>  }
>  
> 


