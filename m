Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0C3F75EA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:32:57 +0200 (CEST)
Received: from localhost ([::1]:33446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt1U-0004qC-Uj
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsm5-0002IJ-6C; Wed, 25 Aug 2021 09:17:02 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsm0-0007Rk-8a; Wed, 25 Aug 2021 09:17:00 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so4568735wml.3; 
 Wed, 25 Aug 2021 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EynHlgji1UQQ7Mryt/gMfsSgTStDYkTJnxP2U4xZuSU=;
 b=RPPyaGMg0NESpAxoy4CL5x1Xz+hPQkEVa0c3aIFHR2S9GJFt+omxt1WSgqYEYO3kcC
 ghrfL2X+Ey6ru6B4VSSQVkcHGNEDIfb1EBEeHhJ1iWezQ0n5GazVUuyMW6y3xin2xfjU
 njgAFzoaCtuUeLunFCLTvx41PF3yioE4yN4wHcFgqAzfVO6Ugi7cOQZBV4FVfXjXweC3
 dp84E2/0rBvl13Hjdwy51z8dompW4qpsEPZcs90i9gYTphhLEWnMd7Q3kvCueawjPNn8
 Z+tVPC8vMXzjmPHFI01cwzbxHsLOgB4nEExolAfjZE94rx5D56IbDo3/XSEd9DomxBGw
 ajSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EynHlgji1UQQ7Mryt/gMfsSgTStDYkTJnxP2U4xZuSU=;
 b=HrO735HlYk3+uVePxPtQSezJX6X7Oi2gYIIFp+l5Vt74R/2Ahhlum61vDN09s6Sd1W
 IjLwGQeZTecrscRDeiTlyJCgxmv0taCRCB8oOKG9voeCZTBrVy6iZKBLi5Dh43R2YLov
 WWKXp+bHgWi7Mal9CxnTvq7nyCMyc2zce1/ZgAI+DxZ56rczCzmlWV/F4O8EFboXq3Y/
 VEyuFv7NWvH7EXDBYmMftAATomngfKlqNRuOLrBiWOZ4y74+ikVpv6CCyOm01MrGkxsy
 p++TWmjXwoCy1HBlIUJYkEI9cCr1h2R4o+YKATk/2B+vJpWV8vdXvVHEvA84Hr8mjpTJ
 Hn/g==
X-Gm-Message-State: AOAM530vAiR83JZV52f79Y/g1pydckZaJtpGbSn4JBTSFquMGOIyENOv
 M3uo8hvyxbDuDa1XdhhyPbc=
X-Google-Smtp-Source: ABdhPJyFKvn2Km5EeeDFtBk9E3ORylfEpgWwbunbBT2kSXFH5b1OZTGFesjSHF7Wx6eOizZ4ztIdmQ==
X-Received: by 2002:a05:600c:898:: with SMTP id
 l24mr8852089wmp.90.1629897414621; 
 Wed, 25 Aug 2021 06:16:54 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n8sm250700wra.24.2021.08.25.06.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 06:16:54 -0700 (PDT)
Subject: Re: [PATCH 14/19] target/ppc: Move d{add, sub, mul, div, iex}[q] to
 decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-15-luis.pires@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <49aa3564-3464-131e-f942-bac0b08bc454@amsat.org>
Date: Wed, 25 Aug 2021 15:16:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824142730.102421-15-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.24,
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
Cc: richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 4:27 PM, Luis Pires wrote:
> Move the following instructions to decodetree:
> dadd:  DFP Add
> daddq: DFP Add Quad
> dsub:  DFP Subtract
> dsubq: DFP Subtract Quad
> dmul:  DFP Multiply
> dmulq: DFP Multiply Quad
> ddiv:  DFP Divide
> ddivq: DFP Divide Quad
> diex:  DFP Insert Biased Exponent
> diexq: DFP Insert Biased Exponent Quad
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
>  target/ppc/dfp_helper.c             | 20 +++++-----
>  target/ppc/helper.h                 | 20 +++++-----
>  target/ppc/insn32.decode            | 31 +++++++++++++++-
>  target/ppc/translate/dfp-impl.c.inc | 57 ++++++++++++++---------------
>  target/ppc/translate/dfp-ops.c.inc  | 19 ----------
>  5 files changed, 76 insertions(+), 71 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

