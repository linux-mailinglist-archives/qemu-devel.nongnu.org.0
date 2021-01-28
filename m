Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2835307D78
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:10:58 +0100 (CET)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Bkv-0005uh-6T
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5BfF-0001Im-TL; Thu, 28 Jan 2021 13:05:06 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5BfE-00089B-6X; Thu, 28 Jan 2021 13:05:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i9so5316397wmq.1;
 Thu, 28 Jan 2021 10:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YYD02V1twG1MzICua02ZAbTilOnRuf+m6lucuG/bznE=;
 b=gWwQSAPTnvM+PKKVZ71pWq+YS+Pywn1NvKBA7rxtEJH2VoN+qO7CHsphaIigVl5R3R
 n2SgtUGDLkap832/bFrxc4mtc/NjdQkRbN6OxpfI2C161cEfwrhGIhS420dAyCCBYdN+
 aeGxHJel76aWm9btpkytntg52iSyyPBkw6ikrO3EAk6tF4MjRvSBiLRwu7eUOBjf3dl+
 HH9vgObMK5LSYeMuxPSrFm8v3r/aALjtsvSYKmXHFzc4vCDdajtWGPihhsJ5tPw4KMWq
 8jdAexxCQdyeXyraxrV5Y0j+CssrWAKAy+PyBNYrM2IeiJ0QyMnpXKDjA6E6ZOL624V7
 diIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YYD02V1twG1MzICua02ZAbTilOnRuf+m6lucuG/bznE=;
 b=iHekrCIp6/3yFowh221ypEUr6TvjvVd6jjqV5oJa4WJb5DmCjloa+935W/qr/eE5FB
 nmCxdU88z2ov7nIlafjW3R8qMb729DQrjgtGVX2DxiBDiKuiZMJPa9psD8kiMfJtTCnW
 oZBDncyqZvA1T6ief14EFop8LD6rkdZBa2+uP/BEMb/Hqn4q1WgU9Bn/O4oTmcp32VCC
 iJj9QtEasXI6hNIUDnwftm0Njkv+eZFRIWIhJJqPRBqOIgFGmOa1AePOO2WwBhxv8sHt
 jrPRpxMoBR4DviX5zetauoog6xdC+HGslAenMydre3nSz0hgmT1peVB0nbiexNGvJmbW
 LTaw==
X-Gm-Message-State: AOAM530DI9r7WudRp08oBRlny+7x5eBqogCMETFl1mO8Xw4gu7jB5G+n
 jGUIdZ9FzGXzld2MhjYlPyM4LW3JwRY=
X-Google-Smtp-Source: ABdhPJyDUVsPg41DnpyRwdyYfeN5YEBXNMv+g3uO5jdd+ja6IOFJ3WshrJvtDnQ4tITy8RfUARlSNA==
X-Received: by 2002:a1c:688b:: with SMTP id d133mr428613wmc.41.1611857097520; 
 Thu, 28 Jan 2021 10:04:57 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r1sm7884045wrl.95.2021.01.28.10.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 10:04:56 -0800 (PST)
Subject: Re: [PATCH] target/rx: Fix compiler errors for build with sanitizers
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Stefan Weil <sw@weilnetz.de>, Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20210128172127.46041-1-sw@weilnetz.de>
 <532a31bc-f011-5c7e-e7e6-9b1e8b149e11@amsat.org>
Message-ID: <5f185a6e-e53a-2122-0a71-6ec1be6ab2bf@amsat.org>
Date: Thu, 28 Jan 2021 19:04:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <532a31bc-f011-5c7e-e7e6-9b1e8b149e11@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+qemu-trivial@

On 1/28/21 6:49 PM, Philippe Mathieu-Daudé wrote:
> On 1/28/21 6:21 PM, Stefan Weil wrote:
>> gcc (Debian 10.2.1-6) 10.2.1 20210110 aborts builds with enabled sanitizers:
>>
>> ../../../target/rx/op_helper.c: In function ‘helper_scmpu’:
>> ../../../target/rx/op_helper.c:213:24: error: ‘tmp1’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>   213 |     env->psw_c = (tmp0 >= tmp1);
>>       |                  ~~~~~~^~~~~~~~
>> ../../../target/rx/op_helper.c:213:24: error: ‘tmp0’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> ../../../target/rx/op_helper.c: In function ‘helper_suntil’:
>> ../../../target/rx/op_helper.c:299:23: error: ‘tmp’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>   299 |     env->psw_c = (tmp <= env->regs[2]);
>>       |                  ~~~~~^~~~~~~~~~~~~~~~
>> ../../../target/rx/op_helper.c: In function ‘helper_swhile’:
>> ../../../target/rx/op_helper.c:318:23: error: ‘tmp’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>   318 |     env->psw_c = (tmp <= env->regs[2]);
>>       |                  ~~~~~^~~~~~~~~~~~~~~~
>>
>> Rewriting the code fixes those errors.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> Those error are false positives, but simple code changes help the
>> compiler (and perhaps reviewers) to understand it better.
>>
>> Stefan
>>
>>
>>  target/rx/op_helper.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

