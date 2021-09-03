Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0749040073B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:03:29 +0200 (CEST)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGLQ-0007lX-2Q
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG37-0004Az-Nf
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:44:33 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG34-0003YI-TF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:44:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t15so386589wrg.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KQ6VNEDT2RTSrtudl0wF85JMAcGQkDFdqJ9dexlByDI=;
 b=j0YbQMDCCUEbh8WfA/4C6tjTCZz5YVgUlnkvm7vBt137y8oCJJCgceYmnd1W45xDsj
 fH2oliFfUD9c9XqutLEe1u5GTFJ6NAM0xeLY5W7fHmz3N4JrZIxA65d+kOsL2+ohTMMZ
 pz2NWVSauNgwHAR9TfxgbMUUxFdzWPsbV7R8NCfsWMr3X1UEPkWtchjxP20wvoSCi3RN
 2F0iPe5rDeOWIgYfpiwvyG9SdVoyXltSrkbqSEyUhJSapGdh1kKfq26I6utdBnwZlpAN
 hMZ0E1VMPwkZiA/nmt6T74JUpWM/2vzkg/YXgRLLDqbAk0z+L4XVz0pmGyj5wrmMUf7O
 sEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KQ6VNEDT2RTSrtudl0wF85JMAcGQkDFdqJ9dexlByDI=;
 b=gbpU7JTta6JLcEzmb4nmyhO4st+C9W/kUiihvdW4juhGwD8oR35+TgjSRvre+c18sc
 uylLogsi+ixEUYnLt0iNmKd+sRO2F5l1oiUFDQ41y5QpS1m7llq3PD0TBNKwN86ojRtg
 4JedkEeNY/ZvmPiNn0Bz9WWEaahwjfLNocKsNCcXaNm0tGnGNmKEjfMI4ZAE6b0sAenQ
 DiPKAGuUP6ldoN+66D6DIEpTJP6GzINCSHMwYQZKzeHDUSQkLgWcPpdgcC1Y3Kouf22j
 kSWZxQQPIu3JnVjdNZLdsj9q/CmK6uO6blbHxDDggDJgDJsln1tQAkqHRwGPxkD+vhG7
 D/3Q==
X-Gm-Message-State: AOAM533u3hud3U+NV0zJ9cimG/KQ2XquoS4gY3zg0F6cnbQ6AdjTveny
 EaL3yp8XBwdTUGagTUHBHaj1tw==
X-Google-Smtp-Source: ABdhPJz3eHG2XBUgqkGosMAvUqwA6yjsJz1vhZ/AXgPH+VG7PO6AKFhg7sg0B/HYBLrKSYyiTUNh5w==
X-Received: by 2002:adf:b789:: with SMTP id s9mr857553wre.315.1630701869461;
 Fri, 03 Sep 2021 13:44:29 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c24sm280794wrb.57.2021.09.03.13.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:44:29 -0700 (PDT)
Subject: Re: [PATCH v3 24/30] target/rx: Restrict has_work() handler to sysemu
 and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f0e217b-2580-49b5-5cee-61d8ab41d706@linaro.org>
Date: Fri, 3 Sep 2021 22:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
>   target/rx/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 25a4aa2976d..0d0cf6f9028 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -41,11 +41,13 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.pc = tb->pc;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool rx_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

