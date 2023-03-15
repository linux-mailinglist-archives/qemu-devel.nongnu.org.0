Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80B6BAB50
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 09:58:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcMx4-0004Mo-Su; Wed, 15 Mar 2023 04:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcMwq-0004B0-VP
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcMwi-00078h-FH
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 04:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678870637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Ky3769EJIqVfNmtTxqXlTAey1UCzPS1PW0IUZIhRug=;
 b=bkDgzXmy4mnxvCG8FoB5loKRfkcVtnFvjndC+hTVNiCU4bWbWhtehY1UKsV6jggoGy9ngN
 9HlJkJNKSYPlFy4wrIEmzSR/MuddsII/YSiwx/1DbDc0Hlsp6coqf9HV16sKwY6qFLjC+E
 SIM30LkRBzRbf1slqFLujxG++pJy/oI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-lwlwi1FLMCS6OySK9mrOmg-1; Wed, 15 Mar 2023 04:57:16 -0400
X-MC-Unique: lwlwi1FLMCS6OySK9mrOmg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j36-20020a05600c1c2400b003ed245a452fso3085402wms.3
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 01:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678870635;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Ky3769EJIqVfNmtTxqXlTAey1UCzPS1PW0IUZIhRug=;
 b=0iZBLrykEymBqvAFcMdh1el/g/yJeS9jIWC0RpKGvdM/xbqId++Iymk9YCAJXZ3kEk
 1bgCb6quPPYDDOqqV11MDj2rjBsciyDI+9hkeMQxenf6TqhplDgiKdPpv6fL4XWX75bk
 s3j3izGmjyI7Dv+r2eaofW0fuNENsDj2j8nHLmlhZ/e5K+JWksKpbM8c4xBvwNTb6hQc
 FeHv6uzwCBcbs16QPoDdzHBIXUO7AQDljou3OFH6EKjCv/OTDMy8xy1kenFpkaJGUacL
 yFtwhPpuRYaT802K5fh8sN5hDaWZ5VXEqPwJBUzn6Ztf9oJkBs+oY4TcM1LKL/hijH4T
 tqsQ==
X-Gm-Message-State: AO0yUKUtZU4/aFuf6Yj7y7xKew1BNUlsGJighKqQIpH15r5PHHnGQb8R
 R/MAygHKGGkKyYEJVyBK8v6XJ9LZ2mtx21MRxRlTi/ExbuAbV033yr+9Ly6xHK9q38g+QZ09ku8
 AcuKZlfM+J05tDfxrJwhQozU=
X-Received: by 2002:a5d:4dd1:0:b0:2c5:594b:10d6 with SMTP id
 f17-20020a5d4dd1000000b002c5594b10d6mr1243043wru.29.1678870635278; 
 Wed, 15 Mar 2023 01:57:15 -0700 (PDT)
X-Google-Smtp-Source: AK7set88qdio4JNRjUPoc2NB9MlX1K/aL9uxeIDKAcqOph0xt4ue2I/RoE6H7hmZRufQZ4tXs2Z79w==
X-Received: by 2002:a5d:4dd1:0:b0:2c5:594b:10d6 with SMTP id
 f17-20020a5d4dd1000000b002c5594b10d6mr1243030wru.29.1678870635011; 
 Wed, 15 Mar 2023 01:57:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:2f00:2038:213d:e59f:7d44?
 (p200300cbc7022f002038213de59f7d44.dip0.t-ipconnect.de.
 [2003:cb:c702:2f00:2038:213d:e59f:7d44])
 by smtp.gmail.com with ESMTPSA id
 z4-20020adff744000000b002c55de1c72bsm4096682wrp.62.2023.03.15.01.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 01:57:14 -0700 (PDT)
Message-ID: <10ae5ab1-4963-fa99-40a6-1a146a670071@redhat.com>
Date: Wed, 15 Mar 2023 09:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] target/s390x: Implement Early Exception Recognition
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230315020408.384766-1-iii@linux.ibm.com>
 <20230315020408.384766-3-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230315020408.384766-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15.03.23 03:04, Ilya Leoshkevich wrote:
> Generate a specification exception if a reserved bit is set in the PSW
> mask or if the PSW address is out of bounds dictated by the addressing
> mode.
> 
> Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Make sure to not drop Acks/Rbs.

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


