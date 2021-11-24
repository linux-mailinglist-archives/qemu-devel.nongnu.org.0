Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D779B45B89E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:47:20 +0100 (CET)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppo8-0003MP-1u
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:47:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpplk-0001yt-SJ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:44:53 -0500
Received: from [2a00:1450:4864:20::32f] (port=43957
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpplj-0000tU-8J
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:44:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so1676330wmc.2
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 02:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=//D8l7M8NzWg28DDeTVf+BnHMi+oNM5SZlXH5McT3ZY=;
 b=q4ESYgQnSOXNxU/Y9n6VqJC5Ma5l+E26GZVSs7VqaMrX1iYwbNMzYxhWQ5/C3QMCcF
 dU3aoFCA3DSWCUzWj2bGh5oCir6o0+0mp3s1SbwG3lWYhoGt/UPBrq4GbSx85M9PnbFo
 A38Pbjq6YNr7/afMzm4Jg8EUyIwXTILhrgHzfwlJQD26ER4ywOIhZ73tzbSrl5JKiSN7
 EXu5Na4CHsUpSfedhvR777GG+IXPvN05erc6YskTp582w5wOYYmRP8ymNKdwmz5KidTe
 VcN6N91GihtBwIx1kVhD6YsdpQxlIOSY5E37qeyLzBI75QoiVVhlnY/PLQ8nIRmkybHG
 Z1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=//D8l7M8NzWg28DDeTVf+BnHMi+oNM5SZlXH5McT3ZY=;
 b=mW7IjthGJydKzcW2ku4oRN8jvfLZ6AJWpXRn7UzTqnE0MetGohcve/XH5JQ+gxaOVH
 z4bbQNgo/scAlHZaBqvXUa2MK6iUMvMCV9ue+tMemqoVQkR9FRYftrR174RQbDoNwCiu
 Qa2dGaXqde8QeO3Ow9cLxaLj7DB84b5gftS1AWdA6zzgLbBrjxSxB2Z8Zow5fVBP1MYu
 2uEJO4RlrCQUsItxd+L0RB+YtrrJqz8cDj7WPdqPeJ+8bE3e35KSapC77nU/CFY9rrcS
 pmWKEUPuc5Id6myLfghJHgTDjWbuuks4/YGIvYoxw+tYfNzFRs36rHIyMp1dZCOYCwfR
 VRsA==
X-Gm-Message-State: AOAM531p9eBWu/Nuy6rPFALQZ7C2aJOXKlHSRMqNhiGEGaD2ik5vXG1z
 kB4Pc5LeDWmv+uabsxgcbrkxaQ==
X-Google-Smtp-Source: ABdhPJzEusKMy3KKPivx+FUXjsrDUAymtXNne/uzskDEVomftCVJmkXIBQnNXOAJYpGN++sHT5ICLw==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr13184125wmk.77.1637750688388; 
 Wed, 24 Nov 2021 02:44:48 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id f15sm5704097wmg.30.2021.11.24.02.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 02:44:48 -0800 (PST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
 <b689fffe-8d92-c1f6-9a36-9cc95871e4fa@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ebf94bc-36c3-d942-29d2-78b3f7c8c86b@linaro.org>
Date: Wed, 24 Nov 2021 11:44:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b689fffe-8d92-c1f6-9a36-9cc95871e4fa@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 11:22 AM, gaosong wrote:
> I see that  kernel  define  the fcc used type uint64_t,   and  used movgr2cf/movcf2gr  
> save and restore the fcc0-fcc7.
> but  qemu define  fcc0-fcc7 as  bool cf[8] at target/loongarch/cpu.h,   how qemu can  
> save/restore fcc,  Do you have any idea?
> Does we can define the fcc   as   bool cf[8]  at  struct target_sigcontext?

No, you need to leave the declaration the same.

To create the uint64_t, you do what the kernel does in sc_save_fcc: insert each bit into 
the first bit of each byte.

static uint64_t read_all_fcc(CPULoongArchState *env)
{
     uint64_t ret = 0;

     for (int i = 0; i < 8; ++i) {
         ret |= (uint64_t)env->cf[i] << (i * 8);
     }
     return ret;
}

And similarly from sc_restore_fcc:

static void write_all_fcc(CPULoongArchState *env, uint64_t val)
{
     for (int i = 0; i < 8; ++i) {
         env->cf[i] = (val >> (i * 8)) & 1;
     }
}

Remembering that movcf2gr copies the least significant bit.


r~

