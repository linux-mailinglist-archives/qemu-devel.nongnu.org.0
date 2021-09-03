Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144C400698
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:27:06 +0200 (CEST)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFmD-0007Gi-9U
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFjm-00048C-1s
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:24:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFjk-00046m-Gh
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:24:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id q11so325327wrr.9
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MUAOnWb7Jr2o1NB8tpwx1E/Lm7U1xeRRhxPNvAXjZbg=;
 b=vzZJ3StsffaZE2XWFvvqf2xJqEy05bbfJRhtDaeaWq7QuAU52n/TB/ULQ8WeVNs54M
 UGk4VZfAumjAQ6YHZqLXwehiRMweE/3kJmX4Exi6/vcM0AbVsP9DyQ+kTZSyXOjSTQXE
 yltj+XKDtFQcrEjs98IbsnvIXwqtEH/TjR8pwEw8KEUkc8NYtmXPjP513FwOCCGUt9wr
 aStX5sxRH5/5TVq63meFggk5pkY4HjNNTzztQF0zM0dnsU7O4t2Ixsf6lRKnmGoibQxd
 a4FPgOEbY/12bxwaYsGxLbjms3hn+0Bpm8n2QXKQeM0XRr72OBCjWTcA7StsxwdGykZR
 MZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MUAOnWb7Jr2o1NB8tpwx1E/Lm7U1xeRRhxPNvAXjZbg=;
 b=HGD98ryQkBkoLBPsgkYJWDGSTeGAcErnj1b2tjuU68pr7EsO9GAjIRaPfwUTPCp+HG
 4dhXh3LTwwHHNzKxQhFDaFQtIUBv5IC/rbZ/1ptewLnOf1AoB8gkdNZnQFlVasGuIUHz
 73j9LJvcyfMFP6C+sZ20ufLte+q8Fa+JwcbrPndUx0ekuKPOKpgOUW2rVD5+7i5SFXjI
 rnjr0kgRt/q9l+iyuuUCJJMMdnCz90cz8fkRgxwiLJZvdB3fqvnVCpjdErGDIWuPbMiI
 AxcC2yI6hLCY4iV8IRduonNKTzueRViXMmfSPjICq+9EWHd2BpGXWNBx0lDOsNVuJNlH
 Iabg==
X-Gm-Message-State: AOAM532R1i8mRgDKzOfDZBb6wQ7C3H6NTV9cNElRWT7AsFeC7Lv/981f
 1oDOUN6cSBj1FdkdlV7zJXU0oQ==
X-Google-Smtp-Source: ABdhPJzUsw/5kYywwKhFVX1rjFqmUKa3i/mI2bjH4AHQJ6YuS1HfmSJytNGtWbSvomY0u97BFeRM4Q==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr799125wrk.235.1630700671118;
 Fri, 03 Sep 2021 13:24:31 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l15sm315117wms.38.2021.09.03.13.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:24:30 -0700 (PDT)
Subject: Re: [PATCH v3 15/30] target/m68k: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ac98aaa-ca63-0db6-87ce-a77193044dd1@linaro.org>
Date: Fri, 3 Sep 2021 22:24:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/m68k/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 66d22d11895..94b35cb4a50 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -31,10 +31,12 @@ static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.pc = value;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool m68k_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

