Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17F05AD8A5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 19:57:44 +0200 (CEST)
Received: from localhost ([::1]:56570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGLv-0006xv-F5
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 13:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVGJL-0003e1-Tt
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 13:55:03 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVGJJ-0006Ha-UX
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 13:55:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso6104218wmb.0
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 10:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=AbC1a6ZURmYemIohoLBjQFeJ4zXHhSNhL9f39QK1WJc=;
 b=N6SKdSh10N1wVvPr2TUhHgF2z3eq7WfJFLPzvR7IbH26lrJYWcqSRjnKQ1eQtdqLBf
 x/C5wHsxQboZBuM9Nsr5EnIBn4PPa51n6YAL/2A8TrLn4APXLwzi7XXF0L0yrcOYAU6N
 OqhHNKyjHUOdVXzSaiLYNnv5WZ6tFfIja6xCndV7uphEUh65/5j8HHZtD+2yCzX1jkQf
 TzHjrGygngF4FhqlHTGTjQxD1OsBMtLiDJ19qwg+/+5vfY/iIdVLKdjEmv+RqTC0o8A4
 +juWvC1+ofcOG0hgRevea6IZZ0esZMH/UERqckr5tGx4M05FSke0/R4xhexpty9VX5E7
 s/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AbC1a6ZURmYemIohoLBjQFeJ4zXHhSNhL9f39QK1WJc=;
 b=of/WnuMx9c5Rjaf5czlgk1pDqzAKrDuGJ0ud+SKXPUg46TQC8z4PR5URY9ki4v0Jf6
 ucvftBOG74ahWMJeT4wb2thTRKG8kGI0bQWC6uX1e1fdpu/yN0OlqrQba1BJH43s4s4c
 2IR/HkRB2+9qlbVMe00eWt44XWQyVzR5cb3Cvzfwn3x6gnJulLgXlq5YIQf0I9LT22mt
 gZNAs7YWVfk1sWgTkZzpMJfjXTQLfxRpIvtWSuwM1Bo+T9ACsdArg5EInR5hDons0BBw
 qiufOglPGVFh90LQrmWvikxbpOYeUyLiva1Z2BtnEtLHpaHJEY8J553iuB3t3w+m0ii2
 Autg==
X-Gm-Message-State: ACgBeo3JM0VeAwkP8a5x1Xuk0eREf8tPBj4/pC107xCO/4yFF2O92iQl
 ERZqvZARNAkuc1wZY/3fWrZNqw==
X-Google-Smtp-Source: AA6agR6AwBJU+o2p3frFgyXHA2WB3khzLz9NAo3nij/XYoyUnFelh27SJ/2SI1I0FMYdWZH4kiR/Hw==
X-Received: by 2002:a05:600c:4f92:b0:3a6:cc5:e616 with SMTP id
 n18-20020a05600c4f9200b003a60cc5e616mr11373503wmq.53.1662400500242; 
 Mon, 05 Sep 2022 10:55:00 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9?
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003a62052053csm23131876wms.18.2022.09.05.10.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 10:54:59 -0700 (PDT)
Message-ID: <9bed9eaf-1b30-27d8-42b9-332a62f2922c@linaro.org>
Date: Mon, 5 Sep 2022 18:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: fix bug about missing signum convert of
 sigqueue
Content-Language: en-US
To: fanwj@mail.ustc.edu.cn, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <7819f62a.51d7c.182f21781c5.Coremail.fanwj@mail.ustc.edu.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7819f62a.51d7c.182f21781c5.Coremail.fanwj@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/22 05:10, fanwj@mail.ustc.edu.cn wrote:
>  From 4ebe8a67ed7c4b1220957b2b67a62ba60e0e80ec Mon Sep 17 00:00:00 2001
> From: fanwenjie <fanwj@mail.ustc.edu.cn>
> Date: Wed, 31 Aug 2022 11:55:25 +0800
> Subject: [PATCH] linux-user: fix bug about missing signum convert of sigqueue
> 
> Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>

Queued to linux-user-next.


r~

