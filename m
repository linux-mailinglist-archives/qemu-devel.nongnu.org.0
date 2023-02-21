Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF23269DD85
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:03:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPTk-00056g-HN; Tue, 21 Feb 2023 05:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUPTD-000567-H0
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:01:59 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUPTB-0000YX-0M
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:01:59 -0500
Received: by mail-pl1-x62c.google.com with SMTP id q11so4750328plx.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ID2wM3HB9kWA3khqrfFXEgHQhC/o4a1L9oSoq9Y1Peo=;
 b=EugatnyQo5GqAlexHTridYaSIi78Htqb+FJ+uTL7Uwth23/7zH/xNivXHv+qf3GaUg
 ZMaKutSAkInXN9qh+ZqyN5nUzFNcyiy0/8B1hzs7lTNBjOTD4QuU9kOSWkvWo4ZeA06J
 29Rxad9gBF446sPo/Asgu+jxpB85HYjIx5HyJgmAbUBC+d7+RHwqFSGkPZ8TDpX488ps
 yuWpzUYZK5l888X7Gnfj5+Ai/Tb8EoDF/BxX/xbjPGmRMO9OhTsJtvXeHKxBxOasCHxg
 WPRy7z9W0rZgopJ7t2HxSEz/5gBRsIxr59lZMq5oZysjSen1HJ+c/+UaHXuNEPB8py1T
 hD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ID2wM3HB9kWA3khqrfFXEgHQhC/o4a1L9oSoq9Y1Peo=;
 b=pcFccmLTAXZJtJ9IpTARwcXzYh36XYKOXKI8nL22S4yiJ69bAlxFO6LJ09iPMv8iAi
 V5DmmL2hGHxbHLmwaDHyddKVjrCO9GIQUgPcTn6njDMSgyg8Wvz+mQesbscIP7WIfvkw
 hkHfdIF30fBVnqtEwdQ9uTtSN7Fyu8VTSdIHlYO8o//h4hAUOTwCLLXJwFuPhhx35zjG
 EF2v+XGH995EnY6yRx95ZcIcUJtY3PP6GXhefyy+Ca5XCyYAz5KkOy6rrCmCdYc1X4vJ
 1R3pbOF/Z1mg0jC6SFwg/g1JB84WqahfWgaIvNqFpZPOK0Dhy+Jrg9Rdx+3o8tI5SueA
 t3mg==
X-Gm-Message-State: AO0yUKUhf1CT01394nrFiGUwRRWn2Z26fEIMinq8kwEidr2LV50MFLBO
 CIihpZB8VD9z32Vv2XYmBoMsqg==
X-Google-Smtp-Source: AK7set/jJqHs7OfwOp9oVVyXoWtAF1BaJkmCCYNnr77c1br8sFbuLEOchzl9AVagAnjm2INVy6kryA==
X-Received: by 2002:a05:6a20:6a0e:b0:c7:6c6f:76f5 with SMTP id
 p14-20020a056a206a0e00b000c76c6f76f5mr4283426pzk.51.1676973714407; 
 Tue, 21 Feb 2023 02:01:54 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 b2-20020a170902ed0200b0019c919bccf8sm1150953pld.86.2023.02.21.02.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:01:53 -0800 (PST)
Message-ID: <bf06cdce-aa5f-98f3-4544-31d08d6bd55e@linaro.org>
Date: Tue, 21 Feb 2023 00:01:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
 <20230220232626.429947-8-richard.henderson@linaro.org>
 <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 2/20/23 21:56, Philippe Mathieu-Daudé wrote:
> 'secure' & 'user' seem mutually exclusive. If we get short in bits,
> they could be shared.

They are not.  ARM has Secure EL0, or secure user mode.


r~

