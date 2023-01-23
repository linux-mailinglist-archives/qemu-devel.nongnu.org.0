Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A32677E37
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 15:40:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJxz4-0006lS-Aj; Mon, 23 Jan 2023 09:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pJxz2-0006kh-M0
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:39:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pJxyy-0008KF-BM
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674484774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vlPs/xnYf9eSLUpV0+u3A/OnnZ4leNWYacmTMIWC7JI=;
 b=AUMWATjHVyVqDRZLY4RIcZcw221of/86SOAhfr9XRCdwrTg9Pt5KaruNpOzycku4ZZ/WBj
 1NWW73A9jBPYBFEZTgrw4UMbAA82orfQrb8N8mGfylyvyWFltAzRyPGc+1pDRPqw40X0aq
 CJ3SE2EOOqvcnkXlU7ZBT5vUYoiyQng=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-ZhXa5wyYMo6A_hGmRJXihQ-1; Mon, 23 Jan 2023 09:39:33 -0500
X-MC-Unique: ZhXa5wyYMo6A_hGmRJXihQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 qb2-20020a1709077e8200b00842b790008fso7936947ejc.21
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 06:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vlPs/xnYf9eSLUpV0+u3A/OnnZ4leNWYacmTMIWC7JI=;
 b=K+z3xABHIj3o8Kf/TwMOgeNw+9YMKv+XHlSH4Bj7xskF15Mh5tD3oLUitX8WIepnPz
 1+B9dbzI5K9Wfuq70xwx34rvqXD+32ZxYiCoaHb20PZUDZtE79apY6ipui0cKkKvSCGe
 AkpH3uqwLbrnpTf5IYiTL4iWd9Do+PSDdd17mYoBE/c3KHQwFRX/tEqN8MGWLQGaxGhf
 j7cvRRVgWl3cahdpwF3g/PjCj85xJauRIImJ1h8VcARYJN3n5t+xeK1HEJHxKcViSqdI
 u9TsNxMlrc17b13lNgFtWOmbxKYB/P9a4UOCcfrbeEd+BXytkfxuaeAKw6Y2+CYXhLrA
 qtMw==
X-Gm-Message-State: AFqh2kr+BVJQhegDLAFHR4ADOj7tSYRg9oujVaC/RTEHR9rI4bN3asbJ
 mf+OSNpd0NvAykTwCvI/dH1oC3iLXSX0860/oWw71AbztiiHly9Q0mlopG/6dIdhdS+uPYZvI2Y
 L5LtQMzMKO+Oy6uc=
X-Received: by 2002:a17:906:79d8:b0:877:a2d1:7560 with SMTP id
 m24-20020a17090679d800b00877a2d17560mr11865473ejo.27.1674484772431; 
 Mon, 23 Jan 2023 06:39:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuIeuYVPeQBECwd04ae6mDjEiiVn7e7Rq3u8YlQ1FaZnuwVbG5Eglg+eS70hhEttanEoUz1Kw==
X-Received: by 2002:a17:906:79d8:b0:877:a2d1:7560 with SMTP id
 m24-20020a17090679d800b00877a2d17560mr11865452ejo.27.1674484772167; 
 Mon, 23 Jan 2023 06:39:32 -0800 (PST)
Received: from redhat.com ([2.52.149.29]) by smtp.gmail.com with ESMTPSA id
 21-20020a170906301500b007c0985aa6b0sm22222824ejz.191.2023.01.23.06.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 06:39:31 -0800 (PST)
Date: Mon, 23 Jan 2023 09:39:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: elic@nvidia.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, leiyang@redhat.com
Subject: Re: [PATCH] vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
Message-ID: <20230123093908-mutt-send-email-mst@kernel.org>
References: <20230117105308.1337120-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230117105308.1337120-1-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 17, 2023 at 11:53:08AM +0100, Eugenio Pérez wrote:
> VHOST_BACKEND_F_IOTLB_ASID is the feature bit, not the bitmask. Since
> the device under test also provided VHOST_BACKEND_F_IOTLB_MSG_V2 and
> VHOST_BACKEND_F_IOTLB_BATCH, this went unnoticed.
> 
> Fixes: c1a1008685 ("vdpa: always start CVQ in SVQ mode if possible")
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Jason are you merging this?

> ---
> Originally on SUSPEND series, but it is a fix that it is worth to send
> and apply individually:
> https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg02574.html
> 
> ---
>  net/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 1a13a34d35..de5ed8ff22 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -384,7 +384,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>              g_strerror(errno), errno);
>          return -1;
>      }
> -    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
> +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
>          !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
>          return 0;
>      }
> --
> 2.31.1


