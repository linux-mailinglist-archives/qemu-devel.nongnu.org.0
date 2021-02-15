Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C1831C334
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:50:29 +0100 (CET)
Received: from localhost ([::1]:57126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBkpA-00060o-TB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkoN-0005ZT-Vx
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:49:40 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkoL-0008Nd-Np
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:49:39 -0500
Received: by mail-pg1-x52b.google.com with SMTP id o63so4890500pgo.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wiW/qFgVA0zUr40y8XwcIycb+FflCembZRPBgtlFoBo=;
 b=cdvu5Cr2mEc9sSrJgllXfLh4IRbfJHHU/kMIbf7sfhxcxwQppIa6YTA6NbM7SE+jMl
 9yr6+/if93ZWUKzn9HbZcZh2uuBd/gxPejfITpWgh5wjDL6aUNtqMU0WOlssV/TBcDwO
 xV7qsEoedofOD9dNh7QlgSuTlnd7sGqsUZAd7M50VCI5r38bYSCaxIz1O/uA53q/Py8+
 lHi0yidn8e119/R/uHbeKOFJJuLp5A1KxV5d1SzSWENpcZX74nDDTcxs5GGEaasgj+F3
 WJmV3k4+XlkJM3NqlDp55fUHTXBHQkaQxC/8cJCji6gqEYIUX8F6zKRkxpwWkB3delA0
 3YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wiW/qFgVA0zUr40y8XwcIycb+FflCembZRPBgtlFoBo=;
 b=l7CeNEwpoUDf+N9djRnuL+G9+ajVDhvBKzmonOykuhsTbyVXKRbP6dwMyl0BwVws4A
 vqYLQvAq7zuSMkI6Inuvwz4KfeOLNwBC+nV+w+sz+yYlvrXL6krAZAMmJSPro6Crn85G
 qbCj+Rn6XG4zcgPBDDmAMC+3+23qtPW6gG9n+Fr+61h1JhGP/zo3qaFQdU4tGCxZZTjq
 WDshoZOgnxe64Rl9HrDVZwAtTcEU+ryaIOl77PFOezqMkd2uqDmmATV2bEuXzpNJQsvf
 ocxx+s52d2mnhNIVD6Y4esfz0l/RbCm/i9RSgxqVxi1m83U8CIJQyAdfCQSrzDm695Hu
 iByA==
X-Gm-Message-State: AOAM532jvd3PVVIaVu9Vy33B/9iekIvWIuFaUxJewdnioQDOAscLOlJt
 /RZdhv2O7Xp38tbiLzIdP35sxQ==
X-Google-Smtp-Source: ABdhPJzMB3OHnRuvYBUYAkB6FcCx2Wfwu5r9m5GNDhbXOn5BOhUNpTdPJm2M9Bz5Ewyl8SVm9I1ykg==
X-Received: by 2002:a62:dd89:0:b029:1de:5c28:771c with SMTP id
 w131-20020a62dd890000b02901de5c28771cmr16343711pff.50.1613422176245; 
 Mon, 15 Feb 2021 12:49:36 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id h12sm18739733pgs.7.2021.02.15.12.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 12:49:35 -0800 (PST)
Subject: Re: [RFC PATCH 24/42] target/mips/tx79: Introduce PROT3W opcode
 (Parallel Rotate 3 Words)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2cc0b283-e44e-7aae-5561-2ef7b8a5e801@linaro.org>
Date: Mon, 15 Feb 2021 12:49:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> Introduce the PROT3W opcode (Parallel Rotate 3 Words).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tx79.decode      |  1 +
>  target/mips/tx79_translate.c | 28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

