Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD105AD713
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 18:06:47 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVEcY-0007ER-Dx
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 12:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVETU-0007cD-R5
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:57:24 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVETO-0005B6-I1
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:57:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id bz13so8500701wrb.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IBRortsc9wjwGduq+IAMnMolTgnsoW6yNu3N3Iyt5cE=;
 b=URw4YtyY+DcA2wjH1pJV3E/iT4qxr/hzi2te6t5VAiLt66q8GWOdurOEQcj+QyVRv7
 tp4NphiNm7chvuuM0fX5oA99J03UFSdhziGrVoruzjJrYE7k3gDjOwTl8At7WHyxV4KD
 3Y6fV3KHBGl07bPHJsXCMx3mo5t+emhJVt6s6Pd8o1Waw5h0c03JtKZbXfbDrSKR6wxg
 WBLW/q/8JH/7KOD7QLrJc5CsZJQH/XHed1N3Da773BXl6PdNGhRMyLOb6ct33CzkSQ91
 3H3YQ2Ljb7pkkcezVgPuvUkCktoto2NeVPDgRAMJtEt1KAcQ0oSs8mJVulGK0xFlPM7g
 8Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IBRortsc9wjwGduq+IAMnMolTgnsoW6yNu3N3Iyt5cE=;
 b=IUkrWtvJ+GAtlvw/JbtpFEOgdaaini5H7RUW2kEQQZA1yqrIXhXLZyQULDuFCq/boy
 D/19wmWJ30nRSayOCMXK+zRdIeImZY9QDwHyFGFKVD5jXNmFFLHsZcJVmr04WguTASkv
 LzzgZ7weYZmMvNMr+81Rp8uzlfPK/NqvF97HXC0ybfG+z9OV3NrJ+cMBfJ0asjSfBQi7
 aKDPnsxco/d+3ZJi0AlhVuTCPbtNQxtWBgsH2mHe6vYC/lzoBKtiyLsTuJn6we63kwM+
 0R3z644E7X1+aDfQt/e0oLkBGXfGckW6lDy06WrB/Q8PPzNrog2XaDY5IS3+Tv83jAig
 H2xQ==
X-Gm-Message-State: ACgBeo3bnAoFQCLvY04lh3X3FrdhCyKBFYz2JCgmRS3Ue/+CfCZEiq/j
 0lW3WmEbqenB4D58FuAoHaYZCg==
X-Google-Smtp-Source: AA6agR7nDTueydDAv4weA1xarZZ3O95mYzZaPkXBpv9LevTfrhqzEMUm3KKbZXxCKo2C66yRGWBI9g==
X-Received: by 2002:a05:6000:1cf:b0:228:6349:5935 with SMTP id
 t15-20020a05600001cf00b0022863495935mr5235610wrx.652.1662393433713; 
 Mon, 05 Sep 2022 08:57:13 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a05600c1d1100b003a5fa79007fsm12032088wms.7.2022.09.05.08.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 08:57:12 -0700 (PDT)
Message-ID: <abb2e6e8-08bc-9251-f4bd-19bd0d91b974@linaro.org>
Date: Mon, 5 Sep 2022 16:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] kvm: fix memory leak on failure to read stats
 descriptors
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
References: <20220905123910.46703-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905123910.46703-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/22 13:39, Paolo Bonzini wrote:
> Reported by Coverity as CID 1490142.  Since the size is constant and the
> lifetime is the same as the StatsDescriptors struct, embed the struct
> directly instead of using a separate allocation.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Thanks,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

