Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C8C37049F
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 03:08:48 +0200 (CEST)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lce7j-0005to-N4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 21:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lce5c-0004xp-V7
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 21:06:37 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lce5a-0008ES-B8
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 21:06:36 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso230406pjn.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 18:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L8GK6Qo0OE8WTL1fP1bkLpJbrPvI3KJiXdXio+O7MZM=;
 b=VisVlW8bymXPVVlgau1h29TKatpBP9uzARNaZ99ORU9eJPcFQJS9ZQ06tYsJof2vB/
 3dofLcy6/RyWtzmwp1xiotXvrbyzA2vD88xsmYm2tEMF/LFQAAq9CW3jVtRjaKAehN6y
 5YZev0CcmC+oGZ388iE8/2/NYXGQs0r5mXB6VIlnYRvflfPdQNzxQBEJHZIRM5NYA+mM
 c5DJMcOpZuG7LNJJRSRhmfoN7gzIsPvml13ajpnvtSAzywWZ+ZtUjyYzd5Zm30jbtYGT
 LFUDgc29vkVtHjNGQdyYUOzKjqIqT3+YUCEUAiH5XmKDp2l6sFCTFhTCzGWDZ52drO3b
 mqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L8GK6Qo0OE8WTL1fP1bkLpJbrPvI3KJiXdXio+O7MZM=;
 b=WZky90vCH2opoyHl2ObXROTv67IIA4gALGMpsE9/Sr0FIU7E+i2r7SptTqSvrER5fu
 bPf/PPeFz3aAUvNsIV7hakI1FqojBsvar+GOmjDAkaNQbg3bocxzJqKKe8KpdiBiRxVr
 1/9cXCPscDOpI5hpwaYgSio7E4zI3qPQwzeMs/DlSy1z5adqJWRlpN4VXucua2Pa40Kk
 vDXxz7kAO7OSK/ODCp0hS1uVM7kNz+EpFEeEoORYHIcih9C9ODvms0yeJwtXE+JCbMA4
 mHLnk+KLr+vFGFk8PRv5bkej1g6ncmLn0K501IWAlhXgM664C7sx2GVExiGKLofb95Gp
 bOmw==
X-Gm-Message-State: AOAM532d9wKrHPUnSQPOJXTb0VueyaQiA4HJsaobqzggrsmk2EZzJpy4
 wdfoenvM/qxCKDA4P1MPPZr0mQ==
X-Google-Smtp-Source: ABdhPJxd9521U3ZKDfQTOuwytXafxkb36Ue8PlEQ1LzW/VV1IcS5xk2ozaPCsF7Yokqgd1wNLAoLbw==
X-Received: by 2002:a17:90a:ae10:: with SMTP id
 t16mr8409713pjq.86.1619831193052; 
 Fri, 30 Apr 2021 18:06:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id x22sm3219538pfa.24.2021.04.30.18.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 18:06:32 -0700 (PDT)
Subject: Re: [PATCH v3 5/7] target/ppc: removed VSCR from SPR registration
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-6-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd6fc5a4-e1c9-11d8-8b0e-4bfc64afebce@linaro.org>
Date: Fri, 30 Apr 2021 18:06:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430193533.82136-6-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
> Since vscr is not an spr, its initialization was removed from the
> spr registration functions, and moved to the relevant init_procs.
> 
> We may look into adding vscr to the reset path instead of the init
> path (as suggested by David Gibson), but this looked like a good
> enough solution for now.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/translate_init.c.inc | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

