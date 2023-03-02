Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31176A88B7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:47:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXnxr-0005Na-ET; Thu, 02 Mar 2023 13:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXnxn-00057y-Aq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:47:36 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXnxl-0005Sp-A8
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:47:34 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so3811820pjh.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 10:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kZWm3WWjQtpIfRaau961S5oQLdCKBqeEN4zL+V0mMn0=;
 b=C8XOWW5520wonb1OsX5rPnaCp2cYoBXtW6t2jm2bgHyxxTp60Fzyb2Sz24y0Al7719
 bE3bvKV/l0g0qEK7DlLXARKy2xLL6nUAD75erJNufYUeUhQkmD1eLkHf3GoOf89wsfrp
 BiSxvXMV0Cidc34T6z97db3sjJ0elJTbX1zlZ+cS9qJ3jgo/9dlBw8Fa/aH3zeqhZsyM
 yBFRTTjdPrZybi45CxXroJDnQNn0LFxG53jB5ffPi0nLifS5aWrjf00dhBdPBUkmRX6I
 ZNdCSBcQ35o51YjYzrwqN/m87QLVuIR+oa17EwghywedWlJTSB2dqsfKLDcy3fNKyU5X
 5Xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kZWm3WWjQtpIfRaau961S5oQLdCKBqeEN4zL+V0mMn0=;
 b=KxxMgCSLri0C4W7LeYmw+ZjakNdz5hCd8ZbuOcSrwThc/p38OvP7UoOT9NK1xM+d22
 nkwz7G8o9C17CV0HhmjTjTnPdW5Si/GPWV97KVLAso0qUVnxk6laj1rjMD68c0bWv7pE
 +acK/n7YIZs0IK0BC/7Ocxng4fF1T3h6TkcP6djKMBIr9MBzuGQPJ/2U/vQ7RTZkZ01c
 7v51adkWaK4GxcU0Exc5mJ3qkEupTYO6DBbWNmO3DdsPsi2OCL5OFZ0irETjWyKcTjEz
 dsYZNR3vWYq+b6N5eEG5zADdUG5qOEsvBloXQfUln69C/VtwljKppBoI9MwrRI7dpf/l
 ygBw==
X-Gm-Message-State: AO0yUKV3L267rLUQz7Ajh3KA+N0WuZiicJwZDH4y1FkaAdhjZmTeZlBx
 k2u0mv/9eYbUiCpZWj5ekdPcRA==
X-Google-Smtp-Source: AK7set/t69hB8brHlLrPOUFJSKFAT5fEfL91xlgAAnjNvUSbePOeCLWAcN8xQP84Mln67kr+vBFwLw==
X-Received: by 2002:a05:6a20:b930:b0:cd:7d01:7654 with SMTP id
 fe48-20020a056a20b93000b000cd7d017654mr10510379pzb.14.1677782851468; 
 Thu, 02 Mar 2023 10:47:31 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce?
 ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a62e409000000b005a54a978c1bsm54461pfh.7.2023.03.02.10.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 10:47:31 -0800 (PST)
Message-ID: <d23b0ad9-5346-d0ff-5f58-5192caec4502@linaro.org>
Date: Thu, 2 Mar 2023 10:47:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] tcg: Clear plugin_mem_cbs on TB exit
Content-Language: en-US
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org,
 aaron@os.amperecomputing.com, frederic.petrot@univ-grenoble-alpes.fr
References: <20230301024737.1210851-1-richard.henderson@linaro.org>
 <20230301024737.1210851-2-richard.henderson@linaro.org>
 <Y/8/iCIOVdAwcgW0@cota-l14>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y/8/iCIOVdAwcgW0@cota-l14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/1/23 02:05, Emilio Cota wrote:
> As I mentioned in the patch that is being superseded here
> I like this approach -- it is simpler and generates less
> code.
> 
> I'd also like to see the plugin_gen_disable_mem_helpers
> function go away, and a mention somewhere that now we are
> intentionally not clearing cpu->plugin_mem_cbs until TB exit
> (before we weren't doing that either, but that was unintentional
> due to a bug).  So, for instance when doing a goto_tb from a
> TB with helpers, we leave plugin_mem_cbs set. This is not a
> problem in practice because if subsequent TB's use helpers,
> they will overwrite the pointer.

If we can do that, go from one TB to another without clearing, then we don't need to clear 
it at all, ever.


r~

