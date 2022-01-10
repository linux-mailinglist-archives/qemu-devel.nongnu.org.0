Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA24894A3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:02:24 +0100 (CET)
Received: from localhost ([::1]:59364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qZK-0002jU-Tg
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:02:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qTe-0006AZ-6q
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:56:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qTb-000805-G8
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641804986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtBHirfuNk20kKE6E1PFmMn/kQ55H3RRE1QLj1ikAZw=;
 b=Dm2DhMm3P4VN3OYIOi6H5P1G1wj3A7Utnux0Z+suEFgJPTIV7h5UahT/4/OrgWcaDGe14Z
 69XMnhtSa08aFy0YcSV+Rx1E9Ryv5yTpuaURJTCJS8jkf7B2SKbGLxt2KHI/1z2d/WHKNM
 ldkBn22d0izTjrNe/3swIxPOihjEkbw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-UvviM8UnO4uwc4UOtkyXTw-1; Mon, 10 Jan 2022 03:56:24 -0500
X-MC-Unique: UvviM8UnO4uwc4UOtkyXTw-1
Received: by mail-ed1-f70.google.com with SMTP id
 m8-20020a056402510800b003f9d22c4d48so9529862edd.21
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wtBHirfuNk20kKE6E1PFmMn/kQ55H3RRE1QLj1ikAZw=;
 b=kqqgStbH98m0bhD7Zpw4OUVvF2Hu76sHamDUyWk632yvRC+lQGKF8izu64ZtEn4WyN
 Nkbx/YZdnkZZZoaqqapNnM/pW8snKJBucbMG0kjzVSMDULO/wPKPj2d/oqfl3ztGC2gb
 31FY4n3DA6m+aMusUPRHnzPpE76MkckpPh9DPlCcVUc/uPdrxEBrIB/+6VWG+3DxC0+Q
 5YV0cwggykV3pwvNjEgU1cT8unha2OEOardJnodSBOaSx7KoFrUjaiszfnosliyO/zS6
 k7DX+vF+47VvKjNfKy2j9R94m2N2gVko9KQS6HGjoynLPOBN+ZvVq0XiYvmvQfwu39pY
 z6gA==
X-Gm-Message-State: AOAM531V7NLg4GnvgEnlK8Z0fvJm/Ojl2l8Fxe8BEB+JVopZOXz6pQ6r
 HSCbmDr9xxJVRqO19KDlu2wvzxYLNvlUxf3T+ciHQDIGJHViekudSkA30WCob1FKUkNHG533Jl5
 MHw8uWvMNL6lyXdw=
X-Received: by 2002:a17:907:6d1e:: with SMTP id
 sa30mr4344189ejc.1.1641804983421; 
 Mon, 10 Jan 2022 00:56:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyt9wCYMdF2hltrP6MCNikIfBo5202DYVUX/VWEXbw/WltTi5OmxjnEyLtAE1dGCbBgMr3UNg==
X-Received: by 2002:a17:907:6d1e:: with SMTP id
 sa30mr4344175ejc.1.1641804983198; 
 Mon, 10 Jan 2022 00:56:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id qw4sm2168636ejc.55.2022.01.10.00.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:56:22 -0800 (PST)
Message-ID: <cefaaa2b-afbd-17d2-7c04-13c2f101dd6c@redhat.com>
Date: Mon, 10 Jan 2022 09:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/5] libvhost-user: Add vu_rem_mem_reg input validation
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-2-raphael.norwitz@nutanix.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220106064717.7477-2-raphael.norwitz@nutanix.com>
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
> index 787f4d2d4f..a6dadeb637 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -801,6 +801,12 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] = {};
>      VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
>  
> +    if (vmsg->fd_num != 1 ||
> +        vmsg->size != sizeof(vmsg->payload.memreg)) {
> +        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");
> +        return false;
> +    }
> +
>      DPRINT("Removing region:\n");
>      DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
>             msg_region->guest_phys_addr);

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


