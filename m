Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8965A4005C3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:22:27 +0200 (CEST)
Received: from localhost ([::1]:36420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEle-0001as-ID
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEg5-0000lA-RM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:16:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEg3-0007h3-Cj
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:16:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id q11so114330wrr.9
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n/pleUJEmykTCvg8Aw+flkSU4YpF91bSEb5xIBG7yjo=;
 b=oaLVi4fMivRi8aPf21Jq2nKzlRmAlXxVxOcfqtrQWrLVReCbWTR2uqING+CMO5p4WV
 B7srr9oUgfKue0+8BPEAY/SkcWuppK9JEtP8Qb8kOiNaPwpwUZEUST+RhkwFtFYGsG4c
 PfQ/5AVpYyxLXrNpHUeJqC/0Wrr/7WUHA1KwBXl5i6G2KUrG0dRHY2LGQR1UcVApiJB4
 jIH7MoUARbmb9LyUzs6j3peIh+0QHGnKl6+y/WS8PAPQjbgKACyoc/ndccwco3/SL+xz
 g3HTvr7jtU+9PLfPQf7ElO9to7kcv0DRbaNnbKPufayn/2G6NIfoWv1MWPGRImK2DZAe
 2t7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n/pleUJEmykTCvg8Aw+flkSU4YpF91bSEb5xIBG7yjo=;
 b=t1oARQas6FgaEVCgzkFLf+6/XsL3a/cRfrkzY0QMM8nTwIgq3Rp7kANzI1XrgJHGGN
 ovLTKSblAdE6wXkmKMqeFqwCTqlWLatSGet9b/Q7AQ6BdoUbcFMhopKhcP7fTY49yfFZ
 YcBHVjTTWC+BTnXIXY1a+zQyaiKybw982/NtNjyUYvTlZS3YRUEAMsz1EjueUSx5lG4B
 lv/TNNO/3wboiEIdTuGZQuH+YefKfHSWl62TmpGfZeQ025eR3IRuhYH8lrhveuXjG/A4
 T8WHHTGLngGhWqLHqlkx8cefO4wvV41qNYEd6xpIvhTPeSfuhZ7fUa/DlpMJM44JCRPD
 jyLA==
X-Gm-Message-State: AOAM531XPJtvU82N9rGR+rcZ96trkOCAzlgTTUxRdVmR65MrBmzafXwv
 +pCrGcnsJJn3QMLUTTv+ZDHq4g==
X-Google-Smtp-Source: ABdhPJzwHCri0OrX009viApug9HZJ8QL6hMoiZY5hicXQ5oLiosxOoKLPOGDod8dkisaB8W7SiYFsQ==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr591846wrn.323.1630696597981;
 Fri, 03 Sep 2021 12:16:37 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d145sm238391wmd.3.2021.09.03.12.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:16:37 -0700 (PDT)
Subject: Re: [PATCH 13/24] target/microblaze: Restrict cpu_exec_interrupt()
 handler to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7886a59c-b597-f5d1-5742-d0c5b5c072a2@linaro.org>
Date: Fri, 3 Sep 2021 21:16:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/microblaze/cpu.h    |  2 ++
>   target/microblaze/cpu.c    |  2 +-
>   target/microblaze/helper.c | 13 ++-----------
>   3 files changed, 5 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

