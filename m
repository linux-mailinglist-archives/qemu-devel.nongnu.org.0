Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F3400734
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:59:48 +0200 (CEST)
Received: from localhost ([::1]:48640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGHr-0001Lx-Sw
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG2I-0001bg-37
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:43:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG2E-0002s4-FQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:43:41 -0400
Received: by mail-wr1-x432.google.com with SMTP id g18so368153wrc.11
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OCS3x2IM2IhJ7L7NOzo3OsfaFZSDUFR4VR+0j8dzaJ0=;
 b=H8ozIcixUveIbw9k7stg4KdS0gx7rTV2e5s41Gx6botMrAh8hYIIWhIu+AvbtT54dW
 Tl8+brbL8I6gSbmldeLB6TkvxB9mAloeVrSwAdDFUCxAz3A9ONWLJnZnRcf7/3YYCKiI
 mKw5CM9pdGmfYUyVULTwZdtG4Zo2cC0TJu5c2IH8dI7SsNAjx2c3JA5uxkgkaF3syZYO
 bS8qs1qwUmnUfdlgL3bsdR1L8kzzDcc0saGHUOJA/DshHL9WLii6vhGNcqmBnmKhwPEJ
 E/skqUuaJ6aFM7UfknaO/MQDQsX7XIC1JB3/bhICCmdu8qPCP1VV/4dZA8n9iYUOsjZI
 4+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OCS3x2IM2IhJ7L7NOzo3OsfaFZSDUFR4VR+0j8dzaJ0=;
 b=V6kZerR97XHWQVi2niKNsR573ATuTyCnPa5Az9WR9bni0t62B9dlBGIXMo8Yx/kqeB
 Otl8DOgZhnCy6Ivh4XmS0G7cP3xwQOHRCB1UHy5Ptu1LDLNbyxaFZoUWLbBigMuS5M/h
 YSLPZQ1Q8NlvnLu+EqQMnFN3BnVtaAdt23ayaxew6Lf0N+29aP0s13WtZbqYcb87Wdfb
 xNeGKwT7VvyluwVGecGNJHv05p1VsQte12G812bME2hzgKAaZH2E+G5lIpjMo0CJE/Ps
 kZHxmYXK4uXkC9SIxUdNVwkD2DTo6p0/RFsrmAKQkVjKQZwQB0Cpn5WioqtnkmjZhw15
 ExSQ==
X-Gm-Message-State: AOAM5328lJmxcb8kTXi9xPQBdyuU8OpE9QbcQAxOzsm5n42Ql7Jz2tHa
 dgD+pNHd3+9QUZMWDd/l3HJbMg==
X-Google-Smtp-Source: ABdhPJzDzA0nqf/Zf1bg1Haee/zHM2hXytKc0QH8nIr2MjWxDRi+4jQmQKWadcbSkZgCEwSPJcyooA==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr939918wrn.60.1630701816896;
 Fri, 03 Sep 2021 13:43:36 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d7sm274068wrs.39.2021.09.03.13.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:43:36 -0700 (PDT)
Subject: Re: [PATCH v3 23/30] target/riscv: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-24-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56180d64-090a-1f6f-5c0a-22387c8a2af5@linaro.org>
Date: Fri, 3 Sep 2021 22:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-24-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
>   target/riscv/cpu.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

