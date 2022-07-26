Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660525809DB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 05:19:47 +0200 (CEST)
Received: from localhost ([::1]:44430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGB6o-0008B1-0j
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 23:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGB5N-0006o8-5w
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:18:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGB5K-0005UK-CB
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658805492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhDuwDOWgqsCA9yp8FNfLTxic60BY9URDaVJHWbtxnE=;
 b=TEhp4hQKne/Atg2fMyv4PbAPnMJgTX2XnbyWxRQWzzLfDQHMDS5Y3DqulDMzHxxcmTKcEQ
 6sbsEImfOdeSHGDuUd/2wVbDvWTXJ7L+KDd04/fsA4cVrrjbT4pfvEtAQQlxSO/5ywTOp7
 I9vC0czUu9tloHSehl8bGk8kfjXn9dg=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-j6vjVugBMv-sDi4roAte-A-1; Mon, 25 Jul 2022 23:18:11 -0400
X-MC-Unique: j6vjVugBMv-sDi4roAte-A-1
Received: by mail-pf1-f197.google.com with SMTP id
 y10-20020a056a00180a00b0052b10093100so4295383pfa.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 20:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JhDuwDOWgqsCA9yp8FNfLTxic60BY9URDaVJHWbtxnE=;
 b=POKTWaNGRtPvDZebgoaFSY8K0YCBw+5KGU8gAorrE2pLz638VvUzzxyTjODuKYdrE5
 hTySxr2oftBZGKrVYv9LzKKMvPBCVW9CHtjUnb+IbQysrVszdMAV69jluujAHJ8s/JQG
 RHNiTNnE6borMWk//giYOvfM6AJe8PTXrCRJKd7z2mi5mBZjwYT34ArK5XlJjD19vawJ
 zlcUs3Ps3IN9KR1dD+Mw+4cGYk3N0HfRLVJk+ci6tcJTG2JOmlK4zAXLMXnQkfdHlBnm
 epR1Crd89Ccht6iZAiuJygf572QWPWuQCbWrQtRPyhoLyAUEj1VfsGv7v9oBzeaRo4g6
 u69g==
X-Gm-Message-State: AJIora9i1yqeX5EqP/eynwidPHahaPfpOnRec4pTvbi/s213MOlnwMLg
 tc1GMRUkDD6TNInqfNmc8n14GfJMM6268Vllgzd9SYSAe3oPxaDjVJ2sK+4e8lLVbskD7aflx6V
 4Zhvd2560dciv9/g=
X-Received: by 2002:a17:90b:4f87:b0:1f2:8a32:ca06 with SMTP id
 qe7-20020a17090b4f8700b001f28a32ca06mr12906760pjb.242.1658805490287; 
 Mon, 25 Jul 2022 20:18:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v9VqlGzYwhRc5VfEt+lVh4qJ7m+v8lI8eG/oAfJgp+j5wORDCXNOg+UvMFEbn2+c2XEFWMcg==
X-Received: by 2002:a17:90b:4f87:b0:1f2:8a32:ca06 with SMTP id
 qe7-20020a17090b4f8700b001f28a32ca06mr12906744pjb.242.1658805489956; 
 Mon, 25 Jul 2022 20:18:09 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a62a113000000b0052ba88f2de0sm10336229pff.131.2022.07.25.20.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 20:18:09 -0700 (PDT)
Message-ID: <07c61248-1774-69a9-ed1d-e6a089c2a89c@redhat.com>
Date: Tue, 26 Jul 2022 11:17:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 01/16] virtio-pci: virtio_pci_common_cfg add
 queue_notify_data
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <17224da449cac081550fd44001798a6e95da3a96.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <17224da449cac081550fd44001798a6e95da3a96.1658141552.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/7/18 19:16, Kangjie Xu 写道:
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> Add queue_notify_data in struct virtio_pci_common_cfg, which comes from
> here https://github.com/oasis-tcs/virtio-spec/issues/89
>
> Since I want to add queue_reset after queue_notify_data, I submitted
> this patch first.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


This should be done by script/update-linux-headers.sh.

Thanks


> ---
>   include/standard-headers/linux/virtio_pci.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/include/standard-headers/linux/virtio_pci.h b/include/standard-headers/linux/virtio_pci.h
> index db7a8e2fcb..598ebe9825 100644
> --- a/include/standard-headers/linux/virtio_pci.h
> +++ b/include/standard-headers/linux/virtio_pci.h
> @@ -164,6 +164,7 @@ struct virtio_pci_common_cfg {
>   	uint32_t queue_avail_hi;		/* read-write */
>   	uint32_t queue_used_lo;		/* read-write */
>   	uint32_t queue_used_hi;		/* read-write */
> +	uint16_t queue_notify_data;	/* read-write */
>   };
>   
>   /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
> @@ -202,6 +203,7 @@ struct virtio_pci_cfg_cap {
>   #define VIRTIO_PCI_COMMON_Q_AVAILHI	44
>   #define VIRTIO_PCI_COMMON_Q_USEDLO	48
>   #define VIRTIO_PCI_COMMON_Q_USEDHI	52
> +#define VIRTIO_PCI_COMMON_Q_NOTIFY_DATA	56
>   
>   #endif /* VIRTIO_PCI_NO_MODERN */
>   


