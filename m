Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFD3366366
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 03:38:58 +0200 (CEST)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ1pR-0000Oj-9O
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 21:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1oP-0008QM-ST
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:37:53 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1oO-0000Qw-Cu
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:37:53 -0400
Received: by mail-pg1-x52f.google.com with SMTP id p2so12756150pgh.4
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 18:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=THmLpEgHBhW8B7749NOq5CcIgGR5sCJT6XhVH3jhh7M=;
 b=fcQzobfgBuWXnj9vr4acOvIJ5ILmZGAZ9IZv4I0SfVh68gl0i6KLoUQpI4DXJMfyE+
 oDNxlVPcV542pZuvzu8r2B6njb682Fnw01SToO4L7v373rCjZwV0DyNMKygGTbF3Yg8q
 KeKPDDtuU31bBy9kYZS394nLUS8PEYL93FpZbvXgmOzBOlnsPntSau/QvfMJngYYnZYB
 yWjR+aTTKACbvbuV66dZjhXXhLhkhfOSCoz2tDFK/aifKg1h0QJPaNngoFdu183gE5uR
 fvXi8fupFu36O0mM5xh5+d9Us9mQaXIxjmEVt9ps8C/t38t2IU/DkSEWk/0T7pYE1uH+
 qs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=THmLpEgHBhW8B7749NOq5CcIgGR5sCJT6XhVH3jhh7M=;
 b=MTZxlY9zYSAlrVyYBlEB8OgVb1h+7WLBHYq6ridKUMMwEnwdfzmLWR6kd3zx+mQssM
 O16iRzUk/q/AAm4YDwpMNoMJN7WxEC4A4wD2x3uHrWmzcgwy4XXxH5kggoc59O1OYo0r
 enmKKq1S0YsLYPzz43tP8g5xuXjFZTax8wFXBoZr95RfL7Sdc0fbaI0QJbq7skCODWqB
 W1FbK89WzwShqVpSXJulMEr9Mx67lLNWJ9YBOFuI5wX9LTz8Ca9AEdukp1r3ioe2NBE3
 Vuffr1oi+qvaicCFILlYpMH2V0OQrXJCdWGKQkwr+B/zgooixEBUMkoCrt8BW/2z6bbi
 bncw==
X-Gm-Message-State: AOAM533pIsqrPzR6ZQPLXR0sjIDL1UVW3MBzya3ikWCk4IOtA5qDyOPB
 dRWc8LvXxctRda56QTz8A70iyQ==
X-Google-Smtp-Source: ABdhPJxJmeeCU8VdCD11zv+YLT3ExXdg6pUXubDsm0g27eoqWsuoe1GVEA0/mMJR6UGtegdf7rUCBA==
X-Received: by 2002:a17:90b:1d92:: with SMTP id
 pf18mr8155563pjb.71.1618969071130; 
 Tue, 20 Apr 2021 18:37:51 -0700 (PDT)
Received: from [192.168.73.113]
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id c128sm237356pfb.81.2021.04.20.18.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 18:37:50 -0700 (PDT)
Subject: Re: [PATCH 1/5] target/mips: Remove duplicated check_cp0_enabled()
 calls in gen_cp0()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210420193453.1913810-1-f4bug@amsat.org>
 <20210420193453.1913810-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <50fc7457-3ac5-2af0-820e-465c8ab73fcf@linaro.org>
Date: Tue, 20 Apr 2021 18:37:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420193453.1913810-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 12:34 PM, Philippe Mathieu-Daudé wrote:
> We already check for CP0 enabled at the beginning of gen_cp0(),
> no need to check it again after.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/translate.c | 2 --
>   1 file changed, 2 deletions(-)

Having noticed the default case for the nanomips decode, I do wonder if having 
the cp0 check happen before the switch in gen_cp0 is actually correct.


r~

