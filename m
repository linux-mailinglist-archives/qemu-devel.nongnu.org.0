Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877AB21DF23
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 19:48:14 +0200 (CEST)
Received: from localhost ([::1]:46644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv2Yn-0002ZT-JU
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 13:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jv2Xf-0001fE-FZ
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:47:03 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:46546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jv2Xd-0006cw-CU
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:47:03 -0400
Received: by mail-ed1-x542.google.com with SMTP id dm19so14420767edb.13
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 10:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eLZFiaIQhG85ce6oAH54WPJEZMdFy/9Lk9beKWcbNwI=;
 b=CMz/Q4cNUZFI7PcZIt94QS4dFAODaw/dIa5UQL+86lIdxtkoSqlS7yyIEA+4+r4XTu
 LMOrOUOX3nQ8gHgiPti3BoAkjOE3pcpoWFi3GiP2EiTlPEui4xkUfjfb/OhsP9veDkOb
 HGqJFmM00Wt6e1x55lBjSMuog9f4ra1q8oWND4+s8VredgSdImrST5ZeccIXQCKshHhX
 EVTECT57byoc+wQgPsU2mCdZioqK4Mfi0uu/5EHmuMP4I4zvukpOn6AIvBR3SO2thO+h
 q4PiC8Qwp/hrwuQJwJJ2eHvoB5l1TOuK1JHQL3108XEhLU/aqoTopFdbLIcxbFCRrkQH
 PalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eLZFiaIQhG85ce6oAH54WPJEZMdFy/9Lk9beKWcbNwI=;
 b=g/TDi/+mV+dqwuqG1G8DvQ9LW0LqaLBjp9mZOmYeVlfwfT3RVnJMCPT3KGv7wzHjtW
 NzR3vPi9LBlxjiQYbOaly3zPSc85HgPgJ3musCKzW5pUVWNYm4Ugmh6BH/ri9mMMce14
 VgfrAftEQ6yAiWpuVd8TBO7/AyslpQRv3ytiODH264z7MIQj9ykf5rG+0GroV4ui45/A
 MtQEtZNw0pF6ez/lRFZA4qxBZBjvCvvsNgrptRJJEP9dD0x2dzyEWnyafhkaSMdP2IjQ
 /N9UescLXvwhVYR7zuLMisxTcVnVnUR6ydPfw5RGgGLz2/dlRvupSsgjvHi1RH/yIaLS
 cobQ==
X-Gm-Message-State: AOAM530ltTvzujmaHD7d27FaGjkJAvtF3roP4Pit9PfjC3DIQpv5cwJK
 t1JuX/micxvd7l2AeCAGTGI=
X-Google-Smtp-Source: ABdhPJy2mUG8HIbHdipEvVhOrhR8tQcpTT8wEI53VQcEJb+G8W8UprI3w2BZiEUM3ComjDU9kuQVtQ==
X-Received: by 2002:aa7:ce84:: with SMTP id y4mr527806edv.113.1594662419451;
 Mon, 13 Jul 2020 10:46:59 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id a2sm11892495edt.48.2020.07.13.10.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 10:46:58 -0700 (PDT)
Subject: Re: [PATCH] docker.py: fix fetching of FROM layers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200713145801.29278-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8954bba6-031c-a341-b74a-048c02ce8c66@amsat.org>
Date: Mon, 13 Jul 2020 19:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200713145801.29278-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/20 4:58 PM, Alex Bennée wrote:
> This worked on a system that was already bootstrapped because the
> stage 2 images already existed even if they wouldn't be used. What we
> should have pulled down was the FROM line containers first because
> building on gitlab doesn't have the advantage of using our build
> system to build the pre-requisite bits.
> 
> We still pull the image we want to build just in case we can use the
> cached data.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/docker.py | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

