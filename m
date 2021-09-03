Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02996400683
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:23:15 +0200 (CEST)
Received: from localhost ([::1]:48388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFiU-0006TG-2n
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFcR-0007Rm-BG
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:16:59 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFcA-0005im-JW
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:16:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q11so303107wrr.9
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ksvR3vXBtwALfl0I6bUYOq6zF1YdgeJMV8dFDRL1P+g=;
 b=F+LmEPrSCssgf1eqjM+WBloAvOVq2tL7NMyM6LZCHirhU39DXiDO2uLD9ug3iNaHCK
 qAQxo2bwgbel/l5ZzJa4uPRl/EqjN0sQA7XIe3XklYehe60QyUJs5qg1vnpnfs/LYzJ8
 F50mpECSrD9JTS8cWWsDSVPn2dEFp7h2GfA9zAOn6e5EfN/aiCylKqANnhUX+0GyzxMA
 5YbCx/uH9oIK3BVZImpikPWK6g5wC7VESYux9bpW/knmD2hNngQDnsSLtz91Hsh54IH+
 4JT7IufJEjtYH/tbJ32xqBZvfx5N5H001O4TnBoFg7L9NuRj3KiL2d3ZfaMPEXO0z6EN
 fEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ksvR3vXBtwALfl0I6bUYOq6zF1YdgeJMV8dFDRL1P+g=;
 b=ms9pagAgIm/TqHAKbIZlS6tKUlKWWIFYHSIm5i54z5LEbEXfPwwu2WFFBEPqywqu0P
 8y3m5eNLeHZO8msrL9e5QznNpOG7FVBynvukT708cLwrU1j6ejcgy4/bqbOTFkS5hXCP
 yZ8VStPlQK74Bn1gsxM6O35d6VGG7CJv+Mi6hqEnjGdfckqStshEF8BrBWck3+Yo+Rf9
 f+Wb9r/GIdV584F9mT83C2ZA/y24vkbd3iQ3+tEK9iw/lN6P2kD0bEExTREPkKahhoSs
 GQ9Zla9O+nPhWYMplavE1ciU9HSeov0IOQLjJmFB4almw7CQ4bPI3s9tpOfO4xbSuGrO
 SJhQ==
X-Gm-Message-State: AOAM533ahCt0kCBC7Ei5L/9VoamvsBCtapycU6U4SQcwZEoJzwXZVs7m
 YKfzefi4b2W6EvgenHMq39bMgA==
X-Google-Smtp-Source: ABdhPJzV+oCZLVl1R3jywIXOYAACRgU/ouMC2nXN7qXT1ry456hLKIT4YtHfUNsVqaTI8qbV2+dfAA==
X-Received: by 2002:adf:eb4a:: with SMTP id u10mr794817wrn.11.1630700201045;
 Fri, 03 Sep 2021 13:16:41 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id b18sm201319wrr.89.2021.09.03.13.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:16:40 -0700 (PDT)
Subject: Re: [PATCH v3 06/30] accel/whpx: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7d58bfa-20f7-502b-f307-9ed8f9f4def6@linaro.org>
Date: Fri, 3 Sep 2021 22:16:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Implement WHPX has_work() handler in AccelOpsClass and
> remove it from cpu_thread_is_idle() since cpu_has_work()
> is already called.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/cpus.c                    | 4 +---
>   target/i386/whpx/whpx-accel-ops.c | 6 ++++++
>   2 files changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

