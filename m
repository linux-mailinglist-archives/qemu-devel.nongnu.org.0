Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE7C48D382
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 09:23:56 +0100 (CET)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7vOk-0006oE-UX
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 03:23:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7vNg-00062y-Rc
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 03:22:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7vNc-0005FC-Qi
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 03:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642062106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V66OLhBk1h/jneXbcM0HpfNRSWXgIVWONBC8Zbrwfwo=;
 b=B2STKUhGTP3P1adHlEYROVPyrcJklsoPBdHVfDg8vxlFHzgAoVyLklrkaC7zT2gLtw1jCx
 5vpVkij1Ha9jJ1hLMvcDsQ8WSOUohYHtx3w18rDUQCOb64QPkc8u3RGTwqGRgdO5dXAYtg
 exBJcTLn5LpuBbZ6sDYu9xoOIt3ik50=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-GxhHF1viMgewwd_sFj9S2g-1; Thu, 13 Jan 2022 03:21:43 -0500
X-MC-Unique: GxhHF1viMgewwd_sFj9S2g-1
Received: by mail-ed1-f72.google.com with SMTP id
 g11-20020a056402090b00b003f8fd1ac475so4681982edz.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 00:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=V66OLhBk1h/jneXbcM0HpfNRSWXgIVWONBC8Zbrwfwo=;
 b=foxw4Z+yqo9T6tlyTxhU+jmM2EJbnj2t7AnbWvcHNBTsdFGLCZ0xg5QPCn+XcHpFb3
 5wgB1ZUzdPf04aBCA7b9lnKgHJo9E69hlRT8AUtOosWQ3z2Ck4D1SRloR+UQujMzWE+o
 TYpC5KN5dPV5kJ00kog8aNirl3aYIwoRVru8exXsYUFJT6M/vFhLijORyf+JGvK3dQhW
 Z6/lJ9fVltb44i4hoNrDJQp2Yq+RuSBuIUxh0JOOUdLChkpXWV9tTNK+vis/SqpmiG21
 5ic/qDf9L5o75x1Ad+DDq+f3pPNnbUmz4M9zFhfmqgVJH8K8VN5mbANINaMnTR32f6en
 OygA==
X-Gm-Message-State: AOAM532cmDVTa3pXl/KYjjBYblMigIDha0JGhyNCLxhyoNs67+YROJpa
 wyZBDZyjlrWvk3EoR/wk7EFNMGv5NZwZ7QvuvS8/FktdV48HzSM1velx97CzyxMH8bpxyeXUquj
 zvxVdzph57YcEugU=
X-Received: by 2002:a05:6402:268a:: with SMTP id
 w10mr3246966edd.10.1642062102622; 
 Thu, 13 Jan 2022 00:21:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlRA9WEAKecX45YXG6oRD66uhNECvxwejRnwubqo/ioiuvSAD+Vjwkx2xdYC2LeGFxcdrpLA==
X-Received: by 2002:a05:6402:268a:: with SMTP id
 w10mr3246950edd.10.1642062102391; 
 Thu, 13 Jan 2022 00:21:42 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:e200:8511:ed0f:ac2c:42f7?
 (p200300cbc703e2008511ed0fac2c42f7.dip0.t-ipconnect.de.
 [2003:cb:c703:e200:8511:ed0f:ac2c:42f7])
 by smtp.gmail.com with ESMTPSA id qk11sm613374ejc.110.2022.01.13.00.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 00:21:41 -0800 (PST)
Message-ID: <0a9642a1-7f36-12a8-1f83-0016a493e907@redhat.com>
Date: Thu, 13 Jan 2022 09:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 3/5] target/s390x: Fix cc_calc_sla_64() missing
 overflows
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112165016.226996-1-iii@linux.ibm.com>
 <20220112165016.226996-4-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220112165016.226996-4-iii@linux.ibm.com>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.22 17:50, Ilya Leoshkevich wrote:
> An overflow occurs for SLAG when at least one shifted bit is not equal
> to sign bit. Therefore, we need to check that `shift + 1` bits are
> neither all 0s nor all 1s. The current code checks only `shift` bits,
> missing some overflows.
> 
> Fixes: cbe24bfa91d2 ("target-s390: Convert SHIFT, ROTATE SINGLE")
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/tcg/cc_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
> index c2c96c3a3c..c9b7b0e8c6 100644
> --- a/target/s390x/tcg/cc_helper.c
> +++ b/target/s390x/tcg/cc_helper.c
> @@ -297,7 +297,7 @@ static uint32_t cc_calc_sla_32(uint32_t src, int shift)
>  
>  static uint32_t cc_calc_sla_64(uint64_t src, int shift)
>  {
> -    uint64_t mask = ((1ULL << shift) - 1ULL) << (64 - shift);
> +    uint64_t mask = -1ULL << (63 - shift);
>      uint64_t sign = 1ULL << 63;
>      uint64_t match;
>      int64_t r;

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


