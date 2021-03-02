Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A063295C5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 04:42:35 +0100 (CET)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGvve-0003gN-A7
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 22:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGvua-0003HA-3t
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 22:41:28 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGvuY-0005tI-Lt
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 22:41:27 -0500
Received: by mail-pg1-x52f.google.com with SMTP id e6so12974651pgk.5
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 19:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Lao7EncI92p900HccFbWDepg1lvdXyAC9oTMfsqtvs=;
 b=B3m2qFvLkkRHKRCThcu4pme6FANBHbEWLHp7RVsR/HjjqojcewzveY+RaULbf12B67
 BB3ItFLJoFbK2p72GQZXv8dvnkyIuFJnbmRvvOFLb1gHIOClwQmm/CSawJ9LDxiMmvsi
 5e7KkiizKyNY2Mq3tzuIF5sKRUo27ejDlWt2VX45HzCLWpYLwgZ/PRWTO4/D1a5Nncor
 39e8zRDxBQyxxi3inD08mjCYaBwSL0gqMBJKx6ahZjqdB/erNHaV/RkhtH6TiAlbEjgM
 MfUM30+M+nK4Q67VHZ8QV+LOoMjL/eT2hdwvc/5be4mV8WTJJ2cB9hO9u6xYRxWcZY0I
 Gk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Lao7EncI92p900HccFbWDepg1lvdXyAC9oTMfsqtvs=;
 b=S9sVcfJmJXJyWkoqsns4W4p3Oom2TH/rcgpC9RuzT1RLh6dmLqUs63WG1cVitIT6rB
 CwBUu+K+PQyhlMML1hra1tfcIpH71eNtr8rhP7qHZthlETn0EZFzzPvYxpki68aKK0cv
 za80Yud+A0UPWz8QxbDX2mYRns1EIonVlHOePdMl29dSYM7m9p1wYzyFb01MLVKTintZ
 xtb/VtC2RodABJFlh6H2tMDyqaVHPJYAqp67+5UoMT/2q83P9v3CF+vm6A1HV4Iikb4F
 kfkSD0JMmgyivEd3QPbAXPl+PCcLO0QrEsPfjsB3PZm+prU0lvCN6B6bt4QpkaZ5bVu5
 fmxg==
X-Gm-Message-State: AOAM531LBxMKF5ZIX3qqsM8btm6F9eu/RxRcX04qSb3v1ehFOnPowcvh
 fu67a/G0/BJlS7G/e3WaRi5LseLB0xZlGg==
X-Google-Smtp-Source: ABdhPJytLk+Wo2D/0jaIWR6e1PPRbqtpxb5bKGo7GY59nJgakvw2WbfdOl2OkxSGLoGaIogMPmXSsQ==
X-Received: by 2002:a63:304:: with SMTP id 4mr14748603pgd.280.1614656485033;
 Mon, 01 Mar 2021 19:41:25 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id a15sm980664pju.34.2021.03.01.19.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 19:41:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC v2 11/24] target/arm: kvm: add stubs for some helpers
To: Claudio Fontana <cfontana@suse.de>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-12-cfontana@suse.de>
Message-ID: <2cd9efd8-d648-58bf-0ec5-26f1bfbe7709@linaro.org>
Date: Mon, 1 Mar 2021 19:41:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210301164936.19446-12-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 8:49 AM, Claudio Fontana wrote:
> --- /dev/null
> +++ b/target/arm/kvm/helper-stubs.c
> @@ -0,0 +1,18 @@
> +#include "qemu/osdep.h"
> +#include "cpu.h"

Need license boilerplate.  Otherwise looks fine.


r~

