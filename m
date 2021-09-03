Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D0940073A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:02:36 +0200 (CEST)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGKZ-0005ka-FY
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG3O-0005JJ-CG
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:44:50 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG3M-0003n0-RM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:44:50 -0400
Received: by mail-wr1-x433.google.com with SMTP id q14so408961wrp.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RwnJMURisH+yRE/JB7Bfb2/Yn8b6cYtCNFVuUTaVTMY=;
 b=Ih/JBI55LtmnnQ0LK4RpnyHfiendf9wrRqOBW4VO1nKVKG7sJlEw8SAc84uW4orHV1
 cPefCRSZY3w/5KLR9Zwy+JpMnSjfZQQBdNyJN/qO3908ROel28M+LcsBU0i3lHqWyRo8
 R8rNmin/BvEyvauhzupWfx699HyMD7Ihe9DGEqsP0mOA26wS/2pXvz8rTu2A08rZ6xen
 Q/kCfn1jPc5qNX7pXaDHMFcZ/bswtTVO8Zc/lKJVhZyifo1S+q9BLgLgxQ//AlzBgwUO
 n0bBaU1aFK4Oo1s8HWgDm3cy1yBX0hJEG/SWnAz+WBdvLFKCphXGus7e9SHESJdXL53z
 fBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RwnJMURisH+yRE/JB7Bfb2/Yn8b6cYtCNFVuUTaVTMY=;
 b=q893lxK2l7BElfQzZL5TMIJXErCBVTfMaLRiLx8jQDE1RJoKU3penTPAooXzx4YGeK
 Zd/73d2RLDm6rP9KPwwZBiPOrmlfC6vOOsbLGzTWXz9xvUgc8ql8bXufie/ZAxuM1Sie
 qHQc2tSqJRTgxAyY1/ZHSL8jsotoM10KAKgDZj5CEIelXoMLIpS+1XwudE9qc78X7YVW
 beBoaXTM/QMBloIzGUuQvoFqgNkXnHf6EfQVE6YuoAgwvmN3L7IKdCAiS6+GLxcApyTk
 f/KxoCmiK6hfnon5HKmzEGp3SP1qVPPdGwfwrve5AQ/l9/BjUchE9u0W2HmX1vzGqxep
 2Zzg==
X-Gm-Message-State: AOAM531BumrtHZE4uy7ANeklrhv3QPJFwOFz7Pbix686AD6oSXnvJfiN
 KsAVT1P9QjWlXpmRttq16XRAOQ==
X-Google-Smtp-Source: ABdhPJw4b7RJ7j2QZfIbh88h3sArDLKiz4nZcBclFdazSVYmKg35s35xOSyR0+zbVpi7KuyLdgWyqw==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr853559wrk.407.1630701887568; 
 Fri, 03 Sep 2021 13:44:47 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y4sm344490wmi.22.2021.09.03.13.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:44:47 -0700 (PDT)
Subject: Re: [PATCH v3 25/30] target/s390x: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210903175549.756092-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdbb06bf-d1e3-57e3-3473-863a47aa0be4@linaro.org>
Date: Fri, 3 Sep 2021 22:44:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903175549.756092-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 7:55 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/s390x/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

