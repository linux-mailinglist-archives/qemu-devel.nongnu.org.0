Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CB3400675
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:19:30 +0200 (CEST)
Received: from localhost ([::1]:38568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFer-0008Dn-4Z
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFbQ-0005Ky-JH
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:15:56 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMFbO-00058k-1m
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:15:56 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso281283wmi.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OIdER+ntU5pnE+dAq/LvT2j6xOcRVpXDcpqShg7WpU0=;
 b=uxvnHzNv132fzgkc218/R0lqQKuK+t8JtxKc9v7MGrkKPRxDYU93G8sAz5OB0Qa73S
 HE9cI2H2Z0CH+z6tU7HILrt73xJLER1ScmOcHWVCSynT7na5DZ8aQUWZ73RzZS1vzDMQ
 vqeZlVUhDraI2JH+QdE7CnrbM86ihr8OahFggiYzaiiPqr9S9Cooveeavxo3806rUBCc
 wAmH4n70qiWJfcK+7NmYB575D8ru3ANLV2HDRDh0a+ujAxTAi2JXNetHl39JI8em8dQt
 /MjpEL+5e1BeWhbg4mKgjTybiTcJ5pJVRqEATLrqAPvRDkDzcFl9morqxai4fdjaAREV
 wsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OIdER+ntU5pnE+dAq/LvT2j6xOcRVpXDcpqShg7WpU0=;
 b=om/ORGCQdzSvoJNAWjfPQswPvQOt8+PJGDtf8McHgGczdp7knA/u7Fsl5jKAABu92Y
 AZUiep2j6EaXM/q+Juru6dFw+lAhckrq6f17O/DEEXrT7KpUk08pyK0uNoy5u+IKKCn4
 e2NJG5dC4WDwYf+5oHRI+nqX5vqBuzmbMrw3QHcb1VBmQ5a0+2yKyLE6nbigsCvvAmMz
 S/0w88dtbAbsErHlx4XhYUBrVb40/itVgJ6lD6QEQ2nUDuGEGXnNftmPbH8Yl+bcp/Ao
 VTfGZo89Rg+5kkKUotmpR/l0RUuo7RC44BKlWJZOmGkPTadgKCxXwntAwK9oZ3TdCet6
 xaWw==
X-Gm-Message-State: AOAM530H3TY5jwtisy9Lew8RQtNLQGovsowh46zGEnBUFXy8A3TkR72f
 MVSkwPac508tYRU0eBXzPNZycQ==
X-Google-Smtp-Source: ABdhPJyMWwBTg93pyBo5sv0A6QW1ur9FJeS4HTsMD79+WiDYC0sQ7drSYJ0pDX3u+yQQ7riYEaCIGg==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr461323wmh.99.1630700151552;
 Fri, 03 Sep 2021 13:15:51 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id m4sm353497wml.28.2021.09.03.13.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:15:51 -0700 (PDT)
Subject: Re: [PATCH v3 05/30] accel/kvm: Implement AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27a1a7f4-10f3-e089-6f37-4eed9542a6c6@linaro.org>
Date: Fri, 3 Sep 2021 22:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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
> Implement KVM has_work() handler in AccelOpsClass and
> remove it from cpu_thread_is_idle() since cpu_has_work()
> is already called.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/kvm/kvm-accel-ops.c | 6 ++++++
>   softmmu/cpus.c            | 2 +-
>   2 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

