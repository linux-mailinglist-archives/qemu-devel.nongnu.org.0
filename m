Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB4731C366
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 22:07:30 +0100 (CET)
Received: from localhost ([::1]:38124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBl5d-0006tr-Nj
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 16:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBl2w-0004VF-FE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:04:42 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBl2u-0007XA-6E
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:04:42 -0500
Received: by mail-pf1-x432.google.com with SMTP id k13so4848262pfh.13
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 13:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uDIU0Nzem+epLirhZd1hhcsXIYnfDnVstAX3JrE96lY=;
 b=ky53PSLyjpZvmUrM3rdOqSogsP4MLmpO4FIDryxf3QtPk1i/kJxAgSWJL9KDhSqLlO
 vTAgxhJ9hYUzJxx9LLaDHhERw9KztQBk2tJQRISHsuUprH4UUnwg/P/o3beNxmHEqC+h
 o7yvJZ7GH1dErrKmVV/BbkLHyR3NMllfonyzHtpSnTXHabu0qNUkneiRLBsg0qgYgAoP
 ADoDheBWHysYF86NrROakvKaqiApLmZQwDaMVJoHUyyNXmBgPnIlTLgiDpCVCu6/uGyu
 ABLsb05b64tWalbHLLaX+q+SRbKdcVRXoVW6EciDwR4bdPRnohM3HVQdRHE0066aenRk
 m1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uDIU0Nzem+epLirhZd1hhcsXIYnfDnVstAX3JrE96lY=;
 b=ABolUkCpDVTy0JTKrvrHxcENEdoh028rjNoD1gslWJWXz0wFLS0c5793cNkX5v4A3l
 qd/xauzI2IGqX3VYS/iX42qSS5RYmZxzlfW3n4Io2OdmwaibZu+L7TY8xdQT/xO6J2ik
 qn2keTrXnMhCRD///TuesBQ1mCC0qGRsf2rL7jM91b4rRRGAzsuhUEMk4/6ySoqalTpY
 3shTrQqwjS0X4U3rjVnkv+BB8uuT6BgwC/Qukvp1aG0r69v4gD/u7GvV9Fc1JpMYjAuK
 ZB9HSlAEJsHBEvHXxuBj6VhEBIOldGZSfgeBrqwwcY6ulBAc+e82A9eu1stBKco2uEJZ
 b0YA==
X-Gm-Message-State: AOAM532d8/RPl53tKa2yCn+FcEb+4Cq0C/dw9z1CIzHHixOe4GcpktDc
 dTFt4BW0X8rb2CFNnr5zwS5x9w==
X-Google-Smtp-Source: ABdhPJyjcSUXBnXPbkP4pAv4SufRuy4z4pj43mNJQ/bgol1sPODd26+gs6gdLZtYgaFk/yhHLtGlrg==
X-Received: by 2002:a63:574b:: with SMTP id h11mr16232288pgm.25.1613423078904; 
 Mon, 15 Feb 2021 13:04:38 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id u15sm2687758pfm.130.2021.02.15.13.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 13:04:38 -0800 (PST)
Subject: Re: [RFC PATCH 30/42] target/mips: Reintroduce the R5900 CPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-31-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d0fb390-b0c9-7ab1-7cc3-564356fc501f@linaro.org>
Date: Mon, 15 Feb 2021 13:04:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-31-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:59 AM, Philippe Mathieu-Daudé wrote:
> Now that we have the minimum prerequisites to support the
> R5900 CPU, we can reintroduce it.
> 
> While we are reverting commit 823f2897bdd ("Disable R5900
> support"), we effectively cherry-pick commit ed4f49ba9bb
> ("target/mips: Define the R5900 CPU").
> 
> This reverts commit 823f2897bdd78185f3ba33292a25105ba8bad1b5.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cpu-defs.c.inc | 59 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


