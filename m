Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2F67C9B3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:21:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0IT-0001sY-Sk; Thu, 26 Jan 2023 06:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pL0IO-0001ro-E7
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:19:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pL0IM-0001Tr-FP
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674731993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+bUcx4JvVlcojMTU4qbgiVnu0os2eVsbXMEmvkomEI=;
 b=V5u78ZvRRo2B+r3SUzuTcNGZQ7Ktjn0RTYYa/jCQY1m+jB9pOMbYnQb/rXdvEjpiY28ZcC
 lWiXgVIPHbqOAeLESL3rA5/nmhQ8jLxNvvSDOChvR7k9c2t9RafHo+AGXj9XAsuvz/jPVi
 IJQWHrQkGxBl9dq6SDsJTACxC/D3hpw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-597-S59k_IHnNSWnJ_CBVE_wvQ-1; Thu, 26 Jan 2023 06:19:51 -0500
X-MC-Unique: S59k_IHnNSWnJ_CBVE_wvQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 u12-20020a05600c210c00b003da1c092b83so351857wml.7
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f+bUcx4JvVlcojMTU4qbgiVnu0os2eVsbXMEmvkomEI=;
 b=5jzIm/+9eRkJmB66VOD4OudjH/9N89t+8goPPGdyYcHlxXgIHjHkHMOO7h7H4/SUN/
 HQPV74GHAEGTmQnaV4CgZozJoMmyAvdq0UCeFuc0gpiVsvi2vntHhgqn8OGumPAawTFp
 MyLP74T32jS1bihGT4OnB4gh8OWww+NdTOXQLKmldFhrzP/9vsrYC/bjf/PLzABlPhQd
 EEGFAa738qlncdlqQbdF593WfZ4pK4mACopZ/BNrsi6IH585Mb09llZDBmnnoN6tbihR
 rQGuW3iosWtikwhtHldm4pF5aqf9Vihs1kJig82EYKaekVCo3ll4B5evwCzZ3Mfkirqt
 bBtg==
X-Gm-Message-State: AO0yUKVNIcc6J/hAh9t7/1dg0weJXcfwTeqlAfWY38Lh5lpgHy/WOPbp
 a23GUwk4UZxFZXi92A/Xs3P3oGthIDEVdXjtpfnHOakcFemd/lqhBGKHZMouUQv8i4KZ1kVjxB5
 TirAVYJEvC2tNSuY=
X-Received: by 2002:adf:f3c3:0:b0:2bf:bc0a:361d with SMTP id
 g3-20020adff3c3000000b002bfbc0a361dmr4965180wrp.31.1674731990563; 
 Thu, 26 Jan 2023 03:19:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9Eov8eXrp05SNHXI1Wp/nsbzzT4q85QyaThdczO5MFS8acQd38uY99SIp3BgcehSJrMybhYQ==
X-Received: by 2002:adf:f3c3:0:b0:2bf:bc0a:361d with SMTP id
 g3-20020adff3c3000000b002bfbc0a361dmr4965158wrp.31.1674731990221; 
 Thu, 26 Jan 2023 03:19:50 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 y2-20020adfc7c2000000b002be07cbefb2sm1425379wrg.18.2023.01.26.03.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 03:19:49 -0800 (PST)
Message-ID: <40475792-defe-ec82-1a0d-e43b518e7f4e@redhat.com>
Date: Thu, 26 Jan 2023 12:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 31/36] target/s390x: Use Int128 for passing float128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-32-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230126043824.54819-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 26.01.23 05:38, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix SPEC_in1_x1.
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


