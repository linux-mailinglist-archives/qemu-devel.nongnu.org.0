Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD52316512
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:23:53 +0100 (CET)
Received: from localhost ([::1]:51098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nb6-0006Ai-Ob
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9nWc-0002iQ-HR
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:19:14 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9nWb-0006kV-3L
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:19:14 -0500
Received: by mail-ej1-x62f.google.com with SMTP id hs11so3479791ejc.1
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 03:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=00HR8q6HNTxsYtK8ciGUEkTpXK4WPC1MJ1RQBHwSBn4=;
 b=tckKX5nCheO4TCbj8haWY/5bEi5hIT3se8o+QguT+T9fce4Ue218CH5Msgt376ayIN
 5i+TMquD7+bMfpKkm0jmfkPSPlPfn0J22R7SCoBzl4qCst4iJAANMX3usnSUBTipl+3r
 t38neewi5kBD4LPhy6hEcYaKlwyAXftzOmFn9tzAZqTRP3AZuyF59rsAKW7xUirWYRfL
 PNw/DNs6gBvw7gfrQ7Sy/5KcSN0oVJm4TT2sAdj3R7w7TIMSN/lU2En2bcTbOl76sLmT
 chNiyavJQxkeU5utq87bHFaM/jntPcUdVDoL2UtUTAw5s0KZxGkfi3fQxB+tEYGNUtJ8
 QPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=00HR8q6HNTxsYtK8ciGUEkTpXK4WPC1MJ1RQBHwSBn4=;
 b=GHgWiMyZwtYDyP0oQYDHU09kLKLgLl9r4S7G3tn68b+Ynw3NavOfnVyw0D1CCRuWo/
 QVmb8T7V7A+OG603nWaij1fm+8ETOIkx05vFkMY0jMF852c5Pfl5dYQqMAUznFmze4yU
 0/MHgF0ctSe+MU9a/Q2HEFp7A+6LUe55i8Fg2U6BGH9Yw19oe106woBt7lIUbi0TMN1A
 yVj71JaTIvLUW8cGJYBCtNCnvhXMyFzvPTCD0CRR+2S/o6DvTVPcMvjtPUeb5eETS0/0
 lsx8DstrnbfAKl9dSSaojrHjkFdlWn0TKU8+0kx9m/vi46RUe6OTPL8vVHK7CsRbO3QI
 xW1w==
X-Gm-Message-State: AOAM530h4FkVO18OtX12wM+/Lc08ppA7rO84kMIWI0dldDD85JVbNy7M
 U7UBj8m27EitA/ohd2YowaY=
X-Google-Smtp-Source: ABdhPJx6weeAKgAN/73BTMgFjbqJEJxP6AMNLtydpZJYNLzfFJ5KsU+SGCenlXS+q/uuMro9JfGl2Q==
X-Received: by 2002:a17:907:2058:: with SMTP id
 pg24mr2386468ejb.441.1612955951538; 
 Wed, 10 Feb 2021 03:19:11 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o10sm902981eju.89.2021.02.10.03.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 03:19:10 -0800 (PST)
Subject: Re: [PATCH 0/3] target/tricore: Pass MMUAccessType to
 get_physical_address()
To: qemu-devel@nongnu.org
References: <20210127224255.3505711-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3cd31df4-22f2-c167-6eed-14a2986752e4@amsat.org>
Date: Wed, 10 Feb 2021 12:19:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210127224255.3505711-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Brenken <david.brenken@efs-auto.org>, Joe Komlodi <komlodi@xilinx.com>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 1/27/21 11:42 PM, Philippe Mathieu-Daudé wrote:
> Taking notes while reviewing commit 671a0a1265a
> ("use MMUAccessType instead of int in mmu_translate").
> 
> Philippe Mathieu-Daudé (3):
>   target/tricore: Replace magic value by MMU_DATA_LOAD definition
>   target/tricore: Pass MMUAccessType to get_physical_address()
>   target/tricore: Remove unused definitions
> 
>  target/tricore/cpu.h    | 12 ------------
>  target/tricore/helper.c |  9 ++++-----
>  2 files changed, 4 insertions(+), 17 deletions(-)
> 

