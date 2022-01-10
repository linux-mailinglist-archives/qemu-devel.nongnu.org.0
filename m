Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39931489489
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:59:19 +0100 (CET)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qWM-00019R-9J
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:59:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qTu-0006Hs-6w
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qTr-00080O-WC
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641805000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWGsBnByri5A+FqrCAH0lKc0fVn+rGa92ZMhvejZgs8=;
 b=X0Ft68nwEsh5EgVqsDeXWiz19lTzDQHTUynwTQ7n1ZS29GGmFMlSZ/Mm0B1JA0a5NdriR3
 pppY/Uu9XjK6akresH4nNlw1hy4KAOB3FXiwtaH1t5EJORUPuZ/OZXV0D7n3RhuxSlMCvb
 G362gjcWYhs5MInv6ornfJU5vuhXSwU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-4yVoHY12Ml2h5HsgmgKmyQ-1; Mon, 10 Jan 2022 03:56:37 -0500
X-MC-Unique: 4yVoHY12Ml2h5HsgmgKmyQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 eg24-20020a056402289800b003fe7f91df01so547094edb.6
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lWGsBnByri5A+FqrCAH0lKc0fVn+rGa92ZMhvejZgs8=;
 b=ggkFv5eWSkxq/oTg3qwGKYpTWe83j1GAdBN1bAzBiuCgtr+CUNhNTMKMEe5imSRu3m
 mej8Burgx9wBhWeoYu8Yd38tSPeBBwgrQGkboR9kMzT8fK1qKGElQztxAL8h7xGwvDDW
 iQ49ANbYJddbUfKQV9xjB23ks/a4xZHUxL4cNuVqkZkZvcaoJjS77HGy/MU+3SZP9UX5
 Q9mONtXJ18Aksoi/hfenmpHxSAXZHhXa2N5eexldblx/CcMS+zh/C7l4mI7VUwyeoFSD
 UW+QZ6i0r1g0WMaFzrOJ7/SPqvuprCw1Cc7KHFehBFxExWkEBudx7azab4SEYar5hH4z
 zVKg==
X-Gm-Message-State: AOAM5301Xz0ylQua1tMv8LGXu1g4vmvDn3b/ZD+GPA+v1mQG7V91rsVI
 wq+25n9UcGdn24cGfBCa9iVR3EPAU/y+YKuYyW3Lrg9fnXFfMnsXSIp+DSUfj7roq+XHQxbVPhg
 f9aXbBiqS5wORksY=
X-Received: by 2002:a17:907:d16:: with SMTP id
 gn22mr57244570ejc.73.1641804995857; 
 Mon, 10 Jan 2022 00:56:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyd96SUlv4X0JSSvr9JtbhTGQASrhRDRraQLPiFZ+2x/c7g40OTGgw1j1D8fZWMXnvSmgYJvw==
X-Received: by 2002:a17:907:d16:: with SMTP id
 gn22mr57244558ejc.73.1641804995644; 
 Mon, 10 Jan 2022 00:56:35 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id l16sm3267544edb.3.2022.01.10.00.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:56:35 -0800 (PST)
Message-ID: <2b803671-0ba6-d499-9d12-f1829e9f977a@redhat.com>
Date: Mon, 10 Jan 2022 09:56:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/5] libvhost-user: Add vu_add_mem_reg input validation
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-3-raphael.norwitz@nutanix.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220106064717.7477-3-raphael.norwitz@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.01.22 07:47, Raphael Norwitz wrote:
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index a6dadeb637..d61285e991 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -690,6 +690,12 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VuDevRegion *dev_region = &dev->regions[dev->nregions];
>      void *mmap_addr;
>  
> +    if (vmsg->fd_num != 1 ||
> +        vmsg->size != sizeof(vmsg->payload.memreg)) {
> +        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");
> +        return false;
> +    }
> +
>      /*
>       * If we are in postcopy mode and we receive a u64 payload with a 0 value
>       * we know all the postcopy client bases have been received, and we

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


