Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0931BF28
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:27:57 +0100 (CET)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgj6-0007b4-V2
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgeZ-0005Gr-Gm
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:23:17 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgeW-0000KI-Rl
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:23:15 -0500
Received: by mail-pj1-x1036.google.com with SMTP id q72so4006933pjq.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p8D5S5oUZWPsW+VEQQ58DPh1jJg6Xc5/MPq4hBEjmeo=;
 b=H9DwOdLkgQ+PUxkJN08cNSW7cAdzk3a9t+PKJ28kAuh6hQIhGAEnXWw3ywypIgeU2F
 M6BMc/toSgbJKqUsCYGEskz4s7L5uz3RAfcltQVaxneTNtCWVTXZR6vAHst5n+Nnr2uJ
 4HIb8cXHcsGvetA9nN4bakJ9rNfLkzROvstyxZ/q0gItl6wffw4zRn1Lq4+o2wXgfsdj
 2UYnxNXUzxqUJSZ2+2RFs2NWuWYYbTeRzbu0fLbU8NNIoRfgMKsblw93WHgC7Z+nAe9d
 Xviq7bLumYJUgax7CNSrr6WxtHX0mKGBNBFyCU8x5lMyXvUFwSrDUWQTT3NxHyKE+F1m
 G0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p8D5S5oUZWPsW+VEQQ58DPh1jJg6Xc5/MPq4hBEjmeo=;
 b=EdBvEyPQWt8HRI7nLHRfUggbbcHRD089OosINc2CXa3Xn7sOkp5oIFxeSXFKSuTLOc
 9BYGaYOsHs7oAATgm5B1fFtHQ3UGOhIyg1FK0BW9hxwODtxS2dK1jsK8Giet+yIbDQUr
 uUs3w+CRDTFxguFJOpMJJwORJwvOnDYH6Rg0s03ePvMSofsKhd3gCbR9C1JeuzItRxjW
 cQwMt52LoYLWvVPeRfY+PFvKpqVft30jStWzSp3L3vB8T6W6Bt25Y+fmYUx1fEQ+NiUE
 MH88V6tmAGqgL5nCGO2Qln8TH9oENX2kpR4jASg72Sj7bg9XHmNsnpEc9UovG1rL5Mk7
 4f+w==
X-Gm-Message-State: AOAM533+tkSgdJRsim9ctZ7Dhkfu+x/Azu52HCD3/76ocrGugsQ9mMt3
 0ywRIitFOb2e2zMRUj9GdrtaIg==
X-Google-Smtp-Source: ABdhPJyyIPhbLRCtn3MCIyKdOWsiwNxFuvYDepjo9WEWEOIdYbwVUrg2bVyzNmasJdw2iS/EVp4Z2w==
X-Received: by 2002:a17:90a:43a7:: with SMTP id
 r36mr17153182pjg.189.1613406191164; 
 Mon, 15 Feb 2021 08:23:11 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 f18sm17845261pjq.53.2021.02.15.08.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:23:10 -0800 (PST)
Subject: Re: [RFC PATCH 09/42] target/mips/tx79: Move MTHI1 / MTLO1 opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19777b40-9608-6bce-abfd-54c87c28fd84@linaro.org>
Date: Mon, 15 Feb 2021 08:23:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tx79.decode      |  3 +++
>  target/mips/translate.c      | 25 -------------------------
>  target/mips/tx79_translate.c | 14 ++++++++++++++
>  3 files changed, 17 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

