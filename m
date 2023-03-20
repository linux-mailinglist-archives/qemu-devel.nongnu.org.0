Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56926C1B3C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:21:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIFZ-0007yg-S2; Mon, 20 Mar 2023 12:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIFX-0007ul-A3
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:20:43 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIFV-0006Lx-MJ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:20:43 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so12957368pjt.5
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679329240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CDxq+gq8WiTyha1564PAJFGxTBIIKSmVZTCyUGdgAXA=;
 b=iJkSOMQoCFR5Eour1OMYEehTQzjaJt8OkfoYk/p0qKsqflWpmIOFt3w7QpV8vPoo7/
 eiMYoEItGBa61iuSIgTn0VXXBwPxK/4QywXs+/gdaHJsDUwJp8wWCd2pNHW+CneqvVCb
 AivQWLPkfhUwyoMiVwTRP2cvRgx0FIDLkVDaY+gO34/d40C+MuLwQuq+GAFylO00qfZr
 7lTwhsVI4njbCD9HzsAPOreljBxqQC/DbkVLR4fSu5EafxiqhTg3Nim5vxKU2mlvlvi1
 +S2I//6fLpWaVr8cggYjW6LIfLlca9MljkjKdJWOjfi5tSiLIs4W4WlQkGLNtNdw3PoJ
 +rqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679329240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CDxq+gq8WiTyha1564PAJFGxTBIIKSmVZTCyUGdgAXA=;
 b=gtdEDZQNKa0I7XjG3UE2C7+6hiHcRK135arAukhpuajbqaKrzFg1KK5jqD/+Jplbmt
 YfWeb8ex8z/hbtZ+ujDkKHQJpd1Y3bcGPIUgVPRWh9mnlmstjtD/VtJ4f59NrgbkJ6kg
 vdGULI8GMXVSDP5Oz7J6QjJ0QqvFeyAMRfMtDUNF7qcxf+bMo3sD03gAiO6Wo8V32uOp
 B//xFH+X8qS1ZzbNtiJSuiy7G5lLISnV9KoiBD/IPXpeSzpWo38NNai9mn7dtkr27pFL
 JOEyWUMSEqnpJ28vzifWGbY/fK8VhyDNjniUaGClhtuIJYEyTs9bT03jDSLPuzcWk6px
 mP9A==
X-Gm-Message-State: AO0yUKW5qvi48vFgf9+sXRZ+YY8/pmfzPtxHvoQpEd4ojZcwqearI0Fp
 b2I66UTJxmJ3brmzITVKJF1iaw==
X-Google-Smtp-Source: AK7set+gB2cprObIemm+NTceTx94l3e1NVxR9C17cIHw9W8861rZjLnbYevt8WxmrAM38Kn3jfhNOA==
X-Received: by 2002:a17:90b:4b50:b0:23d:1b82:7236 with SMTP id
 mi16-20020a17090b4b5000b0023d1b827236mr20731536pjb.16.1679329239973; 
 Mon, 20 Mar 2023 09:20:39 -0700 (PDT)
Received: from [192.168.4.112] (096-041-163-098.res.spectrum.com.
 [96.41.163.98]) by smtp.gmail.com with ESMTPSA id
 u21-20020a17090ae01500b0023f3fc5d162sm7098666pjy.25.2023.03.20.09.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:20:39 -0700 (PDT)
Message-ID: <ddf7c941-3e98-5745-4e88-719bb616d2e0@linaro.org>
Date: Mon, 20 Mar 2023 09:20:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/10] includes: move irq definitions out of cpu-all.h
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230320101035.2214196-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/20/23 03:10, Alex Bennée wrote:
> These are common across all versions of the system so it would help if
> we could use them for common code.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/exec/cpu-all.h | 52 +-------------------------
>   include/exec/cpu-irq.h | 83 ++++++++++++++++++++++++++++++++++++++++++
>   include/exec/poison.h  | 13 -------
>   3 files changed, 84 insertions(+), 64 deletions(-)
>   create mode 100644 include/exec/cpu-irq.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

