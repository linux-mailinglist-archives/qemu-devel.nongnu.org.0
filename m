Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892F8400733
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:59:22 +0200 (CEST)
Received: from localhost ([::1]:46500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGHR-0008NY-L9
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG2m-00030U-6p
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:44:12 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG2j-0003Ge-FC
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:44:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b10so445259wru.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kHY8X+3WAxrdeSKfSV5cKvDPcFHMSr1zqsSabCFDuj4=;
 b=y2JE2znGpCHgDzsU2I9wK0RJ8GE2JJWPW9THeKM+zR9sq8qQv438t3kOx206Jt2Fg9
 HCBj4K5J9LrMW8VCOyReTekXa1iDDwX12LjR7w51Hp6FgTpMfV7mK57QPRaKgTN+mKSM
 c4ydaiundmZ/zqYpEcQ7fTBQRpS/g1xvCPjoSorsUTdNxikH8pbFeAJIqDRqkEeBcdOc
 o6bXO2ZIp6ZGu2T9H1FE0GxSedCTSSR2B/P/X59CRLG9yK22Gt+PLAznez/m/7vmSLM1
 nNLeBSmIfDEWuEX2lL68vLI9//wt72neSXBsIxn05T13a5hBYl9JWV1zFbdtz3FU6mYb
 fpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kHY8X+3WAxrdeSKfSV5cKvDPcFHMSr1zqsSabCFDuj4=;
 b=P92v7LLnm3NrKHsYuxrYUQKjP+/eC867Aoj8NmEwBIBhjKd2j8lK92VQx7WscL4BaV
 n1YHpdfvW/tR7fQl7VLV5w1zaePbVZjqjixtXTlPnkGbmtmcEq+TeIWDsqFp2rYNXhHZ
 UzfOd4Q9jKsfMCGjKTEp+uPcOjByVFISyYdJSJ1EBtg7I8kBhK9XkMedkIdkiTXU7xNS
 9Y8ByVBeoNHRq55JFJ78WkzSq3uEYeFmzYph8XOnxiArPz31zqrgw0jb3MhoZXPdnBnd
 14rJFboz/YQ+cuklMlOsWB/1qTLnMyYpY+Ls/IAD7rpD2FZTKMPsTnnIkuoyYt2CvzTP
 KXCw==
X-Gm-Message-State: AOAM5311+k3lYBu9wLe7A4aUmX4qrEkE2ClYipcMV7js274PzS7XCwR+
 MJQuqGEuHi5qOde3y7T0hptfrw==
X-Google-Smtp-Source: ABdhPJwF66mC8rAdAxTJMbRm7Tnb/TmgI1HpOm8MMDv09XxJRL4qVfHzOz4F+luA4Rwup1L4RWjtvA==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr889163wrw.390.1630701846250;
 Fri, 03 Sep 2021 13:44:06 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id h16sm264457wre.52.2021.09.03.13.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:44:05 -0700 (PDT)
Subject: Re: [PATCH v3 20/30] target/ppc: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <860bd94b-89ce-3aa1-4c8b-b53e4d83b80f@linaro.org>
Date: Fri, 3 Sep 2021 22:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu_init.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

