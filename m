Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9B6522DD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:40:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dmE-0006VB-H7; Tue, 20 Dec 2022 09:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7dm8-0006Pa-MS
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:39:24 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7dm6-0001L4-Hf
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:39:24 -0500
Received: by mail-wm1-x329.google.com with SMTP id ja17so8886216wmb.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=38n2X5mRRJRJMwsj3WTMQ8etX3l0uJ6DH4BNOZ93kp8=;
 b=fbwRmAqcJXzw/ibdhc9g3TgzaCDRmKatvY4/EKo+dbITujesv1tEONcwBH6C+sl91F
 n62gNVqB7Gl7VzwKZp49B6B1O83+Zei3CRr36d+VAdrcDBX1gTsQfbU7X/aPwHm2uDHP
 LQmjtOg7s8mAtDdolDhfoagz5kCMXOakiDcIETyz6HXMMT3QgZj5OibDNVZ1Hz7OJ/Vs
 xhWNonm/4nKaSk+1lqLculbbCcESwj0+oCE7NZpQX8RuaCPcJN6u7kZJgYKcMyabZlMd
 LSRi5lUkySa0C6MZQb1amwDqm0M48tpORym0lWG45M3RCOVCY2ziIGozHUHbZ5icCNqg
 /zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=38n2X5mRRJRJMwsj3WTMQ8etX3l0uJ6DH4BNOZ93kp8=;
 b=Hu1PKLDwg7M1ge0AowkT0/KPy4H6jO43SWvAFkXl+SdVX+clj9rS1OeCTFT+pAYGkf
 LAkZQNXzODnyeQuaNYWCU3N8H/gnZFY4QsjjlOAZ6k/xEWmkqy8SXg0mHnNvD3MTtycg
 OShtLzJ8Kgs7NJC8dThFi5gCvsKZgerKwiVNgg1ZHozkJ6+4Xprcjdt7kVVATk53Z6f4
 LLCF6ySk5RVUzztc19thbnAaJmE1/Ui8K2gN57C/iflY1bFhIyd2rTQOc7juyYwUkM32
 noD3p31JOx6vcRmEdzh/LlmyUUYjn7OxEeACXGSOgXxzJj1bbTB2dwqwh2ClwCC5JJra
 SN0A==
X-Gm-Message-State: ANoB5pnlPNK75ojd2TsSaQqxOSRjPxKTeefuSJJ43LW22mYGWDJRwBko
 UkmVScRZDJojEb0L3waDEms=
X-Google-Smtp-Source: AA0mqf6MpbIbUQCdp3CZ73//32GF1JuRfYe/O4ZNetidrLo40hmexACrhZpoZDDGdpGCVyfcLrA3hA==
X-Received: by 2002:a05:600c:4f85:b0:3c6:f732:bf6f with SMTP id
 n5-20020a05600c4f8500b003c6f732bf6fmr36213611wmq.13.1671547159905; 
 Tue, 20 Dec 2022 06:39:19 -0800 (PST)
Received: from [192.168.6.89] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a1c790b000000b003b47b80cec3sm22554197wme.42.2022.12.20.06.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 06:39:19 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9dea5cbb-1a8f-4e90-52ea-01fe1b7dbd80@xen.org>
Date: Tue, 20 Dec 2022 14:39:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 03/38] xen: Add XEN_DISABLED mode and make it
 default
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221216004117.862106-1-dwmw2@infradead.org>
 <20221216004117.862106-4-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221216004117.862106-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/12/2022 00:40, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Also check for XEN_ATTACH mode in xen_init()
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/xen/xen-all.c  | 4 ++++
>   include/hw/xen/xen.h | 5 +++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 69aa7d018b..109d2e84bc 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -158,6 +158,10 @@ static int xen_init(MachineState *ms)
>   {
>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>   
> +    if (xen_mode != XEN_ATTACH) {
> +        xen_pv_printf(NULL, 0, "xen requires --xen-attach mode\n");
> +        return -1;
> +    }

This is new requirement, isn't it? Libxl only passes --xen-attach
for PV domains so AFAICT this will break Xen HVM domains.

   Paul

>       xen_xc = xc_interface_open(0, 0, 0);
>       if (xen_xc == NULL) {
>           xen_pv_printf(NULL, 0, "can't open xen interface\n");
> diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> index afdf9c436a..82347e76a4 100644
> --- a/include/hw/xen/xen.h
> +++ b/include/hw/xen/xen.h
> @@ -12,8 +12,9 @@
>   
>   /* xen-machine.c */
>   enum xen_mode {
> -    XEN_EMULATE = 0,  // xen emulation, using xenner (default)
> -    XEN_ATTACH        // attach to xen domain created by libxl
> +    XEN_DISABLED = 0, // xen support disabled (default)
> +    XEN_ATTACH,       // attach to xen domain created by libxl
> +    XEN_EMULATE,
>   };
>   
>   extern uint32_t xen_domid;


