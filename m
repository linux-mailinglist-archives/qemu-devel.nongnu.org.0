Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B027E40069A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:28:22 +0200 (CEST)
Received: from localhost ([::1]:38264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFnR-0001cM-O5
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFem-0001iN-Ed
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:19:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFek-0007vX-Vw
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:19:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b10so374983wru.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hrfT6D6r8NgV0kbWbMFB7eJ0H5Q19iawpNSQkwrO3Zw=;
 b=UP4L3x90K9R0Xv9kUPD2k1ldA8cppgKzxB41aZwVXYD7x/qndJVah80MG87/CBUxKF
 TQsp6BHab8hbEiq0EVctWDjgUQRASZHj3+eAB2JftZU4rDgjFNuJfnOUODTXjmvHq+Wb
 CO5SRo4MZKWNpVLFkz1S9LBbag1wL73cRaGdVxll7VdzLyexwvlp0cZN9dy4/9ct+32O
 xuGIsIHPC9o6Pv+TjnwbzRCalBEKUw0bgwH95SVmBcNFszNxj5KOrbihoohVlg16IcU/
 cuE0LBDTSZg+bzpqf7VDLPEdO9axqPBJ8doVS6whQR+pz75s6Bv4Yx4dkv7Omkpgzy1I
 2uGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hrfT6D6r8NgV0kbWbMFB7eJ0H5Q19iawpNSQkwrO3Zw=;
 b=rvj0bESd7Duej08vH4lmm4eKo0wcNwDB7fPEoYETmlE7/MSJXScK1GFli1urZPm1SS
 9HnxD9CCIBDVRJhFhbFoxBjx/KYx22nv8/l3ObvJ7nVgyQmCaRiEqbsH7ehg4EYXrbQG
 bUTC7NCyofD7wzNKPAJE1pIjDGxrsK4kTmTm2FginP05UfZsxbqBGAvlfspnliMMMssu
 yb1KKm1zf7SaiRoqsa/va/1E+/5bAI6ik27RdX2FG8HPAH6av8umnFL5L+HIlRU1WIqX
 PR69suXJIRiFztSJ8GK/jWVWFcql9Ero2qiVGT7ljykxwRIiPJ2lDmpZv1KxDQVo0tJj
 5ZPA==
X-Gm-Message-State: AOAM531UMcCQPcD/Lq8AlQiAQUXSfbQ9zsd1YQ1oLHpNZsr/OdcDvp3Y
 6rAHrnUWLkegbml45bo4zqEkUQ==
X-Google-Smtp-Source: ABdhPJxOkyr3cz4gxEh2Ke6ki62uWZywliZS86PJZb/UyH5xriM04K4qsIBYKGhxLIpR8DxkeTkVHg==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr826597wrc.190.1630700361562;
 Fri, 03 Sep 2021 13:19:21 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id i4sm360865wmd.5.2021.09.03.13.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:19:21 -0700 (PDT)
Subject: Re: [PATCH v3 09/30] target/arm: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <318478f2-6cea-e9ee-dc9d-442589aa8f56@linaro.org>
Date: Fri, 3 Sep 2021 22:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-10-f4bug@amsat.org>
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
>   target/arm/cpu.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

