Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13EB400694
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:26:19 +0200 (CEST)
Received: from localhost ([::1]:57652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFlS-00048a-VA
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFeE-00017x-QA
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:18:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFeC-0007Sq-Os
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:18:50 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so289260wms.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LqQ2qGQh8nV1ZvT9x+U3BKt+BXWg+vkVFqLIEGHhpMw=;
 b=V8kfIBCEJT52V1fp3BG4eEUjASX4Rx05CBYVPUwSnXcrpvu9DyPd9YLrQ1EFixujIi
 lUO2S1zkZF5PG/5VBU6Rk3aTdfu/NohdFpDaoPBTWr2+EAlAEqDrzmgPhi1sQ9/EZI5O
 sp0T10IQyhYcG2l5hY7SahzlV5/YDV007peO7QbcQiw6uki0FNbyDs+4u092DrKL854h
 BofPE+Yc042W1WfjRNZgBmoOLdNGI5J41nf004XrJoendGTO+R9LadQCXGvxwYAslhrk
 awNCuxHsEq//V4tBYb37j34Ybdls/wwtEv1je9PRsUGuN+bp2kKIvMshhTUfobepCiRM
 Cayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LqQ2qGQh8nV1ZvT9x+U3BKt+BXWg+vkVFqLIEGHhpMw=;
 b=i94fI4EuePUrzNOK1X08cyKD3YcP2VgO1h6nh2X01fgREjJGkR3TauGjvpADcQdx8o
 Ad7+K2gHO8nXWXBkf4lsEz8LHgLquoNrhWXMEuMPPwoGWBr913jTqztKesmNHovfxNPs
 ra3ttpUTbu5WR1Do4GImiCScT2iqipMjg0jWJzlQY3f/wA2l6kIyGsoIWFNGZbABU99g
 l39bmv1qVMa/OaR2iAICsQfKwfD9nt0pFBYTPsg9k4bI3tiF5dFReyE/u6YcQkDjdKmp
 rUumILrGrPMeJseo/AUo4hereHzMEpLhLpX+KJRHaepXSyiP9nKJ2UTS2fTeBguEkQ6a
 B2eQ==
X-Gm-Message-State: AOAM531rDDfvyXGlpi2AhKJ6XjHv9cTwSXtHgSAEeXMySfQRW3G3PSQA
 /81c8YaHTfzTz3TYMwgZFPS7Kw==
X-Google-Smtp-Source: ABdhPJw3r9Ix8xv+Nu5+AHr+Q3zSVCPcKA2sZb2hwjS2kDrQMzRlRnU83nDo49PObR1jR+RXBXRDHg==
X-Received: by 2002:a1c:7c12:: with SMTP id x18mr498453wmc.114.1630700327288; 
 Fri, 03 Sep 2021 13:18:47 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id e3sm292523wrv.18.2021.09.03.13.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:18:46 -0700 (PDT)
Subject: Re: [PATCH v3 08/30] target/alpha: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cd48aba-a1a1-cde3-3175-e9c462fcb220@linaro.org>
Date: Fri, 3 Sep 2021 22:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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
>   target/alpha/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 93e16a2ffb4..32cf5a2ea9f 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.pc = value;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool alpha_cpu_has_work(CPUState *cs)

Drop CONFIG_TCG for alpha; it's always true.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

