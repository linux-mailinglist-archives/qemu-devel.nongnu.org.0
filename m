Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5865854A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 18:32:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAaGN-0004yI-33; Wed, 28 Dec 2022 12:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pAaGH-0004uV-Dd
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 12:30:43 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pAaGE-00043q-Ju
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 12:30:40 -0500
Received: by mail-pl1-x634.google.com with SMTP id d15so16620577pls.6
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 09:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ngfbmhws6TcjVG5WcK2IjG5FvOe8rBBoqVrFnsWvlsg=;
 b=yI+NK85JDXLdSrvnrLEFSI1+DHz+alJ3njieIQsvq/CrXbxIdvGMIbzh/S/6mjn73C
 X3cqWoijCaGM92uaC/XD6VfwB1wJlD57q7GANxVOH6kvuyBauXM+ewbwovEwkSDq536C
 8p8XvzIH2S4om1yxdQIPrZcBo7XdhEXTjDUZoQSw0zx8jhV+cQJZKll2RJCxxq4QEmSl
 SD9ycEnpANPdW02WsUCKkl733MviYbUf+9mDM0okrdVgMrDiBMuTTQ17xwxD5/spGNcZ
 yP2lwHDmp4raw/1OE8OKKsQYvSjAJeUt97Y/x3V4oIM87BmPAIeqeYmDRZZIcv5Ob1y7
 sz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ngfbmhws6TcjVG5WcK2IjG5FvOe8rBBoqVrFnsWvlsg=;
 b=HMydkaFRkutTbN+QNDFAiEtWKnIY6lXqWQrpmRyMXhYkv4XllK5WT5PA5KpHRp3m+b
 SWiuQuM8w3aFkN3K4Nq5VfZVZcDxiTgalj3neFPThRFDGqjLs+SpgRYjDLwu/toGQpPv
 MZx8CRLZ3aE7fDYPzYVTkkTiYUDpMJTp0zdFHUG8vBWDPxwfBygOFq3hajbfi57EfhOE
 N4ql/YGjn9mQKz2X45wStzW9vl99Mnl4pup31gBPac8BXEVi21SfwNlE+LpQJmYhXehz
 /pfOYKgODg7bmkxURDjRJD9gtL2XodKrYrBEHVuYCqJypMxQ1nmLhnt/vrjUvu1h9bjM
 00gw==
X-Gm-Message-State: AFqh2kowdsWthCrv2tLHJlOdpVlQOG3okRM7ZJSnnJjNnQN8PpRXBhSI
 u9HInPPmOXk2Uq6wG2mcGqGmaSrqw2k+0tfk
X-Google-Smtp-Source: AMrXdXv0oKKFLg8SATAy96j5kRhTgqOXvV86bWNOQZYXQvdRJpOF+6YbE7FoKXt1xj0H/dypSbm8gg==
X-Received: by 2002:a17:902:d590:b0:192:90b1:9007 with SMTP id
 k16-20020a170902d59000b0019290b19007mr5083852plh.27.1672248636150; 
 Wed, 28 Dec 2022 09:30:36 -0800 (PST)
Received: from [172.16.2.190] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a1709027e0800b001895d871c95sm11344225plm.70.2022.12.28.09.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 09:30:35 -0800 (PST)
Message-ID: <d8e55869-8553-68b9-1b42-0075705dd03f@linaro.org>
Date: Wed, 28 Dec 2022 09:30:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 01/43] target/loongarch: Add vector data type vec_t
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-2-gaosong@loongson.cn>
 <99e4fdf2-fe70-03c7-1168-f300ac7a1ead@linaro.org>
 <4852b017-1841-cf6f-fbc2-e1789a7f9496@loongson.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4852b017-1841-cf6f-fbc2-e1789a7f9496@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/27/22 18:34, gaosong wrote:
> The manual says "The lower 64 bits of each vector register overlap with the floating point 
> register of the same number.  In other words
> When the basic floating-point instruction is executed to update the floating-point 
> register, the low 64 bits of the corresponding LSX register
> are also updated to the same value."
> 
> So If we don't use the fpr_t.  we should:
> 1 Update LSX low 64 bits after floating point instruction translation;
> 2 Update floating-point registers after LSX instruction translation.
> 
> Should we do this  or have I misunderstood?

You should use fpr_t, you should not use cpu_fpr[].
This is the same as aarch64, for instance.

A related question though: does the manual mention whether the fpu instructions only 
modify the lower 64 bits, or do the high 64-bits become zeroed, nanboxed, or unspecified?


>> I strongly suggest that you introduce wrappers to load/store fpr values from their env 
>> slots.  I would name them similarly to gpr_{src,dst}, gen_set_gpr.
>>
> Got it.


r~


