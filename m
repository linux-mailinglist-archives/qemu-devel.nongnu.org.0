Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E877C6A343E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 22:28:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWOXc-00030V-76; Sun, 26 Feb 2023 16:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWOXV-0002zm-Qe
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 16:26:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWOXT-0005HL-7i
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 16:26:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so2714575wmi.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 13:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0/Ns5r2WLEDb+EOEOb6120BmmXMXBtxsYfsN7c0i4ds=;
 b=BRZziXeP3+4swcS7w+/96P8EMzjVkR2+wy9/EkpaHIx4w0QhT+buR9z7LH3ivFriFL
 Guik8uK3X963C3Y6YY3+fG/pRky5RJ2Qo6u8kLVPoytbcliCs+uaVeX9wnEx66dvRmdr
 X7GOHLA0CBJTC5NZWZ8Oarv1jT6hL3+5J4+xpjw6ylaIlCssVynw7DHUU+pwYIf+OX+C
 I6lUQO3FUhxNa33nA65kx3GNaAeKpCmJD//NbvAFfYLgg0HpePwag20126/ZEBXmEAPn
 mNla89FgOKhu193fYMPzZsJ6iUFYl98lxxvnhC+8+Fo2mOY+zduHaDjRf5WGs97UrXJf
 QPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0/Ns5r2WLEDb+EOEOb6120BmmXMXBtxsYfsN7c0i4ds=;
 b=hMt7phdoVuwhxOvjo1HVzK1LQxAQ7HcjxZCt7odXvabspyuLnElcNfajhCnm+c8FI/
 rPD/6xcWcXy9zGNV9/wSDstJ3yARBeHmZvpJIqlkDbyggnTr6zFjmnwdAjd2I/0WM7pY
 S6B6tAYDXGjMZGBFX42EjGY3oj+aVTe4KBrwiTtajuUlaZs2Fh14LU+kQWtaQxyv2Z/z
 b3+6YbCVS1KBTcRXlUdzfv6RxfopV97eIiRQZ8CKGW7nK9Wci+IgXs8tRaWL3w+en+37
 NS+hAjyUH905F8MCzQYhM/ak+SsGwiWZM2gyJHYCVGSdlWtEZXgv4lElSkrYoBf/y7pf
 x7ag==
X-Gm-Message-State: AO0yUKUuUw0nhPIZB1hgN7J6hDohYIo+JEx/QbMiQiXITgMVzSs6Md7p
 xPfDGzgfgverr8yTz0HuuhWtcA==
X-Google-Smtp-Source: AK7set/pNrXIz2U5tDqZ+JHRT5ke/Q2LC1b63uPzSvXIjSm2iYjhVsN2LDXVPUAi7QftezIy85HhGA==
X-Received: by 2002:a05:600c:4a9d:b0:3ea:e7f6:f8fa with SMTP id
 b29-20020a05600c4a9d00b003eae7f6f8famr10158090wmp.10.1677446793160; 
 Sun, 26 Feb 2023 13:26:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 be6-20020a05600c1e8600b003e89e3284fasm10802831wmb.36.2023.02.26.13.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 13:26:32 -0800 (PST)
Message-ID: <531a3d68-7713-a4cd-c70b-3f0d6adc71ca@linaro.org>
Date: Sun, 26 Feb 2023 22:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06/10] hw/ide/pci: Add PCIIDEState::isa_irqs[]
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-7-shentey@gmail.com>
 <FB58332B-FAB6-464A-A74C-B412FF7F1D27@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <FB58332B-FAB6-464A-A74C-B412FF7F1D27@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 30/1/23 18:00, Bernhard Beschow wrote:
> 
> 
> Am 26. Januar 2023 21:17:36 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> These legacy ISA IRQs allow the PIIX IDE functions to be wired up in
>> their south bridges and the VIA IDE functions to disuse
>> PCI_INTERRUPT_LINE as outlined in https://lists.nongnu.org/archive/html/
>> qemu-devel/2020-03/msg01707.html .
>>
> 
> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>> include/hw/ide/pci.h | 1 +
>> 1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


