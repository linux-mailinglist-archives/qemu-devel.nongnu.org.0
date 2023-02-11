Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EAA6932C5
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 18:11:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQtNd-0001Zo-61; Sat, 11 Feb 2023 12:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtNc-0001ZW-8Q
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:09:40 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtNa-0003BA-Pg
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:09:40 -0500
Received: by mail-pl1-x633.google.com with SMTP id v23so9699029plo.1
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 09:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bRHKIMGZnbI4QQZ2BbAC5WllMKDiXQXtuXTwgDuDXd4=;
 b=Y4tupaLDnzjOkBIykRnUi7F5EWHjGWxKDDDf6m6dvGAB96YQtj2JKUg6nNpznw5BPM
 bZMumYWUELOEMKRYEXWTFW4BZzBsKSD0tkGVnmrxwhVhSr3t7YigUdKCDjSOjxaWkVyz
 86tWDrhXHwKQlbqmQfdP0u0sydPzUxGSXfUMQe0accMbPwScAjOK4u2ZP05UciQnao0e
 ZCIHkvvFNsxvECW/5luiOgzbGLj0ojJpWK6c/pj6oIX05dM20EqOyCv0V1DpAIeNGvJq
 PbHtdGvtZS8oJNdP1skGO8N3DlLUjnji1CjjCB7Cn+GyYLKQq2ee3UDgA1g2qpUvtynI
 BVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bRHKIMGZnbI4QQZ2BbAC5WllMKDiXQXtuXTwgDuDXd4=;
 b=Pa1KQNYXWCmJqndUOtPOrzvHiv+1mAbaKaj8PTblWpt2+FbT/TKaUoKNDbWOn13f7T
 IcmzaHcUE+iMc1tORcemXOuw7IIv2WFwCmBhhRfTxDIxPksYnXxr+ahErI4s/yt21e5o
 h90/mMRwI/ZvTy5uk3XKTWkdtvuu+89exMQibXtmWDyd/pgMIZGFbbeM5Wn8isntQWkP
 kKzAiYt8OyilzjlVMUFwgi+GDI4+kyoSGsfQ5//O6ysLEcVxeFm3yRdbgayhon4Sq2I4
 8snN51brKL69fRx052tW+hWdpm97Vo6B2teJsop8h01amL3t7GA6COjE2kUNqSHOhpms
 mdTw==
X-Gm-Message-State: AO0yUKVW6HxwhbdoXq3TmrG3jd0IN2F1UJNfF4efGAUCcKGhC8IpVRli
 Zn7hmrlTrGTb2tJSKGSzM5lI3Q==
X-Google-Smtp-Source: AK7set+eOR9FIFJbApE7tYO3M/zCxVGcptt5b+m0lESNdBHZ7we4AUw/vnbHE4IDu+t1PAVdpNxaaw==
X-Received: by 2002:a17:902:82c1:b0:199:26b1:17a2 with SMTP id
 u1-20020a17090282c100b0019926b117a2mr14413148plz.48.1676135377467; 
 Sat, 11 Feb 2023 09:09:37 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 2-20020a170902ee4200b0019a88c1cf63sm1110835plo.180.2023.02.11.09.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 09:09:36 -0800 (PST)
Message-ID: <e7c7068c-8469-b7b6-d39f-816d47977bbf@linaro.org>
Date: Sat, 11 Feb 2023 07:09:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/11] hw/intc/i8259: Document i8259_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230210163744.32182-1-philmd@linaro.org>
 <20230210163744.32182-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163744.32182-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 06:37, Philippe Mathieu-Daudé wrote:
> i8259_init() helper creates a i8259 device on an ISA bus,
> connects its IRQ output to the parent's input IRQ, and
> returns an array of 16 ISA input IRQs.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/intc/i8259.c         |  4 ++--
>   include/hw/intc/i8259.h | 10 +++++++++-
>   2 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

