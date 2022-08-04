Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04DA589727
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 06:49:06 +0200 (CEST)
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJSnB-0007Ii-NO
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 00:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJSkY-0005EJ-49
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:46:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJSkK-0005Gt-1F
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659588367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/FplmZWKJi7jCa4WMVnhT7v6YiodusOAXNyZ4pUZ8s=;
 b=MWqIpkQT/TC35/UP0JbxbTdaRpRFxdnBW3vasxPYKFZVkWY6IoM0fXwGSvvyI6CENeCoCt
 Yzs8jeDruBKed3ZngWFWXdw8dRfzaYrl4bJYcF+ofNPd/TJK5nFxK5KxwhOFEUHkL6oXK0
 84TOtlE7fFHya7WvQoMfzP4XOBwtfOk=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-p49r9ihgOFiPUF7uzy69Yg-1; Thu, 04 Aug 2022 00:46:06 -0400
X-MC-Unique: p49r9ihgOFiPUF7uzy69Yg-1
Received: by mail-pg1-f199.google.com with SMTP id
 17-20020a631851000000b0041cd5ca6004so219209pgy.0
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 21:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W/FplmZWKJi7jCa4WMVnhT7v6YiodusOAXNyZ4pUZ8s=;
 b=s2/C6hGuN/a5ME3jk93oTaiY0b04YfUq90DFuryCfyQhBxgomZF1z/gnIMKM/gBu5b
 hw8pjeFC/E++acsy34HU3B4bz/6FFLFkQqwBqK1V428JX4pGDomRPqGq9Q3ORXXmPnhJ
 VFngUlx4BuXrYrDSJj2140lLjRTgFDSNT6ITZFMhqZIxaE4vezeSnkTXyJkgqaFNJi06
 sa3QRIr4BVAgPIsSIKMpUc5To+dmeM5IEywl5W4SNAqEKSPrt8GV03mj/7mEK39jxOQ6
 H51/kCeaSRki3Sp5jJ5YOkJT3CpNK/30al4PhRqS1LuD6vN69KPZ+fLsHU4NH4ahWxpG
 xMzQ==
X-Gm-Message-State: ACgBeo0ZUC6cMLUpIdW+ALKKb68HAZsDZDQPKUk8x6VmIPgNp3sbr371
 Nb2ZoYwaoYQtWxesQR3hvtqnSm7K+LS24ZbF3629fN6lWy7bsbJ0MzwmwaElGKyxhwLydNveYE/
 rD+JqixfmdvPwGBw=
X-Received: by 2002:a63:ef54:0:b0:41a:56e7:aeb3 with SMTP id
 c20-20020a63ef54000000b0041a56e7aeb3mr163238pgk.49.1659588364914; 
 Wed, 03 Aug 2022 21:46:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR67lbl9gOzodFx50CBqYTj4fBH69ihDvcfpKXfPtbBwkZTObfdsYhbxijIlbXYaK6hz8fLPfQ==
X-Received: by 2002:a63:ef54:0:b0:41a:56e7:aeb3 with SMTP id
 c20-20020a63ef54000000b0041a56e7aeb3mr163208pgk.49.1659588364623; 
 Wed, 03 Aug 2022 21:46:04 -0700 (PDT)
Received: from [10.72.12.192] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a5d8c00b001f200eabc65sm2504494pji.41.2022.08.03.21.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 21:46:03 -0700 (PDT)
Message-ID: <c25c142f-ad9d-a5cf-9837-5570d563ad07@redhat.com>
Date: Thu, 4 Aug 2022 12:45:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 6/7] vhost_net: Add NetClientInfo prepare callback
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong
 <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20220803171821.481336-1-eperezma@redhat.com>
 <20220803171821.481336-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220803171821.481336-7-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/8/4 01:18, Eugenio Pérez 写道:
> This is used by the backend to perform actions before the device is
> started.
>
> In particular, vdpa will use it to isolate CVQ in its own ASID if
> possible, and start SVQ unconditionally only in CVQ.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/net/net.h  | 2 ++
>   hw/net/vhost_net.c | 4 ++++
>   2 files changed, 6 insertions(+)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index a8d47309cd..efa6448886 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -44,6 +44,7 @@ typedef struct NICConf {
>   
>   typedef void (NetPoll)(NetClientState *, bool enable);
>   typedef bool (NetCanReceive)(NetClientState *);
> +typedef void (NetPrepare)(NetClientState *);
>   typedef int (NetLoad)(NetClientState *);
>   typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
>   typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, int);
> @@ -72,6 +73,7 @@ typedef struct NetClientInfo {
>       NetReceive *receive_raw;
>       NetReceiveIOV *receive_iov;
>       NetCanReceive *can_receive;
> +    NetPrepare *prepare;
>       NetLoad *load;
>       NetCleanup *cleanup;
>       LinkStatusChanged *link_status_changed;
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index a9bf72dcda..bbbb6d759b 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -244,6 +244,10 @@ static int vhost_net_start_one(struct vhost_net *net,
>       struct vhost_vring_file file = { };
>       int r;
>   
> +    if (net->nc->info->prepare) {
> +        net->nc->info->prepare(net->nc);
> +    }


Any chance we can reuse load()?

Thanks


> +
>       r = vhost_dev_enable_notifiers(&net->dev, dev);
>       if (r < 0) {
>           goto fail_notifiers;


