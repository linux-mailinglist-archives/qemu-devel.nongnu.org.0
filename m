Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F238E80D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:50:10 +0200 (CEST)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAy9-000405-21
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llAx7-0002kM-Ae
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:49:05 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llAx5-000311-PN
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:49:05 -0400
Received: by mail-pl1-x632.google.com with SMTP id h12so2491174plf.11
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n4/Dm3N7ctQDEOdGtWOMOY0r85jIAh0ML5HTOmjv9oY=;
 b=sl4REIMiBRy8puhF61kbKq7ViPLtHGjNDyhM9Jn8DRxgAL5SasGJ8Vq1HBfLyfVRwj
 HvuVAg/dgoS68o6jsh1e8l2yi0gH9MJmg3LDQS8Qnl5EP4Uz6YCPxnGrYlY6u0JX9OfE
 T8docSWapuRzrC90M2PA4L0HLJJmVhAo9F6/kRkby5Ik0r3I9EvtuSDDk5QG65GoB5q2
 a3vmooUpaeCZ3dN8QS0d7YJ935Pn2JIA1IoeWSSCUEhIqEWElHHz4Ik2yE5NYLt2oQtb
 rNO2eVgymM0dmEIIjsrbWsqLGRfRMxKta+NJ8pHhU48f0T8Em6ixoYLvMmOVFBCarv9k
 Qetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n4/Dm3N7ctQDEOdGtWOMOY0r85jIAh0ML5HTOmjv9oY=;
 b=YvbVKDeN+e4yAhwSEpnZuSeSqQzinahI8ThOBi7S/e0L3CuAowNkdB1FBdfYpK14e6
 ckuhIjQrSknzja8v2S62HjIQSVFMIyAcED6ujmnG4InKFKWeEM18TfitZj03g/g9Dxt5
 j8Nlur3QoNkasj7rNqgrDksLIPy9YbufIhPe2L/BnhXM+yp6UVIoeh8LDMXSlZbkuuoB
 sUlHsmVRhW5VaYPfLejavtSAGQS6+qz2aBfQaHuIz5VTRqujEi5T1kudRX3XuqNtyYqh
 7rUcRv9noWVJAKeqTUP6gyq0GYIBAfgzeD++1LddCkxr9gIFnfpZSbwltDsDDTgQmMY1
 VCnQ==
X-Gm-Message-State: AOAM532Fwlz+5Qq8Q+j2pMPdLV7eJ3AMD73RcxueaEOsDTypmVxXWFLs
 il1tlrj1MO5Y87TtSHRQB1wnyA==
X-Google-Smtp-Source: ABdhPJzPUDWx8avT9fdCT8In0/y5SvbH8gNSFZTdPJ+OyVuvITws/yUhMsgcz9Gu4SR0uJ8KDBh0cA==
X-Received: by 2002:a17:903:22c1:b029:f0:bec6:7c35 with SMTP id
 y1-20020a17090322c1b02900f0bec67c35mr25140926plg.69.1621864142340; 
 Mon, 24 May 2021 06:49:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v12sm11585775pgi.44.2021.05.24.06.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 06:49:01 -0700 (PDT)
Subject: Re: [PATCH 2/6] hw/arm/mps2-tz: Make SRAM_ADDR_WIDTH board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <20210510190844.17799-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1ca5751-6277-1cf3-b3fb-6063dcc780d3@linaro.org>
Date: Mon, 24 May 2021 06:49:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190844.17799-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Devaraj Ranganna <devaraj.ranganna@linaro.org>,
 Kumar Gala <kumar.gala@linaro.org>, Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 12:08 PM, Peter Maydell wrote:
> The AN547 sets the SRAM_ADDR_WIDTH for the SSE-300 to 21;
> since this is not the default value for the SSE-300, model this
> in mps2-tz.c as a per-board value.
> 
> Reported-by: Devaraj Ranganna<devaraj.ranganna@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

