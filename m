Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2BF3FF007
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:21:39 +0200 (CEST)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoX4-0007dC-G9
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mLoSU-0002iF-HD
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:16:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mLoSS-0000vC-1J
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630595795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P+xP+wLYOPrkRCNRBb2x5tHhjBwlMaOVmyphk+jfNrg=;
 b=a+J346XXWvvRZVzUn8Hvha4+lDd3O9ld8B7mEAjh2/+NX7wULkelClNrBRNLVLFXJk5i1c
 D6qpyUiuyrg3NXOXgyArPJJ0G651uH2O5D1Af3gH3N894hJir/mqD65hHA6s/LL4/ARVgG
 CdnL83QGXStTF8ScNoMya5sm18D6rhY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-IicKuZIaP7ae3EzmO02Jrw-1; Thu, 02 Sep 2021 11:16:28 -0400
X-MC-Unique: IicKuZIaP7ae3EzmO02Jrw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s15-20020a056402520f00b003cad788f1f6so1103895edd.22
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P+xP+wLYOPrkRCNRBb2x5tHhjBwlMaOVmyphk+jfNrg=;
 b=iXKhE8pnLV3gvjhJDqCLZWdFcaI7wxd85+UJMacmaY/dwc2DgsxsUCuP3k3Txqm2uT
 kw/R/Sz2+vG3bH4KR8HvMGNZ4XGd1Qicmrx/4KxjrGIMJOFFrALP8Cxmwp3USJqAAst9
 m1hjf7iL7RYtxJP9v3pzvYjowiV72vHk9E9la9VeZaXCcG6BBS4eo/ClaZetD2/AdYfH
 0wbrMpd4EKCKJUCSUduBzjbq9Abi6JMuNMmSleQPNGOOncExDOwLKmslmYwu9iYZBiuS
 MqZcbS3Pt81SC7Nq7l+Rx/mc9MMoJPJXVlIzqIPlErqw1zg5cgK3d+H+1en0X45vuRtd
 9k4Q==
X-Gm-Message-State: AOAM533wZ5jBi8TodaeCm1WBUQdvp6a2FwLMpa7i6xRDpTeknRi+WVcR
 rs00TpQtmSdACyAO5jrxTD2It6cLBg2DHW9+yGvNWipEQ17MBRPEFJ31seE3xjz7bA4PbyeSFpo
 ta/LdMOdP5X+CxO4=
X-Received: by 2002:a05:6402:2909:: with SMTP id
 ee9mr3940296edb.377.1630595787581; 
 Thu, 02 Sep 2021 08:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvdswIUfKGCpx598o8TrM8YiJqz9vjAp7AEL9/nn4zRuT+kpCK9mYHSHPKCJI7JCs7p2TIFQ==
X-Received: by 2002:a05:6402:2909:: with SMTP id
 ee9mr3940266edb.377.1630595787408; 
 Thu, 02 Sep 2021 08:16:27 -0700 (PDT)
Received: from redhat.com ([2.55.140.175])
 by smtp.gmail.com with ESMTPSA id bx11sm1366868ejb.107.2021.09.02.08.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:16:26 -0700 (PDT)
Date: Thu, 2 Sep 2021 11:16:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Junji Wei <weijunji@bytedance.com>
Subject: Re: [RFC 5/5] hw/virtio-rdma: VirtIO rdma device
Message-ID: <20210902111601-mutt-send-email-mst@kernel.org>
References: <20210902130625.25277-1-weijunji@bytedance.com>
 <20210902130625.25277-6-weijunji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210902130625.25277-6-weijunji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, xieyongji@bytedance.com, linux-rdma@vger.kernel.org,
 jasowang@redhat.com, cohuck@redhat.com, yuval.shaia.ml@gmail.com,
 virtualization@lists.linux-foundation.org, jgg@ziepe.ca, dledford@redhat.com,
 chaiwen.cc@bytedance.com, hare@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 09:06:25PM +0800, Junji Wei wrote:
> diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
> index b052355ac7..4c2151bffb 100644
> --- a/include/standard-headers/linux/virtio_ids.h
> +++ b/include/standard-headers/linux/virtio_ids.h
> @@ -48,5 +48,6 @@
>  #define VIRTIO_ID_FS           26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM         27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM 29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_RDMA         30 /* virtio rdma */

You can start by registering this with the virtio TC.

>  #endif /* _LINUX_VIRTIO_IDS_H */
> -- 
> 2.11.0


