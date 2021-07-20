Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38383CF942
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:57:47 +0200 (CEST)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oNe-0004Zs-MK
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5oD3-0007ZO-LE
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:46:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5oD0-0002yc-Ol
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:46:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d2so25725427wrn.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WRB+tcIj5LQ4oGCfncmUcsTJUnOB7qpIaQWQzVLCQjc=;
 b=PLkMDKoGEGWAoyJfUj5LTKGEcQELItDeW7HV/1QjaEF7DZaVtgOOzGa9UA7YzwSXzq
 RI32auJpQPYClR+1arloIR1yJg07krnjtq24Ilgp4f5nj5J+3TuojY+5oVoY/RBZw5sL
 r8SOK13zq/CPTJSA6tspdFvAfBXyGA8ERObBcTRFpGPWTQewX75lwRa8fWmGoSbesrcF
 W8wpNyxpvnJMpUhBJu1WRkMJmHveDkRK6a4rd1k/nC3NOgb9M1RQ1VNXlj00a+Tkod0o
 U/02f4kyj+LRkMg3cT+qMCjc5g5/7f39x7hs9nq5cqV91ALYTk7rlOm8dKYL3kvt8Oam
 CeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WRB+tcIj5LQ4oGCfncmUcsTJUnOB7qpIaQWQzVLCQjc=;
 b=ZPrj2Ja2R+O+KZK0jciG1b0mTzBzVGhM2BbuOnF5L3liUOlvksJbgUczRxpzscFlna
 MjP7TpA20kLn+GSMXHwH0ELjyUf+j1xv71Y9Q0skLi3kyR3DMxkyne7Or3Togd3FC7+J
 3sKtvPuWxM1jGG9gtiSkmHItiP9dN5OgTNH55gXgDkhP/2uzEMTrD7ktUtMB8sgVmK2j
 glvhQCaRQ/tCT3UO4kpQkYRp5W4S2p0PJMNMZ/+cpmlyZ2eEwfiQdlvHmKKQUm3+vdjy
 TrZI9Ml9VeIM7y0goNuss5bUoEFMrTV+5To3B2SQj/ZnqaJWH32OCjPi/hxD/8W1SC+H
 X5Sw==
X-Gm-Message-State: AOAM5314O9nxNqtsYlCJt8Cu00/Epa/aGnb8P4n4Y1YWpcwrCc9cFMhn
 J4DKoqSGCGQhzAQnju4BuWY=
X-Google-Smtp-Source: ABdhPJwZuUmlHkfg4b93f/nEW7F2bDk/oGX+mKvoPiLAYa6ayrZwa8gsJ7uHOVQIUh+p8bLucKxLDQ==
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr34759901wrn.138.1626781605412; 
 Tue, 20 Jul 2021 04:46:45 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id e15sm23128635wrp.29.2021.07.20.04.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 04:46:44 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] hw/registerfields: Use 64-bit bitfield for
 FIELD_DP64
To: Joe Komlodi <joe.komlodi@xilinx.com>, qemu-devel@nongnu.org
References: <1626732165-137461-1-git-send-email-joe.komlodi@xilinx.com>
 <1626732165-137461-3-git-send-email-joe.komlodi@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e87e2d46-be03-0762-8ba7-074219fa5e32@amsat.org>
Date: Tue, 20 Jul 2021 13:46:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626732165-137461-3-git-send-email-joe.komlodi@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alistair@alistair23.me, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 12:02 AM, Joe Komlodi wrote:
> If we have a field that's wider than 32-bits, we need a data type wide enough to
> be able to create the bitfield used to deposit the value.
> 
> Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
> ---
>  include/hw/registerfields.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

