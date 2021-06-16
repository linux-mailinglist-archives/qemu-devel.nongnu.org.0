Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADDD3AA1BA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:45:01 +0200 (CEST)
Received: from localhost ([::1]:47508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYey-0007Vh-79
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYdn-0006Lf-T9
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:43:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYdl-0007Q4-Gc
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:43:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v9so3425969wrx.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QvWqhoy6P/HIe9yMX9VE7ZuVYXNF7K81bO4a7n36vRA=;
 b=BaG5cgL7Ji620o0oKglVy16nPLt3+U5sWpqMNnSNLNsNoobYQtXNKvi2YqFXltfG+4
 v0fsbeAT3bsyvQrFxGIrPt1ZMiHX74u8M1ZQ29arr0URlXohkBJHBJy72cP6xqNPKpSd
 EHn9QCSxP3E3QA2A/mAOFPOnYKWV3Hvl0QGOKjatxPfTH9fPiyCcM1rA3PnriR6Fy7tX
 J/iI/HcASeOc1OS2t6j4MV9P4JxLNJWth5YNm1lxgJ5W4NRKwEk3BTrelB++PgJ8POFm
 sVpD+RGedlCImtNm+xHoZ6bcEuwvFyRA9whWour9aOR8whX+OVOEvFXLw7vLdb7iYvdx
 It2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QvWqhoy6P/HIe9yMX9VE7ZuVYXNF7K81bO4a7n36vRA=;
 b=EwJtw50fLVQfVuuh+C/hAS2vfMsB+bprvESVV2Wgd+E6KBgNgxtG8VtdXr3Z/gBvqI
 q0WeAFKC/G6n3MRwRx1TVOp6DWahHQdSzGHZtsVHsG05fXpwiSysZ6d+5sV8l9/ozZt5
 pdgnVzPTOgvOgOBZOs+sI+p2t4bUecyNnt300TIQgrqI0BW7u2izG93bGzghoj6RJgZl
 uDPeHeMUwijzPWHWH9zlanE4PNQUyzsk08IL1pCOd6o0vzWTJ9doNSLMkzn4m8uZ5Hyd
 RBvqdC+oI1VICZ+zcKsZWwVcS9yLbaIwKtUKnseFL5llNeKC2ni8ss7/wEkTTkFnj3Ti
 lJYA==
X-Gm-Message-State: AOAM532SGH1cMXkDfgNi6YVb9BsPqGPjZqWGDr3VC2zt6ggV9vbc2Bdr
 bjolsQsJP43snDv4Wh4AQkA=
X-Google-Smtp-Source: ABdhPJzTMeP/cTOyRBsgj1h0hyM1iAemw5pJXaz7HpU0jAV7BjuK1JSbrhlwe4s429f0zzrE/fxOWQ==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr349427wrw.297.1623861824073; 
 Wed, 16 Jun 2021 09:43:44 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v16sm2805677wrr.6.2021.06.16.09.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:43:43 -0700 (PDT)
Subject: Re: [PATCH 11/21] linux-user/microblaze: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ff031062-f1ed-5370-d3d7-1597b21a35ff@amsat.org>
Date: Wed, 16 Jun 2021 18:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:11 AM, Richard Henderson wrote:
> Create and record the rt signal trampoline.
> 
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/microblaze/target_signal.h |  2 ++
>  linux-user/microblaze/signal.c        | 24 +++++++++++++++++-------
>  2 files changed, 19 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

