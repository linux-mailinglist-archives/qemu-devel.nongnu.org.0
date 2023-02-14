Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B33C696063
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:10:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRsGU-00084q-Ie; Tue, 14 Feb 2023 05:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRsGK-00084Y-CU
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:10:12 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRsGH-000234-O7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:10:11 -0500
Received: by mail-wr1-x434.google.com with SMTP id bu23so15030207wrb.8
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 02:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XYKefKMpmztNNNqav6BbhLwqWtWTk1VjsL2VGew2g+I=;
 b=WcrTJoAbMtOcVZWf3sxslwlneO348J2d0njeWtEnypuzAAtQTBbw+TfIAlDhm0RBaI
 +q4ZI7d73t43onoceAF6/LHCqHfjq8xL8j2vaQfRQrCKrgqCgAul6x/z79xHkHlg2bqW
 ap8b/J9E7+ydXIct+5GpuMqSZd/pNcpZFUyUTRZfvntZUJNYIyZSzMid49+wc6NeFbJW
 YVI97H1Kb8ucCfOCdxyENVNzt+Q2tyDp0Da/EOT5brAFrM2pY/rfXhYGh4Twoe50osu8
 CJ95cY6tltOd6cZmI/Z3MpcR4SPTM1jCrM1gdK43YKUjdjpiyOX7ivdFrZ+0pvvWMf2p
 3DOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XYKefKMpmztNNNqav6BbhLwqWtWTk1VjsL2VGew2g+I=;
 b=HQwquz7udE37CLK7+Zt8o3Wm2MIu52YNCgx7UvMK7sFOQ9mqHIPenWt4I426VDEo4b
 Xmen13NtnDTP/NfMgjx5QTrNhfWh6YcI2vqtml22kBOzE00PRwox1Vw5VDGQcia3KEIF
 3mWvcR6bE8b1v2kLUjsU0hlzQX4TrRgLfyKTcgx6gYhCNLcjnhD0xX+UFynQfg1lZDwA
 ixPaPZOIr6sUuyVyKGqKsjfFz7dlr3DBXQPJMkj5H2BkF8eXlflwJQyn+aVmrcVuRn1t
 JAhdAbbkhNQTFvndsfrOl0VgaPG2k8bT2u0QhusWHzSXyc57xBcnI4w8imQ34CUu+xxA
 vyxA==
X-Gm-Message-State: AO0yUKXalNMN7KM5yM3GvZreAfjW90tOSZ6nAoRl9QL/iA9oeWaSXqDS
 aNeuuFW1UOnh5aS9R1r25Ek=
X-Google-Smtp-Source: AK7set+pjx3I3GiskjD+Kio87pN0l2G2TiEHeIHK4AGLhmb+rX5Gmq5qBx020/zV/fdy0QXU4FeyDg==
X-Received: by 2002:adf:e588:0:b0:2c5:4af3:3d26 with SMTP id
 l8-20020adfe588000000b002c54af33d26mr1425956wrm.9.1676369407309; 
 Tue, 14 Feb 2023 02:10:07 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a5d6252000000b002c3dc4131f5sm12772974wrv.18.2023.02.14.02.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 02:10:07 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <602bab6c-22c2-532c-0f94-48d1df6b1a19@xen.org>
Date: Tue, 14 Feb 2023 10:10:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 47/59] i386/xen: handle PV timer hypercalls
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-48-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-48-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Introduce support for one shot and periodic mode of Xen PV timers,
> whereby timer interrupts come through a special virq event channel
> with deadlines being set through:
> 
> 1) set_timer_op hypercall (only oneshot)
> 2) vcpu_op hypercall for {set,stop}_{singleshot,periodic}_timer
> hypercalls
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  |  31 +++++
>   hw/i386/kvm/xen_evtchn.h  |   2 +
>   target/i386/cpu.h         |   5 +
>   target/i386/kvm/xen-emu.c | 245 +++++++++++++++++++++++++++++++++++++-
>   target/i386/machine.c     |   1 +
>   5 files changed, 282 insertions(+), 2 deletions(-)
> 
[snip]
> @@ -1246,6 +1466,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
>       }
>   
>       switch (code) {
> +    case __HYPERVISOR_set_timer_op:
> +        return kvm_xen_hcall_set_timer_op(exit, cpu,
> +                                          exit->u.hcall.params[0]);

There's a nasty little semantic subtlety here which has been missed... 
If the guest is not in longmode then the timer value is actually split 
across param[0] and param[1] (so that it is still 64-bits).

   Paul


