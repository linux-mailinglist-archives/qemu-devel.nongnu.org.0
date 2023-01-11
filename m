Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F066658DF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 11:21:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFYEB-0006Cl-Ss; Wed, 11 Jan 2023 05:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFYE9-0006CC-DY
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pFYE5-0005Ab-Dq
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 05:20:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673432456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHsHmXsJbbvr8eNp9f8QpfkGa2TjrEOCood0DrCQkc4=;
 b=QMQsIjmPtLlqN6ld2DUDv6gxWMMFCl6OjzNjRO5/8EcEb30edRVu1lUIuoWMWGKM62+uGI
 Pv2f+p+Qc2RXkF8wXpAn8BnfMqn9yvtNNb2HvzbZa2ceN4aw6V3eatlAtnrDwFisu4JYK/
 Ef+DfDUVf69MbdZFzsn5PmW8hnlI36Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-cEYK1iM-N26GElrvukf_Lg-1; Wed, 11 Jan 2023 05:20:55 -0500
X-MC-Unique: cEYK1iM-N26GElrvukf_Lg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so10491143wmq.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 02:20:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aHsHmXsJbbvr8eNp9f8QpfkGa2TjrEOCood0DrCQkc4=;
 b=ZPxWvlWfDx0Lnt5sKNvyQ5fKoa1oazsE3Wg7XfBAwPrpUtS6NsRfSXcBDoD/sNSAKw
 c/2vS1s3aARb0FyZ87yLa+DGehxELY6j/9IPWFjbXXpFb+9OjNdnTqpAsijjVK4byEIQ
 MmB4yVHxe3UhgoRHhtxCNutlCd9rw4UD4wrb7EXDfUfSfRx7wVUEe3JJSQ5fpA+2W0Cs
 fw0RZN857pzareP1625Ry6cuwRjJw+h+eTGM+saone+P0nfdcAbkhPBwtjlLo/DSFJYG
 8HwNIjBbaOEPjM3kfIXywUu9zG0IhhdmGT/tBCbDu9JZOPY4aH4t0oJZ5IogGsYAuH+z
 yo7w==
X-Gm-Message-State: AFqh2kpLlrQe7hmIB58f4Z56MJDX5AXoSZnEkG05em2V6jyVDWbGCJ69
 VlQUswCejG6bgz2PoSogAv9yyyWwcIgG8hXHu6pxONqdCh+YdAxf+kD0DoxYcEFat6CBl76ySTN
 qp5dhtUDjhaGdAzc=
X-Received: by 2002:a1c:4b03:0:b0:3d9:103d:9081 with SMTP id
 y3-20020a1c4b03000000b003d9103d9081mr51943313wma.28.1673432454310; 
 Wed, 11 Jan 2023 02:20:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsS/lYBqopt6fK8s6ABoj6FumTjhgMpuMxcX/wsZIfmSWW1fJH0IZwqW0gJwPMzdVlc8cSHZA==
X-Received: by 2002:a1c:4b03:0:b0:3d9:103d:9081 with SMTP id
 y3-20020a1c4b03000000b003d9103d9081mr51943301wma.28.1673432454022; 
 Wed, 11 Jan 2023 02:20:54 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:5b00:5b3c:db46:8eb5:ee24?
 (p200300cbc7045b005b3cdb468eb5ee24.dip0.t-ipconnect.de.
 [2003:cb:c704:5b00:5b3c:db46:8eb5:ee24])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c00d000b003cf4eac8e80sm21503995wmm.23.2023.01.11.02.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 02:20:53 -0800 (PST)
Message-ID: <ad87b144-4fc1-f138-24c7-e376d55293d7@redhat.com>
Date: Wed, 11 Jan 2023 11:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 6/7] target/s390x: Inline do_access_{get,set}_byte
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
 <20230109201856.3916639-7-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230109201856.3916639-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09.01.23 21:18, Richard Henderson wrote:
> Inline into the parent functions with a simple test
> to select the page, and a new define to remove ifdefs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


