Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0022440071E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:51:36 +0200 (CEST)
Received: from localhost ([::1]:47920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMG9w-0007I8-0q
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFqp-0002fJ-I9
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:31:51 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFqn-0001eg-M2
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:31:51 -0400
Received: by mail-wm1-x331.google.com with SMTP id u15so101421wmj.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IuI8V71Jj+hTTxPmLaVm9RgBYo3XervExPJzr/+wck8=;
 b=BHJmUzDO3YywOUa9sdMc6M7Mu/GQRndqEiNv6lAlw/Rx2vJ69SftU14BI/7FyKvVj9
 /uSejEVcW3KrPYDJAJyYChPMo1COohaJL/FXfRq2f06sB0IBPSkSyKXLV8C/rFTDVb7E
 WjHNSLL5Ss9dhHvBCzA6nwVi4BQ/020CB2mCBU5FNscWowKriFlIsU05ePAcI11HBhBZ
 8EJaMt/LSnFNof7n0feMVm2QdfWC+CGhuNk0uCoYDLrGLAXIEX9D0/LRxoU1O0AF4UA4
 kzHj1+GLCmB1fy3OyPTx6ajgae2BTAFMx+usPTXWXhBd7mz+rL1Z/GcPM+49esXseeLB
 SgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IuI8V71Jj+hTTxPmLaVm9RgBYo3XervExPJzr/+wck8=;
 b=VusU4Z8S2KpEEWhBDQ9/WKKABrTvNiNVOWI4ZwMXezK80HxMxN7uFTWastbrkndyEV
 lXMI3wBWxJc9guDPYIyobpjhaEjliRdsmajmqa3U/ql9atJBtYE4hhSXwNwBvoD38/ja
 fvCwnu5Zv3LabUpZsrUf2CFnu1vQzjo6yGne/vX0RHQhkC+ZZ6Jp5Gc9S3GSOzOVWtjD
 yTDNEIbOacTZiJDVVrXs4geXWFqeKlXR1it1heh5oOh6WkwvWof1WuogKKAeWeker93i
 8Xok0T0D1x7hMPkNmsgJORbrFtcvBc3i3x/yPc9XxSix9l/Ns5jkH4ufC2hm/2MTulC+
 Z4Ig==
X-Gm-Message-State: AOAM531Hzu+NGKGY6xn7bCO93bkGE3adB9FRMpHnOyfps/ti7512zD1N
 4rC47Vp7RTTzOxv+vqprReWsxg==
X-Google-Smtp-Source: ABdhPJxfq3NlZYeWiDE5W/APiCzDJdzufksHOX18ryVfGevh4sxLdu17AHeHdIzgstpOHsuJ9Y+KsA==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr440384wmm.182.1630701108006; 
 Fri, 03 Sep 2021 13:31:48 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id 129sm315688wmz.26.2021.09.03.13.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:31:47 -0700 (PDT)
Subject: Re: [PATCH v3 19/30] target/openrisc: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed2e67da-0ff5-88af-6522-1fd029511e3c@linaro.org>
Date: Fri, 3 Sep 2021 22:31:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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
>   target/openrisc/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 27cb04152f9..6544b549f12 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -30,11 +30,13 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.dflag = 0;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool openrisc_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

