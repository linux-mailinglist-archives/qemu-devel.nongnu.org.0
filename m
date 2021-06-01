Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3512B397BBC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:29:17 +0200 (CEST)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loBwq-0005LS-Ac
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loBvb-0003uX-G5
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:27:59 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loBvZ-00087s-Ge
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:27:59 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e22so424414pgv.10
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 14:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BGPmDudkffuYUDOL4SyCxgs+8NBMeyrlFtr/XnTI8wc=;
 b=IjZWjlxoL/wTHfDpRp8YI+uBO3c4LsoCXEpYmCn2jVpN5YnROHwgiQOG/zAVgA77pm
 A+393qKmDQ5tBGKss/BP30st52mrra8WoDNEpDS2SmZaeVy6J2OedU9TutY2HMwz6XG3
 3PxXvACTdxvcRXnV6yUmkfbQFWlLVxQYZ1stTW4nwDiRXvFc3s5qEEhWEZscwKjqFIkl
 f3OeT0/548TxzKocyVp0LgQMidyFlNQMrDdiFf9ZkMouPjJTwRFVIMWd+B1IopFcQ68q
 j28kc1LYgkL4RLVUFiAOcSIRioKiol4M4D5Yh1zUFkL1CzpHoq73rsHYCQJVAWZ0MuiC
 ci0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BGPmDudkffuYUDOL4SyCxgs+8NBMeyrlFtr/XnTI8wc=;
 b=Efa1B7hl5N+NQTgxzFsLx37Sm09kh4d4EFeyfXyiT7jvv7KC4TSlPT/un9FHN/a11e
 hWzBCYS0V0xflm8rJis2MTpIpkCU0fBpiqxTBAIMqMs/+qj2wmrS5fKJGqq83FndqS6u
 SYpJ0nZHFn6I7WgA6BkR9HiJZDDKpzs6V4Ao4jDJevPDbSxr4njkg5fQ7cql04/Cy1M5
 XZAMrFvVRS6H7Jvzfdf8RWGV8w16BpfZHUXgP0N02V4PPdjUilujg69StYiEvCjHzicl
 FdDjvT0GdFT9uttfDouhlFB2cQ0SKgeq7ixo6g9XU9OhdG6GBWGJfSfzUTqxEg9egyJe
 f5Ow==
X-Gm-Message-State: AOAM530j92F7cBM74WdHPuna+/b9hl6s7VVwVntC+3I2PlrnZdzGgEln
 BANEeoYx2dzlH4nkj4yVn+6kYQ==
X-Google-Smtp-Source: ABdhPJzFC7z7b8jKsDyoBf+FvQ90VWgwkBYJm2PE7QjOUd82r3C4U3Fv6A3eu4o/08pLMs93dRN/aQ==
X-Received: by 2002:aa7:8159:0:b029:2c5:dfd8:3ac4 with SMTP id
 d25-20020aa781590000b02902c5dfd83ac4mr23698870pfn.16.1622582876118; 
 Tue, 01 Jun 2021 14:27:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u190sm14042608pfb.151.2021.06.01.14.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 14:27:55 -0700 (PDT)
Subject: Re: [PATCH v2 02/26] s390x/tcg: Fix instruction name for VECTOR FP
 LOAD (LENGTHENED|ROUNDED)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-3-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44c1e4a8-30a7-6edc-8e5e-893c42e1c1c2@linaro.org>
Date: Tue, 1 Jun 2021 14:27:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> Let's use the correct name.
> 
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/insn-data.def | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

