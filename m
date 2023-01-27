Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E51567DF9E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 10:01:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLKaU-0003no-II; Fri, 27 Jan 2023 03:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pLKaS-0003nf-Ll
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 03:59:56 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pLKaR-00075R-1e
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 03:59:56 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n7so4315622wrx.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 00:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zh0iop8Ms8Co0XxjjSWaNwJfrb9UC4WYEwf8QH4PJ/A=;
 b=LLkNHlaeQeCvmgur7g80aWEyqrms0BQu0ImampdL00HPKH26JC/RYrVYfuGMvZC00F
 YRhAKvPSSD0CIX36qnsCs/+WrVA/R3nUTX1tI5qFD1TKzX+W37JtUH2mNIvvUkZ2kwOY
 dbdjIz4NiZuhAR/2LX57O9BCKcXN8W+ntpBwbNXWItz4j6LAnagnqRtpmQz6V9sjcuPe
 P3KYCeb98u4NZW2UYnuWeu9eBVarARfsviz6xK85IqLKS7TU+LiOaSMvzkeHXoOFn5hM
 HblkSjPlQmG+ncDxrRCEb7m4Dh+/bSf/1WGG5F1PES85VB3RKsnJdvTrqKi+uGuuC1cQ
 WwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zh0iop8Ms8Co0XxjjSWaNwJfrb9UC4WYEwf8QH4PJ/A=;
 b=Pu2pQPHj44DebpHQW91LP7ZDIdtJCgIvZZYG7ga1o5eh03mO6IcH1PAmkQ3aHY1p3D
 cDVuuDbIq6BlCjUioiLNEo/76QibaWObJT4XIODF7QyvF8Gxx2adtockX5gDNX4usRTK
 sIW937B0aazJSxX5QNMud/XuBeVpkxnXYRnick1FV9gjOLFYlsmg3wduIpO6pgASpuFZ
 fx2+daq3E5m8b+KRAjfEeKev4nsG8Rc5j5u6T1xm9YQoqquU4xFPJ5mGxfVbVfCFL+7M
 pHevZoGtVW44on92BYJIEH8bqFVyTWQ5mMxUzUHbHmaGlCPqL3LXME72XHsLLV/Gy2Oq
 Z+yQ==
X-Gm-Message-State: AFqh2kp+hMYTtWfOZIht2KDSU5wGsMQPkejuUneTj9uDg8IgYl4hSfvY
 s/6/ivk0cToB2aSwbUZXrzM=
X-Google-Smtp-Source: AMrXdXskpZ6tuRNhOS7FpKrJD5uf2I07GDxQGBvNxrYkpmK6s5qnFTAqRr2EnsPPZqnnH4IRhcsToQ==
X-Received: by 2002:a5d:6f03:0:b0:2bb:e896:5a09 with SMTP id
 ay3-20020a5d6f03000000b002bbe8965a09mr37895290wrb.66.1674809993326; 
 Fri, 27 Jan 2023 00:59:53 -0800 (PST)
Received: from [192.168.14.147] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 t27-20020adfa2db000000b002366553eca7sm3447446wra.83.2023.01.27.00.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 00:59:52 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f5e25acf-5787-8dc9-8786-04175f6363fd@xen.org>
Date: Fri, 27 Jan 2023 08:59:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8 26/58] hw/xen: Add xen_evtchn device for event channel
 emulation
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
References: <20230120131343.1441939-1-dwmw2@infradead.org>
 <20230120131343.1441939-27-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230120131343.1441939-27-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 20/01/2023 13:13, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Include basic support for setting HVM_PARAM_CALLBACK_IRQ to the global
> vector method HVM_PARAM_CALLBACK_TYPE_VECTOR, which is handled in-kernel
> by raising the vector whenever the vCPU's vcpu_info->evtchn_upcall_pending
> flag is set.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/meson.build   |   5 +-
>   hw/i386/kvm/xen_evtchn.c  | 155 ++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |  18 +++++
>   hw/i386/pc.c              |   2 +
>   target/i386/kvm/xen-emu.c |  15 ++++
>   5 files changed, 194 insertions(+), 1 deletion(-)
>   create mode 100644 hw/i386/kvm/xen_evtchn.c
>   create mode 100644 hw/i386/kvm/xen_evtchn.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


