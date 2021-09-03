Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBD8400687
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:24:10 +0200 (CEST)
Received: from localhost ([::1]:52450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFjM-0000iT-2P
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFXC-0000Wl-5p
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:11:35 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFX7-0001Zs-If
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:11:33 -0400
Received: by mail-wr1-x434.google.com with SMTP id t15so291920wrg.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EaCWOOldFpTJW/62GNcO8hnd0wqc8elIcEfaX69jVvw=;
 b=YyrzMqwR7pTY4UVwmQkF/b6/6vs1u7pbVcrnFbJ2IcW6P4fipRJVT8PmaEsbbFpg5m
 Ymv96X1royzInIGobPF2j09Z1yc16HGEdliJIXhC7BdkL4CkDrSv4ViHU6bzRWnn7dZV
 qZBXE7dHM+4+DbAAXk77dXGymyVlTIpYSq7C1i3JEZlTfiNoWgj2wqws++sPnSgcptat
 mA18BowRdXGHFl+/0fRO7ZQ0GtRH00yJ/XcRK/OYqcLDp/RR8ktqw1Cg+Aoha/XNDyBg
 8cWnsyWPtksyXCOTBNPJZ0SnF8sr/Z1rLMwoCoGs5MDwwc19FX55U9jh0cE3apvw4e/O
 +6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EaCWOOldFpTJW/62GNcO8hnd0wqc8elIcEfaX69jVvw=;
 b=M2Duxiyifnh3UXfEWOZun9VWRm5A5wVxa9ZtJnoy5Bn6Jw7LA3d1V5fjzDxya7yc7h
 EXEw3TW3bbiucBPd83VGsLfwNbzqUhydjNg9T1HboIIO8CvLY+wRZPHBRWYSt5fzguB0
 65EJGBB9s7RRp5nYhJ4kL7ExaThUkPyGeQvkEr6q+stVap5wEW9u10PM/MZJKetnhFhm
 1vQlnho1swmu3B/zzJ2RYU27nMVvxtxScqIzaYjS5VFXRuUJeDNE5yMmay/k2Apymzjr
 bq6NMhybL2lf8+KNYCIqHiWJhgP4+hb5ha5KZQAm/TK5RZ53E5uBlzQdETcmPkhOBrLK
 pDew==
X-Gm-Message-State: AOAM531bn1+J2tOqmmXHW0Jc2ct7LDmgAMpRdo72L1FSizdX5QxgUdqO
 sb3QfN/gqOFUbcX+4xRKiyj6cw==
X-Google-Smtp-Source: ABdhPJwhD7ZLlhNK9IfRlsfSxTpaQWDz0Xn28SyMeYUyzG5cv49AdD3Ojc4LM0ShmrKJ0X1u+d3JqQ==
X-Received: by 2002:a5d:5712:: with SMTP id a18mr758059wrv.367.1630699887867; 
 Fri, 03 Sep 2021 13:11:27 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id o26sm331500wmc.17.2021.09.03.13.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:11:27 -0700 (PDT)
Subject: Re: [PATCH v3 02/30] hw/core: Restrict cpu_has_work() to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee2f2d27-cc3d-c398-74a0-c0ca439d84ef@linaro.org>
Date: Fri, 3 Sep 2021 22:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> cpu_has_work() is only called from system emulation code.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

