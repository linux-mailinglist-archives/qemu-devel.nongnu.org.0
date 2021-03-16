Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2035733E257
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:47:43 +0100 (CET)
Received: from localhost ([::1]:55668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJPa-000164-75
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJOc-0000OK-7f
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:46:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJOa-0005ps-Tj
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:46:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id a18so11344205wrc.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fAIboAycK6HLa+hgeFcAmleMpmzkqVvd9HUHntB1dBo=;
 b=mFx8PU5zJbQe47MpX7q2+Mkjp0XGKUykUMUK1qTeLtSYKxE7BRwu3RPwQsaoC9/lv2
 Ya27i5El06QsmDvKZJiYzq0HPgKUtoto3B881REHPLEHiCfbjVSa0kGdXA5q2qF6X+RF
 eRUAHtKDz5cQZfViqS9OBJWodDS4gLxXQY0QA28fBIU5l7cpU8eQFoGgtrTMKTInVFCe
 xEdhqPvqsb+a+dwd3UHhLXrmIcqrG32ZBw/21cQDetT/XbNHkxAliGIix69t0+H389S/
 s9ArVJC+ENtjUG3Vp/Zp1rKcsOvBqfdQH1ot/rAHxIn2z6pdvI/RQZyjQfgJQrVdzfrf
 MboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fAIboAycK6HLa+hgeFcAmleMpmzkqVvd9HUHntB1dBo=;
 b=MQ+X5UaYCiJBQqRBFccgMuJAy04vpqVPJz49xMJThRAymRfhS58285uHlkfDTtqAJk
 wNK2F0aVbTluRkVviYtCjOUjsZ2mqQvPzlk30GaqV0Lp4UkcoDBozX20tGBUrTu+wxXg
 U+WUXyV6J+5lxO+zGQgF2uwc51E2w4PMbpRPGGOzB7gPagcj7m0td8JEn/gW/H/gAq02
 nWxXNuKW8lYv/TZPN87ILwl/lqDKuTxHm1zCrLRTC3AcRJ2VG+dteODWJDgD0QbziKBE
 WgWX3I3PW2C6P23sP68kCdSeAvIn238rrnXeFBmXaQ7z4WIL5QhCQEHRkOuGqGXwQ/dS
 ZifQ==
X-Gm-Message-State: AOAM533DDFlYvLEHhkLvjNJaO5M5SEdBQrBIY7E8Ltcp4nTSxw0CrW7/
 5MF+rfJ3ymL+QM0E2dGB+v0=
X-Google-Smtp-Source: ABdhPJytkmxydCK8uubcuKJ/lwJRiP2aKBnTldpd8xmkqep2DLqqItGjNNVsX7TG3Ao+uo14N2r4Ww==
X-Received: by 2002:a5d:5906:: with SMTP id v6mr1393312wrd.137.1615938399781; 
 Tue, 16 Mar 2021 16:46:39 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e8sm740518wme.14.2021.03.16.16.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:46:39 -0700 (PDT)
Subject: Re: [PATCH v5 15/57] tcg/tci: Split out tci_args_rrrr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0331df33-65e5-c22a-3283-8550f92fb5ec@amsat.org>
Date: Wed, 17 Mar 2021 00:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
>  tcg/tci.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

