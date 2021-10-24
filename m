Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62598438C19
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:26:07 +0200 (CEST)
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mel0I-0002PA-Fj
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekyP-0001Yl-I4
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:24:09 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekyM-0002mw-Vz
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:24:09 -0400
Received: by mail-pf1-x42d.google.com with SMTP id m26so8844219pff.3
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8MQmqrUGTZF4srug0oGRNtMZFLeHyeWSCPKlYpQ9xqo=;
 b=oTePD/8MKjea7fTWKF5r+HNv1d2kmna8Pv/V13PIkcr/s6B+zW8YEaRBnBkYzJTbLp
 we77/1hTRgP7A0ba2LfyRQP5CICr35bK0gg1Laete9eMGg3wJJ8istyNuL1ajiBYnZUK
 /X4uW9rp6wmSWwjtVrXMpm13lo1ic5vRGQCMa0q3cvEgA9KvaqYyYd2GIODnPVeqkgi2
 JKngZGNQHEvWpSCyr1OYOqAIl7Jdb4xkQqNP3NBFp4KhPrvlTiRqcm+p/49JEQL5+d9X
 +flEPyUSCTi15rEFJPw2zxEM1bSkpSDCq9DbXiz42n1DW9hPFfK6yL1/8RZOXiBul9o9
 4Lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8MQmqrUGTZF4srug0oGRNtMZFLeHyeWSCPKlYpQ9xqo=;
 b=jnltDHkItFHM9NmsohPKhpu6KcW2fN1zKAQ5eCD/laFFuOhbgKiFJjnWHhSBvfFAlK
 M3Myz0AfgYegIqnTiqzTULMq0JljglhRK2eL93rrmwTRD2V1u4hTx7znbLq7bpUoejno
 Sae60FbzzHCfGhOl20Kjj5HoSD7embkA06SD0F1xsKSKK1noE8A31+c+UrgFLWtPdL6g
 HGIs69LvZ/IpE88Zj7NLk+GrqwggqQ15ROQwQKZKEnbbeLdwpHhFYQSTcgY+ucYJBmZO
 JC5pxWfl9ESrRGXsKvIunMwe1pjmZisww7ukINIMkV0uGhb2Pe1fDB3mePaX0UGpGrW7
 pYmw==
X-Gm-Message-State: AOAM530B7zrcGmdte3Kf8kauJCKPpurbvGaxbi349QuSUZWQTgis/ots
 lT8QNVdSBshQcom3Th0qHncv6A==
X-Google-Smtp-Source: ABdhPJwB3GREoVY+vwyrnVswthzRg4OpqBjRuXF467XHU0wkIyAC6yZq38zJwcru2mFMBhZW73Oa8w==
X-Received: by 2002:a05:6a00:2146:b0:44c:2922:8abf with SMTP id
 o6-20020a056a00214600b0044c29228abfmr14435796pfk.27.1635110645506; 
 Sun, 24 Oct 2021 14:24:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 4sm4370177pgg.75.2021.10.24.14.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:24:05 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/arm: Use tcg_constant_i64() in
 do_sat_addsub_64()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211024161619.325903-1-f4bug@amsat.org>
 <20211024161619.325903-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81f5dc42-f50d-19a6-912f-38678af6b486@linaro.org>
Date: Sun, 24 Oct 2021 14:24:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024161619.325903-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 9:16 AM, Philippe Mathieu-Daudé wrote:
> The immediate value used for comparison is constant and
> read-only. Move it to the constant pool. This frees a
> TCG temporary for unsigned saturation opcodes.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/translate-sve.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

