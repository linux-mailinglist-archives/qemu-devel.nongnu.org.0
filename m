Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B716380DE5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:15:21 +0200 (CEST)
Received: from localhost ([::1]:41996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaTA-0005Cl-5M
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lha8q-0005NB-Ix
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:54:20 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lha8m-0000c1-9Q
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:54:18 -0400
Received: by mail-qk1-x72d.google.com with SMTP id f29so16899060qka.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PwNmiC6brTsHqT+eFjUUs+K3ZOz6GTSYbhCREKtSags=;
 b=UUV3Ta5Ypv2xXlvWLGcoYC36Amlg/fWbPkAtD5HTxY4fujPW75yQyLffYotKXkWVg6
 TfTBAa24LqF8l1WMZlK1gR8GaXDUrpn/usRqp93zMNxA7HGvHKYDF/00gIZC2RKTpwNE
 mEwXAyLEqALeqfKFUXpTgsVPrFNwB/muV1SnOK27nWC47tvQpWiDJtxuQZQvuXk0ZxcM
 luY1+yo9yr7E2GwbIbnNOrOGFy9nNg1E8SKUOzHzULkK+hNnPHe6F/cJp/+yfqYBKp6z
 XnfEaP4DjItTv2hFFXyYFo3q6erhIpPmEmDRd+xzzACIiDw34wsB7fKy5kN66DIuBGoU
 38sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PwNmiC6brTsHqT+eFjUUs+K3ZOz6GTSYbhCREKtSags=;
 b=EL2iyoHCSPRqqZ/RyBQG2A1CMbicITlMrwuF89EVwokrOaLbxBgNly6BSLbjiqMPX7
 BWy2p8NTR+uf1FlnJCSu79Sx8o/rsYyKRVHrcEDX7Qs0mhkKIPo1YoNFvAic/7aLOPBI
 0C43e1SqHnvQ1sEAgQkH+MleDLTYB2L82+KPyVDX0mmvNLLyDOEv3Ugb86XD65sZuhBp
 HTH2Fn2gk46Np1X1MMx4RJB+H4DpQdzjsElok6q3hW0pA2u3D6IKaZU/8Hh5DzF07ywK
 tUtmojR0ZyAQlSZ8h6aV8MyusF8Xp3yZXMAvIRXrNe4WFBIQj6Od94XbA8YyBTu3bArT
 ENpQ==
X-Gm-Message-State: AOAM530WmA6Gvg3A7+kxCyNaOpcwznDD6Zj64CQkzf3W2jhT3DqCc4tP
 4TnEFCSnpGgkfxvrTy+qPc82cA==
X-Google-Smtp-Source: ABdhPJwAcrVlFEn9njhfq374gs/N+Lfy3nIOZpQQsBoYmsnFc7Fhl+tIyGxynaNkKadmuTXET2KW7w==
X-Received: by 2002:a37:9ac1:: with SMTP id
 c184mr45200808qke.201.1621007654166; 
 Fri, 14 May 2021 08:54:14 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id z18sm4750019qki.55.2021.05.14.08.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 08:54:13 -0700 (PDT)
Subject: Re: [PATCH 0/4] linux-user/arm: fpa11 fix and cleanup
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210423165413.338259-1-richard.henderson@linaro.org>
Message-ID: <21e7d514-8c43-6db0-2477-7b548b187edd@linaro.org>
Date: Fri, 14 May 2021 10:54:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423165413.338259-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 11:54 AM, Richard Henderson wrote:
> The bug fix is patch 2, the rest is a bit of tidy-up.
> 
> 
> r~
> 
> Richard Henderson (4):
>    linux-user/arm: Split out emulate_arm_fpa11
>    linux-user/arm: Do not emulate fpa11 in thumb mode
>    linux-user/arm: Do not fill in si_code for fpa11 exceptions
>    linux-user/arm: Simplify accumulating and raising fpa11 exceptions
> 
>   linux-user/arm/cpu_loop.c | 125 ++++++++++++++++++++------------------
>   1 file changed, 66 insertions(+), 59 deletions(-)
> 

Laurent, this is all reviewed.  Do you want to take this through linux-user 
queue, or have Peter take it through his arm queue?


r~

