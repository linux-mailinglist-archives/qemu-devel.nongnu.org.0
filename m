Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DB348E6FC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:55:43 +0100 (CET)
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8IN4-00017l-Ek
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:55:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IK4-0006Kl-Kd
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IK3-0008PO-3d
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642150354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sunfqT0mxH4lSbP5b+qZzOn8G8tatyfsWdTecLtroJo=;
 b=iCD/Y11UfsuKAtfDW3Uf7n+UWvLfX3g0PXEVgJQynPSHe5BPvNZW48COQhwPPZJC127VoV
 RyaQb9XWRUZraGbcjmmZzLphKpECK8BB7sLWi3tFSn7Us3NX3ZqfSnAfR4vU4FGv2+doke
 1DJc5ielJYYLez1nkw04e5Rx6T2Wrgw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-ZieGeumJPRCl0SXD4_BHng-1; Fri, 14 Jan 2022 03:52:33 -0500
X-MC-Unique: ZieGeumJPRCl0SXD4_BHng-1
Received: by mail-wm1-f72.google.com with SMTP id
 20-20020a05600c22d400b00349067fe7b7so2036275wmg.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 00:52:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sunfqT0mxH4lSbP5b+qZzOn8G8tatyfsWdTecLtroJo=;
 b=ay+KEa6uqYkqdYc5Bjm0X9/xZGiPu5r4Otx+XDAuWAQdJH5jRwwwOQPQBeUFjITal6
 GW+iZ5lKkMMCjyVpsE3Y2P/XJkjc0+OEP8a6GDol6y3CRlyQ1tG5u8lzv6eS5S19TV0l
 drbDA/+7taZg4qu401kMmCgNz9lvKJ4Qc48mt22VRSYUDorHjP+O9hcWbLAW3Nwv4EmU
 cVe2cE6T7tNQbIK4Y+0tQmudgMha63zNZFhbKoPDP8tT1+77FwJZC//foWY8O1UoGi/i
 D9gyfm0Coiip/maIi7AczyjG9OazwyI9VfEpJHXr/5CGxorU/wRcIWUGi5Q6i0CC+Svu
 Druw==
X-Gm-Message-State: AOAM532efnCKE/Kquq7rgnQrSHV6CxZfWAx5nXUx71WlPuMlluhoh1ZL
 ixMRzaU4tq91TOAJ2yPmSW6FJvBgRbDG71fVd/aG8m95m7Qfg+mTQtTwgC1doHbqPzynpONvQE6
 zG/Q7X964RMCtlHc=
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr7452318wmj.187.1642150351847; 
 Fri, 14 Jan 2022 00:52:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8KEJ9CyCKDWnuNGLH23McJuocs9LCtCBI2MZoybdgR6IHhiO9xSAczc+pTEBLQ8y60Kr0Cg==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr7452298wmj.187.1642150351652; 
 Fri, 14 Jan 2022 00:52:31 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id p1sm5428227wrr.75.2022.01.14.00.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:52:31 -0800 (PST)
Message-ID: <e0189600-1f6e-ac8e-c756-4fe0d1aa4144@redhat.com>
Date: Fri, 14 Jan 2022 09:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/6] tests/qtest/vhost-user-test.c: Use vhostforce=on
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-2-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220110211915.2749082-2-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2022 22.19, Eric Auger wrote:
> -netdev vhost-user,vhostforce is deprecated and vhostforce=on
> should be used instead.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/vhost-user-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> index 3d6337fb5c5..6e79935c47e 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -42,7 +42,7 @@
>   #define QEMU_CMD_MEMFD  " -m %d -object memory-backend-memfd,id=mem,size=%dM," \
>                           " -numa node,memdev=mem"
>   #define QEMU_CMD_CHR    " -chardev socket,id=%s,path=%s%s"
> -#define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce"
> +#define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce=on"
>   
>   #define HUGETLBFS_MAGIC       0x958458f6
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


