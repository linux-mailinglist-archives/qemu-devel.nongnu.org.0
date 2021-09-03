Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F3E400689
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:24:22 +0200 (CEST)
Received: from localhost ([::1]:53442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFjZ-0001Lk-NZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFhv-00074j-TK
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:22:41 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFhs-0002aB-VQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:22:39 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so296911wml.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UnbOiyADd1ZMlxRvNb9HZP0pt1hL83FL8WVZjS8Ogcw=;
 b=COG3NPL3Vxpz88wlWI3lGdCLg/LDdsQZJexfhJnrghpwFEqcukZveIdAk/fFiP0wKB
 7HNAWQIl6rmgV04BpIshszyQzk9qq0Q2NwrgljJCneyfFgOJ0xAXKUZsaU/hrF0B0/AT
 3w+VRd6HCQDmcDCjwEVjMOfRX4d+x+Lya4wftnpVkB2KXN3pr43vNkh+vseHQcZijosS
 Q3FflSz6b5FTlNEGFg6AgPTW3cZ3FSliEWoFoIHYG+zwm5ACts2RQXEeZ5OBwv2FsHiM
 zzHD5y43SWWwvU4sjxJD/8SKKcD/qNm8NbTssviVjN3cg7xbLdiiJSNeDTXPZ9eqrqkH
 KpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UnbOiyADd1ZMlxRvNb9HZP0pt1hL83FL8WVZjS8Ogcw=;
 b=XdzFD0rXDEm+gYDRt3yRNUVUXDaUzYL1k2ut5vVlb13LsgVDu6RkKRSwjkinQKlJ4m
 wIuq0kyhrha6zSx7MUPj0TBzPvnXrVSc2IiKDm7SBcNV1aMcLW5Icyzih/+W55AWD1k4
 +iwmRJYWrIKRjlN155LrGscK4lHB3K1nQO4rU8LOClT0ROV6d8GREYAR58c8+SjFvWn3
 FvHL9+W7OLUaSSfz4Qf/O7KbmrIi1WQr9QX5ViAdASXGzLMz/UaJP3Y2NQTtF2Uiys05
 Av9riIsGH/f2tkMXoxzB24vxzeylTZu+oJNDKtaDvG8UidcmlZ49KPcgjSv0ZPV4c5uc
 XUFA==
X-Gm-Message-State: AOAM531KZYttVLxcAI98Nl2OJcTgWPlw7v72dockxWpPusWYFOYM246Q
 6LU1vs7zpC50+P4/4tJXlpfCzQ==
X-Google-Smtp-Source: ABdhPJxPwO0cHTUIrMGmZMtVOl8TUayc1aTCNm++vMgNkxvRpyKHD/crU8kG261DTumMzBNsNkV5GA==
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr432498wmq.178.1630700555348; 
 Fri, 03 Sep 2021 13:22:35 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id p13sm244311wro.8.2021.09.03.13.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:22:34 -0700 (PDT)
Subject: Re: [PATCH v3 13/30] target/hppa: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f644d61-92e9-2161-284b-0643edd4892b@linaro.org>
Date: Fri, 3 Sep 2021 22:22:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
>   target/hppa/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index e8edd189bfc..cf1f656218f 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.psw_n = (tb->flags & PSW_N) != 0;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool hppa_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

