Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC48288BC8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 16:46:32 +0200 (CEST)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQtfE-0006yR-1I
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 10:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kQtdN-0006Mc-8d
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 10:44:37 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kQtdL-0008Vd-N0
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 10:44:36 -0400
Received: by mail-wm1-x343.google.com with SMTP id q5so10099639wmq.0
 for <qemu-devel@nongnu.org>; Fri, 09 Oct 2020 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZcBpxENNZBm9Pdrtjd9+gi5JOHDQHFEdTR++4eW7GG8=;
 b=F1eLHX3vCVfIlrGoVyo5tDufoT4spKz+5SmwP790yi2EDVrFFXy2/x0+snQ+EL7VUg
 4UzPp50Fcku6WIx9SV+nDQ+QfWo394Ht7qJEKDGaMgJv6wt5tUk3v8RQwJMsKK0afPFA
 PFklZdrvz/hxO94/iw/02IstM6H53qYGbCSxAydCZtTBOBHXDRH5fq/x6CUuixdCyiov
 AAK9mRP7TRtt7MoBBkkeB2t49pNsGF3/Le8JqBt9A9D616Y3cFLXptV+RW+YmQriazWt
 41R7pF55r5p+VQXOHCQM7K/nJ7hh673suOj72ISuvXzNXZL8qGview5pduFs9EDwYOXL
 FF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZcBpxENNZBm9Pdrtjd9+gi5JOHDQHFEdTR++4eW7GG8=;
 b=kvzfYmw7D/VlcUfWHCJl+kvkTpMQmXTKIDbLqhLslTR4z/OE9Q1NIaavNpbcK/cgbC
 alZO6eMwbpr++j4bV/XSn3qPLv9mfF8iaSH94weH+ilpxzpm7L7tDtvaUVGJ2uWUFRJR
 V1TqqOii2Dwd40puA7srB6PDF0zn44J4h1fctD7ikKHyO3sDw0JgTfB5KFI9lrJGMqjG
 8fbV49sNzZOuuQf0UGKVvyE6ZzGcoJG1d5ztUfpB+JKb0Z6rxieh/fdQtz7jvzRPWgnN
 SFp9wRO4Wvef5hwtM9U8CRBwwfr24wAyKufWLWrBHmT4tn9Rf1TnvZdoCNkfFutGrApH
 9n+A==
X-Gm-Message-State: AOAM530vq1V3fRE8DpI37GxKm5MKUVZWSzB4XLqU0992w6ufRzGnY50v
 m6+ff2a6lWoCALjq8K2Mdyw=
X-Google-Smtp-Source: ABdhPJxYxBE67xZbyl9O5vyhdeeejYtsFCqh2VTRoo2sunK5/cErduQB0cAuB8Nd6WgSePhiy7Az4g==
X-Received: by 2002:a7b:c843:: with SMTP id c3mr14917573wml.67.1602254673776; 
 Fri, 09 Oct 2020 07:44:33 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id o194sm11608873wme.24.2020.10.09.07.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 07:44:33 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] target/mips: Demacro helpers for
 <MAX|MAXA|MIN|MINA>.<D|S>
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 qemu-devel@nongnu.org
References: <1602103041-32017-1-git-send-email-aleksandar.qemu.devel@gmail.com>
 <1602103041-32017-4-git-send-email-aleksandar.qemu.devel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a6d61f6a-7bb2-7ce3-25a7-cc8e62676487@amsat.org>
Date: Fri, 9 Oct 2020 16:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1602103041-32017-4-git-send-email-aleksandar.qemu.devel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.208,
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
Cc: peter.maydell@linaro.org, aleksandar.rikalo@syrmia.com,
 hpoussin@reactos.org, chenhc@lemote.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/20 10:37 PM, Aleksandar Markovic wrote:
> Remove function definitions via macros to achieve better code clarity.
> 
> Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> ---
>   target/mips/fpu_helper.c | 104 ++++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 81 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

