Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342D339E6D
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 15:07:15 +0100 (CET)
Received: from localhost ([::1]:37402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL4vC-000405-AR
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 09:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4tA-00031y-Sv
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:05:08 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:39632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4t4-0003iP-3U
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:05:08 -0500
Received: by mail-oi1-x22e.google.com with SMTP id u62so14092528oib.6
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 06:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ryV1eJM1ezb2jzbb0Zh8DhWuSTU6E/mFMwdCn75N0tA=;
 b=KDWJj9R+Ms31Pwry7T+dBk2sY57le9AtVQP/kDVSejVOA7bl4lA8yEDiydce/JhEqv
 gYnLrm8g9p47D1ssKEMUYLa9Q9wpIQZ0ie3i0mH8CfgEDvxRx39Ycep3PCZ3AICc/V6K
 YzNKiP83mrv0dzqNpFRN9XOCZO0YCBXnMJFgh+XKiCu0uZH7/dhCcsndObe0TbyZTDtI
 oBPyoAC0LboiwKWkSCElwelRaDv6XGTPI8HQx/Asq5SGS6JofjD+qE1t7e7NBZhpA5iv
 6nubqel3vO44FuHje7uSLNmcsnxBQWDb1zBgbEr3VO/0JNE/AtUov0dVIoKTYacXATTp
 5/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ryV1eJM1ezb2jzbb0Zh8DhWuSTU6E/mFMwdCn75N0tA=;
 b=tw82iU95faEwn9R4QYnYjJ5t6zYr1AbioGmkmoMt9pOdiIhQJy3/vim6LyQ6eHNlFu
 dV0y18v2Tc4B2wC2JG8GziiRzyFr4hbmgdI+SpudhbDEviLRMGHjfso8VXzyiZsWBJR0
 W59xfsHDae+VO7KcmLzBFk2nFB8wSJHo9+ZMKNhzr/4KmBRdjHko5cgoMLob/vdrtA5L
 fIUr5CkXWzURE0KDOgxLbyQYkYXIyjMzQM3mU55LFMOGmaS7MnQ+XUlClGwjPt+CVc0E
 SSTg5lOHaD72JN17iteSAlBPXsqeJ6HyAp+p7svs+Ljvz02VRaHr+XA7n7eXBmvcpT4r
 F5SA==
X-Gm-Message-State: AOAM533xJcadWQeFmxokOs8uhIARq6wL1q51ha9DnGO3A/yM54Bpvvs/
 VWQO139qREqO2ifoVy4q5Q3XtHhr75Ka/dw3
X-Google-Smtp-Source: ABdhPJxYPn6su9rWZiLg9JKinJ2Q/IFvD6/wIXxKaEYqQulI2rs+si5EFcl8ipDJxz0M0tZMYSqK3Q==
X-Received: by 2002:a05:6808:1448:: with SMTP id
 x8mr2305185oiv.99.1615644300604; 
 Sat, 13 Mar 2021 06:05:00 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id f197sm3816522oob.38.2021.03.13.06.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 06:05:00 -0800 (PST)
Subject: Re: [RFC PATCH v2 11/22] target/mips/tx79: Introduce PEXTUW (Parallel
 Extend Upper from Word)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210309145653.743937-1-f4bug@amsat.org>
 <20210309145653.743937-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be72351f-9763-5ce0-cba9-08d10d480c4b@linaro.org>
Date: Sat, 13 Mar 2021 08:04:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309145653.743937-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fredrik Noring <noring@nocrew.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 8:56 AM, Philippe Mathieu-Daudé wrote:
> Introduce the PEXTUW opcode (Parallel Extend Upper from Word).
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


