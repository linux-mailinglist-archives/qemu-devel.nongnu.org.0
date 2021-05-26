Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7173920C9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:24:10 +0200 (CEST)
Received: from localhost ([::1]:47444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llz8T-0001aR-5v
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llz7U-0000tz-L6
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:23:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llz7R-00042K-1E
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:23:08 -0400
Received: by mail-pf1-x433.google.com with SMTP id y15so1695463pfn.13
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 12:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=61HSFW3ESjPXu9mzoOek3VrgK9X7eKy71slwR/p/KFo=;
 b=WEv+uf6QJzmrfFLhKPQGLtpfKCE94id2vGisifJjsYSkEBTnJxu1Y76U1H7V38lPhl
 FMfY8cb8heISaO7/DZrq4aiV/wsWoPrTKK5eoTKcwdDqFD7wgiHBF1Ub2CGG8YJSW0q5
 x69f8/kpnYxDWkYKqqJvKeBfme5xHRq+Y3GAbtmxpt6UsI57fsB7DPRJipL4U34u78Nj
 J1KDPJ/yNlVSUeoNjl+4GpMdgLN7oj0QGRE+8EL7H7apGjFdvnqHBC4oV5lY0XEAhPIw
 rnEw6VIg/S2cMdVnTcSSE/DtmvsfioTnzSlI05Xn6+PenLh526SeamHZ7aesp86Qym4o
 GVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=61HSFW3ESjPXu9mzoOek3VrgK9X7eKy71slwR/p/KFo=;
 b=IqqHFwDtwzoNtZQSmKkZepqDOm9/byysgkUiKyEo7Utnwor7C97Tzg7nOns6iRbatH
 izOKkJo03Jusf13K0K0WbtYMQnTzpB6RFmwso8SuEmfU5z3oUjUMnBsI4PoZxTZqm9xa
 UnUox/93rsSsLAZWyMzS+aZKWuWBD1w16Yj7luv+Dg4TgdfPQGxpYuXAluZsyAfW/jru
 2Ka0P/3VJ/JIoXJTXAMeWtdNbTP0U0nQ7iHB3mu0ASJTcLQHNbIsew3vMYfsr0sWsHZ0
 MQ09JhsfMqTNEqPLZvtGLax+69L6FfTf/z/pa5n2FZ3MLNegikIrsInXPhwNd+TQdQ4o
 s0eQ==
X-Gm-Message-State: AOAM533HGDHGSWUZ/F1PtFH3PbKVjyJ3sqLRhoTZyyfY8joMz7Z1D1rH
 sQsrwjjzAmjQlIrEvaUZz0N/i8Z3Wl25Sg==
X-Google-Smtp-Source: ABdhPJzgdAJDb6R0cxUy0zAEI51nXAmdRP80f4iDqSWP2q0BS6nbzD64Tp14yrJhhsf562Vfpoq3kQ==
X-Received: by 2002:a62:8810:0:b029:2db:1af8:fa81 with SMTP id
 l16-20020a6288100000b02902db1af8fa81mr36980093pfd.46.1622056983482; 
 Wed, 26 May 2021 12:23:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b16sm35366pju.35.2021.05.26.12.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 12:23:03 -0700 (PDT)
Subject: Re: Denormal input handling
To: morrell@alumni.ucsd.edu, qemu-devel@nongnu.org
References: <746277332.296230.1622055775751.ref@mail.yahoo.com>
 <746277332.296230.1622055775751@mail.yahoo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bc4444e-782a-311c-719d-091a04e20387@linaro.org>
Date: Wed, 26 May 2021 12:23:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <746277332.296230.1622055775751@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 12:02 PM, Michael Morrell via wrote:
> I think the behavior should be for denormal inputs that if "flush_inputs_to_zero" is true, then set the value to zero (without setting the "input denormal" flag); and if "flush_inputs_to_zero" is false, set the "input denormal" flag and normalize the input.
> 
> This matches what x86 does (I'm not sure about other architectures).

It is not.

Intel Architectures SDM Vol 1, Section 11.5.2.2:
   The denormal operand exception is not affected by
   flush-to-zero mode.


r~

