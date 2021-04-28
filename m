Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE6B36D9ED
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:54:22 +0200 (CEST)
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbla1-0005Qd-2e
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lblYp-00049o-SJ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:53:07 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lblYo-0008Fh-AQ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:53:07 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m11so732185pfc.11
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ipEGKqF6yIsN9R+Io8P8kjdHB51ztvNPey6/Zi2PWoc=;
 b=xkQrmrhyx6vT/fCrC6NiDZ6RtWDzcQNGcsCiQMj0EycNqH5PULilqs+NCH08kfrA5U
 WIWqysGfgURomhNMWpYvUbdJ3mtxsGZUuSRJtagAjXDwA0TWXR1phm4ui2iezBx5RI1e
 5md8BghtOTwE9rlXjfLexztFfSvaU4yt2HCly7f4lTJOmrfrBSsg2Z6ivchN7jhwNv8w
 63RTTV1hPwqGGGJI2camc7g1OqQKC/7do3ovpXuA+LuqTY1c0kw4rF+4XBReB7AZaRkz
 4gg70a/2I6Cz7Q8DkXcvgTqtudFJ7iI57XHMCMrXhXXW68xJGmT+eGjL2bwNK+E5VThH
 kpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ipEGKqF6yIsN9R+Io8P8kjdHB51ztvNPey6/Zi2PWoc=;
 b=BI3NNdOjYqhNAQOMHT0/NEjifckzszqP5C9ZsfqJhfrQTvyBbiraw/jEkbATSBoR3o
 DCjhk35mXNq3+ka1mbN3y4FW1IPF9SzLLF0UqtObNcJzasPj/dqcFEH7UueRabMf+sFz
 Lob53Gt8/lnM5YOnjtyRf3D3ZzZF5tcCUMsyLpVpfMgAsCCZVSN4dj+/skmiFPjUOXo/
 J/lcH3L1S/Pk+Cdk1CAZZOAwPzpY0Cpyax/zY5udJImw3bP5V9Kzc1nnijUmIWWYrMLe
 oGuzYwitQzUF3uuB2HdeP3Wrl+wk0yeOuQIdxJOlAwgUw1TjxkfbSn0v537ocf9AwFPC
 NHkQ==
X-Gm-Message-State: AOAM531eo9Zxlhxi6fKuFayAe0Exos4CINRYEXo4GSGrj8Y9Vkl8Lw9+
 towgbra5ee6Wh+OK/HG/fz1WRQ==
X-Google-Smtp-Source: ABdhPJxxzN0InyIPT3wZ4yrRXF60LfzTyfxTxltfYsECByW24A8xFTc2gR4pZViXJF+7YEi1Zy3KTA==
X-Received: by 2002:a62:4c3:0:b029:27c:892f:8e22 with SMTP id
 186-20020a6204c30000b029027c892f8e22mr4528102pfe.6.1619621584742; 
 Wed, 28 Apr 2021 07:53:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 18sm162004pji.30.2021.04.28.07.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:53:04 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] hw/sparc*: Move cpu_check_irqs() to target/sparc/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210428141655.387430-1-f4bug@amsat.org>
 <20210428141655.387430-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9ebea8b9-7481-3ea9-3e05-b08bd5ad4ac5@linaro.org>
Date: Wed, 28 Apr 2021 07:53:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428141655.387430-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 7:16 AM, Philippe Mathieu-Daudé wrote:
> Since cpu_check_irqs() doesn't reference to anything outside
> of CPUSPARCState, it better belongs to the architectural code
> in target/, rather than the hardware specific code in hw/.
> 
> Note: while we moved the trace events, we don't rename them.
> 
> Remark: this allows us to build the leon3 machine stand alone,
> fixing this link failure (because cpu_check_irqs is defined in
> hw/sparc/sun4m.c which is only built when CONFIG_SUN4M is selected):
> 
>    /usr/bin/ld: target_sparc_win_helper.c.o: in function `cpu_put_psr':
>    target/sparc/win_helper.c:91: undefined reference to `cpu_check_irqs'
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/sparc/sun4m.c            | 32 ------------------
>   hw/sparc64/sparc64.c        | 66 -------------------------------------
>   target/sparc/int32_helper.c | 33 +++++++++++++++++++
>   target/sparc/int64_helper.c | 66 +++++++++++++++++++++++++++++++++++++
>   hw/sparc/trace-events       |  2 --
>   hw/sparc64/trace-events     |  4 ---
>   target/sparc/trace-events   |  8 +++++
>   7 files changed, 107 insertions(+), 104 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

