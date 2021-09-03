Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EBB4006B1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:34:42 +0200 (CEST)
Received: from localhost ([::1]:57854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFtZ-0007UL-0N
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFqE-0000wU-Bw
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:31:14 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFqB-0001BX-Qt
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:31:14 -0400
Received: by mail-wm1-x32c.google.com with SMTP id g138so88273wmg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bg/lxOaKgNK7p03NwBu4EagG8gbF3wogDiecV24XpwU=;
 b=N7Y7UOCwkEiqMP/DA2rhef2OLc1uTSqNeETW5xALwf+2bPM9vLPwLP2mwNJoCACMW9
 VGKi6Y2sF5A5a/NW+D+AWWckUMjZ4g3RW+QjWA4qk3jIut3SSJ9spjBUDhjvwevFox5I
 JxUNi0LSnwXZj39KDzqlWU4jMSwm5sc60TEToEgbjTBaHRQCxznMjmrAUesETWr1pxNW
 YyW+6rvnEyxw8H9JQrzfuQGZib07c4Ny8cSP8XSD4x2scI1MkvpGzBsmG8mPGMPdfgDz
 mq9c4Q6tDvPpU/qVPLs0vNhp9EqbjHmLIcoKB7Y3JPSTxJq3EY1M5NeWFCnMB3KfYlPd
 C/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bg/lxOaKgNK7p03NwBu4EagG8gbF3wogDiecV24XpwU=;
 b=GG0vA9ycl2Gr37AGx5eLPVa6v5AsahtRMkjFP8zteVJ9m6efVFoJjQgUwel+WJlscV
 ENVNuax/NvOht8/zjjtyUBWNY9tY+KYMKodx9+iRKj03RCh28qFcKYIhs0g79KHxuz5X
 4C/a3GuP1+iPW8mB26ImV9jjZTarnajLN3GeHTJjw6Pz1wW5y5YU0Jb9Au8u4cll1zya
 BMSG+KURTuQP4UVVYwJhUzj9GZHQZ498tHl9fXTkrVgsmVxqYrlfwis23PDvy7ekVISr
 9GfgobNdxq+pbs5DPDEkFXwsWNsLzcB43x8cix310qvJfN+dRwN5SecShTjYHcLf6xUT
 vBUA==
X-Gm-Message-State: AOAM530LaKWUZVdYV/r1bypGWpbkkRiQjkWKhAW96Q18ImCGGqjb9J4O
 gLWTc/KvimRxTj7hsP4FHHme2w==
X-Google-Smtp-Source: ABdhPJwzsD1YoBLjkg4zHzKfIgPz4jC9G2HwCKaXpDjC3rpGD+JAqToGSBQB4JeRK7m1b0G3qcn/dw==
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr538951wmq.24.1630701069292; 
 Fri, 03 Sep 2021 13:31:09 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id i21sm232068wrb.62.2021.09.03.13.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:31:08 -0700 (PDT)
Subject: Re: [PATCH v3 18/30] target/nios2: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f58740c8-2199-61de-014a-fcb1db4835f8@linaro.org>
Date: Fri, 3 Sep 2021 22:31:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
>   target/nios2/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 947bb09bc1e..f1f976bdad7 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -34,10 +34,12 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
>       env->regs[R_PC] = value;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool nios2_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

