Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6125B5AC9AF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 06:58:04 +0200 (CEST)
Received: from localhost ([::1]:44142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV4BO-00035s-Ns
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 00:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV49k-0001dy-Kp
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 00:56:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV49g-00081p-I9
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 00:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662353775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwbUng3+e9mcdLC+VQxzGiUH4rjqXmhfURDhpEpRvBM=;
 b=AXD1KEgGidA/Wr8VnBA602kQB8MBx47jgUexRG+csmU7K/mAk1sQzG1KYf/oJBsAueDDil
 5bfjQH3JcpfYvIYn+GHO0XfL5XhBgClSjbkMZpWCnRY4oGKhUQtunJ/dyAffvTaOdy6Ian
 gWpQ3FzmVP/2SX/U1QDmvFBqlDgmKvI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-IYtifYcCNRC0gbpkbW8HBw-1; Mon, 05 Sep 2022 00:56:13 -0400
X-MC-Unique: IYtifYcCNRC0gbpkbW8HBw-1
Received: by mail-pf1-f198.google.com with SMTP id
 i74-20020a62874d000000b005381588912bso3686420pfe.0
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 21:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JwbUng3+e9mcdLC+VQxzGiUH4rjqXmhfURDhpEpRvBM=;
 b=d4VbLzcIejPgog2fWQ2G3/CP/ER/u8iUkPLR4/vRVkjU0ExI6bNJE70I+bWv3pJoTB
 +hdjSS21RmQmJ9arMpZQbu7K5DDVZbooO/FWH1MNsb2jOlSQUuV6eshOJ2L6arAdM2wQ
 /u5f0YDkBa8Wr9nfQfWs4g7kIeyMpNFvDFFbCs0m2+xnOb075BDrqI85t90JMsOyNZH6
 lvGCIdRnxSv5kimdmuv4GbRtmjcnC8JdcqqbalZDjLl8OFr6hsz0DJeU2UogHg3qqk2R
 WWAwjdWem0EWkeiit+kTyf9+0CmAcPJiuzbKy9WLS0OlpQXM/C9Q06WBvA/ydFdp56f4
 6f5A==
X-Gm-Message-State: ACgBeo2fcNGvxwkeLeN/wAOXsxlBG3Yxi2yjzBQhoWRkee0b7E8JpRzh
 HU9m9GtabXpteq/8d8KhaKL33/hnLkMjLTb/BrtZ2T8HlaJ8usCzbLVLsIE6352ZFrfYQSjP9JR
 fMFXXivY1CFGuK3M=
X-Received: by 2002:a63:914c:0:b0:42b:a8fa:eb47 with SMTP id
 l73-20020a63914c000000b0042ba8faeb47mr33664517pge.267.1662353772497; 
 Sun, 04 Sep 2022 21:56:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5/hk7zD/bnTRbSzqLiuVhtCPEK4VWHk6abRZNJVBcGDuon2faKqhiCcH9K9WB8F/htKiUJhA==
X-Received: by 2002:a63:914c:0:b0:42b:a8fa:eb47 with SMTP id
 l73-20020a63914c000000b0042ba8faeb47mr33664501pge.267.1662353772179; 
 Sun, 04 Sep 2022 21:56:12 -0700 (PDT)
Received: from [10.72.12.129] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0017500f9b01fsm6301502plf.103.2022.09.04.21.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 21:56:11 -0700 (PDT)
Message-ID: <9fbe469d-bbe9-a21e-c98b-4fd59583c3d8@redhat.com>
Date: Mon, 5 Sep 2022 12:56:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 01/15] virtio: sync relevant definitions with linux
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <18193bfe3168e3b4f7115daefed725e8014fbb94.1661414345.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <18193bfe3168e3b4f7115daefed725e8014fbb94.1661414345.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.978, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/8/25 16:08, Kangjie Xu 写道:
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> This is updated using scripts/update-linux-headers.sh.
>
> Added VIRTIO_F_RING_RESET, VIRTIO_PCI_COMMON_Q_RESET. It came from here:
> https://github.com/oasis-tcs/virtio-spec/issues/124
> https://github.com/oasis-tcs/virtio-spec/issues/139
>
> Add VIRTIO_PCI_COMMON_Q_NDATA, which comes from here:
> https://github.com/oasis-tcs/virtio-spec/issues/89
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   include/standard-headers/linux/virtio_config.h | 5 +++++
>   include/standard-headers/linux/virtio_pci.h    | 2 ++
>   2 files changed, 7 insertions(+)
>
> diff --git a/include/standard-headers/linux/virtio_config.h b/include/standard-headers/linux/virtio_config.h
> index 7acd8d4abc..47a7eef5e4 100644
> --- a/include/standard-headers/linux/virtio_config.h
> +++ b/include/standard-headers/linux/virtio_config.h
> @@ -96,4 +96,9 @@
>    * Does the device support Single Root I/O Virtualization?
>    */
>   #define VIRTIO_F_SR_IOV			37
> +
> +/*
> + * This feature indicates that the driver can reset a queue individually.
> + */
> +#define VIRTIO_F_RING_RESET		40
>   #endif /* _LINUX_VIRTIO_CONFIG_H */
> diff --git a/include/standard-headers/linux/virtio_pci.h b/include/standard-headers/linux/virtio_pci.h
> index db7a8e2fcb..be912cfc95 100644
> --- a/include/standard-headers/linux/virtio_pci.h
> +++ b/include/standard-headers/linux/virtio_pci.h
> @@ -202,6 +202,8 @@ struct virtio_pci_cfg_cap {
>   #define VIRTIO_PCI_COMMON_Q_AVAILHI	44
>   #define VIRTIO_PCI_COMMON_Q_USEDLO	48
>   #define VIRTIO_PCI_COMMON_Q_USEDHI	52
> +#define VIRTIO_PCI_COMMON_Q_NDATA	56
> +#define VIRTIO_PCI_COMMON_Q_RESET	58
>   
>   #endif /* VIRTIO_PCI_NO_MODERN */
>   


