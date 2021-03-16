Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AFF33E21B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:29:38 +0100 (CET)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJ85-0000Us-QT
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ6y-00085r-Uu
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:28:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJ6x-0005x0-Fv
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:28:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso2368497wmi.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FeyqbFYpllPxddBWPJ4eYqE7jO2vnLth/qtkpoHEqOE=;
 b=ZQxYmFj7vDg0B0azMIR2Rt3H+8W0GPoi4kVTH7kfjfjS1Z5AndQHvstJ4IdZi0FBL8
 fGHr87++MEJ97fLQHVqobujvwG98hrBRWq4mxkjXXbOWmc5SuF4ls2/aS/UO3CfPl5oP
 zKr8Zl0cROxYYjjJZelabGFPIoUr4cX9z2B6BlQpzQUrAygrret69h3Wz+QIi4+U6Sfy
 /10vcjGnz1wH5YcNmizjleXovtnzbGVw6MHgaHrJxHsEV/gzE9kA2aNmKSMDJQ7CaqXc
 iE5AR6cRLrZl51uAAIHlDALv3SD7u5+NFeuabcoAiXggNc1v2itD1mLfX3rfSrVMRZdZ
 S8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FeyqbFYpllPxddBWPJ4eYqE7jO2vnLth/qtkpoHEqOE=;
 b=jh3ywbfxFHIdkZIt+3W6bOOZw2jPM8UKXz1m+DqzhudfRAwfkUYRxo7vPf4LFTSR7W
 v5JWP0CL4A8crVsljjl5heQ0XvC5ergv2SvM/LSaRwKXQNyCzfV/BAtKgLnym56FHgPP
 boA/xp/pZl2D3YAhjpdLYTuab1wojdoI79SwVgchq3K5c17oWEEfdNYJJ8no5pXt0Njc
 H3W90XE5zPwqp4JxIfrHK0UmGoriWuRpWesUdKnZYMN0hA2nvDKyCzDayE5nbSDwQP7D
 m3Xg1kTsw/9mNLJEzei8Uc2hD8IedfoO56mwliuksgfIBc7AaCJAUZixeW8HKVIBYRL3
 3CEg==
X-Gm-Message-State: AOAM532nVQWbGt6PYRdBxdFhK4Ug+RHAPPXAUx++62rvUUpHFzDPPgWG
 Uumm1hNmrdkzNWu7Hi1BVuRAZZFKFd56Uw==
X-Google-Smtp-Source: ABdhPJzt07d+Ok/dI2RBv5tPvO8a2+RP7nC60bgaKag2hlLrUbuuwCb3R/HmnEerzcoyaZyeG4ksqQ==
X-Received: by 2002:a1c:c282:: with SMTP id s124mr987175wmf.99.1615937305887; 
 Tue, 16 Mar 2021 16:28:25 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k4sm31038976wrd.9.2021.03.16.16.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:28:25 -0700 (PDT)
Subject: Re: [PATCH v5 33/57] tcg/tci: Split out tcg_out_op_rrrrrc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <43955185-38c3-7191-26d7-347eff84fa6c@amsat.org>
Date: Wed, 17 Mar 2021 00:28:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
>  tcg/tci/tcg-target.c.inc | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

