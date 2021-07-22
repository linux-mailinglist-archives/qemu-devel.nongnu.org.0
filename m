Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A73D2B92
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:58:42 +0200 (CEST)
Received: from localhost ([::1]:46086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cy1-0002D2-60
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6csV-0005Y2-RQ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:59 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6csU-0002Ge-Ce
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:59 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 j8-20020a17090aeb08b0290173bac8b9c9so5424252pjz.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Z/hNEd3hK8Un1Ihme4Y6kXKzkzlfxGaDxGhD7QiKgWk=;
 b=QGCp1Qoi8fvVdfrLtcBbNcZUHhn9k7t3ztOb/tdo+C+96+DPXTrWBl+OaEKrl7TMNF
 RytmUUtQ95+BFt5s+6HigJRqBk3RhrGlOYZpgdIo9XDHhw5DTZH5yXJj9wxF6MXr3KXV
 BeLxsU5UhKwp/Gjs9opl1pjs7ZzeTMIDApCC+YLf2zn87+YLItmHgMQm/snI2b6uJQcX
 4WXAjWCU7IhK18cVTAIylTmbNIRqCae/4Sczpwd/ouZ5LhBDBw1PQrMwCFuCehk8SsSu
 9Z4PHl0DD2UHG53xvHpQ8GzAE2JB59urc5BR+a4V61ds8lLVNoxp+JMUiD/Q2cy1sKKI
 n85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z/hNEd3hK8Un1Ihme4Y6kXKzkzlfxGaDxGhD7QiKgWk=;
 b=ngcoEAfrKI49Wsd98CzbCOeOWYJx9w/HJOWhstuX16k9NdO9eDE20mFNzrW3OJV1u3
 iHNGdAexitzTT+5aH/npJFJLeHe0drMFERNyxs259cLbP9D3nYDNAsweYA3zbdy6DYKs
 Da2E5xc80LjSb2Rf1fdL1IZ9g3dJUDuSVXVj04sIOLRkexfDE96NR/CdzMCS8yjNutm1
 mHNsnnPguZWBgq4ICPSi0FLdwUn+11PCNlI2T7fzr4fthEI5g4JLqzfm/RkSfob6SV42
 bdDZkBpHfUFV7uigvDjZxUmsO0k9ibAr6bOfLcFW1zN2YzX+F7hfe7a/mstdKyIJyGgw
 f65g==
X-Gm-Message-State: AOAM531FmvJjedV+Dwjnv9AJL80nW1+tvBlgDjTXnzufNtTyMZLjUKIf
 eYjvlcEniwj6U+V0nHBvOAr/ziwzDqnK8w==
X-Google-Smtp-Source: ABdhPJx39SlIxzNgAcUW+WxAGEtWeqeCZrHebH9u8WoQpVl2cGepO1hLZM1+5CB7AFYewx/ZC5b4IA==
X-Received: by 2002:a63:4b59:: with SMTP id k25mr1098732pgl.252.1626976376626; 
 Thu, 22 Jul 2021 10:52:56 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id y35sm23009914pfa.34.2021.07.22.10.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:52:56 -0700 (PDT)
Subject: Re: [PATCH for-6.2 34/34] target/arm: Implement MVE interleaving
 loads/stores
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6221fd83-b59f-72f1-e992-104d823dba7e@linaro.org>
Date: Thu, 22 Jul 2021 07:52:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 3:37 AM, Peter Maydell wrote:
> +        const int off[4] = { O1, O2, O3, O4 };                          \

static?  uint8_t?

Otherwise, with the help of your little print program, I can confirm that these offsets 
match what the pseudocode produces.  I hope this while beat execution thing really pays 
off in hw, because this description is nuts.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

