Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84272E1DD9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 16:23:00 +0100 (CET)
Received: from localhost ([::1]:52452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks5yd-0006wZ-61
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 10:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ks5xP-0006VW-94
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 10:21:43 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ks5xN-0006wZ-Lk
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 10:21:43 -0500
Received: by mail-ej1-x62d.google.com with SMTP id j22so23248943eja.13
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0/deLXIq+uOgWlytB/A3apFxn+FLyKaCATuTqtMPFf4=;
 b=IKA6tv6uJbdVmWX0GTr1hBZwZv0m2ijYA0B7bRfDQ7DvWuk+YnljZlW3nY375m7+rM
 vo6QVzvRM+jWWq74yoeyAXTGpplRDHCSmUp8cw5A2/1dXs68O6KH2UazKnWf+nPYwtku
 zNoYHWAi/Fjv7K0S/B76D4VDoQ8VTrzST6t3ZsbP7YTu6FI7UmECWMtKV3QKtChwFwvf
 gGm8g3tf2ygkcsWJps4VA1KFFLPHTIf0EM9VWPRueaEIYT5K3sB4vB0qrVhsceMYuuVC
 m3NAiD7r+sPpoG2E8lRuaUuGm2ehyOL12zONiImXu6iHMj/XjVn4p/ViZvnJh7rzzoG8
 nFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0/deLXIq+uOgWlytB/A3apFxn+FLyKaCATuTqtMPFf4=;
 b=KvMcdzVSeZ6rK4FDq2FeQrXTYh+jtsWYvhVGbxaBhuIAIMCw6PE6vsb+3MoEEcdhVc
 gr6BTDSayRFCyXk6vx6ozPsSzwMkcyO2FePmGQy6Oz9RJcSqQIZ+Y2i1VTcX+Ztn95Kf
 PNNVhyB2EeJuUAvUm7slb6UufI2TkbcJSPTNSfC01F6UV3Lpl3P/cMarz40ThNUza+sy
 CsyG7j651cG4qWaDlpuzCk77jx8Ewehgw7ggX0ldW97Y6QkAFnq6RuZWpoLREM5At7KT
 hpATF1/M/7HH6NutX4oRFGOW3l6UFcWaTrNEy+X8MlTF2b+WnIVNztAVawJ9Y5LcnbUJ
 3pHg==
X-Gm-Message-State: AOAM533oVVCnbW05saX2UAymcOXtEMpukncRN7WW9EyBK+9J1JD7nIlJ
 J6UWhAluocWZOVHVTomYDRM=
X-Google-Smtp-Source: ABdhPJxj08MpoIa9XV6uENg7l7BhiUYjNuvLGIwLs33zz+wkvX6mj2oaY/vkp1l+2Ff81SVkOQ2Mdw==
X-Received: by 2002:a17:906:5285:: with SMTP id
 c5mr12207621ejm.17.1608736899758; 
 Wed, 23 Dec 2020 07:21:39 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id lc18sm11640761ejb.77.2020.12.23.07.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 07:21:38 -0800 (PST)
Subject: Re: Problems with irq mapping in qemu v5.2
To: Guenter Roeck <linux@roeck-us.net>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan
 <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
Date: Wed, 23 Dec 2020 16:21:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.521,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/20 5:16 PM, Guenter Roeck wrote:
> Hi,
> 
> commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
> pci_bus_change_irq_level") added sanity checks to the interrupt number passed
> to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
> is indexed and sized by the number of interrupts.
> 
> However, as it turns out, the interrupt number passed to this function
> is the _mapped_ interrupt number. The result in assertion failures for various
> emulations.
> 
> Examples (I don't know if there are others):
> 
> - ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
>   that isn't a good thing to do for slot 0, and indeed results in an
>   assertion as soon as slot 0 is initialized (presumably that is the root
>   bridge). Changing the mapping to "slot" doesn't help because valid slots
>   are 0..4, and only four interrupts are allocated.
> - pci_bonito_map_irq() changes the mapping all over the place. Whatever
>   it does, it returns numbers starting with 32 for slots 5..12. With
>   a total number of 32 interrupts, this again results in an assertion
>   failure.
> 
> ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
> correct mapping should be. slot  & 3, maybe ?
> 
> I don't really have a good solution for pci_bonito_map_irq(). It may not
> matter much - I have not been able to boot fuloong_2e since qemu v4.0,
> and afaics that is the only platform using it. Maybe it is just completely
> broken ?

FWIW bisecting Fuloong2E starts failing here:

4ea98d317eb442c738f898f16cfdd47a18b7ca49 is the first bad commit
commit 4ea98d317eb442c738f898f16cfdd47a18b7ca49
Author: BALATON Zoltan <balaton@eik.bme.hu>
Date:   Fri Jan 25 14:52:12 2019 -0500

    ide/via: Implement and use native PCI IDE mode

    This device only implemented ISA compatibility mode and native PCI IDE
    mode was missing but no clients actually need ISA mode but to the
    contrary, they usually want to switch to and use device in native
    PCI IDE mode. Therefore implement native PCI mode and switch default
    to that.

    Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
    Message-id:
c323f08c59b9931310c5d92503d370f77ce3a557.1548160772.git.balaton@eik.bme.hu
    Signed-off-by: John Snow <jsnow@redhat.com>

 hw/ide/via.c | 52 ++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 14 deletions(-)

