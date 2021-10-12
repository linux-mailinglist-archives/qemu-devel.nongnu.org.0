Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B96E42A389
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:42:51 +0200 (CEST)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGBG-0003cQ-Km
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFXq-0001XC-E5
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:02:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFXT-0003Aa-Iz
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634036501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fRi3PyToUjozTcU35b3f4kLf/VrIXqamswlI3WnBM4Q=;
 b=MCCzdcliQuGC3IMUtJ1IcXXkHGYft7b34TuXQFeyOQQ/PzMvWWbHCZy2YCpCPkmtjTmnp2
 ihzy4hFSFnp0qxwneIne/YfK3nu1hv4ZYwvGiITcxxJIo9/A3T3SfV9fkPQE/+8tZ59R5+
 CXm3wh6iHU4FGrcsfx5PBLZ7LVtWI0Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-4hWafinlO4SFUtD4Z5UawQ-1; Tue, 12 Oct 2021 07:01:40 -0400
X-MC-Unique: 4hWafinlO4SFUtD4Z5UawQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 10-20020a5d47aa000000b001610cbda93dso4242691wrb.23
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fRi3PyToUjozTcU35b3f4kLf/VrIXqamswlI3WnBM4Q=;
 b=kF1SoABMgtKwow+YrCRIvb7G8iu4wFRiqDnsezOFTjUhO/vX9pG0wG474xP/z3rsvn
 j7TcjFhsiCECOLg5knaNR1U5XDOs8jK1TJ9Yjjca2ieKSBJUr6okvVywRikUC0rRVfRY
 FM88WmEcZHjxLoeunljMu2D4LtT2doLuxVnu+YP6iMjdGCdOtHYe/5DI3gaFmLfAvK0P
 b963RsbqnRUENa/SlZjl9dLkFp2n+PjozFszFcxSZT2WrRMeKcPsUFYKwZy9cM12Okx8
 X7HUSNc9uaLNhlgu2/+Vp3grWGC62uCkVVcrGJoG1FP8DegbYjUzpIHlnv2T7WwNChZc
 TPpw==
X-Gm-Message-State: AOAM533ORNGAWTdH2yQUtHuOSM3XBjjA+jNSal7LNbfDWVgyqW+VK7By
 Wa5P0fQ01pdr+Ha7XUD5e+w+A2OB5xqH9538emZ1OeolRLZz3XoYgnyXjl7qsDUvzb45ZsRKJmf
 71WckkqY5jBZtzMo=
X-Received: by 2002:a1c:19c6:: with SMTP id 189mr4674960wmz.121.1634036499375; 
 Tue, 12 Oct 2021 04:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4qs44KfCJSMEupZW/acQdsKlcr9uYW7p+u6I4TRFaZub6n9MjDvnUSBHWTfukaVOSPhSPyA==
X-Received: by 2002:a1c:19c6:: with SMTP id 189mr4674915wmz.121.1634036499031; 
 Tue, 12 Oct 2021 04:01:39 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l21sm2233351wmh.31.2021.10.12.04.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 04:01:38 -0700 (PDT)
Message-ID: <5cedb309-c12a-5d90-01fa-c129a457aa10@redhat.com>
Date: Tue, 12 Oct 2021 13:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/6] numa: Add SGXEPCSection list for multiple sections
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20211011111554.12403-1-yang.zhong@intel.com>
 <20211011111554.12403-4-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211011111554.12403-4-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 13:15, Yang Zhong wrote:
> The SGXEPCSection list added into SGXInfo to show the multiple
> SGX EPC sections detailed info, not the total size like before.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>   qapi/misc-target.json | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 594fbd1577..89a5a4250a 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -334,6 +334,21 @@
>     'returns': 'SevAttestationReport',
>     'if': 'TARGET_I386' }
>   
> +##
> +# @SGXEPCSection:
> +#
> +# Information about intel SGX EPC section info
> +#
> +# @index: the SGX epc section index
> +#
> +# @size: the size of epc section
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'SGXEPCSection',
> +  'data': { 'index': 'uint64',
> +            'size': 'uint64'}}
> +
>   ##
>   # @SGXInfo:
>   #
> @@ -347,7 +362,7 @@
>   #
>   # @flc: true if FLC is supported
>   #
> -# @section-size: The EPC section size for guest
> +# @sections: The EPC sections info for guest
>   #
>   # Since: 6.2
>   ##
> @@ -356,7 +371,7 @@
>               'sgx1': 'bool',
>               'sgx2': 'bool',
>               'flc': 'bool',
> -            'section-size': 'uint64'},
> +            'sections': ['SGXEPCSection']},
>      'if': 'TARGET_I386' }
>   
>   ##
> 

I am not sure the index is particularly useful, but perhaps you should 
add the node there?

Paolo


