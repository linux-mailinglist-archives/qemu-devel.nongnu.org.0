Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C046D63D3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:49:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjh27-0006Ld-Nc; Tue, 04 Apr 2023 09:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjh25-0006LF-V9
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:49:09 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjh24-0008Pq-6M
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:49:09 -0400
Received: by mail-pl1-x630.google.com with SMTP id f22so27190799plr.0
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680616146;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KQjijvaNrHxTaTzO9hawPAv24U1pBLA4Fe1sbbHcTBQ=;
 b=epcmK4eBkYuoNLx5ieDjAK28vF1lS8k50L67IWSQKiRE0eaLctWkjw648Vzgm+ci1F
 zrohA57rIJ4GsTPqi+sCtAmZB1NT+eSxtav35WZGb1YaSUCSHC5xeDLCr4YCI+4gIHJ3
 nop0mm+L+IdS04wVpq32gFvUoTM73L975w+xw97T/jFfDgqbzyhJznvu8TK2CNlLZEw3
 h8cmW+5vcdIqDw65cngcfW/zOp3OuYxOxZtx6wMvx3CFTcba4Z6juEh1Xy8AtjgdNZoy
 fhFrY6xy2aP3M7aoTFeEtFcCay3+WtBCh9/LLwaR9oGCJhs8/HL6nshRW8ZZJwu1gLDU
 Cw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616146;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KQjijvaNrHxTaTzO9hawPAv24U1pBLA4Fe1sbbHcTBQ=;
 b=w0aIAQm4YKFpm1vW7T7QJu6W5OqAK1lb54R+yU/DFlV5j8YeEzBzoaObxOgutsS016
 0+E1xo+s1AEWoh55//I7InIDNv+L2G3245UWoopJZX/+/eTjXg6pX4obrTMBGO0x/k81
 1GCYsxrHeYoX5e6PANZZIxQDtXIzwwAajKXD1amkz7dqRXpCeGcvxikxO8vU6Xc/SNeQ
 k6Crb9UIHrO5EyFq7v/Zllzpmhn/zxNuovQACw8CKgSBWP+KTE7PKD9+4pPr5i9ISDAt
 FSh4eR+dRoS6nU+aEZbo+0dw02ZR5eD2BkE3oaW07Bfy6RBFRZJGfA/V3yHiVE+323oy
 i6Qg==
X-Gm-Message-State: AAQBX9dGELYGRminFCnbSPmq/Eb2VGL2ZOuN4K7M8EvPfqx8K84X1d1y
 osFeAyjVAkVlgWQukdOnJ4jjor+TsRz1I+JZMmU=
X-Google-Smtp-Source: AKy350Ymi9GUZnUnjxDOyGORuQ/r7rh9mh+fY+B1+LzwdtupVEQpSMjcBCGCIWclWmIA8enVL7PycA==
X-Received: by 2002:a17:902:d405:b0:1a2:85f0:e73f with SMTP id
 b5-20020a170902d40500b001a285f0e73fmr2193103ple.35.1680616146299; 
 Tue, 04 Apr 2023 06:49:06 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a170902834c00b0019ac9c4f32esm8297288pln.309.2023.04.04.06.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:49:05 -0700 (PDT)
Message-ID: <5b661650-dedf-8240-8b6a-de0687496f5b@linaro.org>
Date: Tue, 4 Apr 2023 06:49:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 0/3] last minute tcg fixes
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230401045106.3885562-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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

Ping patch 2 & 3.

r~

On 3/31/23 21:51, Richard Henderson wrote:
> Fix a bug just exposed concerning qemu-arm commpage, leading to an
> immediate crash on any 64k page host.  Fix two bugs regressing
> pc-relative tb generation, found by Weiwei Li.
> 
> 
> r~
> 
> 
> Richard Henderson (2):
>    Revert "linux-user/arm: Take more care allocating commpage"
>    accel/tcg: Fix jump cache set in cpu_exec_loop
> 
> Weiwei Li (1):
>    accel/tcg: Fix overwrite problems of tcg_cflags
> 
>   accel/tcg/cpu-exec.c      | 17 +++++++++++++----
>   accel/tcg/tcg-accel-ops.c |  2 +-
>   linux-user/elfload.c      | 37 ++++++++++---------------------------
>   3 files changed, 24 insertions(+), 32 deletions(-)
> 


