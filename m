Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D23AA295
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:42:15 +0200 (CEST)
Received: from localhost ([::1]:45342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltZYL-0007F2-LD
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltZXC-0006NI-4H
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:41:02 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltZX9-00047o-Tx
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:41:01 -0400
Received: by mail-pl1-x634.google.com with SMTP id c15so1405538pls.13
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TfYWu4LZt60DcT140T1hl/rnF7DyK95ypZd+TzuelCk=;
 b=a5lTm0iyy7pmQ+eHbIkfnXJ3Hg196Lz18wJX/d6WJ1hogbvLT+1EZEoe13JJbPRyoB
 1Sho3xRpIODPvAFAlPyqWJO1SLKsBLog6O2uITcJt87vfBt37OnWVTijUzL+HY+IU7fv
 3L8ai+eK3MXTb7nqpeNwAPKu8BCfzgY5aDcXmQ8kx2PeC0Qm8G8pwfcjZT36+VSvWEIt
 c0nvIklLdGGUx7PF5MlQ1nmBbx/R4WmTTh6Y0hp22SLhh4t44MrTr6Z0YNKw5ouPqAzy
 GSOGehL1zI8hn1z8GANf3nXq2+VJlbh3XnG+AnR5+FYD299NrBoSvROP7fWtSt5MZgVo
 xMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TfYWu4LZt60DcT140T1hl/rnF7DyK95ypZd+TzuelCk=;
 b=TLT6NFf4Pp3eQwI/so24HPk0WtBvMlPd50gGQrBWqrfFeRopp2IZJE4Vod7ObUKvoi
 M4NeZj3NIBmABy92OERWQIaLgM6J3y0ZdSSw0aL4LALtYmZz80XbCV/AZNy8W619dPfa
 d5VASNlKYcmd1Xqs3i5r3Nir9l1TIBj8GYLEyRu62rRa1FEA45JUPPFlaeoYhkmWFnRq
 i+rCM/ZQXaXFjBg0bG5J/GqrVWt4EEA2TN0Wb9tUqglD7nLvLmkFhY/JtR0PVsH9xME1
 fsgococVZ0zg6SLQcFs1L8Hs06cZaRgSUtztIVEPrW1OX+i/bOCHqi6tYeCnbLvKZ0iJ
 utYQ==
X-Gm-Message-State: AOAM532tP+E5sQME2S2mViHi8/QQ+Nr0p45CcBIbTWfFioSAboXMyG0W
 t3utRB1vXzLlzS9bs0k4pKJrhQ==
X-Google-Smtp-Source: ABdhPJyZhvX63xFmddmKnz+XGXMRVu74K0kq5qTk5PpLs7VuA4WNPp5QMFJroD65sj0Tdw75jrBHfQ==
X-Received: by 2002:a17:90b:1908:: with SMTP id
 mp8mr987064pjb.106.1623865258254; 
 Wed, 16 Jun 2021 10:40:58 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 l5sm2686799pff.20.2021.06.16.10.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 10:40:57 -0700 (PDT)
Subject: Re: [PATCH 04/21] linux-user/arm: Implement setup_sigtramp
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-5-richard.henderson@linaro.org>
 <87y2b9gbx7.fsf@linaro.org> <87tulxgbqw.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <915fbc3c-29a8-3fe3-1deb-4da917212cb9@linaro.org>
Date: Wed, 16 Jun 2021 10:40:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87tulxgbqw.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 6:49 AM, Alex Bennée wrote:
>    ../../linux-user/arm/signal.c: In function ‘setup_sigtramp’:
>    ../../linux-user/arm/signal.c:847:47: error: expected ‘,’ before ‘)’ token
>         _Static_assert(SIGFRAME_FDPIC_OFS <= 0xfff);

Heh.  Apparently, _Static_assert with no message parameter is a further extension, present 
in c17 but not c11.  I presume it's enabled with gnu11 on my compiler version, but not yours.

I'll change to use QEMU_BUILD_BUG_ON, and give up on removing that macro for a while.


r~

