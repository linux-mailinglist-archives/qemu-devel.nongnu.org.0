Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FCC4EC623
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 16:06:26 +0200 (CEST)
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZYxt-0007zB-Oe
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 10:06:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZYw0-00059w-5K
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:04:29 -0400
Received: from [2607:f8b0:4864:20::32c] (port=35652
 helo=mail-ot1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZYvy-0001Wr-1O
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:04:27 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 d15-20020a9d72cf000000b005cda54187c3so14981680otk.2
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e1rOuJVVxPV1xsJP6tOlkg+1DL2G069oIcIxtlQ3PHU=;
 b=tqCOximwiinJjntqIqknav1zQnutoS4B2C1MHJfZFD2ZMtCNSG6RgV771N71hFnvZi
 qjRS/LKpoJ3l97mf5GRsT043/kSCabdGaCIIZrYKUD8F/cIIGxvPrWamehn9633rXF29
 B/f74M1ZfUx+aeoTvslfnXLJLnlEDqwnIAB8hvRzFS46cW9oP8z5QllAO3c3Lp+fROTS
 9lzzwsJzWMsTCql6hBeaus0kQwrclNLxzXVK4+a+w/pezHXF3kQ9PshEQMyGL+fcc9xW
 lgBLzrM9CdZAbuyH0c/OsgfGJDUiI4az0az0qx2hEzPwLViJiOKw0lnQjwr8YJw25og+
 60HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e1rOuJVVxPV1xsJP6tOlkg+1DL2G069oIcIxtlQ3PHU=;
 b=uq5rL0B5Ue685K7smuBUSY3Q13DCjGV8Fuj7ZdIjI0DzwS13ktnheZoTec5X0jCRR3
 7KmMyH9qdnGGOH1ANv5YdoAnoan+gQs6L8zJwFhFy4jqZ+ikGIb11sKFb2svfK17MJNH
 c0uFx0tfTDYIFvb0CLiRznu2u53Imo7UE9G7pSJLsgMaqNohDCS82eZRhwYpg9vOQdcy
 Gux7gGsqZ9jgZeMgmw77HVqW8T3pXZzicn0FbVhV0hrLLFYzPv+cE9LnOSnSWT14Ej2F
 IJxTQd7myyxmpRkdPgFGxQChiBtwl4JUc1+6Phc0bZclcJ8E92T6E5joVLm/DKkIJLgK
 yk6Q==
X-Gm-Message-State: AOAM531gwC4pU+MI3Fy9LIZAZ8R7a1l96D/cOdJ3jd0Z1JIqhHA/kLWP
 EZ5z+u52SVbPQtsmN6+QZJv9Bg==
X-Google-Smtp-Source: ABdhPJwoU5VZyLqH0APHNJARrhT3845Mh+ulJOwbb3hP8UuBzERtgvh00QI0wGLXZJJRyIfLSKi4Ng==
X-Received: by 2002:a05:6830:2099:b0:5c9:4715:2c80 with SMTP id
 y25-20020a056830209900b005c947152c80mr3281865otq.244.1648649064373; 
 Wed, 30 Mar 2022 07:04:24 -0700 (PDT)
Received: from [192.168.249.227] (172.189-204-159.bestelclientes.com.mx.
 [189.204.159.172]) by smtp.gmail.com with ESMTPSA id
 r6-20020a0568301ac600b005cdbc6e62a9sm9171257otc.39.2022.03.30.07.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 07:04:23 -0700 (PDT)
Message-ID: <a59957f4-ad6f-609e-eb29-e14f16694fbc@linaro.org>
Date: Wed, 30 Mar 2022 08:04:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] target/s390x: Fix determination of overflow condition
 code after subtraction
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20220323162621.139313-1-thuth@redhat.com>
 <20220323162621.139313-3-thuth@redhat.com>
 <c12a3830-053e-11b7-9e6c-325a7d03df5f@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c12a3830-053e-11b7-9e6c-325a7d03df5f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Bruno Haible <bruno@clisp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 02:57, David Hildenbrand wrote:
>> diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
>> index e11cdb745d..b2e8d3d9f5 100644
>> --- a/target/s390x/tcg/cc_helper.c
>> +++ b/target/s390x/tcg/cc_helper.c
>> @@ -151,7 +151,7 @@ static uint32_t cc_calc_add_64(int64_t a1, int64_t a2, int64_t ar)
>>   
>>   static uint32_t cc_calc_sub_64(int64_t a1, int64_t a2, int64_t ar)
>>   {
>> -    if ((a1 > 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
>> +    if ((a1 >= 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
>>           return 3; /* overflow */
>>       } else {
>>           if (ar < 0) {
>> @@ -211,7 +211,7 @@ static uint32_t cc_calc_add_32(int32_t a1, int32_t a2, int32_t ar)
>>   
>>   static uint32_t cc_calc_sub_32(int32_t a1, int32_t a2, int32_t ar)
>>   {
>> -    if ((a1 > 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
>> +    if ((a1 >= 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
>>           return 3; /* overflow */
>>       } else {
>>           if (ar < 0) {
> 
> Again, intuitively I'd check for
> 
> a) Subtracting a negative number from a positive one -> Adding two
> positive numbers should result in the result being bigger than the first
> parameter.
> 
> a1 > 0 && a2 < 0 && ar < a1
> 
> a) Subtracting a positive number from a negative one -> Adding two
> negative numbers should result in something that's smaller than the
> first parameter
> 
> a1 < 0 && a2 > 0 && ar > a1
> 
> 
> But maybe I am missing something :)

Again, see ssub64_overflow in qemu/host-utils.h.


r~

