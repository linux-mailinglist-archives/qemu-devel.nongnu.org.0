Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C91DA40D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 23:49:41 +0200 (CEST)
Received: from localhost ([::1]:49958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbA7I-0001Sq-6e
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 17:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb9zd-0007pj-UF
 for qemu-devel@nongnu.org; Tue, 19 May 2020 17:41:46 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb9zc-0000Hc-3w
 for qemu-devel@nongnu.org; Tue, 19 May 2020 17:41:45 -0400
Received: by mail-pf1-x443.google.com with SMTP id 23so509398pfy.8
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CMye0gRnqmKea87uFYvrR2qGt7AWfI8R4JkHmzP32YI=;
 b=Lw21wVNFk/ef9zTd2wkJzOON9dfOfJGBjhEXeK4P387RP2jLEaJkdajlgoay5EcFQD
 2Ff2Eb/pS/1Nq7nZQPtZLQJMT2GRX23Bx2o9sfspZJhfnn4MuPgGtK7lCG6mpsScj+CW
 eCM279MJYS2tqr8o64rYJaoQtRDzDUPa3RSu+iheZYbGYaFYSy2W+Qx0uwpdP/L72mdT
 0ET2H/xsS9zS8n439yY0WnyTW+GiqF4qR0JzQg/1QzIRUVhnnWwPqirL4CM+Foj+C/Cn
 dWWcgLcUY3TA/53V3g0UCvduuMCVJQmd18ZFVUCjaExHSP4bWOzUD/rLah8CJENbZ5N1
 liOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CMye0gRnqmKea87uFYvrR2qGt7AWfI8R4JkHmzP32YI=;
 b=QCf8ELSuXRuIKIOMjWCb6zh7pwyfWdveLogHo5Gmeyeeps/+HEV0QaWP9gFwTEAM0f
 D5QvI5t4h2MtWEUYNH8EXwK7DFlvvDl7S77ZSqzW4wdF+SPEzvH9JedRT49rhTnkqORS
 3PNs1IKPMt4RLpQGgQfyINQraiCYQrtFeNfY8YdPKov7eyqvPDfYip9Um+MR/7NAKzCK
 H0AIIHXHq7LswZmISuKLUzWdGNGui0x6ieqmyJLfIf0tcq6jUWgnlxbwh3MXy123e11k
 zGYMGyMmbZaHN6Kjwa7jP8LgmPgSuYsyxeJOhmQxL2BfejNbihAc6xjf66aMuomYTK6H
 DP+w==
X-Gm-Message-State: AOAM532KN2d8hwWm+vfqG8KhdPi+K6PyJM6gzO8viW3ftpv/eQJnl+gy
 kiYx1qCU2vGYeuolqe4Sx1M3fA==
X-Google-Smtp-Source: ABdhPJwoC6noJKTG77fPfU2eCRRbQs2oAlFqLDHodQayiKG7+kIM2EtKvh92YwHJApOXyau7gQq42A==
X-Received: by 2002:a63:2347:: with SMTP id u7mr1071376pgm.183.1589924500699; 
 Tue, 19 May 2020 14:41:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y5sm356466pff.150.2020.05.19.14.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 14:41:39 -0700 (PDT)
Subject: Re: [PATCH v2 04/10] accel/tcg: Add stub for probe_access()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23e13589-1d57-8fc2-885d-b2fa34589d6b@linaro.org>
Date: Tue, 19 May 2020 14:41:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515170804.5707-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Marek Vasut <marex@denx.de>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "Emilio G . Cota" <cota@braap.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/20 10:07 AM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The TCG helpers where added in b92e5a22ec3 in softmmu_template.h.
> probe_write() was added in there in 3b4afc9e75a to be moved out
> to accel/tcg/cputlb.c in 3b08f0a9254, and was later refactored
> as probe_access() in c25c283df0f.
> Since it is a TCG specific helper, add a stub to avoid failures
> when building without TCG, such:
> 
>   target/arm/helper.o: In function `probe_read':
>   include/exec/exec-all.h:362: undefined reference to `probe_access'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Emilio G. Cota <cota@braap.org>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> ---
>  accel/stubs/tcg-stub.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

