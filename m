Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC51840073C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:04:28 +0200 (CEST)
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGMN-0001Bu-NW
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG0r-0007Dt-Vt
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:42:17 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG0p-0001nV-0X
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:42:13 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so338099wmn.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KO1an/5CmjrwEhdc2mhCZ+S9p7TgIYwX9ZNZ9M9TFAE=;
 b=cu2bS4up1KUaZFvfqZzOd2qoAgEXmB9czyJg7Ld9C9RhrRFPlF7SwFqEwPUxttKJHP
 I1xS+ex3bHbMetfNUUCLVWvrfESiUFlOEywVjEsNBviabapOnUNOdhvyN9zKTl2NKPkI
 oFLzpz1YOXk4f6pHR/sY67Y1o2wn+XVbP1qwIi2sdi5BDgf0tM7J6FGdCmto3LcLIaIX
 PKJGhIKO37mpf5Ce+QN4EnowFcFFR+4AUTl4t3FVeWIkVZSObVUv39QZ23RCI1PJPmoc
 scHBKkHA2wztn0q+7QOHwGhnRETaGgrejgdp9/upgRUBCHz7lFrOigJB0pB0zh/LJOTn
 XY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KO1an/5CmjrwEhdc2mhCZ+S9p7TgIYwX9ZNZ9M9TFAE=;
 b=DRXskdw3Vh39SpGP1ta464jxh5kaD9rJLzGnGV/VEuHCIr0/5FTwVVM28hU05vd3Q/
 z5ctbhZQRq7EitPf6/G/5cD1j6HNqZOPSOSdXIzcrty55+oJhYt+KrLYNDK+WzqgErSj
 iqHJXKHlLi/4C3pW9UBG5yo/aVoUEED7FPgNpx0l201YbrDe7YbpogKx0r5NjM5a6H2P
 jewcVotmbhRFCbBAWyxcSqh8G8vepL6veO2oMeXu4SXDDcwXH9pve76WKY/p1u2Rp+a3
 mc2cdUfLyi6EbCtkRfGxzv4mI0O5dHyYiex4/RuOZ7IeUYaKVhe+uOM8C9TKYpRlq2Jx
 cvoA==
X-Gm-Message-State: AOAM532DRwblfCSd/WLmL1Jk5vBDxVvmrz2nlZN/5rdLBgQTlMXy5eVa
 HC4fidTg1rYQDDeAqqJ+qCPZQg==
X-Google-Smtp-Source: ABdhPJwceVbbv7hWOXS37awGetSIGUJik1eFEfP7Dd+3VwgeGBrwgNpP3UDG2KidWTsBePHMk6Y+ng==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr522391wmp.165.1630701729599; 
 Fri, 03 Sep 2021 13:42:09 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y15sm462739wmi.18.2021.09.03.13.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:42:09 -0700 (PDT)
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce PowerPCCPUClass::has_work()
To: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-22-f4bug@amsat.org> <YTFxZb1Vg5pWVW9p@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd383a02-fb9f-8641-937f-ebe1d8bb065f@linaro.org>
Date: Fri, 3 Sep 2021 22:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTFxZb1Vg5pWVW9p@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
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
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 2:50 AM, David Gibson wrote:
> On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daudé wrote:
>> Each POWER cpu has its own has_work() implementation. Instead of
>> overloading CPUClass on each PowerPCCPUClass init, register the
>> generic ppc_cpu_has_work() handler, and have it call the POWER
>> specific has_work().
> 
> I don't quite see the rationale for introducing a second layer of
> indirection here.  What's wrong with switching the base has_work for
> each cpu variant?

We're moving the hook from CPUState to TCGCPUOps.
Phil was trying to avoid creating N versions of

static const struct TCGCPUOps ppc_tcg_ops = {
     ...
};

A plausible alternative is to remove the const from this struct and modify it, just as we 
do for CPUState, on the assumption that we cannot mix and match ppc cpu types in any one 
machine.


r~

