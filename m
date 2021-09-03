Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972924000F2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:04:10 +0200 (CEST)
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9nd-00070i-O8
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9kG-0004DK-2v
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:00:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9kE-0007Ic-4M
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:00:39 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b10so8442211wru.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0YHsIeQBNfTspHsS60tynElfn/DxUFuqDQKkZn1YRZk=;
 b=z00klYt/3eVSSMe9vwYnewKuuf0QGtV0PQHn5C0R6P9xEZIX5HQAGQHpYGhGrwJWai
 tFGLxfjuiqRAtsTQJ+gbAEfbv8ConWndlCgGhIxAa+2Wgg0/LQsmXweT2bgtLejKEP7O
 qJlbymmsKTCkAaL0CZ4WtxoH/ax4d6wIL7HVMWDEHmU1G++Z0+vgO6o4HzIxnCb0N61w
 ufozKe+B53Neef1QuGQMHf+I3bqwsei2LXvbyH9oFrJbohh5DMDDdi3Vr+1+Iq9LV6U0
 1B6AJgoCrx0VRqkD5QNj1xLiNQ4rdzQGZb58na1GJINNzAZOppY9rIkOvqdqSXXLSLCs
 eepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0YHsIeQBNfTspHsS60tynElfn/DxUFuqDQKkZn1YRZk=;
 b=HdSLPnevf4BFuT9rHCjoOBI8It0pPHmvrVZItwj8cPvgfT1h6BHjh2J9u5q9fJUUts
 7GvLlK6JXyVhnGCpgA/HHmXdN6Z3JYGFrZwdGVC8HGWZZ5R/8qULAepx/ybUvRt9iIBf
 Kr+QtoKHWBabj5sER+rMTHLB0TM8oYBcr+6Yz7fWUcd9AHabMbtLYSuWOTLF0AkjZFVv
 W16gxP4TCSAHxLDMfcpCJIlR/0gj2Bv+YoINggnWG05PngZwL9WfoEHh9fPs+3mMT8av
 nHOMgd//Nix2rw7LIff4bA2QU44m3ob3Og+0hKAVIluxUJ9S1NjB9b5g3uFOrMWAwbwT
 AUHA==
X-Gm-Message-State: AOAM530cQgwB4Y/2RK/93X9TTdJgRBvWEwUd6SS9y7OASkCoOmmPNijJ
 A8dZ1GOMDzH44thwCVRIjPr6a3/xzDVAZKs6T9I=
X-Google-Smtp-Source: ABdhPJzGp82KpycShWUqIjxq1+DKLKib8BIsIx+TjdMEY6dlRPDAuVksTsvD6MJhtI9X1+8y6YsKyw==
X-Received: by 2002:adf:c109:: with SMTP id r9mr4303008wre.184.1630677636757; 
 Fri, 03 Sep 2021 07:00:36 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id g11sm4789497wrx.30.2021.09.03.07.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 07:00:36 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/arm: Optimize MVE VNEG, VABS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2fa411b-5fec-3cf4-16b5-94c9b3b082e1@linaro.org>
Date: Fri, 3 Sep 2021 16:00:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:09 PM, Peter Maydell wrote:
> Optimize the MVE VNEG and VABS insns by using TCG
> vector ops when possible.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

