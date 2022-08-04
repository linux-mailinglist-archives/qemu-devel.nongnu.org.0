Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C3E5896CF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 06:04:45 +0200 (CEST)
Received: from localhost ([::1]:56464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJS6G-00027x-3o
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 00:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJS3l-0000EG-PH
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJS3i-0007gk-AM
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 00:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659585724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETJBEMIe09qR7ceC4Z5/ko2wjYfqWpl7Uw6ot4/fxko=;
 b=CDI2NGryVTqNMk4lu3JLal2Hm8IV+kYJVEXLfcontTBNbhpuqJxxLf3UrswBRaxggdl4Cl
 5iQa1DAfnM4D4TZ09VyNaQOSRXSot+Znah60t2DxeBdp74YSFgQNDdmb7EXJ2prRv6bUZL
 kzRAVIUL6GGqluMiDtBnBCr1Nka2cMc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-ZOaTrc05NmmIAqC3sv5dAA-1; Thu, 04 Aug 2022 00:02:02 -0400
X-MC-Unique: ZOaTrc05NmmIAqC3sv5dAA-1
Received: by mail-pj1-f69.google.com with SMTP id
 o69-20020a17090a0a4b00b001f527012a46so1926956pjo.5
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 21:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ETJBEMIe09qR7ceC4Z5/ko2wjYfqWpl7Uw6ot4/fxko=;
 b=p+ZYKYYCrpbB4BGrmo8w3eGfHiJiOQz/j2oHqsCvXBRuNCRB5x6IuucLGmP1DOrjqq
 XpCzEe6fITGquWBnYUYanXu1hXKjJ5Xa1IaBfzwzPRrPiNsxzQ6XR6tEj855O0o+TnGj
 DlhbLN9Bb22psWtEuMEFxWYPoiF/cImbAubAKvuIapieq3IITIXWgi4iip/wFGuqPXge
 96s48Q3AxuBUin1meUIrKJVdo6i4OPI1LKygCU/Qrexb1J4MgX5jiEQBJSRKfR4+W9LR
 FmGz3W/HA6sqiR7oWa6zt4WesLAXWnpnK8CPQrJ3zdD6vNvcj5pq0bC4fP5ZRE2Fe/Dc
 QPmg==
X-Gm-Message-State: ACgBeo36aiHvZ+sKvewnoUFDTUJg/rRoVWbqBFbfwOJmtb01zJFd2UyJ
 pYhhE6Cg6lKk9ICpWAa9yALJN41V0VN5u5JqMuglEddQkkJwBo8wAqqngWEssQrI4GVU6e6yBfj
 yQVSqT0ZUUePdX+8=
X-Received: by 2002:a63:db54:0:b0:419:698f:fce0 with SMTP id
 x20-20020a63db54000000b00419698ffce0mr55670pgi.424.1659585721456; 
 Wed, 03 Aug 2022 21:02:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ovJHvlqKwuX4r9Rj9cltQA2cgV2k421zLx/5J95LxGQeTou02jhRMep5W01z0vPHZOrCkyA==
X-Received: by 2002:a63:db54:0:b0:419:698f:fce0 with SMTP id
 x20-20020a63db54000000b00419698ffce0mr55639pgi.424.1659585721176; 
 Wed, 03 Aug 2022 21:02:01 -0700 (PDT)
Received: from [10.72.12.192] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902654500b0016ef1e058e5sm2770662pln.295.2022.08.03.21.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 21:02:00 -0700 (PDT)
Message-ID: <bcbf0e61-a86e-2085-ec30-46fae2cde838@redhat.com>
Date: Thu, 4 Aug 2022 12:01:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 04/10] vdpa: Get buffers from VhostVDPAState on
 vhost_vdpa_net_cvq_map_elem
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220802175731.312115-5-eperezma@redhat.com>
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


在 2022/8/3 01:57, Eugenio Pérez 写道:
> There is no need to get them by parameter, since they're contained in
> VhostVDPAState. The only useful information was the written length in
> out.
>
> Simplify the function removing those.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index ac1810723c..c6699edfbc 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -303,34 +303,29 @@ dma_map_err:
>   
>   /**
>    * Copy the guest element into a dedicated buffer suitable to be sent to NIC
> - *
> - * @iov: [0] is the out buffer, [1] is the in one
>    */
>   static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
>                                           VirtQueueElement *elem,
> -                                        struct iovec *iov)
> +                                        size_t *out_len)
>   {
>       size_t in_copied;
>       bool ok;
>   
> -    iov[0].iov_base = s->cvq_cmd_out_buffer;
>       ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->out_num,
> -                                vhost_vdpa_net_cvq_cmd_len(), iov[0].iov_base,
> -                                &iov[0].iov_len, false);
> +                                vhost_vdpa_net_cvq_cmd_len(),
> +                                s->cvq_cmd_out_buffer, out_len, false);
>       if (unlikely(!ok)) {
>           return false;
>       }
>   
> -    iov[1].iov_base = s->cvq_cmd_in_buffer;
>       ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
> -                                sizeof(virtio_net_ctrl_ack), iov[1].iov_base,
> -                                &in_copied, true);
> +                                sizeof(virtio_net_ctrl_ack),
> +                                s->cvq_cmd_in_buffer, &in_copied, true);


I'd suggest to do some tweak to make it easier for the reviewers:

- let vhost_vdpa_cvq_map_buf() and vhost_vdpa_net_cvq_map_elem() return 
ssize_t and drop the confusing written/out_len parameter of those 
functions.
- rename vhost_vdpa_net_cvq_map_elem() to 
vhost_vdpa_net_cvq_bounce_map() since it uses a bounce buffer actually

Thanks


>       if (unlikely(!ok)) {
>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>           return false;
>       }
>   
> -    iov[1].iov_len = sizeof(virtio_net_ctrl_ack);
>       return true;
>   }
>   
> @@ -395,7 +390,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
>       int r = -EINVAL;
>       bool ok;
>   
> -    ok = vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
> +    ok = vhost_vdpa_net_cvq_map_elem(s, elem, &dev_buffers[0].iov_len);
>       if (unlikely(!ok)) {
>           goto out;
>       }


