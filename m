Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085A66B9BF9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:45:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7lT-0002T3-Rw; Tue, 14 Mar 2023 12:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc7lS-0002Sg-GP
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:44:42 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc7lR-0001j6-2e
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:44:42 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-17683b570b8so17910346fac.13
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678812280;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pgTwFtWQCPyLnUrh15brmG7fGurawV7AJk64FoBd14k=;
 b=cPB+EpOxaDCO68YqgO7i9w5RfJajx1SQbYeG4Z5PHSrQW+FIT48OdbtX8n4iKAggps
 SuJ9LUI46XTKuNpbcB9K1Q83eRDjEVcsoQQp6b9kZB9tvhSx6MUBa2dinBYs9tzyWY21
 hbM70ZUzt/RCe89zKJCSj8IMyL5hLEeBzjs7E+P9oyDqqKhRGss2uHktccAo9DA3GRrI
 hy8mZ+cd3FPlKNAcV+eyohdW91eIj96twr1DxrSkn4DoR+fVlweojy0rJyzheD21Udok
 +qlT59rAqD38VL8CmIuPbb3prdvxNFyQ7QbcsHzri9CBSK9rp7niAsBglZ/p/xWJTOcw
 omgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812280;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pgTwFtWQCPyLnUrh15brmG7fGurawV7AJk64FoBd14k=;
 b=BzH8usuC7wT53KOZyvUFt4zNpxKi2Z92SnNUnQc1/vRBUjdvbo36cZe+UCkuDeFPlW
 x9WHJlr65juQbNG9tjamTqGB5GI66KL6AB1iDULKXl5dLFf0IOM/TfpbKVfQhQqhOusB
 o/W+09+WT0Iz93TFnNfCGWDeMi6ZNwtnUSltoTOkYN5VrZziNmnxBUkay6Zj0BDfGfBR
 pVhVonisBK4FqrbjETSltX4j0IeAGlqDZVhqQAuZc0jJYIxPGu4gCRslqIIsoZ+vY7c0
 fjiILrKPfaMN/lpQL8KvX/6v1vKOqLEVk9Flf8oa3oh8Gbzgeq6+tXlKIfhaltGBXMmS
 on7w==
X-Gm-Message-State: AO0yUKUTTgsoo0AXNiXIjXmmNBhgpzEY/HT+UBr3VKwc22pv/wfxXKuh
 wtILQKvQXc7WkXzXfvfFkCvh3A==
X-Google-Smtp-Source: AK7set/VlXfbrmPWDbl2Y1JpseRstMxoLF/rBOKQp+j6zmEhSt/kykldPkMwiPgqhVf/dfWnimYdqg==
X-Received: by 2002:a05:6871:1c4:b0:172:c578:d798 with SMTP id
 q4-20020a05687101c400b00172c578d798mr7726013oad.25.1678812279871; 
 Tue, 14 Mar 2023 09:44:39 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a9d4b19000000b0068bcd200247sm1078874otf.75.2023.03.14.09.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 09:44:39 -0700 (PDT)
Message-ID: <1249fe9d-488e-3d07-0cbc-eee61ab28184@linaro.org>
Date: Tue, 14 Mar 2023 09:44:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] tests/tcg/s390x: Add early-exception-recognition.S
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230314110022.184717-1-iii@linux.ibm.com>
 <20230314110022.184717-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230314110022.184717-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/14/23 04:00, Ilya Leoshkevich wrote:
> Add a small test that checks whether early exceptions are recognized
> and whether the correct ILC and old PSW are stored when they happen.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.softmmu-target       |  1 +
>   tests/tcg/s390x/early-exception-recognition.S | 38 +++++++++++++++++++
>   2 files changed, 39 insertions(+)
>   create mode 100644 tests/tcg/s390x/early-exception-recognition.S

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

