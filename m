Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6C067A357
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 20:47:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKPFX-0003Ut-7u; Tue, 24 Jan 2023 14:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKPFW-0003Ub-5R
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 14:46:30 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKPFU-0000ab-Cr
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 14:46:29 -0500
Received: by mail-pl1-x62a.google.com with SMTP id d9so15775600pll.9
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 11:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+f870kiiCCjcdInQxu+aIwWZhZb/gVu6WfOAU0/fRi8=;
 b=qHSt3p5nigHLuGCY9NWmyiKTadv1xSIDULNXivMlszgWHGqT4VrJBR9yVIX1JvMBXo
 w9kkaWTljOTJCnZ7OgfECXGcigR+z2g4kNRaoXjtMk6gqs9BH/hxja/L83HhOH464fKM
 6Aae1Al2sUBm5j1dwUmsqHffFCrMGe5LVcagAZ8A8YwjT8hTLH2+ZCnmq84uF12bzCem
 SVrjhI68IOs0odA/pFeUUrcNfDyYuPVqA14gq6Md0UI2fXuNAvi8jmR9GDqtkai00BsG
 DZBfRA9zmnb43bpSXqofb9A7JvV6/ednBybehx7YwLfKhQf6RA/PMqPOxXXWv1VucArh
 RTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+f870kiiCCjcdInQxu+aIwWZhZb/gVu6WfOAU0/fRi8=;
 b=50FSqeXfgaHgUbrUCFgJthFyOQHrN7GfDuPYuLr6W9LKXvJhaFxkUMC6jVg8DCs2QY
 q4hpazw4uNIa1sDtZvhd9P7OGAgndA0QisTYL+EcdvaWV2qwekwjll5My1LmMXbq3GHn
 gyNm4/mCr7SOWPkt6L92b3hZsjxh40aAEzZ8W+WyrQt/KyuvzTcu3oIJ4zkyMLSmYinO
 GNxYgkL8g7hvjSwy0uYwRa8dOt2BY8RkEjIvfernEUqQwioX4VSrS+JOCe9XKVwO1hrR
 D+q84wPg3M9vwktg6s4J6ZW3BtRzc0iPF70lIpmgaITjwuqEWNJjoTeApf+ZCYS+4ysF
 QYmg==
X-Gm-Message-State: AO0yUKVzDmckBSWSy4W+0AmqB/5dDfDatQb1f//LS1LKBpVSNbJPpQ68
 GMANtn80BGO2b2AT8AX76iiAwY6ghXKCOUvd
X-Google-Smtp-Source: AK7set8eZBEJERxzDNJhB3nkM8t0b65wLXHEjA8aulyMM0nZLC3ZiearMVtOjKcP61N3bMbsGY/Frw==
X-Received: by 2002:a17:903:2290:b0:196:1595:5b1 with SMTP id
 b16-20020a170903229000b00196159505b1mr3667603plh.21.1674589586989; 
 Tue, 24 Jan 2023 11:46:26 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p13-20020a1709028a8d00b0019327a6abc2sm2077297plo.44.2023.01.24.11.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 11:46:26 -0800 (PST)
Message-ID: <418e7e6e-26e1-2d8b-4c16-370038d838b6@linaro.org>
Date: Tue, 24 Jan 2023 09:46:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 34/35] cpu-exec: assert that plugin_mem_cbs is NULL
 after execution
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-35-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230124180127.1881110-35-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/24/23 08:01, Alex Bennée wrote:
> From: Emilio Cota<cota@braap.org>
> 
> Fixes: #1381
> 
> Signed-off-by: Emilio Cota<cota@braap.org>
> Message-Id:<20230108165107.62488-1-cota@braap.org>
> [AJB: manually applied follow-up fix]
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/qemu/plugin.h | 4 ++++
>   accel/tcg/cpu-exec.c  | 2 ++
>   2 files changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

