Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C958433E1DD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:06:23 +0100 (CET)
Received: from localhost ([::1]:36598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIla-000227-Iy
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIk8-0001bB-58
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:04:52 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIk6-0003nW-JY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:04:51 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d28so24982wra.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XbYZ2Q5tM7FrXS5QaHH7QWlFIur7FaJwjkqQZ1dg7fA=;
 b=hTzInXLB/r2dllrnZIRm6m9/+tBvfgcJolJsR5Uy1msJlc3PadZrQKC3YrE+BaVG65
 rBKxStq2uZ9JOHy34+Th9AxYErdoqvhyrqFrvGmWfsFqM4m5TyqOHxKjX9pDoFyu4Qqf
 /AH804qhaMueTjl3H8RnqcIcgivEygeG2pP3d3GsnJXk5huRgZVsoIdju72qQOHSpN2E
 RWr0SyP91zb97dj15wi52G8WVtGiwd4c9fYSWMlwJx5YR+Wu4KfM+K6ylYF8kw51QjNP
 gVQktPc7i/uqBGsXJGN+Gt1VrorDeoUHxW2PixQGlcV+lmkpmNDhSH46PPg38eKpebYn
 YYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XbYZ2Q5tM7FrXS5QaHH7QWlFIur7FaJwjkqQZ1dg7fA=;
 b=eD9fG+LnxNMzt+x82EcxK85hm3WDHpyXhU2tYYkbWhn4+57btN3F/vIdtj3MsVSLa1
 1mLfGryOhR+Gr5Y64et70x54yIhV2gi5SnMezauFIKY5rnBbfMrJ/A35h0StRnR029bH
 E5PTrw4jInOITtUOPrXQlVns8/MdaAKRtmNU85m8pkfM0Fi9TsE8gk0/21HILyL1OCrO
 gMg5fCtR2RcPm7nMkFVMGKhVK25LJSGujAqMlXjLYa3y6EaLXAQMGE4QuQWq6Y896Ukl
 zpvmCvvzDwwUiBqgiGnR3hUDwZMDtXKsMY5+7ChBYDeGJc/6llfXm1xg02qQtLcJv2/z
 grDA==
X-Gm-Message-State: AOAM532RiiyCQReUzr9w+evtccHulNjKvG0f/eQYdHPz3Mu+jMS0MLSI
 CnZhRORFduVxt4/ADjh6cjQ=
X-Google-Smtp-Source: ABdhPJwI4nY8cg3y9/e3Eqkz63uedvZubrNp9OOPeayMMeX+MsUdoHYIrY7PS45x2c5/FrO/GAA7Yg==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr1332351wrj.310.1615935887859; 
 Tue, 16 Mar 2021 16:04:47 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p16sm28140262wrt.54.2021.03.16.16.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:04:47 -0700 (PDT)
Subject: Re: [PATCH v5 11/57] tcg/tci: Reuse tci_args_l for calls.
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <035675a3-2198-e6e0-f1aa-b307358c19c8@amsat.org>
Date: Wed, 17 Mar 2021 00:04:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

