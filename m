Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59433AC4E3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 09:22:07 +0200 (CEST)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu8pK-00009r-9w
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 03:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lu8nf-0007oo-NV
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 03:20:24 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lu8ne-0000Jz-3C
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 03:20:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id e22so5979052wrc.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bEPxRYy55GgRk4BDFJlqkQiaVzJ/fybYZySngn1AKnE=;
 b=kpgdrLbcd5aMqrIjz4ZJscf8Dszk6TeRirxylGR1IZjlLO2nOxkQEwdEclxhZ9jaIp
 GudKlyCT5gN4PYO7/TdLWTabNP+Ec6xZsQZQmyEuu74Svp/LFB9XQu27bXTjxu6m8Toc
 XXJ79xMTlG52ljSvnKV8wibI6Mo3Wd+/8f0sO1tlTKv+YiKlRh75Jc5uOLJH0C5r4Pno
 dqTIvsyyknDvApiiyGPWaOMauxsz28n7bdEjUaLY8jRs8Iz9aWKtKiTOuisrQbBcP6lQ
 BQGyXXsQqsFR5nysyjCfS9gZrwiy3oVXHcWld2xOlfLu8fcKh4xk07I6nUUU54i1gosX
 3vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bEPxRYy55GgRk4BDFJlqkQiaVzJ/fybYZySngn1AKnE=;
 b=eLa7vyx/S5m+jeIGqG1QqZhBkSS3XQhuBPWxyF5iJAbHIKAFc3CuBiqP0rqGbvT+wX
 fEuklLtzsNkF2TIfqKWIh0YuRUbT7uLVOgcW+RVrMwJUYtSHPmioNBDSw8fS9CqD6xeZ
 Qf6NfphZUByWJvHPXWmc2WGvFzuZXVgZWgHMg2Rx4qpGH2g5SeqjScpfH9UGWGPpyONF
 Ey4YXxLfc1TYs1G3in4e1rVmC/YPCZWCjUrHfvW7rrGxTHgxrqSHeHRK2aYxT48A/t5k
 DMzUFcaj1mjpf0cCxQ36GqojZa4VN+1iuvfRcqY9jiqldKWbhAmYhCRqTLg/GTi7tUMV
 HldQ==
X-Gm-Message-State: AOAM532FanGEgyoZ7y6TcoQ7Z0IFuLF/6Q095VB8B/5Uv24VP+yxmzbX
 snOwJliGdvtXcJpYWEB4rMBx/KBWAUg3tg==
X-Google-Smtp-Source: ABdhPJwBMKZbfIJpoHqtOWmm4qkcC5S4PgMR9+Ees5a0J9lh0jL9z71z7MksEU2SUb1ddPp0IGFqhA==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr10361404wrr.319.1624000820137; 
 Fri, 18 Jun 2021 00:20:20 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z6sm4832451wrl.15.2021.06.18.00.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 00:20:19 -0700 (PDT)
Subject: Re: [PATCH 2/4] fuzz: add an instrumentation filter
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210617195353.284082-1-alxndr@bu.edu>
 <20210617195353.284082-3-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <638771e2-b945-a136-95cf-9ef58e22bc34@amsat.org>
Date: Fri, 18 Jun 2021 09:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617195353.284082-3-alxndr@bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.254,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 9:53 PM, Alexander Bulekov wrote:
> By default, -fsanitize=fuzzer instruments all code with coverage
> information. However, this means that libfuzzer will track coverage over
> hundreds of source files that are unrelated to virtual-devices. This
> means that libfuzzer will optimize inputs for coverage observed in timer
> code, memory APIs etc. This slows down the fuzzer and stores many inputs
> that are not relevant to the actual virtual-devices.
> 
> With this change, clang will only instrument a subset of the compiled
> code, that is directly related to virtual-devices.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  configure | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/configure b/configure
> index debd50c085..40412bcfcf 100755
> --- a/configure
> +++ b/configure
> @@ -6089,6 +6089,10 @@ if test "$fuzzing" = "yes" ; then
>    # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
>    # needed CFLAGS have already been provided
>    if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
> +    # Specify a filter to only instrument code that is directly related to
> +    # virtual-devices.
> +	QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=$source_path/scripts/oss-fuzz/instrumentation-filter"

I'm getting:
cannot access 'scripts/oss-fuzz/instrumentation-filter': No such file or
directory

Did you forgot to add the file, or is this series based on another one?

Regards,

Phil.

