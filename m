Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDA3400699
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:27:27 +0200 (CEST)
Received: from localhost ([::1]:35180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFmY-00081F-HJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFgp-0005BE-5j
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:21:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFgj-0001Zi-GA
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:21:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id q14so341213wrp.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q+SSfq4073OmWN5SjfGpr2ImvdVTltAm2Ap93b1Y88E=;
 b=PZ2KiViiXR0yMgtsi9ubJd49eXX8m7kgtJ7JWAf0xocPcQ4Oxw4avSPsHVo9QZcW0N
 BByueunHxBruDfx2gZo+Ix58peWhu5wGIHIMCSjfvS8XdfqDnHodPv7hZLnIQBhld9/a
 y0lWLp8aIQKnuXGpPmhHwQpf/DGQHqb2SPZDygfQELNsjREPaTcvh71MJU4d2M9P2WuC
 AZHX/t3lV1bfa8h49PxfG8kq4e5hCt+9BPtVsMQjLzebnh3VaBZTuTGJBK+rNkK7BCfW
 EvnOQKajlmpMw2NfupoVnEo8oI6UDgZtiqq4mNRFKiSDClkKz+9ZYBjtDFyqInTaIFO/
 szhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+SSfq4073OmWN5SjfGpr2ImvdVTltAm2Ap93b1Y88E=;
 b=akf9wHntDakak5pyPl+sg5Nj9xFkuLd+f2+HUVpJy93HQYCdjj82C3N0NoQ9z89aja
 bi7zL2VJX6kdBCIlrfyK7DFp+nVZQAy4a31MWwW69kKG0YR6Tks4jzxQb5aCynXrsiDV
 e5y6N6rCjTzSfnS+v6X7ZsMUa4fTGWjrpsFOw8L55LkbNO+FJEhl3GIEq0MuRNgOdDyF
 p8bYrYkl3HBVK5Wm2U3uuhiB9pGjCjKABFlezfqacYU99VPpz4CCl4UKfJkvLiv0Iy9E
 mRxTOhwIw6tTIrh3adlxbaNZ2WiDKUya63LrQ1RKwQSdHB7+U1r92zNcOIF0MMDSZAWy
 R/Gw==
X-Gm-Message-State: AOAM531YzntsrJMka35nIlGffWWxmZTtF6LlXiTCrLdnzJycP+ibCg4z
 TIJhVB70FjYXk7/3dYl+PHIQpQ==
X-Google-Smtp-Source: ABdhPJyd1De7PuFzuLP4i8MhbWXrBu0OhprhhfEXRkHThwdYNyCL8/AmxbAlET5sIL14xwjI9QRBeg==
X-Received: by 2002:adf:c149:: with SMTP id w9mr804955wre.127.1630700483905;
 Fri, 03 Sep 2021 13:21:23 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id s15sm232969wrb.22.2021.09.03.13.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:21:23 -0700 (PDT)
Subject: Re: [PATCH v3 11/30] target/cris: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51e42a3f-6064-be49-26b2-20eafd1106a2@linaro.org>
Date: Fri, 3 Sep 2021 22:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-12-f4bug@amsat.org>
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
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool cris_cpu_has_work(CPUState *cs)

No CONFIG_TCG for cris.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

