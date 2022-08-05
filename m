Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE85758A4BB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 04:30:34 +0200 (CEST)
Received: from localhost ([::1]:49936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJn6f-0006yu-GS
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 22:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJn5I-0005D7-SS
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 22:29:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJn5E-0000U4-Pe
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 22:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659666543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XNGlQAjvYaKY68T14fdyMvl0Xny5b5fMWpTyJt9nrMY=;
 b=I9maZoU6Tzd24WLk3N2KETPdh1L9dDgoI6dP43U+I1eryMsHHUNGeiYLlkhgst4PCm+N5a
 WWpGKnhS3aaNmyhcAL3a4vuIhxO0vhR5JHyLun1mVyFNTCaHUmud1996O0QyUsVTfxqR99
 b6qhD9xvT/W+ofuaTekKI+rU/nT335M=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-oObqm8aRP6mmd-E7nr4BhA-1; Thu, 04 Aug 2022 22:29:02 -0400
X-MC-Unique: oObqm8aRP6mmd-E7nr4BhA-1
Received: by mail-pj1-f69.google.com with SMTP id
 ng1-20020a17090b1a8100b001f4f9f69d48so3724699pjb.4
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 19:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XNGlQAjvYaKY68T14fdyMvl0Xny5b5fMWpTyJt9nrMY=;
 b=s8awpyr7PqIG5Z6s9XSZOxymOc9RGBEjJfYwqfjOmpn6JJ5usSTlvN/XR4EzxGoBpi
 yJ7yR2ie805XEQOdYPMWhLpcRjpIUU6j2n+vPn4Unde1xGkV03EkA4E/TSVKuwmJlLID
 u719aPwq9lYRRpBlz5x9BhSyigVIbTaV4jjDmjUxQsJnEyWDUWuDLhDD6zVbeFMFlvK4
 xV3QhyRMfBZtcBpeIhxn8BZHV6Iab7grl5HI49vb6aN4+5P30FhrDziBW4raT5T5GPS8
 j4sqzycPnQ64xziQUg8TZ2B7Q8UHF3fPIuknWwe2n2dur0a9D9ciAR2pk56KAWrgAjg0
 I8tA==
X-Gm-Message-State: ACgBeo33yvUU2zCYdKuGqlFi4Ybx4bp7ZasDoprV0SRUkAFd0g37SW8r
 GZdiwtuUJ2R7g7BKe58ucKX8H/rrTpZkTAahngzlwPNI/+MbOPXIZS9ghoGOb2UtyxTFfuYNA6v
 X5Ey2tTnifRJ43wQ=
X-Received: by 2002:a63:d811:0:b0:41b:3c11:32c3 with SMTP id
 b17-20020a63d811000000b0041b3c1132c3mr3835749pgh.183.1659666541712; 
 Thu, 04 Aug 2022 19:29:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6jABPjEDAzhApARgMk9GLUwHWYAVUeP0V22fJKIo/JegN/l6E5s4lkciVgcdu+I0gVrBPnlQ==
X-Received: by 2002:a63:d811:0:b0:41b:3c11:32c3 with SMTP id
 b17-20020a63d811000000b0041b3c1132c3mr3835733pgh.183.1659666541441; 
 Thu, 04 Aug 2022 19:29:01 -0700 (PDT)
Received: from [10.72.12.229] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a170903234d00b0016b81679c1fsm1654044plh.216.2022.08.04.19.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 19:29:00 -0700 (PDT)
Message-ID: <907485db-d53a-9e32-e447-39d67ce8c9a5@redhat.com>
Date: Fri, 5 Aug 2022 10:28:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] vdpa: Skip the maps not in the iova tree
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Lei Yang <leiyang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220804155443.671136-1-eperezma@redhat.com>
 <20220804155443.671136-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220804155443.671136-2-eperezma@redhat.com>
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


在 2022/8/4 23:54, Eugenio Pérez 写道:
> Next patch will skip the registering of dma maps that the vdpa device
> rejects in the iova tree. We need to consider that here or we cause a
> SIGSEGV accessing result.
>
> Reported-by: Lei Yang <leiyang@redhat.com>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/vhost-vdpa.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 3ff9ce3501..983d3697b0 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -289,6 +289,10 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>           };
>   
>           result = vhost_iova_tree_find_iova(v->iova_tree, &mem_region);
> +        if (!result) {
> +            /* The memory listener map wasn't mapped */
> +            return;
> +        }
>           iova = result->iova;
>           vhost_iova_tree_remove(v->iova_tree, result);
>       }


