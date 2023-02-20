Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7FD69D3F0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:13:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBZO-0007gU-51; Mon, 20 Feb 2023 14:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBZI-0007bv-Jd
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:11:22 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBZH-0001yL-4X
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:11:20 -0500
Received: by mail-pf1-x435.google.com with SMTP id cb13so1050231pfb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bH5/U7Md/Pify1quLtdiu4LUjHJmzVXISw8b4AaulM0=;
 b=RtTf5OweqaYkSoyhiRwycbucENKBYQcxBJOURtS3CiqQLe1DzdcA77VBpAh2OexKfZ
 Z/HweVasiCfOwYXbaxNlFxmCVuolakqhbuoO+XdiEA70glZay32hUW//cFGgMOQmXNTF
 vafrc7dbJFch70khYpcm7Of/tN3UoED7V1qmqCxiuc2raURlAqJmS5WlHpMEzWwOJNAF
 qolVhAScG3aojWepA+onBa6jzjl6mIfoNDGeJRxXxF4efOKb2KsZXvRjeTo6cghOMt/k
 XZXd3qt4/NNdI9uvu74dSldSYdJpqPNvjDw9tcCTn7MWONJGk3MfsPvX3oTquhdrmAMD
 BmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bH5/U7Md/Pify1quLtdiu4LUjHJmzVXISw8b4AaulM0=;
 b=2Fxy6YTZsgWBiqHLQB7XuuC4cgXC1qSQlwIxrOpOxM75PxfciEh/MFJI0beVOz1pig
 6DUXl9WhYLtZU7Xq+ZKTlOUBLvSCsrC6jwXLCF4Cup2qmVH5+VG6z2MDgxcbV+l15FSf
 cmEjmOFd8UA745bmJoy3bqBkMa3vok5r+wBtLPdoSLn8zF/lO2SoZ24rI2S5SS0S7Pi3
 +bTkCU2pwsPxzin9JaHgQugDj3rcat9WZWPScfRvA9OaTSvU4044LGZCt0KVdvaEHhGD
 ruTu5eM35n4QD9nGkvQAWUeeE3ErNsFRQ8lZJa2JOKEE4HPeAA1e9SmmSiVRkDkK/PSp
 lNiw==
X-Gm-Message-State: AO0yUKXH0RNvUjqc3TaGq6FnMqlU7rgk0++QXIhrOABXR477hkI7EKSa
 FUU2boAnUEks20RHl95rStCI0A==
X-Google-Smtp-Source: AK7set9+I9iEfMSvhElLnD1toQmOzVNAUuPDKYMs1k1mhdp+xmfHnzKRcFKjaBvJSuM6Cki8Xd5llQ==
X-Received: by 2002:aa7:9681:0:b0:5a8:e9c0:7d0a with SMTP id
 f1-20020aa79681000000b005a8e9c07d0amr3839383pfk.4.1676920277395; 
 Mon, 20 Feb 2023 11:11:17 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e25-20020a62ee19000000b005907664a3eesm1491998pfi.125.2023.02.20.11.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:11:16 -0800 (PST)
Message-ID: <be0a7599-aea8-d5a9-1849-6acbb9b84e95@linaro.org>
Date: Mon, 20 Feb 2023 09:11:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/9] hw/usb/hcd-uhci: Declare QOM macros using
 OBJECT_DECLARE_TYPE()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230220150515.32549-1-philmd@linaro.org>
 <20230220150515.32549-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220150515.32549-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
> The automatic conversion done during commit a489d1951c
> ("Use OBJECT_DECLARE_TYPE when possible") missed this
> model because the typedefs are in a different file unit
> (hcd-uhci.c) than where the DECLARE_INSTANCE_CHECKER()
> is (hcd-uhci.h). Manually convert to OBJECT_DECLARE_TYPE().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/usb/hcd-uhci.c | 2 --
>   hw/usb/hcd-uhci.h | 2 +-
>   2 files changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

