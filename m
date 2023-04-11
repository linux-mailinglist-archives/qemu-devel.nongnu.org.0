Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A76DCF57
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:31:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2r5-0000az-9l; Mon, 10 Apr 2023 21:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2r3-0000Zj-RD
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:31:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2r2-0007Se-Ah
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:31:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 c10-20020a17090abf0a00b0023d1bbd9f9eso9395584pjs.0
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681176685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FKeof4Z/P0qBb5KwxKZSr+SwPVDpBJ9d7ViZI7Ka0Ws=;
 b=Q/cGMhwJDcercaatu8nJyqGLEf6CRwMyu73va32LYYNiZu06QjQcNu3WYlS33sskB2
 8Y1gHC8VN4gbbomkl661VcY13hWZkdKDY4w5WraBPUSzQN+xclZrCQ8J6qfbOA39Q2eL
 HOmGlbmdgz4k1QqXt36fCBK5Yxk5/lFTCCQrpowc4Giv1MaBk7sqHholCUK+MHyx+m26
 OvZTvRkND6vAQpMYMcYRGJOvXCISQbTc3kKSjsYHGrTv2UMVBvFOYUL2DpsS6yoV2hR9
 2Pctu6s1mtuT7Jqi9llCwJkRDWou5fOoaQ6Wd6Az+SLY0hD6vQCWdTX8bkfWOzrthWQ/
 dlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681176685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FKeof4Z/P0qBb5KwxKZSr+SwPVDpBJ9d7ViZI7Ka0Ws=;
 b=dNbSL+xeEqKF3iA3aQqIVHnPC2mcFxILpL4JwVQQmpS2a4OX6zUUu60VzR706YJ2Os
 nUjKqgXCEY8GIU2K3FQMpv0XveF5ePAKvokA7lqa2n+7zPJRtpPFozDFljfHQnYdSypI
 r/KsEAu2LuBDbwQntTeEvbsggVBkDHgw//A0LwbLd+NLiYd2kJ1tmrjjagZYlmyEtZtE
 2JEh6cYpt4woXqjH/4i3rLYBepvq+4y1KFCQ+ijbGy/8Fb+UGPWkjrAE0RlO1x4XObX9
 DXdfT4DrA1Z0GZP6Qoa/bc21hVYiMPCN8IQIrCSzyWOpCW344RgdlU1KO9mk6HOth/Gv
 dlWQ==
X-Gm-Message-State: AAQBX9c84YkemtmO2oCCAS8vpAS417JFIImyMtWnHbWIp2qs4CIhQVZ2
 LjoQ0sUHYg5sve7amewajJpXnEx0gSn59JP6MYEtmw==
X-Google-Smtp-Source: AKy350ZRi9r2qvLWkCTPrVT6H/3nYUG5dNJCSsbeMsFEQsWgtMXIVzuMOkIGkVWVErFmE6H1Lg1C/Q==
X-Received: by 2002:a17:90b:4a86:b0:23f:b35a:534e with SMTP id
 lp6-20020a17090b4a8600b0023fb35a534emr16675830pjb.29.1681176685531; 
 Mon, 10 Apr 2023 18:31:25 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 b10-20020a17090a6aca00b00240ab3c5f66sm3384783pjm.29.2023.04.10.18.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:31:25 -0700 (PDT)
Message-ID: <cb8e36d7-16fa-ecb2-c449-cd37cbff1f0c@linaro.org>
Date: Mon, 10 Apr 2023 18:31:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 02/19] bsd-user: Ifdef a few MAP_ constants for NetBSD
 / OpenBSD.
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>, 
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 reinoud@netbsd.org
References: <20230410182056.320-1-imp@bsdimp.com>
 <20230410182056.320-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410182056.320-3-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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

On 4/10/23 11:20, Warner Losh wrote:
> MAP_GUARD, MAP_EXCL, and MAP_NOCORE are FreeBSD only. Define them to be
> 0 if they aren't defined, and rely on the compiler to optimize away
> sections not relevant. Added only to the top of mmap.c since that's the
> only place we need this.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

