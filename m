Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AC367C7DE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 10:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKz1K-0003IH-FR; Thu, 26 Jan 2023 04:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pKz1I-0003He-9P
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 04:58:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pKz1F-0007cZ-RB
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 04:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674727088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+eewEnyD3rV0xpD2JchVLKO3xDMPAX9gXw78K+BvboU=;
 b=E1xnbRb70vShkBGQLQag+fvHuOoq1nKdRjF5B0pP8W7Ti7+qs6ybJeGsa1D7dFzRsVby/O
 veMq3AHF4byqzUsYsV/ogaPkTryTsa/rMUgk1i10yIGT+tTfumPQztU3QUELp4Va8C1y3W
 TT4rQwqmGV4sDzUc4Qdluf3QLYFPCT8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-xIZriKmOOKGhIuUFSJb6fQ-1; Thu, 26 Jan 2023 04:58:03 -0500
X-MC-Unique: xIZriKmOOKGhIuUFSJb6fQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p1-20020a05600c1d8100b003daff82f5edso776004wms.8
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 01:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+eewEnyD3rV0xpD2JchVLKO3xDMPAX9gXw78K+BvboU=;
 b=HL2Lw/Z2sbH07yI6mXORD7Ch8PAcjr/YSXvuWvS5BrSDffCCTUUm8s7qrGW2TS+S3M
 sp7Al+hX2ZgBmxe57+uJH1YqjubzfRIqw9H3kPt65LrqjeWk9dygcMQB8jDvpZBAygHr
 5TX4qLKFd3i43tiCcRwY468pOOluh1SxJphL4dQRsho7xewFPga3Lp4sQDGm7GJ9kYdQ
 /0aAZ0Q2ShcE5hEp3wKT/21/fRAZXhdSfvFysxS/ou6dc9H+3fPRoyKQDpVtGnUNUqoM
 qBpkov3oCUwb2D/ybkudlWwRRpdHZk3WoxN0motnQIPDgeqyL11q0RD7pmvMcqnQpLDE
 oFHA==
X-Gm-Message-State: AFqh2kqKZ8nf+5gMJKQ4wMPXIE5jJyuWH5U3u4//GluCFUbAHZM744UM
 s4WrY4c8QKQ9icpe/C4fxHhQ/VPf8Usq+BwVMb2o6OKI0UiLM6AajAt/8IlTd7a8FZYSI1WTRt2
 a4pZ4pkwB7stMQv4=
X-Received: by 2002:a05:600c:5d1:b0:3d0:761b:f86 with SMTP id
 p17-20020a05600c05d100b003d0761b0f86mr35351833wmd.28.1674727082235; 
 Thu, 26 Jan 2023 01:58:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjg/iqBzvICu8gP8RAt0OXiRPcanxGZPeAZTCN7F47M9UX/WR56mWl/lQDMd0dU2/2YZjzEw==
X-Received: by 2002:a05:600c:5d1:b0:3d0:761b:f86 with SMTP id
 p17-20020a05600c05d100b003d0761b0f86mr35351818wmd.28.1674727081926; 
 Thu, 26 Jan 2023 01:58:01 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003dc0cb5e3f1sm922797wmp.46.2023.01.26.01.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 01:58:01 -0800 (PST)
Message-ID: <9bafcaaf-77b3-f2f3-801b-1d2c6e379bfb@redhat.com>
Date: Thu, 26 Jan 2023 10:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 24/36] target/s390x: Use a single return for
 helper_divs32/u32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-25-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230126043824.54819-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
> Pack the quotient and remainder into a single uint64_t.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix operand ordering; use tcg_extr32_i64.
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


