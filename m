Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2677B68203D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 01:00:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMe4A-0002cg-OV; Mon, 30 Jan 2023 19:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMe48-0002bs-59
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 19:00:00 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMe46-0006MO-Mu
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:59:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so1569wmq.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h+k69Upo1cDiX5FpfjKA+yA3cSU60SC/jlrD3O+czVo=;
 b=nbOPgFtBqdHXuo5y5x/PsL55PFPHxBByQkfTSogl/xBMXAtpVkcz2/p65yeXq7AAFB
 Wumfm9lygsW056yUu0gkcajw4fuo+/ThlqgnITfo48YTHErmdv/X0tHttJUknze+E7qe
 40gFuP5TIt/u9v9ORo+sbqDB8+0HU+BIYPZAB+dv8WpvWlmFVf1B2TiEX9u5PbmT7Nyh
 qWG90y44XMaxbW5hg5EZxsb1LM5OJxnGLNhKggigNgIZ4CjQlk77cjpHwvqtwJR7f7HC
 Ele+7U7NHw0d/wnjEAjXusox0U+H3koyoQmy5mCjXIP80Z5U/IiQc3XqYV8WmHJhUUU+
 O2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h+k69Upo1cDiX5FpfjKA+yA3cSU60SC/jlrD3O+czVo=;
 b=nqgya+B6f2k68FTpRVKAXvfyBhNeUUDCBHfE7zcSyMrGTRDtPa59FFkD5ZNZytBcpm
 8/spbNohTL7Zi7Q2aWWJmWeUJA56B5HGD1sGqwIKYDWWPGSerVQ/Hw9tWmDGGkcAS4+7
 44DNo3ENP2pbrtPQr8seTSNxEoJftIFVedFz29bYzLEg/0+x31hPWV235P7cD6F34Jsw
 qNX52m/0POwlCGSc9tIOVpNPHR+z8wY6/VCmIQm09d2RhwWIDPy/axkSVFht2BUCRgf8
 +XcRvUfJVdBRSL87c5Q5sx0kiJrQeOwOhG8gMP7JZcS7KdZlcArrs3i3M0XwaHu84175
 mNQg==
X-Gm-Message-State: AO0yUKUhgh9er7VSMQIO8o/MYC39gUCTj1ho77f8tXvGLjWPv/sA/AzF
 gDi/6D2v0bNKT4Yv5eGPzwANCg==
X-Google-Smtp-Source: AK7set9UbqoLpXUvvXvelpgrS0mzlmhKZ6ZOjh1wnWvckZlCF6INbr4XXlpvj9BdpxsRGH8OD/rWVQ==
X-Received: by 2002:a05:600c:54e5:b0:3dc:4f2c:c856 with SMTP id
 jb5-20020a05600c54e500b003dc4f2cc856mr9460519wmb.32.1675123197355; 
 Mon, 30 Jan 2023 15:59:57 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 bi24-20020a05600c3d9800b003d1d5a83b2esm17321947wmb.35.2023.01.30.15.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:59:56 -0800 (PST)
Message-ID: <c72596d1-8735-11d7-c9d9-1427f2ec558b@linaro.org>
Date: Tue, 31 Jan 2023 00:59:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 09/27] tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> TCG internals will want to be able to allocate and reuse
> explicitly life-limited temporaries.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


