Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC3568A315
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 20:34:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO1nv-0003HT-Vs; Fri, 03 Feb 2023 14:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO1nt-0003Gw-RM
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:32:57 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO1ns-0004HG-58
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:32:57 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 l4-20020a17090a850400b0023013402671so9731191pjn.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 11:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dG0a8fJBCT/Oaur9MGeYdEB1XYw6nwH+l+QzxE964iI=;
 b=fn1GB6fVdaKh2PYPg8aH7Zug/cFJYp68g4zB8JsZTTGE1PAtqEERttXZVF9TY+Mz+z
 I+L6QKLO2rUe2ft4ifJZVRb9KNaeEM3DpL+v/KPJHD2lQw9/YBIXBcjiy7buTDhaMFpL
 FNJyIO5iyX/Xn2gO/V7UjRLeNAvUgFzXk6jYleR810oqYfg26mgRju/1N/vq0oYWwI2w
 GHng8Ef3/4w91vTLsvR3jzpSv1XAdJItYdukwnSA1ziBnxgPgQljJZgOCsa8bACB86gO
 Xiaxje3++N13730nwIXQuF4E+7od/i5lPXVFpask+9U/V2LSO9X6HSeTXA7Q3Ok+lzfX
 9M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dG0a8fJBCT/Oaur9MGeYdEB1XYw6nwH+l+QzxE964iI=;
 b=J28QEeiDjh1Hzm41p/+jYKO37HDYpMGP6teeT/4dw7PFV51wx5pa+fU/Uvfv1NJYHg
 H1vQQlM1ocJKqXTCo9CnmkpoGzY5mO5Suj4Es4CBMeCUpLRNXKBjErgTgb3zOy2io7Sb
 gvadu+zKSLjYTTudjJJiKQunsTqDn/PQBTw1Wqpdgatb9bh1BqNcf7Ou5Loif3Rt3weq
 UJQlRqHAsJN4OkwPjziy5B4V6SYYB534Qi+2IMGseb4qzpnRhf+mbYvw4C+N1JiupP2G
 QzPSJL+zwN49isX5LfQAGiUHaCWiyfz8Xa34UooexbzUt4LR8laPw2amLmbXBa4Dm1gt
 yNHg==
X-Gm-Message-State: AO0yUKV5icCoSLWnZiqyhfrem0raHZVSU13tHUbWAd8qdjspaRDnLn6B
 G0vB60dxHGIIIubpoSOTpogwuA==
X-Google-Smtp-Source: AK7set+bAmc++WLp5hJK/bVWIDHIpNinMBH1F5myAUsPiaTB3eqAeNT8R8FZIO5TwEewSZgd87Jm5A==
X-Received: by 2002:a17:902:f30c:b0:196:6215:8857 with SMTP id
 c12-20020a170902f30c00b0019662158857mr8311999ple.22.1675452774299; 
 Fri, 03 Feb 2023 11:32:54 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 je6-20020a170903264600b001899c2a0ae0sm834759plb.40.2023.02.03.11.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 11:32:53 -0800 (PST)
Message-ID: <30a154d5-7a11-4a65-c847-c8ebff8242b5@linaro.org>
Date: Fri, 3 Feb 2023 09:32:48 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 1/3] arm/virt: don't try to spell out the accelerator
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-2-cohuck@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230203134433.31513-2-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/3/23 03:44, Cornelia Huck wrote:
> Just use current_accel_name() directly.
> 
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   hw/arm/virt.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

