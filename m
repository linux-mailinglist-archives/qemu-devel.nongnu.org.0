Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC50655BB2A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:39:16 +0200 (CEST)
Received: from localhost ([::1]:48804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rlb-00017N-UK
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o5reW-0000KK-BP
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o5reT-0004Ue-5s
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656347504;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/hleHAed8bNCynt13zS51L1c4e9Z5Jd7L4kYpJ2JhA=;
 b=XsFJw2Z9vsrkHlsm3s6GbzSqT+mFezTh7Sqe06EqLYR4Kf0gcrHcXo+I3JyL+N6dKafpMD
 d/KAr3dkzcGEFpvNFiVUMocS7rBbdpa/hBrnqJ8ii8/P5dmjUgi4wBl2b84FNMP1TpUVrD
 XPkXjX+S6pCREUU8u6w/MBxIk6xftYA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660--figXpsIN0quMT7cxCh5CQ-1; Mon, 27 Jun 2022 12:31:42 -0400
X-MC-Unique: -figXpsIN0quMT7cxCh5CQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m20-20020a05600c4f5400b003a03aad6bdfso3696522wmq.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 09:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F/hleHAed8bNCynt13zS51L1c4e9Z5Jd7L4kYpJ2JhA=;
 b=g/NvQNR13bLD0c352IY6ke6lRoKGyk8sq6nTYhMK5PbQnd3gFWbuwN3HrJzxs9pWtx
 FHjqNskVJZN5dh1vqD1fJ5GQtAWfhGavLWW/kbWycN1swpgQZlTgISJrlW1j69OLE3U3
 G5M9aCVY6kvfbUUc8tMis3ikrDpUnlmP5coTUwj1D1a9wfbN1dqxVn8lNKToDAmLTJIa
 m/KWPB+orlCTE+W/I/uwffc6RX2S0+VVLht9m49O76cAWoVsHM+HjNAv7rOIYZuCy4/v
 5dr6ldlLjkNb4Q/LE1TbECQx4gMqOug+TlUpFjs/+NVUx6LcW1Np/fqpSx9gi6mGf9oY
 BaSg==
X-Gm-Message-State: AJIora8zsOjFn119ZO+Kko6tv5neIohSFrPlBHnWwxt2Bf0L3QS92+7C
 1uHOfPQ+W/nRExlMko5JRCeub91E31Vew8EIz6rRxoeB1dGg6vmgtGbFcun+vT9ckFHUqI5UtD+
 jb8CSuecafc5OtoM=
X-Received: by 2002:a5d:5050:0:b0:21b:a348:7c0 with SMTP id
 h16-20020a5d5050000000b0021ba34807c0mr12767494wrt.184.1656347500854; 
 Mon, 27 Jun 2022 09:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v1v89i2e1u1EJW9zCeiGoRiP5V8C4kMpu8ULbG5WKrh5dBO8wqu/gaExV1zKmF2eTTJ70QCg==
X-Received: by 2002:a5d:5050:0:b0:21b:a348:7c0 with SMTP id
 h16-20020a5d5050000000b0021ba34807c0mr12767482wrt.184.1656347500671; 
 Mon, 27 Jun 2022 09:31:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfdbc2000000b0021b9f126fd3sm11164257wrj.14.2022.06.27.09.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 09:31:40 -0700 (PDT)
Message-ID: <5b75ba05-4cb3-7812-fc86-ed1a7e2cbb39@redhat.com>
Date: Mon, 27 Jun 2022 18:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] virtio-iommu: Fix migration regression
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, jean-philippe@linaro.org
References: <20220624093740.3525267-1-zhenzhong.duan@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220624093740.3525267-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/24/22 11:37, Zhenzhong Duan wrote:
> We also need to switch to the right address space on dest side
> after loading the device status. DMA to wrong address space is
> destructive.
>
> Fixes: 3facd774962fd ("virtio-iommu: Add bypass mode support to assigned device")
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/virtio/virtio-iommu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 08b227e828f8..281152d338f4 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1322,6 +1322,14 @@ static int iommu_post_load(void *opaque, int version_id)
>      VirtIOIOMMU *s = opaque;
>  
>      g_tree_foreach(s->domains, reconstruct_endpoints, s);
> +
> +    /*
> +     * Memory regions are dynamically turned on/off depending on
> +     * 'config.bypass' and attached domain type if there is. After
> +     * migration, we need to make sure the memory regions are
> +     * still correct.
> +     */
> +    virtio_iommu_switch_address_space_all(s);
>      return 0;
>  }
>  


