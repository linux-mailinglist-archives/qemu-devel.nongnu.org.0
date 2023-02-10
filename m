Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24C692215
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:25:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVGi-0003Wp-69; Fri, 10 Feb 2023 10:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQVGg-0003WE-6E
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:24:54 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQVGe-00031d-Fe
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:24:53 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so4333664wms.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 07:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zbWx/MDQTgxDLeOPi91vBHlZ4YJxrZ0XSAiwcLDNDbM=;
 b=OOopVmiAoequMfAOHrFKORdkygu/PMFsLuw33PAwPXNXLTrwuABiB8vBtJQTs4EAVv
 94cUfc9PDdiA/KMSd59tELPyojyBWAlXI87wY1ZmWTLVxIzPPBMQOcoyMCLuSVxXaXX4
 z8j8+MlpTbOEQilIufwFN4rT6umaXr1XG+4I3T76t+Q0Zsh7I5ASPfB0dIRcp4djwyij
 0Aht9Cks0aiDyRncCxEBDQda/yXG8l2MaRgZjQ+FutOftbjWMPyCKCGGCPjRUCaH3PzU
 aojeRkpc7DeXGrHS7yyT/1snYUodTAZe1qXVZkjaeI2joLJYAqnawCcRxSEDC3O8U4cq
 sy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zbWx/MDQTgxDLeOPi91vBHlZ4YJxrZ0XSAiwcLDNDbM=;
 b=CO/95nXsNXayp4L3ntHviZgovl3Lt/txNYoPnqAZbIDCzdgH8ccMbFkVcPNCT+24Bg
 GLCiIqSq9DooEUZsqNtojh3ym7gPjogyHSnRuuPgRJw5vz1LuTQXZ7qd0a5IeZSvQflm
 JTXB2HryTdSvxRc0zPwhsoev/yYRgrBZBvryClc6tUguNoq+rk3iLvYx08+00MjJ5RZW
 8BYfCGf+9ptE2fe6egNXK/vefIt+sFMbcGENX34/zP+hoTpsRp+CTi7Cj9kTYRWLPgrJ
 HOf+xldPDiHlXPH6NJOKWm8V/oEZTBvW8Rl6iLPPnkzYnKAeyYScCltiGz618E87m5hC
 embA==
X-Gm-Message-State: AO0yUKUahMZ4cNHP0xrPxUYvlsGoZNYK/R31GiE8L8nJHYcPu1PoS7Cj
 /JK9N1ZDPKoN/K5RnOmyroM=
X-Google-Smtp-Source: AK7set+HrOfOG9jS+/7eGV7jM98Kwf1bRr/jfAYre6X1ABTbzX0sgzcqVrFgHiahb3/K0m1RuPubfQ==
X-Received: by 2002:a05:600c:13ca:b0:3dc:5937:35a2 with SMTP id
 e10-20020a05600c13ca00b003dc593735a2mr14513673wmg.9.1676042689675; 
 Fri, 10 Feb 2023 07:24:49 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 iv12-20020a05600c548c00b003dc521f336esm6043268wmb.14.2023.02.10.07.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:24:49 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <334f7e7f-c8c1-68e6-8b60-a2ce182fd4c4@xen.org>
Date: Fri, 10 Feb 2023 15:24:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 40/59] hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI
 callback
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
 <20230201143148.1744093-41-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-41-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The GSI callback (and later PCI_INTX) is a level triggered interrupt. It
> is asserted when an event channel is delivered to vCPU0, and is supposed
> to be cleared when the vcpu_info->evtchn_upcall_pending field for vCPU0
> is cleared again.
> 
> Thankfully, Xen does *not* assert the GSI if the guest sets its own
> evtchn_upcall_pending field; we only need to assert the GSI when we
> have delivered an event for ourselves. So that's the easy part, kind of.
> 
> There's a slight complexity in that we need to hold the BQL before we
> can call qemu_set_irq(), and we definitely can't do that while holding
> our own port_lock (because we'll need to take that from the qemu-side
> functions that the PV backend drivers will call). So if we end up
> wanting to set the IRQ in a context where we *don't* already hold the
> BQL, defer to a BH.
> 
> However, we *do* need to poll for the evtchn_upcall_pending flag being
> cleared. In an ideal world we would poll that when the EOI happens on
> the PIC/IOAPIC. That's how it works in the kernel with the VFIO eventfd
> pairs — one is used to trigger the interrupt, and the other works in the
> other direction to 'resample' on EOI, and trigger the first eventfd
> again if the line is still active.
> 
> However, QEMU doesn't seem to do that. Even VFIO level interrupts seem
> to be supported by temporarily unmapping the device's BARs from the
> guest when an interrupt happens, then trapping *all* MMIO to the device
> and sending the 'resample' event on *every* MMIO access until the IRQ
> is cleared! Maybe in future we'll plumb the 'resample' concept through
> QEMU's irq framework but for now we'll do what Xen itself does: just
> check the flag on every vmexit if the upcall GSI is known to be
> asserted.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 97 +++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |  4 ++
>   hw/i386/pc.c              |  6 +++
>   include/sysemu/kvm_xen.h  |  1 +
>   target/i386/cpu.h         |  1 +
>   target/i386/kvm/kvm.c     | 11 +++++
>   target/i386/kvm/xen-emu.c | 40 ++++++++++++++++
>   target/i386/kvm/xen-emu.h |  1 +
>   8 files changed, 161 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


