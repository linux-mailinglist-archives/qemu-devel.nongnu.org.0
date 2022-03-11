Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C914D68D3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 19:57:34 +0100 (CET)
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSkSD-0003Cv-KT
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 13:57:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nSkQU-0001kK-MS
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 13:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nSkQS-0000cC-AD
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 13:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647024943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5mhgi0HegsRuGXrsc2IF1bav80TQwc6b1z1X8mZrCQ=;
 b=YAQqn4L3SIie0l6Gg8qOoM23viu6VMJGTGYX2IgrZxHW/XAIWq3YeHOCzMDezhozeYmdTn
 xZxq7anRd/S73t12pZ0wQzONsFapoU9+06ae1thcZsFcP8s2VaZf0pItRo9oBNevNhxYfF
 t1ZMPbr6inc0qs+DMavLVaK5qVsDAb0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-Mm2eyMTvNJS4bKwT1NBSoQ-1; Fri, 11 Mar 2022 13:55:42 -0500
X-MC-Unique: Mm2eyMTvNJS4bKwT1NBSoQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 20-20020a05600c231400b00389886f6b23so3767092wmo.6
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 10:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=P5mhgi0HegsRuGXrsc2IF1bav80TQwc6b1z1X8mZrCQ=;
 b=bzojwH+r5eT2o7wZOxP/nldbjBi6mp9IGeXlgfTDEk5n+wn3hMYhPus9ozLoWzV+KZ
 Z8mZ9JIZi0JULmmOB6ZASUchNYRvAn4jR97Sdvjbrm8yDZCWt3BBA+YXakSRgv0xgbMp
 Ri5aR1ttUrGTnqM5QUgeAjE7t6pNET8HimIqZ59246X+q7CTNNRN3DeO2ZzHHchYFQ00
 Rc5r7ZJhoWknMx/Y8agNNcE5C8aPTVaIGhCqMBpRHOqr1nVmY1tIIXgc0zA2WigKS9Nv
 SqzVbuOqT5xayOv+ADeu5IDUMFC2iv7dbu3YxuxWBLNdk2HgKAFmE2qYx3CPJ6txOHZQ
 ZckA==
X-Gm-Message-State: AOAM5310eZVEk8KIGT0m80VDS5vP0Mc9Fo+RT92hXi0UHdG1fCjRptCI
 1N1eohv9PNkg34tBBzhPonhP2pxXxFs47gmhWBDrt77T1GVCqMhV+flcik4JwWpl4JsWC2Mlw3a
 stKe3+FOtylpSO+8=
X-Received: by 2002:a05:600c:1c9f:b0:389:cf43:da64 with SMTP id
 k31-20020a05600c1c9f00b00389cf43da64mr12487245wms.206.1647024941440; 
 Fri, 11 Mar 2022 10:55:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYiLrmXJDhGDpp67bEzJR4UNaWX4qU8q8nu9N/J7C/eKLay1u+V774TSx3Zh9sYCKLWbxlDQ==
X-Received: by 2002:a05:600c:1c9f:b0:389:cf43:da64 with SMTP id
 k31-20020a05600c1c9f00b00389cf43da64mr12487230wms.206.1647024941207; 
 Fri, 11 Mar 2022 10:55:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:8200:163d:7a08:6e61:87a5?
 (p200300cbc7078200163d7a086e6187a5.dip0.t-ipconnect.de.
 [2003:cb:c707:8200:163d:7a08:6e61:87a5])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfd18e000000b0020373e5319asm7848542wrc.103.2022.03.11.10.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 10:55:40 -0800 (PST)
Message-ID: <add09a29-594c-d5c3-bd8a-9fb924353dee@redhat.com>
Date: Fri, 11 Mar 2022 19:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/3] s390x/tcg: Fix BRCL with a large negative offset
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220311184911.557245-1-iii@linux.ibm.com>
 <20220311184911.557245-3-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220311184911.557245-3-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11.03.22 19:49, Ilya Leoshkevich wrote:
> When RI2 is 0x80000000, qemu enters an infinite loop instead of jumping
> backwards. Fix by adding a missing cast, like in in2_ri2().
> 
> Fixes: 7233f2ed1717 ("target-s390: Convert BRANCH ON CONDITION")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 41c8696185..5acfc0ff9b 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -1201,7 +1201,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
>                                   bool is_imm, int imm, TCGv_i64 cdest)
>  {
>      DisasJumpType ret;
> -    uint64_t dest = s->base.pc_next + 2 * imm;
> +    uint64_t dest = s->base.pc_next + (int64_t)imm * 2;
>      TCGLabel *lab;
>  
>      /* Take care of the special cases first.  */

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


