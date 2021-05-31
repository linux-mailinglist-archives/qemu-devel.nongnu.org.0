Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9007D395783
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 10:52:17 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lndei-0003Cc-FU
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 04:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnddI-0002TY-RD
 for qemu-devel@nongnu.org; Mon, 31 May 2021 04:50:49 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnddG-0003Cy-Hz
 for qemu-devel@nongnu.org; Mon, 31 May 2021 04:50:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id g17so10026059wrs.13
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 01:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xLa45yYxMkW/kpuX2CW4u3rAz3PLUgfyQIwvjSeSWvs=;
 b=uXDogfOwHt+xFnY4P33od1/XdEE0CuvX4xqH+eGYekGwSolkcVgFXTmnDCgb2F1aTZ
 aHQD4Ryi+BnqYdBKXiQHpcvMVLti1Q6sDOut8BWIAOr8DK40z+w9EjNcMjKBMd7RtujB
 Hrpp94G3VWSffxIWpZ418QgDXH+NGBaxCBVqcbD1+lbkeuNNHKbjTktIANrxsnHg8EN3
 83Vn+ClFouYr0VVQmy7lKqwrsvDDPc6i6w7FDS9AYhP2Ia691k8cIPXmZVogPZsNKxny
 z9kRyw2ITgLt95GPffYP9OoKP6iicEi0kkl+Kvcel01ywL2XYzOIPtX9KYryDkz96aSp
 iNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xLa45yYxMkW/kpuX2CW4u3rAz3PLUgfyQIwvjSeSWvs=;
 b=ai6OW2gx5r2RpZ00y4l8Xk5sNVU5B2PecWU5VXnVLtsqLpDFZRVECzHBRZXOliDP8k
 ErYL7SRdNhdSWtwfqKeAIiYpkeRNaJxCWx83/l4MVgT4sQ21nelmjcAy7pC6LhtrKOua
 nhGDDWgOHCtodCGsLl3OV5PINCCIJjMbqpk1znBcBRt3M0l/BlXs/wDFSqskrpvSPYdm
 q0WNs1/VohmDx8+uqfgULPHjsOg6Cp8nsrjsWX00EoW6f1ANvCdKnqUY7G3cx75jdV4z
 /Ret2wwnGFbHmUJz4jrQgb8ohZ3V0V5ShsysvfkdR4P8sGELHbC3Z0J19GnKctNBbQNd
 23hA==
X-Gm-Message-State: AOAM532E8UICTqEJOa2oV2g0h6bqi3Rcva+X/VzjhgeEWYrUMavE68WP
 KhcktlwgIOkhea4IP3B83N0=
X-Google-Smtp-Source: ABdhPJyJMoipBOTRzGgh3fY09BYbYgi/VWtO6Fa3uPZua/aciPExJTaiUeV0ggyea0eKT2PXuR1luA==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr21155832wry.364.1622451043605; 
 Mon, 31 May 2021 01:50:43 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id z11sm13167352wmf.31.2021.05.31.01.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 01:50:43 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Fix DBALIGN DSP-R2 opcode 'byte position'
 field size
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210529130520.1039274-1-f4bug@amsat.org>
 <a52d983b-ce0b-c5f3-3e1a-d175a23f1175@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3d31e48a-79a8-a0e9-7b2f-ec98a0aaa385@amsat.org>
Date: Mon, 31 May 2021 10:50:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a52d983b-ce0b-c5f3-3e1a-d175a23f1175@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.618,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jia Liu <proljc@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/21 5:33 PM, Richard Henderson wrote:
> On 5/29/21 6:05 AM, Philippe Mathieu-Daudé wrote:
>> Per the "MIPS® DSP Module for MIPS64 Architecture" manual (rev 3.02),
>> Figure 5.12 "SPECIAL3 Encoding of APPEND/DAPPEND Instruction Sub-class"
>> the byte position field ('bp') is 2 bits, not 3.
> 
> Rev 2.34 has 3 bits, not 2.
> 
> The mips32 version of balign, that uses 2 bits...  Are you sure you
> looked at the right instruction?  Because 3 bits makes most sense for
> this instruction with a 64-bit register size.

Yes indeed it makes sense, and Rev 3.02 is incomplete...

Thanks,

Phil.

