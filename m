Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB74432A3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:22:39 +0100 (CET)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwYY-0002Nc-NM
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mhwVW-0007lN-Ok
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mhwVQ-0001MV-FL
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d30GD+pPmuu0I4V1pFSP3O/+rfLnr5fE1Cn6fN48iT4=;
 b=gUvZaxc7tV21I0B7i215CjrDt2ebfwk7rqXhpBv0xWOCn6eqKuJiwuAWJchtXc6X33J3p8
 ZeAk4SBozZTg3vaioZyMTRyjmdljQDLI5waFBgd2pBHJDr1x/cASNnfBk4m2cByHv0MT0Y
 AVXDLmsUDYq3st2m8xdCHx++m29Xl68=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-mV-AZAtKO0GvG_G6GHOL6A-1; Tue, 02 Nov 2021 12:19:21 -0400
X-MC-Unique: mV-AZAtKO0GvG_G6GHOL6A-1
Received: by mail-ed1-f69.google.com with SMTP id
 i22-20020a05640242d600b003e28aecc0afso6786581edc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d30GD+pPmuu0I4V1pFSP3O/+rfLnr5fE1Cn6fN48iT4=;
 b=sz4MhqUw6E+bHDsZc66RgMgqTA8HbJY0LE735+MGmH8MxR4ML9kQa9brjkBOtJdDK9
 C9yKDsGW3oYtTtU7NI0dWACppZwVkJ+5WgV8kv/itPjLocQohwPIxp1nBJBi+acCHJZk
 HWA/+qiHa3IzeBDjd4ombsPAVNkYM9XrWOTny7QzkXJM5aIQfNUZqtDqunMkSTPv2De8
 t53gPkhoLgwihjJCCRBswnPlo1aj+F6a6z8Xv9924L+IaEQ1R7jC5OzCYOK7oBcSUZCI
 FeFoLRjIvL1if7M9E4EomncZHvNICcnzBcOQUfJ1FvpcR3MgbY5EcbD+cmW5cMRSAY4f
 wEDw==
X-Gm-Message-State: AOAM532QRQsN95W3gDmfrJ+87ZjdqhAf4UF62jJ2j1GluJr2J0KpOLmS
 qBTtyZHpmn5DoQn+561xfCZ6Im1Xja6UR05FFbBN3uzproqcJ+cOTjjOJmcfIfrF7QwH/pfFh4C
 eyM44g3gIEBVUg+I=
X-Received: by 2002:a17:907:6da2:: with SMTP id
 sb34mr13907189ejc.509.1635869960731; 
 Tue, 02 Nov 2021 09:19:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx60dHo50XuKT7q0cVs5PSWfn9Mw6av+H5w7GT7veTdwVGSmkMgLH4gwhOsYoHD9aURGFke0g==
X-Received: by 2002:a17:907:6da2:: with SMTP id
 sb34mr13907164ejc.509.1635869960545; 
 Tue, 02 Nov 2021 09:19:20 -0700 (PDT)
Received: from steredhat (host-87-10-72-39.retail.telecomitalia.it.
 [87.10.72.39])
 by smtp.gmail.com with ESMTPSA id cr18sm8413116ejc.25.2021.11.02.09.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:19:20 -0700 (PDT)
Date: Tue, 2 Nov 2021 17:19:18 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] net/vhost-vdpa: fix memory leak in
 vhost_vdpa_get_max_queue_pairs()
Message-ID: <20211102161918.6lfv42u2caseypvl@steredhat>
References: <20211102155157.241034-1-sgarzare@redhat.com>
 <96f02c90-ffca-0a64-00b2-835685977762@redhat.com>
MIME-Version: 1.0
In-Reply-To: <96f02c90-ffca-0a64-00b2-835685977762@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 05:05:21PM +0100, Philippe Mathieu-Daudé wrote:
>On 11/2/21 16:51, Stefano Garzarella wrote:
>> Use g_autofree to ensure that `config` is freed when
>> vhost_vdpa_get_max_queue_pairs() returns.
>>
>> Reported-by: Coverity (CID 1465228: RESOURCE_LEAK)
>> Fixes: 402378407d ("vhost-vdpa: multiqueue support")
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  net/vhost-vdpa.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> index 49ab322511..373b706b90 100644
>> --- a/net/vhost-vdpa.c
>> +++ b/net/vhost-vdpa.c
>> @@ -214,7 +214,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>  static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
>>  {
>>      unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
>> -    struct vhost_vdpa_config *config;
>> +    g_autofree struct vhost_vdpa_config *config = NULL;
>>      __virtio16 *max_queue_pairs;
>>      uint64_t features;
>>      int ret;
>
>Eventually reducing the scope:

Yep, I thought the same, moving also `config_size`, but then I switched 
to the simplest patch possible.

>
>-- >8 --
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -214,7 +214,6 @@ static NetClientState
>*net_vhost_vdpa_init(NetClientState *peer,
> static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error
>**errp)
> {
>     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
>-    struct vhost_vdpa_config *config;
>     __virtio16 *max_queue_pairs;
>     uint64_t features;
>     int ret;
>@@ -232,6 +231,8 @@ static int vhost_vdpa_get_max_queue_pairs(int fd,
>int *has_cvq, Error **errp)
>     }
>
>     if (features & (1 << VIRTIO_NET_F_MQ)) {
>+        g_autofree struct vhost_vdpa_config *config = NULL;
>+
>         config = g_malloc0(config_size + sizeof(*max_queue_pairs));
>         config->off = offsetof(struct virtio_net_config,
>max_virtqueue_pairs);
>         config->len = sizeof(*max_queue_pairs);
>---
>
>Either ways:
>Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks, let's see what Jason and Michael prefer.

Stefano


