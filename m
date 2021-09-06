Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28CF401D3A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 16:42:46 +0200 (CEST)
Received: from localhost ([::1]:54640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNFpd-0007mu-RB
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 10:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFoR-0006uc-3n
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:41:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFoP-0000fx-LG
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630939288;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNZmFUxIyYOyp2UU77EfnsRN0bsS1NEmfFfsmjO7RzI=;
 b=RV20ETcfIvHGu0OVYAnTjOsaK2ZPN4wUM1RzqcQda5NlMeIkNMr2C9cOyXOGj0auoSe2bs
 nFJQGRCzDjg0Mlf7O/BAsBefbYhj2Jgklw7qWhHLOhxCIstAudean8l9dSDTWykoHJridg
 3R2sCoSK1sBI9vd455oAJNVYQw0ICb8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-dql85_c4Pdud3UU9qcu_qQ-1; Mon, 06 Sep 2021 10:41:26 -0400
X-MC-Unique: dql85_c4Pdud3UU9qcu_qQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p18-20020a5d4e12000000b0015940dc586aso1256509wrt.6
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 07:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=bNZmFUxIyYOyp2UU77EfnsRN0bsS1NEmfFfsmjO7RzI=;
 b=cnTvFRB6GBdqAoapFkG2WlXok/mcePN1u28obSpw0TrYQLUcpPQDPDbZvL9ix9teVw
 a7Opj/IppQ2iB9OvOhWPTrhbiMT13NXN9Lz8wIA8HDHBFOjukVmsD8dZeVQX/DvfYDmC
 8rjxp/YbpfATsmx1ZiLqmBL+paSHKCqO4QIU4RJX0JRn41yERGsbhfen8d5ferPT07Wu
 RAIoI5Gsh9di3EjoRBGYcg8MhGmiYqQSCN9zXKVUUh8JkY39c+Jr7hKRX0yhYO+YDECm
 s3fKngtkECl7PyBashD8Jz3s+rW6iSyAmZYXBIdR8TqZ7LLxdR5S+Y/Pd2Z6W87otU/M
 P2ig==
X-Gm-Message-State: AOAM530V1iFndKWSH8oGqMS3okErCF4/QuadSKISiJUx36o6dDHYcbNY
 8jj7Pwx2aUVUdY22if9wIt/BpHcBRoyLg3vLqH/UsKmboVAY1kJdljAtQd7DfsQaWGxMNBBSLHz
 Z7XPKi4pq4Bf5PiE=
X-Received: by 2002:adf:80c8:: with SMTP id 66mr13967696wrl.65.1630939285048; 
 Mon, 06 Sep 2021 07:41:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCX/QposC9zgkhRvXsM6Gw5GEfhWbIJL0VGNusKfJhCT3oRymUabhxhMU3rHNnUa/Of5AQuQ==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr13967682wrl.65.1630939284887; 
 Mon, 06 Sep 2021 07:41:24 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id u26sm8491916wrd.32.2021.09.06.07.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:41:24 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] docs: Add '-device virtio-iommu' entry
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-9-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <4aaffa5a-e9cf-9997-aa59-dcb2726ad696@redhat.com>
Date: Mon, 6 Sep 2021 16:41:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-9-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> Document the virtio-iommu device for qemu-system-x86_64. In particular
Nit: this is not only for qemu-system-x86_6. This also documents the
option usage for aarch64. Only the interrupt remapping note is x86-64
specific.

I think it also would be worth to mention the interaction with the
bypass iommu option as you mention "for all devices".

Thanks

Eric
> note the lack of interrupt remapping, which may be an important
> limitation on x86.
>
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  qemu-options.hx | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 83aa59a920..9a1906a748 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -976,6 +976,9 @@ SRST
>      Please also refer to the wiki page for general scenarios of VT-d
>      emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
>  
> +``-device virtio-iommu``
> +    Enable a paravirtual IOMMU, that manages DMA isolation and remapping
> +    for all PCI devices, but does not support interrupt remapping.
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,


