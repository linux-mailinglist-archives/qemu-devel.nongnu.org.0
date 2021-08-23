Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF93F4FD4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:49:39 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIE4n-00047h-M6
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIE0m-00008x-1P
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:45:28 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIE0h-0006gU-01
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:45:26 -0400
Received: by mail-pl1-x630.google.com with SMTP id o10so10664418plg.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GTgUpb7apRaTwIjaie1ZD4pBiMyhG4QD4dmR0+dcu2g=;
 b=V6d01Ia8K6e2HhY7eOMlNArExObvc6wG64sizxYlLZgu70Yi4wikQqOnhRfnqLcRZu
 z0LI0tUtIEi9gn5L5a7QBEOeauHpFAiZmXIulTJ3RazvXetpFpCGNl8ziXEk8oY/SeBn
 RzKtkAq12VfJENFA92SqPWWILB313vvkl9Pn4MoY8llcYBP5ZrOFhA2341HXLFhJtz8i
 OeNQXWaioOBRA4QASJGsidGt8wOgD5W5iZAzEmF6EI4KaOYZII21sNWZMMx61aq5t457
 Gv8oTk71CME2iHqsE3DXl6OhEzf5nM9SKR3g2nI91AirC1vTskOZSaEfZHToscRrY7JM
 KjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GTgUpb7apRaTwIjaie1ZD4pBiMyhG4QD4dmR0+dcu2g=;
 b=shGQ0pA9PBoKy2/wNRj8ULvMBYGVnj1acn3Sy30DY59n/l7+jEGW2tncrlrRNKWum+
 PJs61zRy29NY2mBwvNTsCpD6WSeqp3ncuE7oFvpKlQQtpDvNUL5iX3cdBicB+84UbYLj
 dN+YEBLwQiZD2IxvC4KC/m73Qew+E5NVq4QSqsWiSQir+5bLhzpV4Jl7IR/jOc5bvs10
 vEChVaC0l6hYhdbFbxqBK6mSkUeKY2plO4xFU1gGG+LmEexgMsOPdRric0+4SFN67EAR
 GMhOCSe4k8ZuuwTB9AAyyT6qGHZJvBqxgLvVHzPGzx21fC9p39rVbryv6L8oHzLmJ8Ee
 mKvQ==
X-Gm-Message-State: AOAM533jG30JxvXRG90TFuM9vvfGfi2+S1/75QH9sLB2xGE4rA/DxliQ
 QkbG3RvSso6cbVJi42QW7cINcg==
X-Google-Smtp-Source: ABdhPJzIEIfjXgEeJpVFmjkp5byVfErapxEKte7f5GRvrdqvkvJI39DdA+OFuM/KEcQzRYhRrGzXhQ==
X-Received: by 2002:a17:90a:b016:: with SMTP id
 x22mr10247921pjq.205.1629740714742; 
 Mon, 23 Aug 2021 10:45:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v23sm4280276pff.155.2021.08.23.10.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:45:14 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] target/arm/kvm64: Ensure sve vls map is completely
 clear
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-3-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc71bb26-a18c-a2e8-d1f8-21bb93e59c53@linaro.org>
Date: Mon, 23 Aug 2021 10:45:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823160647.34028-3-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:06 AM, Andrew Jones wrote:
> bitmap_clear() only clears the given range. While the given
> range should be sufficient in this case we might as well be
> 100% sure all bits are zeroed by using bitmap_zero().
> 
> Signed-off-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   target/arm/kvm64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

