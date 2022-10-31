Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC2F612FF4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:47:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNdZ-0002qa-Lx; Mon, 31 Oct 2022 01:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNdJ-0002oI-Pl
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:46:51 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNdI-0005uT-0g
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:46:49 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 r15-20020a4abf0f000000b004761c7e6be1so1525225oop.9
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p0H0wr2spYBeiOuUdijZSnzmTxeV20fYrlk3zoOXwY4=;
 b=wHi38UynVzjhQ2WibRPltliTbCpsTlBVaDjQ6I+ShtJjHjcjg3HRD1AGpGPmduK1Zr
 VTsGsGKJZTb2rrpIlmeiYe1q8cil31vGV/OB5Z6H6DIdGKoJs03SDXoiC343A6js8uxA
 WJvAJV96Ryj/hWYWa/Tjr6VBWQ7guouaX+RYwVA5FVuzYMf1hr2yyXph9IuFLedAQ18N
 vwKMT9/GamflgNvrvZlqDfCJziLZKyc5ME7Yyov6yLHgQa8iJNxKEV0eXo7t+eb2Z5VM
 Sg0D/u04mlonm2LOibI1wXJsmS2m2R0reqY+LmGJVjiBrdddvQtOHYuRiIW4Rpze3KZ+
 I6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p0H0wr2spYBeiOuUdijZSnzmTxeV20fYrlk3zoOXwY4=;
 b=Cu3kbZKNuRReXeLYMEVN79PYJUhkX73fGT2bjKBcN3teHhURax7CQtCZ9vSAsKYdLa
 t1dAtZ7ch7U12b7x71mrluLaYQDs/8BdpWV/Wljvp1b3djiRFGWM2O4vi61hVRGMxqZR
 8j3xJunR+XoSxSu6hA2t63uHpMJBlMWM4ej96P43FoZofclG4GtURu+4In71c5F/QVT0
 FhzOu3CBYT8uziixJ6WlpbqkcSu8i5n1prfJYPNMoRgZK1fbuRB5n7rEaZmzWRv4d9kk
 RTgmuqAbU4nmToMvCejqFS8vBf+GZGImw/bbg/RNgree3GDSS6TzjSgUXUvWIw2+/UIi
 f+/w==
X-Gm-Message-State: ACrzQf32Spts+6072IoG0r8S+qUc/1gew5PjhXRnBT7r68QqTSzfNHDr
 cdBO2nGSQJqQGIAzhLWBWrEmXuyq6RSMsw==
X-Google-Smtp-Source: AMsMyM6eOjusLMIUR592KOE7Yz4oSCziEI8KoysXzCOxhv/RAe/QzuNZz6ZI8KUA9Pf8PP9V5PeGqw==
X-Received: by 2002:a4a:e1a9:0:b0:480:db3e:b230 with SMTP id
 9-20020a4ae1a9000000b00480db3eb230mr4726596ooy.68.1667195206753; 
 Sun, 30 Oct 2022 22:46:46 -0700 (PDT)
Received: from [192.168.108.227] ([172.58.27.233])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a056808158e00b00349a06c581fsm2025638oiw.3.2022.10.30.22.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 22:46:46 -0700 (PDT)
Message-ID: <d373fe32-292f-0320-32f6-c61be2408c18@linaro.org>
Date: Mon, 31 Oct 2022 11:40:42 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 0/6] tcg: Fix x86 TARGET_TB_PCREL (#1269)
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cfontana@suse.de
References: <20221027100254.215253-1-richard.henderson@linaro.org>
In-Reply-To: <20221027100254.215253-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/27/22 21:02, Richard Henderson wrote:
> As per #1269, this affects NetBSD installer boot.
> 
> The problem is that one of the x86 acpi callbacks modifies
> env->eip during an mmio store, which means that the tracking
> that translate.c does is thrown out of whack.
> 
> Introduce a method to extract unwind data without the
> writeback to env.  This isn't a perfect abstraction, but I
> couldn't think of anything better.  There's a couple of lines
> of code duplication, but probably less than any abstration
> that we might put on top
> 
> Changes for v2:
>    * Rebase on master, 23 patches merged.
>    * Comments adjusted per review (claudio)
> 
> 
> r~

Queuing to tcg-next.


r~

