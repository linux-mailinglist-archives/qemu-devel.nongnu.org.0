Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890FB61872B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqeid-0001Ep-UK; Thu, 03 Nov 2022 14:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqeic-0001Ce-IH
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqeia-0002CT-VH
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667499212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfVLmn/sxUKPKnYDZX8xeYqtsAW1u1NdXpXSWH2R0es=;
 b=XKVjnX4jUztI4PgEXPFM0EsdlYaVW6UYHAWaYcwO9ny05XMlf+96937HsPvfWPzRJUuRud
 jK7l2bp6rE/PQzvZc4SZQJ+8k4LYECg4VAJKMnatIkN6hec1CJHdpWWtB72n+SRZC8aWrE
 rKG7rKIiI/gup91TrK8mtlCJa1amOf4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-XoKCr8LNMyCst42jsvBtwQ-1; Thu, 03 Nov 2022 14:13:31 -0400
X-MC-Unique: XoKCr8LNMyCst42jsvBtwQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso1754482ejb.14
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 11:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xfVLmn/sxUKPKnYDZX8xeYqtsAW1u1NdXpXSWH2R0es=;
 b=lA3qlzD6iiP02Xaz1GetTKvSh8kPNFEIaMx3U9zX3ZTvefaGSo8nu+ZrPJ0CSz2Jn7
 epEwhV/10b6PJ1gAhzQ810yKQ8zFHwINNkyPLvNIBYV35LwjGLTiyV/cUZn5GmY4WctL
 WPTsUFmimmgM2Ua9WqlJRd5Kh9Gp5Z1/k8AbbIyETZ3AN7+cgqiKHzJHnMUA9CVnYWTo
 hWAps9N7X4EytJCZ9r3lN48+b01gbS40cR6UexqoMkRmP4fwxeomwU/86dhmiR/Vz+6e
 BRucNUXftXNz+goq3CR6zm709yB6kkkzXBM05he/klb8bDizblbouVzdOHeDRZbWJCpW
 oV3w==
X-Gm-Message-State: ACrzQf2zfZhycVY3Y3R2AzkQrBUso4u3s2Wq3a9UmtVcubWomWHg6CF6
 OouYNgmgcCjy1w1SvUi1r3qexKQeWWfC2mFZQK9YKm/iuQbUAC1BixXetty7o6b39EG/GI0kkPV
 vHtA2pMsa8pa+OAQ=
X-Received: by 2002:a05:6402:51c6:b0:462:6545:5d88 with SMTP id
 r6-20020a05640251c600b0046265455d88mr31876500edd.304.1667499209721; 
 Thu, 03 Nov 2022 11:13:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6n1G2aVEOwdrGD8fN57mG259dME5ZsCKsqy5cdbTsqH4JwT4cBSlGkq99xJwTPHzpWuUPkXw==
X-Received: by 2002:a05:6402:51c6:b0:462:6545:5d88 with SMTP id
 r6-20020a05640251c600b0046265455d88mr31876483edd.304.1667499209503; 
 Thu, 03 Nov 2022 11:13:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056402033000b004614c591366sm808472edw.48.2022.11.03.11.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 11:13:28 -0700 (PDT)
Message-ID: <fc1415a3-d1f2-73f4-4bb3-c1857484f462@redhat.com>
Date: Thu, 3 Nov 2022 19:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/2] hw/i386/postcard.c: New ISA POST card device
Content-Language: en-US
To: Lev Kujawski <lkujaw@member.fsf.org>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20220707003705.43894-1-lkujaw@member.fsf.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220707003705.43894-1-lkujaw@member.fsf.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/7/22 02:37, Lev Kujawski wrote:
> @@ -1139,12 +1120,10 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>      qemu_irq pit_alt_irq = NULL;
>      qemu_irq rtc_irq = NULL;
>      ISADevice *pit = NULL;
> -    MemoryRegion *ioport80_io = g_new(MemoryRegion, 1);
>      MemoryRegion *ioportF0_io = g_new(MemoryRegion, 1);
>      X86MachineState *x86ms = X86_MACHINE(pcms);
>  
> -    memory_region_init_io(ioport80_io, NULL, &ioport80_io_ops, NULL, "ioport80", 1);
> -    memory_region_add_subregion(isa_bus->address_space_io, 0x80, ioport80_io);
> +    (void)post_card_init(isa_bus, POST_CARD_PORT_DEFAULT);
>  

This unfortunately breaks live migration of old machine types (new QEMU 
to old QEMU).

The simplest (though not very simple) way to do it is to add a new 
property to the machine (e.g. "postcard-rw") and keep the old 
ioport80_io_ops if the property is false.  Default the property to true, 
and in hw/i386/pc.c make the property false with an entry like

   { TYPE_PC_MACHINE "postcard-rw", "off" },

in pc_compat_7_1.

> +        VMSTATE_UINT16(port, POSTCardState),

port doesn't have to be stored.

Paolo


