Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767D1403634
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:39:05 +0200 (CEST)
Received: from localhost ([::1]:53344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNt6m-0008LN-DM
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNt2c-00035c-DA
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:34:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNt2Z-0003Ch-L3
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631090083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8gs8F+0Afj2R0w/up4S1NdgkWNgN+Qe3sCAO6DbeNNw=;
 b=G0PjWYT/tLEhi/Uk7bI3la/gPmZAnTKTMyuiJzFn5zgpzbukwvAT+1gxFKx07EWjdJw3dE
 jaQRtooqQAWws40yEhFHfgr78X+G/nvWMfBnvOiZLWDdmVWaWXrPlFyfD0e9OR3+AaNeJv
 5+XbTvNApJLtS5auTvrGBLHbk+miapk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-3H1Cpo69NlqAtHcu8qMwCQ-1; Wed, 08 Sep 2021 04:34:42 -0400
X-MC-Unique: 3H1Cpo69NlqAtHcu8qMwCQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so648936wmp.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8gs8F+0Afj2R0w/up4S1NdgkWNgN+Qe3sCAO6DbeNNw=;
 b=45s0EnG0eQ1fTfXLpH8KMCNxMGOvuMVGGveXa30VLdi2o8O1Q69Dg6yI5h362K9BJd
 vNqgDoG3uK8PNrAWY/ZncL5nqs/UzlpDx9Rc8z+1O6eR44FLhteY3hqb+xtR2RQCp4F2
 CkCVik+RUwWtJr71+zfHElKLWp7U1fpEFadl7i6Weapdy6WobOqbYicA4BhEUg/EakQH
 KjWFIvdtO/hZm0l9DbsghvaXqkgALhetW9a7kqGyymilG8uQ/JjV82SDWHt3ooVi2kCZ
 xFknxpurwe7iNncH+tQkkZuPUsREmV3yVDQHL9R+uJ2/fv34yLigLhw1LfHcXEVv1yXy
 NnMg==
X-Gm-Message-State: AOAM530cwwB1QYrlrshAA70d4A48uyZDLNv8qMaMt3+Q2myBHKavCYZM
 yQDI6aByIHcLFoqJ6IZ0gg+R0qu5FqaLC9EF8XZ5sUu5nrlSHAuyD3WftbUMGGvrSWpsRIYBq37
 u7kngZv7Wgnd6+jA=
X-Received: by 2002:a5d:424c:: with SMTP id s12mr2677910wrr.8.1631090080958;
 Wed, 08 Sep 2021 01:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvbL7xg+AeNTk9YKuG407mPFs2F6NnOZUby/68siGIxxrK2u6v2rnFac8XGoVf9pfB0wbEPA==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr2677897wrr.8.1631090080837;
 Wed, 08 Sep 2021 01:34:40 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id a12sm1412943wmm.42.2021.09.08.01.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 01:34:40 -0700 (PDT)
Subject: Re: [PATCH 4/7] bitops: Support 32 and 64 bit mask macro
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-5-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <92520c7c-0aaa-5776-b8b1-3dd97d3eb63d@redhat.com>
Date: Wed, 8 Sep 2021 10:34:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908081937.77254-5-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: pbonzini@redhat.com, eblake@redhat.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 10:19 AM, Yang Zhong wrote:
> The Qemu should enable bit mask macro like Linux did in the
> kernel, the GENMASK(h, l) and GENMASK_ULL(h, l) will set the
> bit to 1 from l to h bit in the 32 bit or 64 bit long type.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  include/qemu/bitops.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
> index 03213ce952..04dec60670 100644
> --- a/include/qemu/bitops.h
> +++ b/include/qemu/bitops.h
> @@ -18,6 +18,7 @@
>  
>  #define BITS_PER_BYTE           CHAR_BIT
>  #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
> +#define BITS_PER_LONG_LONG       64
>  
>  #define BIT(nr)                 (1UL << (nr))
>  #define BIT_ULL(nr)             (1ULL << (nr))
> @@ -28,6 +29,12 @@
>  #define MAKE_64BIT_MASK(shift, length) \
>      (((~0ULL) >> (64 - (length))) << (shift))
>  
> +#define GENMASK(h, l) \
> +    (((~0UL) << (l)) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
> +
> +#define GENMASK_ULL(h, l) \
> +    (((~0ULL) << (l)) & (~0ULL >> (BITS_PER_LONG_LONG - 1 - (h))))

What is the difference with MAKE_64BIT_MASK()??


