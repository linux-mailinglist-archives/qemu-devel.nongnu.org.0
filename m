Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E2387606
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:06:09 +0200 (CEST)
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwc4-0004vI-Vp
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwLb-0004lV-Mt
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwLZ-0004DL-JN
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjZVkVyBHjIKR7+Mk8DhprphIlOvUUm/cZCdbiphxg0=;
 b=LZXruh+GlrrgDfWZsneAxI5clYHTV6TR6fcy7dHMEE2nCnsexq407NpQ/uz5dTOjfn4rqJ
 BxsDOzolfUhxW4ZFjTzqH8FJBHqALh0VceLtsI05GKN7hz3y7O0SomxqCNL8ewY8EJnlf5
 u0WYAn1Zr4No6SrdD26ez861oDxPBbc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-9Zg9rY8wMceBzyFi6XCgcg-1; Tue, 18 May 2021 05:48:58 -0400
X-MC-Unique: 9Zg9rY8wMceBzyFi6XCgcg-1
Received: by mail-wm1-f71.google.com with SMTP id
 b128-20020a1c1b860000b029015b52bdb65aso361124wmb.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cjZVkVyBHjIKR7+Mk8DhprphIlOvUUm/cZCdbiphxg0=;
 b=kL/mYZWyxeM/Aw0RvikzTFnYsWHucl1KfBLiSjjMZfFdq6GF0zM6DkAx9HzXmG2M9G
 Is5IWt+ZjCP4f+bD87C3V9epKuUlUS9qyQntHlPiazhntSMGa9meLpnw/uvVcK+VdO/O
 MzXH1xnhoMxCnsaqT4u+6b67WKOIQVQ5NugErNh5cZmxAlvY1DSxVelbocFDLr7HwTee
 xWJ/anHJSSS9mZMQysAWTcopaZBeOs5XPMm47VpJ4xW3L67MkBX2gzP8AxGPMJoCV/T/
 L5AorlZxSmZPT2AGJYZxkeZDyp9q0AbpooePIfclcKuLJlAf2bosEc/cWKH59ipyK7Gf
 5aWQ==
X-Gm-Message-State: AOAM5333AnJrbvVsV0TNWivu7NsPSOBKzc9dq8L3eoPTfxYj8q3RggJz
 yypIC6TGuCkpL1nHGqTg1WuduZv8/LMVNC8rSuG4azF9Jz7duFgAUA1/uihOcxofqLqWLvN7s0d
 9Un1xKZSVb4o5ysY=
X-Received: by 2002:adf:ed52:: with SMTP id u18mr5572878wro.379.1621331337102; 
 Tue, 18 May 2021 02:48:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTUmUdQpgQbcjITdGcYzDsdG0FnEVInZlDdL933lGdH/mASazRU8QnDhDV5AaoJijyETgdCA==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr5572872wro.379.1621331336998; 
 Tue, 18 May 2021 02:48:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m6sm20311467wrp.29.2021.05.18.02.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:48:56 -0700 (PDT)
Subject: Re: [PATCH v2 04/50] target/i386: Split out check_vm86_iopl
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-5-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0b16881d-f4e0-95a7-6598-fd1a1ebaad85@redhat.com>
Date: Tue, 18 May 2021 11:48:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-5-richard.henderson@linaro.org>
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

On 14/05/21 17:12, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


