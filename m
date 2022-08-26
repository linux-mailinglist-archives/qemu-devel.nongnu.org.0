Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C73F5A1D98
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 02:08:57 +0200 (CEST)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRMu8-0004zA-6v
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 20:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMrq-0003XD-6i
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:06:34 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMro-0002fd-Mu
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:06:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id q63so5007448pga.9
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 17:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=EBOxq5PgNa9t9rAazTGAbQKnXCUVmU9YBYsBXuk+3aw=;
 b=EiEW4pfRxc2HezyALyS0Hcw7MFXnRR4TVnclQCt04Vr/71H8MNmO3Fxb/qMzDRB3NW
 2OXOw9/b4r4GVwnpACimpfRb/ymHmt/HNAl8XPqFTsYWPUosr/6YJQxsUYQW783V1fPl
 GRLmR9HI8JGa0E5BZsiyIxNYSdxckr4Vbs9JTgdiC3vApRQPXr7rbE+qnye9BvtR1WeW
 QvtGKaiFQCY+jA5yZ2QxDFW4bJjGxDSn0/G4r15s9OZeQ03enRdKw/TfYRCoqo9zJ8P5
 6xr3Zue4P+2a+irQddMK618sB4H00RkbvQhrCOfAf/ezLygeHRLiJoo9ZLfkbsD1zPFZ
 vL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=EBOxq5PgNa9t9rAazTGAbQKnXCUVmU9YBYsBXuk+3aw=;
 b=N7/nnMM6+NVPlKEk436afrgPWTm793SEIgx3HlBCXUD2mewc4GgOFRxpG/Fv9AWD6K
 EjVUtP+mWBOpVMsW0cfHaVcci653wCYK9FHoUIlvUFQyBcEZxeNfO1hzYoyf6CYCS1ew
 4zMPTHXQEw50QFuLYS59Xd1Rraff1lKGSNIbYpxRjKVnOv6OPoBMI2AOycX7xQGip0fg
 jzsm18+X+ycgllNwVLJVibik0q8+3WDkIgnch5uBxRLXSTBUxYId6X4h93GxRFNNB1Fz
 3HYPLFO7ql2fF4bYzDhpoD9Yc0yOG9ARL+F3XHAs/I+olNfqJ2q7kDWOSGqhu2s9Q3AI
 CHjQ==
X-Gm-Message-State: ACgBeo3TnUlWGmwJnEouTzDy2VOp12oZf/4B/997guwJBuJOToC+0ViB
 z4jpa+5yebWJJ7CQv7TQFLDm9A==
X-Google-Smtp-Source: AA6agR59ONafkpZVHkhYbgh+LF5Za7lCs3EtgwsHQslokNBpCLsXWf/pWjxULlEA17zA5R2I+0It5g==
X-Received: by 2002:aa7:8653:0:b0:52d:6fc3:1e41 with SMTP id
 a19-20020aa78653000000b0052d6fc31e41mr1360487pfo.13.1661472391254; 
 Thu, 25 Aug 2022 17:06:31 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a17090a550c00b001fad1f975casm313969pji.12.2022.08.25.17.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 17:06:31 -0700 (PDT)
Message-ID: <da53e216-9c90-c20b-6a74-ff08611300a1@linaro.org>
Date: Thu, 25 Aug 2022 17:06:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/18] i386: Misc integer AVX helper prep
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-9-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/22 15:14, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> More perparatory work for AVX support in various integer vector helpers
> 
> No functional changes to existing helpers.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-13-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 164 +++++++++++++++++++++---------------------
>   1 file changed, 80 insertions(+), 84 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

