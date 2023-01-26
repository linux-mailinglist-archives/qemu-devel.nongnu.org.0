Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A519E67D5A7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 20:48:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL8EU-0001Xi-7D; Thu, 26 Jan 2023 14:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pL8ES-0001XX-JF
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 14:48:24 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pL8EQ-0001X8-Ru
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 14:48:24 -0500
Received: by mail-pl1-x629.google.com with SMTP id c6so2831660pls.4
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 11:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jk6YSilYWeIGsNZebNNiZETBP+lRIqgEKsC/bacnJWw=;
 b=Qucy+B3gFv90a23Gg/mkIRONL/K6Bb+Yk/tJlOgvO8s80Z1J2M21uwM1W0nx06U3nz
 c+gsBVLSHlojdNZJY2Dfy9FCvNvf/yZtoZLDc9GoNE6YDhhPznKD8Sq2SGNHe5nsv6Yg
 F6XZ5GgqVLLd0C0KbljxpMYuvOv9nNKDeI5nJPPfHVYAUvvxJRLYIoPROpmeDvtKRtia
 fi/te/UiAWPcItjH+l4tytgL2UX4s+V1ePCsTE+ElGsszYO2s2vNoiDSANyUOk4mCMer
 SYGymyUep8FTls+1kQ+kpcBm0JzE6WcIBAqs1f833rZ/awyBgQU+9TS6BEeEtEFAUSQN
 3xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jk6YSilYWeIGsNZebNNiZETBP+lRIqgEKsC/bacnJWw=;
 b=dtiaGz6ms3GPTypGHFI+nwg8Xq9K3V/H3No4/42e/F+kQuLcNJdxkx4LeUZaU1xmdj
 wm52qj9ul6KE0u2RCxeZj23GvUvPUIkr5zLGFwvd7CfU2AUJIo1C9q9COtEQXDvgUbEd
 BYEePQ5xH9qeDauH7Ev71jekyb8T8QBNZtvCMGF84+zaRPTiNf3rJQbecvO3KlHfJn12
 X1pv92EnDD7MfdwwbrFmlfyAYmT2wSfZs+T0RLLBRbosUR7XGiyIiCqPzkVfdB8TuuC8
 pID4/OGM9KfFBxvRz+9HrYja+QH/KmsRMOLq35Z4/isOWq9MxBU/D3zh4ZHR6UN3ShUl
 TsQA==
X-Gm-Message-State: AFqh2krd4liDwkmaXw66bQcydyI6NO+GyhNeSctCujv5riWrNCr0g9GH
 Sl16UWX61syaiwL/eDOE1wt30Q==
X-Google-Smtp-Source: AMrXdXskpq8JTws0EMP3DctU5wupzc81rpROgyrmU0TY/6GQryaH8QfA3UHdVKJgp5xu7QQqIJ4JhQ==
X-Received: by 2002:a05:6a20:9b86:b0:af:6d41:dd8c with SMTP id
 mr6-20020a056a209b8600b000af6d41dd8cmr38820454pzb.38.1674762500916; 
 Thu, 26 Jan 2023 11:48:20 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 y7-20020a056a001c8700b00588cb819473sm1208223pfw.39.2023.01.26.11.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 11:48:20 -0800 (PST)
Message-ID: <2843d6bb-ff98-2469-44b3-e763bd307444@linaro.org>
Date: Thu, 26 Jan 2023 09:48:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 03/36] tcg: Allocate objects contiguously in
 temp_allocate_frame
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-4-richard.henderson@linaro.org>
 <878rhpp64v.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <878rhpp64v.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

On 1/26/23 07:12, Alex Bennée wrote:
>> +        ts -= ts->temp_subindex;
> 
> This seems a bit magic to me. Are we saying we always know there are
> TCGTemps "behind" ts because that is implied by temp_subindex?

Not "implied" so much as "defined".

> It might be worth doing some documentation of the various parts of
> TCGTemp to help follow this.

Ok.


r~


