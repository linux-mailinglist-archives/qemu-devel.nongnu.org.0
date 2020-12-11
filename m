Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CED2D79DD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:52:09 +0100 (CET)
Received: from localhost ([::1]:53378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkiG-0008P8-7h
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkey-0004UW-Kz
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:48:48 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:39325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knket-0005nU-Fa
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:48:42 -0500
Received: by mail-oo1-xc44.google.com with SMTP id k9so2229329oop.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jMKwW2sA2znFMCHR/NCS7RwSc5jRFiydzhYhCFi+QF8=;
 b=nX11ltdR4IJyLVZiMgggghuZV4iRUyXYsQuc3aBrdx+e7u8eIm8d+SybBRxGbHyDtC
 DVq0/yGHDa8xpxvjaSlnbLRuKA73ibJI5of9Cmhnz8J6Q1B08X5DHqoZ3m17JXIB4lsR
 UVE+lhUsLt4xCruk6X4r1WToca4l/cLqIDNBHHv9zl44S+9ELcqjRS8kPn2bmeLQjGAX
 W+CUQVWbuelOsrTXys/zXfsyyL2FnZ3zsUALJ6Ycc21zZMrUrnl/QmKsd1H7lrCHW3eM
 UevdMEuK5saSmG9xZ0Ybbu2yh+HQki2KBqy3e8XxP6eoPGGBihqk23edYBfFzDocX2TA
 22bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jMKwW2sA2znFMCHR/NCS7RwSc5jRFiydzhYhCFi+QF8=;
 b=jwVfuLOnuCqRBLCGoD1JoaQbYNcHfLKB9lE9eNiBDNzGWR7iVe8YbwcpRROWw0Zdfb
 yUFdTBLmJh37baMi5wlzfFPUuGcN2DD5bas0G1MC/LM+YvQ5pUs3GPXrX5134vOfXYVR
 uc2mkpSmoUa+2irkRsJzoXEacEzXUqmczdctm3zyLLoZm2+djXwKQ5ZVXXh9/c1QjaKp
 ebTf6d5LQCdAZS0+iVXXNGvcwUdE+ZmrJw8LkBO0lNQLCEQwVadO9mN14XfSrxbpWM6r
 OkbrvV3QAEt1AFQUGxsjtvTQMnEUvHfc4UgEnwFnmKjzYrwJ4j+1mT4WDjcmCRqul8xj
 GMuA==
X-Gm-Message-State: AOAM532bjYB67ECmGq/Si7x/fYNs5fBubpRqpebZXoMBTzcpnnVbX5hQ
 D5oMKMdMSAx7255COjwfx2onCg==
X-Google-Smtp-Source: ABdhPJwrCM+VWsh3zQdiBmnHyysrihh901H1JLcjyFRqAs60/4Hxy+f4w7IfEPImx4jvKuU6aAfvPw==
X-Received: by 2002:a4a:9563:: with SMTP id n32mr10619308ooi.53.1607701718342; 
 Fri, 11 Dec 2020 07:48:38 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t19sm2005211otp.36.2020.12.11.07.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 07:48:37 -0800 (PST)
Subject: Re: [PATCH v5 05/11] arm: Set PSCI to 0.2 for HVF
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20201211151300.85322-1-agraf@csgraf.de>
 <20201211151300.85322-6-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <830efda6-f421-75a3-a29f-ee6f80b7d1cb@linaro.org>
Date: Fri, 11 Dec 2020 09:48:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211151300.85322-6-agraf@csgraf.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
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
 Eduardo Habkost <ehabkost@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 9:12 AM, Alexander Graf wrote:
> In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
> of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
> that fact in code too.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

