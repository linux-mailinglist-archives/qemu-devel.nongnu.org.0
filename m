Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B052B9CFF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:39:31 +0100 (CET)
Received: from localhost ([::1]:39652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfreM-0006yL-9J
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrd8-0006Td-Un
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:38:14 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrd6-0005nZ-UE
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:38:14 -0500
Received: by mail-pf1-x433.google.com with SMTP id w14so5762533pfd.7
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tQHCzHEgyZnzT2riSzwbYqkuCnU6VbH/EVmIN6nPuVY=;
 b=SAdm3QZ3eo0gyR4jFGWq3XvZs4Zi5SmWfqKR51pjOPDvcBNn464indRvHkXlrl4Vtf
 HJpjUvbyoBe/T8IcwtFqflo52xZa2NBCkbRvi1/d/RBswNqgsoy2wJ10kejTIm+Uhn+z
 doU42jWcoj+e8C7i+3OXWaZHzMMU6/PCKWFFoyf3NX9bsWyVv4b0CNXGc4vb0CP8kTkT
 Tf3GoubZIT6YtxI7grNfwDiSTgLzTvvLhG4b/spzixCkpw7nIwhiJuzxntPE/F8J3zbA
 0gcac4caFwbgx+kbINIJz6DPL+zuBnphr2Kxw2Ac/4FhuIk74mnZ8XG8WpJM0PzQEjB2
 V/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tQHCzHEgyZnzT2riSzwbYqkuCnU6VbH/EVmIN6nPuVY=;
 b=jN4/e6MXd8w1Zzc6Ek4uNTdyGTViA2H0QMqKGzT4y0cGgO0EtySI0TPQdwDGjcG3cv
 rziMsgeLUn2NFe143naFEAtds2GIK9aSPH8j19V5snmfYTEPM6OA/eJfKKcYyAl0XCpt
 RbCV/SCswHQJ65QGLnO0A3mOjbYfGOtG2VtHx4MQ2k7vOKYwx036DqE1r2C+Idz8oSJz
 Sk2QcZSiAFus9fh3XZb454fiJZpBMwuCBJOTLoEw7kDbGOoslb+oKg6OApFJD0m/euDl
 jP2Z3QI1G8twvhJEwGOMtow6Doc5uVlVOVvUZ8W5pD2toVlTHpS3txhqMHAvNHzffOrt
 658w==
X-Gm-Message-State: AOAM533KBBBZMClXqgmaIXSypRJAgmvccggmC45XrAGLrtdQJC/jU2zR
 ZNnuDFPafB/bD3OnVoX0UKMW/g==
X-Google-Smtp-Source: ABdhPJzrICKRqEsTZAXeNqJvYm1+N5636B8sjhrIdCthi/v8YF99drgQdrcAqT5CxNWNYejxSgYBsw==
X-Received: by 2002:a17:90a:6283:: with SMTP id
 d3mr6453486pjj.96.1605821891327; 
 Thu, 19 Nov 2020 13:38:11 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t9sm731119pjo.4.2020.11.19.13.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:38:10 -0800 (PST)
Subject: Re: [RFC 13/15] target/riscv: rvb: address calculation
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-14-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d0cbc48-a405-b26e-d34e-2fe6512f494e@linaro.org>
Date: Thu, 19 Nov 2020 13:38:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-14-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  3 +++
>  target/riscv/insn32.decode              |  3 +++
>  target/riscv/insn_trans/trans_rvb.c.inc | 23 +++++++++++++++++
>  target/riscv/translate.c                | 33 +++++++++++++++++++++++++
>  4 files changed, 62 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


