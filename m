Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8296F52E2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:14:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu7cH-0005pB-B6; Wed, 03 May 2023 04:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pu7cF-0005oI-L5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pu7cE-0005A1-78
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:13:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683101613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJ0xGj5YaAajFMRqSopJn8BQmBE9dW6WSLkFbMwXhTk=;
 b=LluNnq84mR5MCn4flkR+AjutEnkez0uW2lOQcM1LHtm2CI4kh62AbTtpiyQ7uzuwXM1hbs
 hixi9C5HNamfAlEkQNaE9RrEfhKRrbD6oW9gLkVAh6WZn+yMeahusggfowvnT3vsxmzH6H
 G3p/425esQEYqDBgfRwRMdmyLH9o+d8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534--iD2P37MOSmka8yCtg12kg-1; Wed, 03 May 2023 04:13:26 -0400
X-MC-Unique: -iD2P37MOSmka8yCtg12kg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f187a7a626so14753465e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683101605; x=1685693605;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HJ0xGj5YaAajFMRqSopJn8BQmBE9dW6WSLkFbMwXhTk=;
 b=Be0kmI1j4GbyCR3tevoJPEi597qMIeHUZPp6l86mLypaWBrI6ZkjEDbfAWho+sEDfJ
 qzDK8QsmfjaPhMv7Oen7YFb5j3y0kIBcGm0zGSZYQKK6Pug7pOzD6grtgY1VR1F47znK
 CZz/S0eC6KxMJ1wzc9Oq90PDUODSBLI0hTtG6RoRvbsDM///nvvf1brFjjHoBqX2wQC5
 dv4j+cVMMf+JRv2K4N5ZBGAazyZmU+MoGHFr23LMtjtv/Y711PwckFWrjoMSBqxW87We
 FijgjfifmaWj06Z6V10k6p7CO/C3E5p714eKJN7tbJANKieFG8H4fiYDUQBRW44j5rDI
 Iewg==
X-Gm-Message-State: AC+VfDz8N1JFd2/ZipL3CLMkzNWZe9XRbraScunM9DCXP/vwwUi75/kz
 6/NqTXm2NwSSESEtbcCZwRb5OixHI+V7xpneoLMT+7AEQ7vkJD8FgL0WE+EksnodRaPlEkMTsGJ
 ozlBgnmFA763v1Jo=
X-Received: by 2002:a05:600c:b43:b0:3f1:6f3a:fcbc with SMTP id
 k3-20020a05600c0b4300b003f16f3afcbcmr14310633wmr.16.1683101605470; 
 Wed, 03 May 2023 01:13:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Ifuja0KbuhqOXSq/i+QE+LbTRsC5n1m2v9alHC0dOR9mP7LBwTvRLxbj81jkgKo4GLWBX3Q==
X-Received: by 2002:a05:600c:b43:b0:3f1:6f3a:fcbc with SMTP id
 k3-20020a05600c0b4300b003f16f3afcbcmr14310614wmr.16.1683101605129; 
 Wed, 03 May 2023 01:13:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:6a00:9109:6424:1804:a441?
 (p200300cbc7116a00910964241804a441.dip0.t-ipconnect.de.
 [2003:cb:c711:6a00:9109:6424:1804:a441])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003f07ef4e3e0sm53017519wmq.0.2023.05.03.01.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 01:13:24 -0700 (PDT)
Message-ID: <d06aac75-528f-82f5-5567-a8e5f5745ddd@redhat.com>
Date: Wed, 3 May 2023 10:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/9] target/s390x: Finish conversion to
 tcg_gen_qemu_{ld,st}_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, iii@linux.ibm.com, thuth@redhat.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com, jcmvbkbc@gmail.com
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-7-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230502135741.1158035-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 02.05.23 15:57, Richard Henderson wrote:
> Convert away from the old interface with the implicit
> MemOp argument.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


