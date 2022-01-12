Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F0148C0DC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:18:42 +0100 (CET)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZmE-0001hq-1n
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:18:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7ZTY-0002PI-SC
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:59:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7ZTW-0006SE-77
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641977960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=op5bLuHOuPmbMEL8bw66X8I+jH+Ujbzo2APsKWIG1RI=;
 b=LVKGd5GuFDzvlERx8VtwjwwvDqxtj+/3CJe/sJ3fhYy7/W5jaan7VByB3ah+8pdlWSV5Gh
 5An8YFoAxtluo/y5085sBnkTX5MJAUj1nbg0WqoxM5+AwDFMiE3yFMk198OoqJ17V9al9r
 ZKMp9Sf7gMUJFtRtAV9xmIntuLg9Gq8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-a0SfjSpIOAmyk5aDY9S-yQ-1; Wed, 12 Jan 2022 03:59:17 -0500
X-MC-Unique: a0SfjSpIOAmyk5aDY9S-yQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y18-20020a056402271200b003fa16a5debcso1649386edd.14
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=op5bLuHOuPmbMEL8bw66X8I+jH+Ujbzo2APsKWIG1RI=;
 b=2/KcZ1Rg/HUB3pTWkXZ495q90tzhPdcT2R8O32n8n6FyjN0VHW7jmvVInK/luNl9Dk
 WBDvojMwXJOuuF861zAc76SnE0oiQpdgWysupeN2deZVZ/NCG+Qc5KGwLm5hRIVwuu6q
 rr1D9dawjZwT0QqZAjjjR/AEAdgQnKCdqoGh+lrwVmTe2DU5dBRUbllCBKrxrLB94pyK
 aJucr1+1bzPXcojqr52/SJ3HiCz5c2ihKuV319iRyZSINGvW3J0f9FEFL28xAHs77xVH
 VtQ7SnmB8u3hwzznUeAjIfVFYdEZAKRDhSBh+AhTdL7vYsRMXz6e4UQVzZi8VFwgUt4A
 aMxA==
X-Gm-Message-State: AOAM531aFaXjQOkDCmNHZN/wG4oCy3klHMes8AOs80xIU/5PVd7oA+JT
 GdifAXzONEBH/oLv83cH+7KI+l2nSAK58M90jfuQfM+g3qdzkBXS5RYbIoojRASLqAEAmVoN9bt
 bQWH5ZSAzPm4eIs4=
X-Received: by 2002:a17:907:8687:: with SMTP id
 qa7mr4908771ejc.106.1641977955854; 
 Wed, 12 Jan 2022 00:59:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywXlWmqu9V+yDGaEC6cEeH53bcvM1TuE9fiZq/uiuX+ZWV9HFwpFxwjpp2WbkuzdrXYkGbSA==
X-Received: by 2002:a17:907:8687:: with SMTP id
 qa7mr4908760ejc.106.1641977955647; 
 Wed, 12 Jan 2022 00:59:15 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id j17sm4255873ejg.164.2022.01.12.00.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:59:15 -0800 (PST)
Message-ID: <08948b31-0729-5463-829f-35fb444cf82d@redhat.com>
Date: Wed, 12 Jan 2022 09:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
 <20220112043948.224405-4-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 3/5] target/s390x: Fix cc_calc_sla_64() missing
 overflows
In-Reply-To: <20220112043948.224405-4-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.22 05:39, Ilya Leoshkevich wrote:
> An overflow occurs for SLAG when at least one shifted bit is not equal
> to sign bit. Therefore, we need to check that `shift + 1` bits are
> neither all 0s nor all 1s. The current code checks only `shift` bits,
> missing some overflows.

Right, "shifted + 1" here means, the shifted bits + the sign bit.

But doesn't the

if (src & sign) {
    match = mask;
} else {
    match = 0;
}

logic handle that?

If the sign is false, the shifted bits (mask) have to be 0.
If the sign bit is true, the shifted bits (mask) have to be set.

Do you have an example that would be broken?

> 
> Fixes: cbe24bfa91d2 ("target-s390: Convert SHIFT, ROTATE SINGLE")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/tcg/cc_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
> index c2c96c3a3c..b6acffa3e8 100644
> --- a/target/s390x/tcg/cc_helper.c
> +++ b/target/s390x/tcg/cc_helper.c
> @@ -297,7 +297,8 @@ static uint32_t cc_calc_sla_32(uint32_t src, int shift)
>  
>  static uint32_t cc_calc_sla_64(uint64_t src, int shift)
>  {
> -    uint64_t mask = ((1ULL << shift) - 1ULL) << (64 - shift);
> +    /* Do not use (1ULL << (shift + 1)): it triggers UB when shift is 63.  */
> +    uint64_t mask = ((((1ULL << shift) - 1) << 1) + 1) << (64 - (shift + 1));
>      uint64_t sign = 1ULL << 63;
>      uint64_t match;
>      int64_t r;

This looks like some black magic :)

-- 
Thanks,

David / dhildenb


