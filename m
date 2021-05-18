Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A418387652
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:20:36 +0200 (CEST)
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwq3-0004UY-5Q
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwSm-0006BL-MJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwSk-0000bF-9V
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FScbVnpq2IoUV6DlR+Xov3djhEV2cU6aF5agIjHCaM=;
 b=KJHXG+ehD9T63A6lFBjQZqp49ZtiJf1wYDSbxfFiuHnF4PDE4zBiwIkkG3KqmDDq7/zHs9
 Mwcysk20vJwsXSxCwL8NzLp00Puw5G8R5zeuAO6rCEISpG9Bis4OKlnqcX7RRD6YfG5soE
 mFPjakSxO++D/XRp5NvLBnyuF3lnrN8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-aYzdYmazP8iFrC1YF_h-7w-1; Tue, 18 May 2021 05:56:28 -0400
X-MC-Unique: aYzdYmazP8iFrC1YF_h-7w-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so5294904wrm.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6FScbVnpq2IoUV6DlR+Xov3djhEV2cU6aF5agIjHCaM=;
 b=FL9NW7TmxLoGZmhSJY+cW+X7dxTtFwZIYrz4GytjP1TF3czaAxzAylKpVahsZ+/Pv2
 2T9+ijYy9hRTs9jxCjQzhMx1Va1IaChax8k4qfCAr6Kzkmx3BeKKckqc7LA6t95VtrlJ
 cyAsUWMPrCZ29fpSniC/0/Bc1Q13U2XZ2T7kJIMcsiLLqn0pdMh8BvJgP97PlaUkpWeZ
 hbdGjVyIjEbADHZeX7G1v3WHMN0aZL1lu6jPMdkllsnNHNmn0iqsnLuCZKz3GLLmls4/
 hzmfQTWdFaLaRKACehfaAfZ4wJF9rnnD9undnBOe8f66ZWZxWhN8ZVK814sJNFOQgH9u
 TsiQ==
X-Gm-Message-State: AOAM532zlU2F0ca9ysOQS/Dh3V4ugh0hVhnTlx7R9ohBMkuZlCd8h2Im
 XgfeNN+a7zsLARtZdkyGHlZpe3yxMI8p4y/uv9U/uZIsjvCYS/AGd8552ZIRSnCuaQcxRUrlPQd
 JPrBQp7RrqPDyV1I=
X-Received: by 2002:a1c:1dcf:: with SMTP id d198mr2691373wmd.40.1621331786844; 
 Tue, 18 May 2021 02:56:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP3ITWsazOAlv7taH8JN20oiUarLgMgYVEXTWVTuhqI1zSmhW/0BHh5QyyTjUS98bJfeZBfA==
X-Received: by 2002:a1c:1dcf:: with SMTP id d198mr2691354wmd.40.1621331786690; 
 Tue, 18 May 2021 02:56:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c12sm639491wrr.90.2021.05.18.02.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:56:26 -0700 (PDT)
Subject: Re: [PATCH v2 35/50] target/i386: Simplify gen_debug usage
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-36-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <321fa7b4-feb6-6e3c-4e49-3e2aca5d75ff@redhat.com>
Date: Tue, 18 May 2021 11:56:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-36-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Both invocations pass the start of the current instruction,
> which is available as s->base.pc_next.  The function sets
> is_jmp, so we can eliminate a second setting.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


