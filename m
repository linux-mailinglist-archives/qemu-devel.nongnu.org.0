Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0A40BAEF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 00:07:12 +0200 (CEST)
Received: from localhost ([::1]:57324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQGa7-0000d2-HW
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 18:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQGWN-0004co-3E
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 18:03:20 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQGWJ-0003V3-Eo
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 18:03:18 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 f3-20020a17090a638300b00199097ddf1aso3425191pjj.0
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 15:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1NsAV4k6LVRqmWD15NJZLnjFDzMOB3Z55fYai7M/+jM=;
 b=fZRlLgg9ZHANB1k8HS38MRz33Xid2rJ/6UnJycEiDif+UprOpclXAsanZ4WYgSFhAM
 4sF/O0/PMvFO9bGUA35PyhBmtzNpzqzSI6d4zrzfo3+BLmSpgGwQnSOAPigpRuXNqlzB
 2cZkmKJP2toICSkZQJAhq8kwjXYBbtVeWHaW3qWJekgHEBGCZJT+Dgat6AqX2uaB1S5Q
 6sYQHYiggEmEll/u/4IZw3x5bIkxBGxxjwwuCqg2vqH6GoX6+5hMAWhl5NNVX62tWVPy
 cITnbn+g8U7Q6CAnSYUqhCqBuAmNGoD7j4pPC+Rp4/rkvMBShux9bh6QNQnbprrALMQh
 y+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1NsAV4k6LVRqmWD15NJZLnjFDzMOB3Z55fYai7M/+jM=;
 b=nc3lmplaogFUK0IyS3dcvUPmYOsLMzjQZMym/NroY2jzLuMLMlqTSwvTk1xLhkxYCP
 OmwbVt8hxFemIaPd+RsKtQFzLp9ttKzpuj5BEQ1yvVF0DTiTVykqc9h7DuxH0E1HJxIR
 MWWc6ubIZkNPGHRb6A4jGGsvEt3o5thbBgDoenQHZ/OmPkM8wH6z4N/U9yA6sDCD4spi
 Dphe5PAvwDAPvzsvfQChPPUr9KPTJCLaGdcp4Jp4TeJj/xmw7naMj0qP9cY5+y2nWvze
 nC1VTjNVUp9ZweN6E94CD5N4rKsiXKetbysCEqCi57YttajyAq8VnYb6y4dF86GMHSaa
 mKAg==
X-Gm-Message-State: AOAM5317kLqSATzGE3R3MKkmhh4KqjR1EKrITckiH7kCiiu+AYAArMl2
 S4ojZ4Fahca1PLymeFvCNKUy8jMGM7i4yA==
X-Google-Smtp-Source: ABdhPJy/gfN0B64x1GS1ZpbsR0uZt2OtebJhWh+LXJZvLH4IZWtIiVts0PbMpc/jSU9d07Dk7gqAvw==
X-Received: by 2002:a17:902:e80f:b0:13b:721d:f750 with SMTP id
 u15-20020a170902e80f00b0013b721df750mr16862025plg.18.1631656992018; 
 Tue, 14 Sep 2021 15:03:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f1sm2469502pjq.26.2021.09.14.15.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 15:03:11 -0700 (PDT)
Subject: Re: [PATCH v4 05/16] tcg/s390x: Implement tcg_out_ld/st for vector
 types
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-6-richard.henderson@linaro.org>
 <7bd6c9a6-6b0f-5a0c-f9a2-be8a37102196@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <166e6957-57a9-ea87-60d1-628fb44dfbea@linaro.org>
Date: Tue, 14 Sep 2021 15:03:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7bd6c9a6-6b0f-5a0c-f9a2-be8a37102196@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 9:46 AM, David Hildenbrand wrote:
>> +        if (likely(data < 16)) {
> 
> This actually maps to "if (likely(data <= TCG_REG_R15))", correct?

Sure.


r~

