Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299FA4006A6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:31:28 +0200 (CEST)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFqR-0008E9-72
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFkq-0005OW-DF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:25:40 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFkn-00053O-IU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:25:40 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g18so317823wrc.11
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W7k4RtqOZy7ya1WayabP+HxNcp5Fq3Mk2ZbTc+R+8wk=;
 b=Y7PtSwX3LA3cO29hKgEQ0rkI844j3EG/DnwVbuMutIDQuUE90Uvns4x6mk4yf7B+cm
 Z6Ehutu4130di1yQJkVCvyamcRHY9V7H8+/nW9cFA4cQP7R4+86sspF6SjVkmgr6mnbK
 taRoXaEV9tG9Hfk01UC455nNMEqk+FHQaJULcihgVHUwNroTfGeteSjAaIcGVZ3lfe7k
 vWQNvEvJXomiaKpwJ4tHqL+1JgHxOaDk5BcG2O5Ba51DpymToNVYzbCqx9P90GXzyM8j
 2b3ZUyaRty9XmOwlTzWm7qEP3nm+1Lkh4CwG0qqunwT4jbB+PrEQJvI5TjsNGJMxJsoD
 DntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W7k4RtqOZy7ya1WayabP+HxNcp5Fq3Mk2ZbTc+R+8wk=;
 b=ttY2rwq9G4bTDhnw2xd4kT1LuS8ZdPbAfq74KPsm38LyIFNimQ9IEWcsmp4faI4XUe
 ym3HZb/Q51LndMF38yFPNxyLu4P/xNqK0947x509mfml/kyW/pzV2L9x7cleKNYyKN9x
 s8BjNtmLYSLRSB3+LJzcn5u1gamHOZVxQramICHAnxe78oKri1Oq3P1D5z16L2Y58kQF
 fowxr+Syy7AH2A5xA5UpoUSguIYGsSd7axNUJrtbXVw2ByAV2mIidEfsnIF54rMhCifr
 aR+jP+YjzYnc8Os5PfDT+Yqd7LkOnLrjVfGNzwOEc1CYpiiORMKCQe5uZpnMZ8vqRv+E
 D9+w==
X-Gm-Message-State: AOAM531B1cXxmMb4C8lSmMZ2tw6Wj19A/tIy/4M28hNEH6kVjnZSLeP+
 XnNYrckmH19r6obda/0oujlHvA==
X-Google-Smtp-Source: ABdhPJy/o6kXb1fKJrZGJ7NA/+HnxHPvtkph89J5ZY0ajIZpI/IL3HlrDNTpZbKsJbsJhN5+OKI2UQ==
X-Received: by 2002:adf:d239:: with SMTP id k25mr830865wrh.314.1630700735383; 
 Fri, 03 Sep 2021 13:25:35 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id q13sm324320wmj.46.2021.09.03.13.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:25:35 -0700 (PDT)
Subject: Re: [PATCH v3 16/30] target/microblaze: Restrict has_work() handler
 to sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <acaab338-bc0c-3c06-37ea-dee2ba753900@linaro.org>
Date: Fri, 3 Sep 2021 22:25:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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
>   target/microblaze/cpu.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 15db277925f..74fbb5d201a 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -92,12 +92,15 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
>   }
>   
> +#ifndef CONFIG_USER_ONLY
> +
> +#ifdef CONFIG_TCG
>   static bool mb_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

