Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E3C64F66F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:44:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6LIb-0003FM-I9; Fri, 16 Dec 2022 19:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LIX-0003Eh-CX
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:43:29 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LIV-0006Yj-LH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:43:28 -0500
Received: by mail-pl1-x632.google.com with SMTP id x2so3842251plb.13
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Cpa5inuuTWifznucnO5vMZhLNHoyBC89qAOzG5VMfI=;
 b=heIykpvPJwK3sJNnRB7YGBxYfEWHvZhSjXfN8SO4TpsP9IAvpcGdD9W+B1xvDpsYH0
 OLzswTSLGJx0DYTdAx2cjrj57G5ikj3nzM9o7MhQcmpYyHohPYcsAobZooOmnBHyfNXn
 jmKg7RKe7d8+pqaXDNJdzX4xHFnKnspCHPk0aSWc+lR9fY+H/ZqYCVRzqwhq7A9kfCVb
 G2U7StAj2TeKEdxyX5GeLtbKUHSCYiIFiPkqDs1la0GVXVEo3aZgnqBekx96xSLtciZ0
 uQ07BzQfkabAwOcoEOpqfoXCSy3kL8OcKLQq3zFFht6Zqp0N2sH/Dnh777fHP76soSOK
 5ZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Cpa5inuuTWifznucnO5vMZhLNHoyBC89qAOzG5VMfI=;
 b=gRfjrXpbgoN6UjgjY697Q2HDEnwj+fPt6CMcf6IMz40a+dGlUIBk2TCxo88KDAojMS
 IXVWXpNVoU6g/EaBWpgaJnNiwpfblAVzpE2tI82V0I++W0hmNjgaLN5LQkqRa4QOKopY
 uR8X2zjSRruVBQm2uiXEIJWK1o9jYZPzFahmeS+hQAfOJrQPCAwagHnmNxhtny5Kixai
 F9oUzsraL3i0qa5Y1Y3sqslYMQqxKP/GpyjkwyFRhmQMJM3FwY079ib+x9iBbVlbIWoG
 FyUFg2qyGnbqoASKCzLLDrOKkrzMEVnPdQ4CIwipya3rUJYlul1hfANyVUOmOgXM88Zp
 Qv0Q==
X-Gm-Message-State: ANoB5pm4l1S2G3y9QQiY27j8eJHMgFnv9rw2w4ttHS6cxzcg5CbvFEaB
 t+ZnTy5y2zXYv7A2PqizEc5AIA==
X-Google-Smtp-Source: AA0mqf7VRdduedRSTaCFfaqEkZB4Dtmk38mKdARBhvArMVs1YB99i+I5kV1rSijYCkvdXw3uaLxCKw==
X-Received: by 2002:a17:902:e884:b0:18f:ac9f:29f6 with SMTP id
 w4-20020a170902e88400b0018fac9f29f6mr31233106plg.50.1671237806232; 
 Fri, 16 Dec 2022 16:43:26 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a170902710700b00177f25f8ab3sm2207512pll.89.2022.12.16.16.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:43:25 -0800 (PST)
Message-ID: <c55e054c-a2f0-7098-8dda-fb5cacee00ba@linaro.org>
Date: Fri, 16 Dec 2022 16:43:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/5] target/s390x/tcg/misc_helper: Remove unused
 "memory.h" include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
References: <20221216220411.6779-1-philmd@linaro.org>
 <20221216220411.6779-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220411.6779-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 12/16/22 14:04, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/s390x/tcg/misc_helper.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

