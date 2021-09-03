Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6524006A2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:30:44 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFpj-0006YX-8U
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFjA-0002Pv-4h
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:23:56 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFj7-0003bt-ED
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:23:55 -0400
Received: by mail-wr1-x429.google.com with SMTP id u16so337938wrn.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wXBwe+C96NVMAw/WVJPmEePxSXgR8UnAw4mAKidy+Uc=;
 b=QHLQ3rMDWNB/26AcEt/tmQB5kk5HXskxmUCeZxjWkZY+/+gmxKxtLYBbUrbEJ9IIVl
 TXxNm1cMDVlWjjJE1EL8SyZCs1686ubATja87bAh8hUlCMrmrU+p/h2HnsSi4f6M2VVv
 ZijvBz00fTjJ0Pey6nM7GppsZ7HFYqOWG62UIeKnTBmuInsYh9s3ltuexL+iuerhbSSN
 uMg0jOQeNSsrtwUY8ODf5A01NMcBOal5Wp3/QlINZyEPfodQvP1VTMgezqqMzuZLU7iB
 OiJNsnH57C+xyoKu+8wTdisD8sJn3vaHgIGWHGCi7wCCfdTlsvskKx4OEy1NR1/zo36u
 mnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wXBwe+C96NVMAw/WVJPmEePxSXgR8UnAw4mAKidy+Uc=;
 b=PIjAWus6Rfa/ofDGSKe4y1FUZQakcdUNQ+WXb6axU60seVNuk3c37wphA3UX9iK7r5
 q5mO5aIOTpXZlPX4cBkxN0ZvgJkk8EPWxiW1N1c2QUz8SvMZthtBKiUbps4P5/SiJs8q
 AmivtsUoSWOCWpDxpmLHZwIzLneK67fOvEFgcBaiGIMBQoO8z80NGHCLggBHCMAM0CaJ
 HwYuOqsNywKgvLcRJO8hMnth1+PPZJgqk8Yj+y110O9qCSFnhCWC7Upsk7oR/8udK41C
 y8Mox0o0aLR1AXiQWWO2KkmjajRu9z8Lu3u51Tg/oGh0B/cCQmeHLGur2GdhR3kehTjg
 3ctQ==
X-Gm-Message-State: AOAM530S7eW1/RBCv2R3AO4gItiqk8b49a+SeXa/dENGc00EGQZk6plm
 gxlLDCZdl74oF22pIfGBYEn8jg==
X-Google-Smtp-Source: ABdhPJz826d62i3FadVITpOZWzNuXjQqqxILWUC/72776fLbfHJdkqtyjig/TilRLtZ8efOdunSk1g==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr839408wrc.190.1630700631792;
 Fri, 03 Sep 2021 13:23:51 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id j20sm258635wrb.5.2021.09.03.13.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:23:51 -0700 (PDT)
Subject: Re: [PATCH v3 14/30] target/i386: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2796bcf-8358-1faf-cf30-0ad87cd0ac08@linaro.org>
Date: Fri, 3 Sep 2021 22:23:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/cpu.c         | 6 ------
>   target/i386/tcg/tcg-cpu.c | 8 +++++++-
>   2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

