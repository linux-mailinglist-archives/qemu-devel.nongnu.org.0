Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBEC66187E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 20:21:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEbDh-00023r-2B; Sun, 08 Jan 2023 14:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEbDe-00023B-N7
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:20:34 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEbDd-0002tF-8j
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:20:34 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 l1-20020a17090a384100b00226f05b9595so5088035pjf.0
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 11:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BExgMlzMiU4l6v6pVYPmbo2SsoD7y++9M6TnJhtehko=;
 b=G1YQR0GRy4uenJBCNW5Gk/OxHmRanVgMGMCqx4RsOub1GkY7Gj5oZ30QwtGwJfSiIO
 WZ0lfWoP59Q02KpN6hUWUDoSDst/tBfLfxMlPM6uVM8R2WMWFBbr7oRCrXGkeeqRUUlO
 PG+5PWHPb0Fnodm3Lm81IaTui7M4w/JcTUZKqC5352TKCxoDXLxUU++o52+GL23LlSyw
 I/RyYBXpS5DfDrDcrVRGf4hqqoyjh1POiorWsTXEH3PNkM+zUvkhABlykRkY1IeKfOGb
 1O+4nQKfwO8T/XrtHcM0a78mNT6bmukZAAZ93VZSHv1Fy1UL1xBkbgpJJIBiL+rdNaAl
 t9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BExgMlzMiU4l6v6pVYPmbo2SsoD7y++9M6TnJhtehko=;
 b=AyCBdL6C/ensAY4Q1pRCfNZjrcjGan0JzMyTbLc0XHmurdwTtrpi9y/0D0z5kPTxIg
 vwoP06UHmFLAzyREAkhDkJsJJmNFvPrFajFF8SodPP/RRn+imjA8nujdgS5qVehNYqBt
 n/Suz6Jqnv+JCDfP6FBIFOlHTsSv5iStImD923s5dq9DPe/mPw9LYwYNQwu/SK7cTaEc
 DN7PkcoNbpOKxWZ7tn1j738UE6zBZlabMymZSUqdzlDvrEL9UScoU5ZRHsM6Wju5FvOI
 0ddJ8Q81swjUyojfzh0MbvwUoVE3jNvHjItB9k+RM9vGB0KDUCXUk5VO7vCFPG56BR8C
 SjtA==
X-Gm-Message-State: AFqh2kqqrxiw5s4WRNkEiTeRj//gM15HSDMCn/WLAJIXfRGNrY/ZqSdL
 Cnu6Kidt5mUrp0fZwSqcJx2Ypg==
X-Google-Smtp-Source: AMrXdXu/dqtx0BGseEzVEkjd45JvShIfxOcyfo46ejGInTrcDBixXIdrQkcNqBnScLO+7gxLqur/vA==
X-Received: by 2002:a17:903:2783:b0:193:2b86:bdc6 with SMTP id
 jw3-20020a170903278300b001932b86bdc6mr2484609plb.48.1673205632042; 
 Sun, 08 Jan 2023 11:20:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a170902f20b00b00189fdadef9csm4531477plc.107.2023.01.08.11.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 11:20:31 -0800 (PST)
Message-ID: <f6b7a7f9-ed48-fae1-2329-30f06c42c9c1@linaro.org>
Date: Sun, 8 Jan 2023 11:20:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] util/qht: add missing atomic_set(hashes[i])
Content-Language: en-US
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230108163905.59601-1-cota@braap.org>
 <20230108163905.59601-3-cota@braap.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230108163905.59601-3-cota@braap.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 1/8/23 08:39, Emilio Cota wrote:
> We forgot to add this one in "a890643958 util/qht: atomically set b->hashes".
> 
> Detected with tsan.
> 
> Signed-off-by: Emilio Cota<cota@braap.org>
> ---
>   util/qht.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

