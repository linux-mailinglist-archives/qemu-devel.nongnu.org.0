Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5952E8593
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 21:39:49 +0100 (CET)
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvRDA-0007Rr-68
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 15:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRC8-000712-Hz
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:38:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRC6-00067c-Uh
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:38:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id w5so22681001wrm.11
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 12:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NlYmBY7Pi17d8HovmGLDkW/Pi6qwHzNG5oE8eqbdqTc=;
 b=Iyo46W46HCPmd6c5ttqW+jfuN6Ov6RaD/rnekZcpH9idEITj92O2M2CbeviCqwHSxe
 8wn3/+GNSM/Nt5ZqVm5U/jD0fDi6YeZhjaejTo2wtbxubgDFIfr/ohX0byy1YeL897PP
 m4EvVRkFqlmV3TVUr4cmkATl6ZLvJygdKyYqkbJp4yk4VUaoa3pSHWDvlu2FG3roiGa+
 QACzgvjILQ2Cv2kGF+M2OTyydiAeZpSlm0A/4vUZkuOKiWMyFEFrNdC+MSUjO5UEW56Z
 XXRySkQp4l/vqvNsUfrjKkqrSq2YkZoxDzSMROICXkWicXr8NqJYH8t38C3c6LLcPLGR
 dLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NlYmBY7Pi17d8HovmGLDkW/Pi6qwHzNG5oE8eqbdqTc=;
 b=sT3d+cy7UGU6oxQHbc0As+FEh0mB3T3mZIM37Ve2a5u1E2emqIvkLeLdwdBXgT2jEA
 nA0M/eJqWeH3b2V2PpyOUARIkYHnDf0lnPAkG3FM0z4gQLZ0QG/VTKgGordqtGpRhO2o
 193PUfBOEZQHO9T73l1tbpmTlMOPf3Nk1e6C3FV9mYNijIJ10VHMMMwESFwWLEeHfANu
 e6/Tb3cbbB5xIU49ZOHqOYNvu3XKxmuv2l/WCkr7Sn0jUhRpypogBI7Oqjx3yo/YN+B/
 MqekiD0fEqH2ECElnh+uNRpcleoMAGXoVZWeO7+mM4Xt3poCXMbyYPZdnbFoZszui5kW
 bDfQ==
X-Gm-Message-State: AOAM533Daki/3GnPlKoMwD/vIBWMO9TjDe2uXpmNo2sow8WbJVeJl/kx
 +gTyEKKtBb3PL9PvykXNwELbIeUkHGg=
X-Google-Smtp-Source: ABdhPJxPDTdAmPs+P5an+Yy0iGPv0MhQZVkpHZw3EffwTJdtkuqWCp2ODkI7pT0tUPhn8+My+HGy9A==
X-Received: by 2002:a5d:5604:: with SMTP id l4mr68348113wrv.127.1609533521097; 
 Fri, 01 Jan 2021 12:38:41 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id f14sm18067217wme.14.2021.01.01.12.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 12:38:40 -0800 (PST)
Subject: Re: [PATCH v2 3/8] hw/mips: Use address translation helper to handle
 ENVP_ADDR
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064200.28751-4-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d5103933-5ecf-6284-48b0-c143071425ce@amsat.org>
Date: Fri, 1 Jan 2021 21:38:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215064200.28751-4-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 7:41 AM, Jiaxun Yang wrote:
> It will signed extend vaddr properly.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/fuloong2e.c | 24 +++++++++---------
>  hw/mips/malta.c     | 62 ++++++++++++++++++++++-----------------------
>  2 files changed, 43 insertions(+), 43 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

