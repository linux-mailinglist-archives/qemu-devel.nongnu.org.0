Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2954E2CA5DC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:39:07 +0100 (CET)
Received: from localhost ([::1]:55788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk6o6-0004V3-6x
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6mQ-0003Gs-Ch
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:37:22 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6mL-0005SD-Ef
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:37:22 -0500
Received: by mail-oi1-x243.google.com with SMTP id o25so1946301oie.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 06:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D9UGCUyh9UPMx+1aY//Ix5B2/LcCnYvndjmH62WG/r0=;
 b=ks6PrpMG3v0aHTrCf3A2IwxS11Ai+GzFBaP+AgPOOVI7043yi/kRC+fWkR7mbOkKVd
 D5PJi+zThgdgQxgSZHzC054pzJQGf+/zaJbLx1oLPJL0T6EXjBCEyR1w0wRJe7SIv6/+
 L/yHIfFzw5z1nbcsk2oUzVnt3fKM/QYmXd3x6WZ7Sim4GmaiHhB+3DWcHiZ5NZzQG8+2
 5At7OBtbyNbwXyaCU7+fG17ym5PpbQIezRFoMisYf3nymZf3Mk0PNlb9gG9P4Z4nmkC4
 eUTd07IGqz/HgOApkTGQPlrlAB5qRErG6VcibdGcsbWLoa/3jMEZxkhatPAsEKjJIgJk
 RZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D9UGCUyh9UPMx+1aY//Ix5B2/LcCnYvndjmH62WG/r0=;
 b=AgLbprdEru+4J81Dmy7GaFU2ueseXcJPD2Lhr5xEsWIn0EXcpJrwsXAPrhWrkUC/bV
 Q0lVk+qjHkIc9dUtCnBcO40oVMgXGJZJcUUYvFI50FcL9ETa17RBeE78WtLjV0/q0U0t
 aEYwNzSGE1HR4zRFmofCeM9sWf7qp/cmLvlXjE2vXm1bjY5xtjkwEoIOQ4nMXyTVwOC+
 ViY65jGFFitYEFHYrf2XGANYZXNn2J03xMZcJ727Srbs/iByvOvI8tRcQtJOjxQk3C6d
 w0Cslz9vKXeau3X1Nu3DKxwaLxHh/owDwpFQ0/zC0kPOMPP+u5iO9NnrtZjHP8Q6nETR
 sa5A==
X-Gm-Message-State: AOAM5331gRmUiZ5WMqCu4RXK9j4XMW97CMlu0uSHDVqf2fVYZ4Wg/KHV
 KAyXyglCfsfrWEWXZIcXCmVr+g==
X-Google-Smtp-Source: ABdhPJw2coNTL6YDlnDSQtPLFtQQy7N7fi8TqT1WnhvhdhMSKAlftONBtybKkd2zGAD2CNk8Bw6BvA==
X-Received: by 2002:aca:5a86:: with SMTP id o128mr1350546oib.23.1606833435085; 
 Tue, 01 Dec 2020 06:37:15 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h20sm397147otj.57.2020.12.01.06.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:37:14 -0800 (PST)
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA_0=iTLma9KgmW3jDhP=JYDaT9rVHZO5h3yaFDm8KUAnw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d27f5391-ac7a-6822-8fb6-7ee1e6f0ed45@linaro.org>
Date: Tue, 1 Dec 2020 08:37:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_0=iTLma9KgmW3jDhP=JYDaT9rVHZO5h3yaFDm8KUAnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 8:27 AM, Peter Maydell wrote:
> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> As reported in https://bugs.launchpad.net/bugs/1905356
>>
>> Not implementing SCTLR.A, but all of the other required
>> alignment for SCTLR.A=0 in Table A3-1.
> 
> Any particular reason not to also support SCTLR.A ?

No, it's just a bigger job.  I'll put it on the to-do list.


r~

