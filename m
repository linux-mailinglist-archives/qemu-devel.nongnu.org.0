Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAB95BDB01
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 05:55:27 +0200 (CEST)
Received: from localhost ([::1]:38366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaUM2-0007K6-O8
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 23:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaUKO-0005yw-Jh
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 23:53:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaUKN-0000w4-06
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 23:53:44 -0400
Received: by mail-ed1-x529.google.com with SMTP id x94so1946707ede.11
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 20:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=46HXVGTgf/AJhKnGVANIoXU/2gChTCU00pUengRFdhE=;
 b=edH8/GN0vj3eqfER+RRu4pOt2zcZSe2nQJXw6LnhAM9bnraoFxy7Pp24mFNxsKZdwl
 WcTc69gh75nMhtnLCq/JJY7Wbg5hyVjcVFjYAGwxc9f3Jo4y3tteMmt3tGvzxaqzPM1A
 EI+Qr7NFHpCKqPO+fq4VLVpAKLTQda+lPiklczHky16QIz21kI28yXUvA53vomvoHU22
 ZzrCBoQxXCLlOL+qOX8U6OdN9SoepUrM6TkWDwZOmpZqbQ9mlDIND/7OcGRbSnGLJhYW
 9sKR4lkkUikggGjZhKFgEYWJS64jfWkeZiTtMo74MsPD8mazvO6XIdJUyrgPcP4EN1BC
 9b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=46HXVGTgf/AJhKnGVANIoXU/2gChTCU00pUengRFdhE=;
 b=ffJ5lZ6Z0EQKlpVynK7LXwaFCJK7pg9Rqy8erMegJDewR84XVr4RYuc0q3DHUq/HbD
 uWT5h6sQhnuAmRRTrcacRBdxah96WOCYBJftgxJixTy726vvN7uliSJpR3MpsdxTZYUD
 wGDOY+JXj7OfHYHSt8MKgFRuTqa0StSxE9vOn3+JXhB0MUCKkzmPtGEcJkBWbGGa8OVx
 BBWn+VFlC5gRvDyUdS2QBkah1koQ2MjqXOpjeYtZ/vo2nIE/g22rBK51ehMfVwREE4dA
 1n0Zodf03vc5Svkw4EOesM/MI1gCmAYxsywOL7VXNMXeAcgU4wTrmtWIR1rOBquYOArA
 ieVw==
X-Gm-Message-State: ACrzQf2hEwKcKSSWVIzjWypkhPCMOxe9DcJ+ZMIMMQpwC5ohM8cxNuVr
 Gufxp6jZccnn8BXKUVcN5kCR5A==
X-Google-Smtp-Source: AMsMyM74Vb08jddEHxA470fxvHyjIhdFaeW7HJHOe2Gx7Mrw+uvWvhyoL3Qpmznr2SnFfuNk26luiA==
X-Received: by 2002:a05:6402:3408:b0:43c:2dd3:d86b with SMTP id
 k8-20020a056402340800b0043c2dd3d86bmr18438182edc.108.1663646021152; 
 Mon, 19 Sep 2022 20:53:41 -0700 (PDT)
Received: from [192.168.4.112] (h-213.61.242.164.host.de.colt.net.
 [213.61.242.164]) by smtp.gmail.com with ESMTPSA id
 gj25-20020a170906e11900b007707ec25071sm88121ejb.220.2022.09.19.20.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 20:53:40 -0700 (PDT)
Message-ID: <bca58f9b-13cf-846b-3ec2-8bf2d2832082@linaro.org>
Date: Tue, 20 Sep 2022 05:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/i386: fix INSERTQ implementation
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220918075609.549781-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220918075609.549781-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.952,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/22 09:56, Paolo Bonzini wrote:
> +                else {
> +                    if (mod != 3) {
> +                        gen_lea_modrm(env, s, modrm);
> +                        op2_offset = offsetof(CPUX86State, xmm_t0);
> +                        gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_D(0)));

INSERTQ doesn't support a memory source.  The two forms are

INSERTQ xmm1, xmm2, imm8, imm8
INSERTQ xmm1, xmm2


r~

