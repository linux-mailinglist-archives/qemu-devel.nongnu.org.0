Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407AA251F27
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 20:41:20 +0200 (CEST)
Received: from localhost ([::1]:49986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAdsl-0000vL-AQ
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 14:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdrU-0000FH-5C
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:40:00 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdrS-0000dZ-FV
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 14:39:59 -0400
Received: by mail-pg1-x543.google.com with SMTP id g33so7433145pgb.4
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 11:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JofeZzJ5SExg9SUh7gqUsyQBbdBpgvVivJ1TorSzG9A=;
 b=RXk52AXHDt/Njtutv9ZVE4oSFP+ovKxZFi7wxg+Ug43LoNLh4TiXCpdfLHtuE9VLUA
 nlZf0wPX8p3TtUG65fKD0fmakc6J7AKdosAFMKfqoOJmWxNizBIPuNTpVQTZ1wEaPBNU
 mOqdaTpD5RT2/ZvYbZTCMIg+re5Mp7GVj07qSUNmzD81Mz8HUmch/IzWHAESgJkmI08m
 xwLP4iwICdH3tUCVyFUSI5gDywMBLZcjuUhzmeiE2dfOqhUF765WMc4vNS1Ld/X5OmA2
 MSBTQMaLZiYghoyFqfVOjXKmqyOdY3fAUs84R8x1XD1T1FhGTVdXBZdHPdRoGZIl2szF
 vqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JofeZzJ5SExg9SUh7gqUsyQBbdBpgvVivJ1TorSzG9A=;
 b=ajzbu0AAzgfRUHeXztibDniyrfcrVJJ9fn2o7FAVLzc406jge/u4xRc46DnRH8Fr0j
 BugGfW9HTjNHlhG6VRuYoFKEJ9QCY6kd71iEJuhrlu4aswPLl2X6hSmE8ngS9130s9Jo
 weYqqX56EaBjYcwAUtt3YSxe+Z88f/KGbSxDj0PFDmh/nibhHYMoDBZ9bkVjEHDAmST+
 BKo3FwgQ6upzqA3fb14w4qBi3no+AFMhOURKd7E1QoUjEsHTh0l/b37AVBi/Iol5bQw+
 lEgBuNDotzLRUcXOmkDHLvg7+LFsG1xCsRjKfihqd0LU9AtOICkqCpQfET6qosmXVk6Q
 +DQA==
X-Gm-Message-State: AOAM532vIfkbKh7KI/jwmEgbZA9FO9rob11bMIATyZVsWzFP5K/NHEL0
 Bdf+uzIDz4hwvvuw/CseQKbZICZ1eZOR2g==
X-Google-Smtp-Source: ABdhPJzzm/7X+ot6FfPhfpfu2SkaOz580synt9XodY70H0u06p1g1olWFy+zOi+Fx0o/wVzTQPpiZQ==
X-Received: by 2002:a17:902:8f8f:: with SMTP id
 z15mr8596549plo.221.1598380796372; 
 Tue, 25 Aug 2020 11:39:56 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id q34sm97937pgl.28.2020.08.25.11.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:39:55 -0700 (PDT)
Subject: Re: [PATCH 10/22] target/arm: Implement VFP fp16 VCMP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cfb93cb-6a50-a229-c9f5-b8cb96dfa675@linaro.org>
Date: Tue, 25 Aug 2020 11:39:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement fp16 version of VCMP.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h            |  2 ++
>  target/arm/vfp.decode          |  2 ++
>  target/arm/vfp_helper.c        | 15 +++++++------
>  target/arm/translate-vfp.c.inc | 39 ++++++++++++++++++++++++++++++++++
>  4 files changed, 51 insertions(+), 7 deletions(-)

Same comments re the helper types.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

