Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377833DBE85
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:48:57 +0200 (CEST)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XZ2-0004AH-8P
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XSr-0005yk-GB
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:42:33 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XSq-0003PN-1j
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:42:33 -0400
Received: by mail-pl1-x629.google.com with SMTP id z3so10808284plg.8
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JJztzzQ4s1qn5++Hln44EDeIN/ijZDicHAofzr2rlPE=;
 b=mpb0CQn/PWMeBqBzjCOGSQDIp9CBvVeWBVR8jXcfXC2L9GJxBEnSAPsmQtVe6Efxui
 lHCzB2V1M7moDaiGP+rsMIc2UMHneTeM/0OyxY/l1myfW1GWHZnuLobYLNDY7VZYrRa5
 Y8wTeaXbr5Msglb/jXCs/CdLBcFkq4/j76q/5/P5GbqAQcIl1X0OX1Npt+XjxycE3Xj6
 rrxmfkH5dIYXxG4FXoXtp9JqjFU9ecfnvhPg4CIGA/Chox7VHH9Ktj7UOVr3EGt0fcLV
 iH+LgaT3h6TOzOfIZAm9w5xUHHO//zwIUtmjhFmlWfU27yef1zCNLaqQoJ9T+GPiP2LF
 AbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JJztzzQ4s1qn5++Hln44EDeIN/ijZDicHAofzr2rlPE=;
 b=hX3drxMqXNGlYsTziUiVlLSXUxrn+GBOkc51fl5S9gxCmQbbADiewOxMsz0v9NZ0pf
 dCYyiSrM5cvdUNo7mD5NHTFchk+G2NQWa2ym2r4J+c787sAFkWq/BUjrR+JST/TKRzRp
 cAhWTrmgP0P+FprTB3nKvYG+EmkSccF+K7GKte0Pv99L93i8486W+1d+7MhFF2JhNhmQ
 3DBnampl6OrZLG00gHwrmDJlSFQLXzVnl5S7t+FxEJqJeF3+OosypEJzsbnNvmgUJG4N
 dVRY6ieHtLy596nWg8MPGBBWxm5K5fWCuEaiihXGPLFhmifKFlxor34biUC9Z2kjRbVq
 6dGw==
X-Gm-Message-State: AOAM5335L0jYTCqPFMcZPebL4YeML4RXTIut/1TBT0wjhow7sLBNbtO/
 /ksBVwzsROCgFBwV5/iBk2X2xw==
X-Google-Smtp-Source: ABdhPJwLgHrmMyyzcdPUqexw9JbHo2CKpGLBPV3rIBzW41EtbBlvboLIl9Ur9Yq/CtcH5n4q3Ws0zg==
X-Received: by 2002:a17:902:c409:b029:12c:8d18:a03 with SMTP id
 k9-20020a170902c409b029012c8d180a03mr3699656plk.81.1627670550704; 
 Fri, 30 Jul 2021 11:42:30 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id r13sm3584699pgi.78.2021.07.30.11.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:42:30 -0700 (PDT)
Subject: Re: [PATCH for-6.2 3/8] softmmu/arch_init.c: Trim down include list
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f5cb69e-666b-305b-dad5-b93d0c25b4d8@linaro.org>
Date: Fri, 30 Jul 2021 08:42:27 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 AM, Peter Maydell wrote:
> arch_init.c does very little but has a long list of #include lines.
> Remove all the unnecessary ones.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   softmmu/arch_init.c | 7 -------
>   1 file changed, 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

