Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A1400663
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:14:08 +0200 (CEST)
Received: from localhost ([::1]:59330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFZf-0002np-Kj
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFXh-0001By-DN
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:12:05 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFXe-00026W-Oe
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:12:05 -0400
Received: by mail-wm1-x32d.google.com with SMTP id i3so62888wmq.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mxyctmapl79Ub3Q/zYX+Nkj85YoukkH7BHTHMekfamE=;
 b=t9RFyV/8T9K6nv3dHRjG1hWQUIpgeAPiWzbli6rc/aUuQ31x1HtnbcmsiJVOb8T6rR
 m4qiCVH84qQK8xPbNGXOZUpCRPvxDeX7tTBSsZh8M0374UGQg6dF6PLZwyo9ISjfc9bJ
 CWfpxjGwhMr7vTpK1fPtfwbm1iJ8HnTJdrYosgJK9izgHdZ0ztxg8B2uyepCOhJplxAp
 prdXjw8n/KT5kuDuS96LqrCZaNEgUC6kDP7SmktLzm+AQ+9mJ5wvgVVAeU25jfhlO6eI
 BLzbMQN2f0dppbQCTMKOQkiUcLDlvJ+v4vT/tXsEEKXyNLSD/44J84hSUEVubACT1vl5
 uKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mxyctmapl79Ub3Q/zYX+Nkj85YoukkH7BHTHMekfamE=;
 b=Skl/+1hyL/Sn2aTUCWKWXnkFz991MQIOL2BRnWwfwx3mi+tJqohdgg435Es/mpSbNZ
 2+9/IBUToMYhN+szESCyOBHazhJ+a3QvBPZtGOwYSosYjkOT11BLUsAz1y0NSnd7QuvI
 AsWy7A9Obbwi5qIgARzNcnzhtivcuMPNUifft43KUp/IdGkVeeDxGWWMcFVQIR+mhy8G
 CseRL6VH2pPrwyC3BIpaBvnCX5v47T5uCpmqSbNWY55M8v+j8vuCa8mrv6/gmHQDSA38
 JaNUqNJ9KJyWoV7nWT+gSSmg/3D/OO676//5xSI5EaPy6BtK0S0jqKq/nNSx/C8+tNc6
 tw2Q==
X-Gm-Message-State: AOAM532aT0d8poN/rsAxI1eFl8aaLJm18rgq037NAPVLC+STProMYMzR
 aZO/kTwNjQZ0D6Zp/EBkZe5f6A==
X-Google-Smtp-Source: ABdhPJy+MRQgwX4y9J2xsMLOLDvh4kR8c6BOyH1OQWePN8Q6sLyIRNmiAvv2gW9kqjIBssHC4EjXwA==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr455976wmj.1.1630699921311;
 Fri, 03 Sep 2021 13:12:01 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d24sm273952wmb.35.2021.09.03.13.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:12:00 -0700 (PDT)
Subject: Re: [PATCH v3 03/30] hw/core: Un-inline cpu_has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a72010ab-56d8-a6ca-14a0-7caaec76eca0@linaro.org>
Date: Fri, 3 Sep 2021 22:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-4-f4bug@amsat.org>
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
> We want to make cpu_has_work() per-accelerator. Only declare its
> prototype and move its definition to softmmu/cpus.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h | 8 +-------
>   softmmu/cpus.c        | 8 ++++++++
>   2 files changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

