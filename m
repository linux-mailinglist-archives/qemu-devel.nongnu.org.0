Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB205414017
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 05:34:14 +0200 (CEST)
Received: from localhost ([::1]:37430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSt1R-0002bL-Rr
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 23:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSt0N-0001et-G1
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:33:07 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSt0L-0001tw-UJ
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:33:07 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w11so808120plz.13
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c7zeZ9wywPJeHOx/yBEKnKI4wfHWZbOWe2i3hwUF6hg=;
 b=F0vLZ41iyKgnuFRmxMzWIikvTp0s99Gqdbpf1RVqm+TspPRcmQjfDhmDkFxTPasGjr
 WYt40xyyPZYbrTMXOigDEyVkppuvIo0ISRmEr3siLs4ZlL7GcjxZ7oT+TfzNm6d4hIW9
 XXyvesFereJ0M/3+SNznW7Hl1dh1by/rg7mTNKhJ1E/htc/YX24Y6JuDSPLvdgLMFsK6
 0vYNksm0ZiUJgi/JkM1teAfhpI759SYS6rc3Ob9zU6G6Zox0GFluKU/L6gDEpEO0HEup
 fnZFWUJxDxgIYzGparhw1DUnwXGigxQXFo/EHFyQDY0N9eGjx7Laobjbq0IAQGNt5Oer
 1d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c7zeZ9wywPJeHOx/yBEKnKI4wfHWZbOWe2i3hwUF6hg=;
 b=ixi/5B2QPGBofh1p5dWQHG51aLty8/0bmSal9LJyufmb6FwEX7V7d8yt1alckXwNjs
 Eq+MPbX80N3kJOg/GurAcIXNvwyz04k+qKuLfbqGVO2nkQacz48itCMv1vwPlDVN7gS8
 UeR+th+v8jhu1Xxo6wnAFBtEYHizj00ndI55rIrolfIKZKaz6RRBy0NG53KQkoSM2C00
 FVROX0eRnnHkk5oyom18594qKD907RJjFiws6zFf1GgmNPaB69SuNOOJ+PgjO55HgWBz
 7+5oYxIVnPutvij4Nr2JIYQcsrwqW2IApBobss86c3NhaAzRPqjaJ5MVwzQ0QOfx0ool
 WucA==
X-Gm-Message-State: AOAM532f8H3YveJXtBrsCktpQ0zc/j2ZtHXzop8FUD9qlCQ741sHe/bG
 QnByrKZwCjX5acO3U/SaOD+IfQ==
X-Google-Smtp-Source: ABdhPJwo79MiqANpffl4avjAvARxUx2KAsEh4cIhKpytmr5b4GrPcvj7oUKRejgsyF6Rih3k/+EDWA==
X-Received: by 2002:a17:90a:8c8f:: with SMTP id
 b15mr8794507pjo.47.1632281584011; 
 Tue, 21 Sep 2021 20:33:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t28sm566484pgn.19.2021.09.21.20.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:33:03 -0700 (PDT)
Subject: Re: [PATCH 5/5] [RFC] target/arm: Advertise MVE to gdb when present
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a8b94bf-6d76-b028-82b1-1864b24ff8e2@linaro.org>
Date: Tue, 21 Sep 2021 20:33:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921162901.17508-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:29 AM, Peter Maydell wrote:
> Cortex-M CPUs with MVE should advertise this fact to gdb, using the
> org.gnu.gdb.arm.m-profile-mve XML feature, which defines the VPR
> register.  Presence of this feature also tells gdb to create
> pseudo-registers Q0..Q7, so we do not need to tell gdb about them
> separately.
> 
> Note that unless you have a very recent GDB that includes this fix:
> http://patches-tcwg.linaro.org/patch/58133/  gdb will mis-print the
> individual fields of the VPR register as zero (but showing the whole
> thing as hex, eg with "print /x $vpr" will give the correct value).
> 
> NB: the gdb patches to implement this have not yet landed in
> gdb upstream, so this patch is RFC status only until that
> happens and the XML is finalized.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   configs/targets/aarch64-softmmu.mak  |  2 +-
>   configs/targets/arm-linux-user.mak   |  2 +-
>   configs/targets/arm-softmmu.mak      |  2 +-
>   configs/targets/armeb-linux-user.mak |  2 +-
>   target/arm/gdbstub.c                 | 25 +++++++++++++++++++++++++
>   gdb-xml/arm-m-profile-mve.xml        | 19 +++++++++++++++++++
>   6 files changed, 48 insertions(+), 4 deletions(-)
>   create mode 100644 gdb-xml/arm-m-profile-mve.xml

Looks like it'll do what's advertised.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

