Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BDA40D453
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:13:13 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQmW9-0003El-0F
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQmVA-0002aB-8M
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:12:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQmV8-0004JO-Pt
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631779930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5hyuq75pRTeZMDEk5SXv6pKlKxZxuJUegf1yMz98oeU=;
 b=ae1u/7zkQ5MnUNeB8yosf6N8sl1qC1K0GrUFIBxIGkAY1PUUnTFSSEB6lbxNaBuwiEZ9l/
 L8Q1vu+o5JGzSBeNu0etdhkYbjx852+QmVOM/PlOpWR1nOJG0NlWIb4e4737auakBmRvpZ
 96A5KganEZV+1ZohFpGbCkDG7owfYbY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-J6VeUlozPHK6HqvmmzxQnA-1; Thu, 16 Sep 2021 04:12:09 -0400
X-MC-Unique: J6VeUlozPHK6HqvmmzxQnA-1
Received: by mail-wr1-f69.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so2109703wrn.12
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 01:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5hyuq75pRTeZMDEk5SXv6pKlKxZxuJUegf1yMz98oeU=;
 b=j1lKgBvTTLjPNFJEeT8llqoHDsodQha6mXCQf+i2CRwSLw/qgwXnfFV+5HI8t2+px1
 xu1OtC0AXir3iihcPX6yUnzCyWO8EY3qbUYSRw31+5IKwE0H7lgqRVctCa1erDn7/tjO
 Umlh8ocp7+XhBu4x6yeHaf1BmFk8ddCYFY48jJO8cN+ZPa9m+9kZ+b6/to3imkcole68
 zZtXraJsPqJ8awjWl9A/WokNXns++rMVdbt2XPW7044NyFeMOOtiSykoaFKkuWDuRW0s
 BS1FG42U133VRv4baXBQh3zUmhNBN3OZauRTpt9iY7dluTOhJl8nnxZzWPWox1c36STr
 Bzsw==
X-Gm-Message-State: AOAM530hJCHO+WPRLpT5KWtphhbcYCW/L+kEiRR9olZ0MHK7ea9mJ2Yu
 rPZ6X3TdUHa2yFFa5BwU/1oASP1Kp1og8xOB/UrtA9SbL65Saa0AWqMWB7tqpAQpRNhMxDnr0D3
 1ZLkc1eIMoWhbx6yLXFDStBYR+nkfkMaIIhaYiH0LD5ZfPdvBNnHOot0XOc4pVcU=
X-Received: by 2002:a1c:28a:: with SMTP id 132mr3739558wmc.101.1631779927866; 
 Thu, 16 Sep 2021 01:12:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmcWhublelTUFHmtyZ7mXHElUNgLRazGj8jWiyyhvW+ivrMtUziYquQk205niZ/K3H+HNEwg==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr3739540wmc.101.1631779927674; 
 Thu, 16 Sep 2021 01:12:07 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23828.dip0.t-ipconnect.de. [79.242.56.40])
 by smtp.gmail.com with ESMTPSA id
 v10sm2564503wrg.15.2021.09.16.01.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 01:12:07 -0700 (PDT)
Subject: Re: [PATCH v5 10/16] tcg/s390x: Implement andc, orc, abs, neg, not
 vector operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
 <20210915213114.1923776-11-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <26652172-04f0-fd06-2226-121dfa020681@redhat.com>
Date: Thu, 16 Sep 2021 10:12:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915213114.1923776-11-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15.09.21 23:31, Richard Henderson wrote:
> These logical and arithmetic operations are optional but trivial.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target-con-set.h |  1 +
>   tcg/s390x/tcg-target.h         | 11 ++++++-----
>   tcg/s390x/tcg-target.c.inc     | 32 ++++++++++++++++++++++++++++++++
>   3 files changed, 39 insertions(+), 5 deletions(-)
> 
Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


