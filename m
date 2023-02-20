Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C7C69D408
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:23:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBk0-00077U-0u; Mon, 20 Feb 2023 14:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBjy-00076z-28
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:22:22 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBjw-0004Rf-E6
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:22:21 -0500
Received: by mail-pf1-x432.google.com with SMTP id n5so1279501pfv.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vQ4hYHwZ1H8mSHAstXqLwSygKIC+z1hT2Q5ZA7Kmpaw=;
 b=UIpc9icqDVA3+Vo/+c/MVEpTFF3xE3l9hxAr7LjYWZsIK2AyOHk/j1l5GasO0gkPHj
 ai8pEY9DYclcK4fpeCQrxKaV0O5vs6xKcvHBEEDr2sDcIsWEADFNZFtMR1Epep/6YkIb
 3LylbGQ++D9Ps/T0/LmQdf79QphN+uQehR03Jr0g+THnKgi4ZZdtCHnjue/vSyGXGPSk
 MEM71dD1OGZ5yhjGY0x2sAJ6v2ljDuEOkMPIfh8dKYAEkvfETTG58yLHR8FO9tfjscxE
 c2teEFSKF+LnKicIsUFSZwkRV73R0gQlfZ+sKqWw2DmSO3D0tkdKlaaQXbOos72wCiF4
 uVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vQ4hYHwZ1H8mSHAstXqLwSygKIC+z1hT2Q5ZA7Kmpaw=;
 b=FvslIO1XD5dGVfNDWsveFEWSWHgtcDgZ4VVroH+Rtw/ZgoNIHr2WNAl3o8+zv5L2kR
 rsLzigfXCfdmTrVvXlbc5UWTZLZb8dzk6UrHez6QWM2Y5+SRGoMLpmKUCvi4PnTRpHhD
 L59MxBcCbiY2LGq/Etf4NNUGvtqHL8HrcFADYnEYPiXqcnwb1rW+S8bRlWR2jtj58AcA
 4rsp6fwpvEnUQqbzwDhU6jq2TvvHihdOG8sEcBOqPLykOGL/RrAqKk9aDC5BRGmbjPLJ
 wvoKvjv0dqjFZNyEzXPvWJGu3y5egQ2YAtlt9ThO1EuOqMeNzcHoEXsBa6/YzFCgU893
 9ckA==
X-Gm-Message-State: AO0yUKXJkYC+uuhVTUIOPDSQ0uATHTF1HNHjlZq6VRuqH15tEJzaVFwx
 +TqWAHEQsZo8TuhpF00DMrsmrg==
X-Google-Smtp-Source: AK7set+EGCTrIAEjhd1oAd/D18fH8SUM8VggThrO2ms73Yi15joV9/qn0YA7XZ7+qqHpbFTB8BtVYw==
X-Received: by 2002:aa7:94ad:0:b0:5a8:ab21:be2e with SMTP id
 a13-20020aa794ad000000b005a8ab21be2emr2050107pfl.18.1676920938644; 
 Mon, 20 Feb 2023 11:22:18 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d7-20020aa78147000000b005ad9e050518sm807083pfn.76.2023.02.20.11.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:22:18 -0800 (PST)
Message-ID: <e512f6fb-8f58-4404-5d3b-05d523936321@linaro.org>
Date: Mon, 20 Feb 2023 09:22:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/9] hw/usb/u2f: Declare QOM macros using
 OBJECT_DECLARE_TYPE()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230220150515.32549-1-philmd@linaro.org>
 <20230220150515.32549-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220150515.32549-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

On 2/20/23 05:05, Philippe Mathieu-Daudé wrote:
> hw/usb/u2f.h was added by commit 80e267f1d1 ("hw/usb: Add
> U2F key base class"), almost the same time of the automatic
> conversion done by commit c821774a3b ("Use OBJECT_DECLARE_TYPE
> where posible"). Manually convert to OBJECT_DECLARE_TYPE().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/usb/u2f.h | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

