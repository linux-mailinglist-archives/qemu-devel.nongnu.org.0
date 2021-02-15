Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30531BF09
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:24:54 +0100 (CET)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgg9-0005RQ-Nt
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgce-0004MH-FS
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:21:18 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgca-00005I-Vx
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:21:15 -0500
Received: by mail-pf1-x434.google.com with SMTP id z15so4461483pfc.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VyP49pgysZ1EuZz1kHbakPZjmUVZWSnYmmo4Lms1Iww=;
 b=eCvinVYtzzrOmap+CIGqPvUfVJOWS8VjjdC9W+mz6wyBa/jNEZDtua1MlMUINkkgpm
 /3Jv79fg6vh45nlU6tB4ByQfa3PgUPRTJz/4O1OVo2HAtRqcaeyl0eUsAXmQR7SpslKJ
 lyz2zbJuF0fipA1jNB8FzAOUjt1kAY8W5hW/juPVMiIO2X5HyrorLifoK5Pnz7+n1+v9
 b27MuFetVL7RXpKo+386CPE+y79Q9xa8uqXOYXu0xE/B+TunEF/xZw3zwR0Sa2zx6lwe
 /Mc7t1ssrLwTnGCxx8ZVDJ4jJlFIVzH/9xTRgi5cTUlfEoNQgacfRxnucYW5DtyCEB0B
 VeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VyP49pgysZ1EuZz1kHbakPZjmUVZWSnYmmo4Lms1Iww=;
 b=PDm3ZN6Pj0Ot4qmMmT8dGmEsRy9CvvEBXJB4zCsrUUM1s5StokeWVFO+npo/5qZCFb
 xMZMs2c7q4EJmO4epoCxQTR1GhD8Z/xegayvfjURWOHbfXFA89QYevq5LjDToYAcnqKf
 vFj0RAlLAfC0F0u6agV0g3Lb6XJLOedt5x+Cpem1FRHpsUf+steid+wWTL2YswppSCWu
 AAL96zl5LRkky75wf/l5kTYlHAOJ4xzi0927OAYIfPFBu7uUkpcP9qvyac8PwkXxa7+f
 7W7hrvzAD0MC9yYkv9yI4mHhWeQ474QGvyvinQUj0/PkQg554o7pDqzyMchrolvM5XmD
 Am8g==
X-Gm-Message-State: AOAM5339kxISDC4wnSxVXWlqhORoxPby+22tS36o9LT2wC/3P8t70A4P
 aJ+Eccbo9ZYCijr34DWjm1tDvQ==
X-Google-Smtp-Source: ABdhPJxEBLSnQ2wXxuXRjchcnGKg/O06D9/FO0VbeapU8luc9PdCogofnM4Kgbe77F3qrwpcrdmohg==
X-Received: by 2002:a62:8342:0:b029:1eb:5024:6f1b with SMTP id
 h63-20020a6283420000b02901eb50246f1bmr9994795pfe.49.1613406071308; 
 Mon, 15 Feb 2021 08:21:11 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 w3sm3223315pjt.24.2021.02.15.08.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:21:10 -0800 (PST)
Subject: Re: [RFC PATCH 08/42] target/mips/tx79: Move MFHI1 / MFLO1 opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ece80c8b-2521-db4f-8988-7ba94b5a0c01@linaro.org>
Date: Mon, 15 Feb 2021 08:21:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
> Introduce decodetree structure to decode the tx79 opcodes.
> Start it by moving the existing MFHI1 and MFLO1 opcodes.
> Remove unnecessary comments.
> 
> As the TX79 share opcodes with the TX19/TX39/TX49 CPUs,
> we introduce the decode_ext_txx9() dispatcher where we
> will add the other decoders later.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h      |  4 ++++
>  target/mips/tx79.decode      | 25 ++++++++++++++++++++++++
>  target/mips/translate.c      | 15 +++------------
>  target/mips/tx79_translate.c | 37 ++++++++++++++++++++++++++++++++++++
>  target/mips/txx9_translate.c | 20 +++++++++++++++++++
>  target/mips/meson.build      |  5 +++++
>  6 files changed, 94 insertions(+), 12 deletions(-)
>  create mode 100644 target/mips/tx79.decode
>  create mode 100644 target/mips/tx79_translate.c
>  create mode 100644 target/mips/txx9_translate.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

