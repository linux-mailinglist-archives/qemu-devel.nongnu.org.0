Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CC22FBD26
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:04:27 +0100 (CET)
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uQc-0000Pa-JP
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1uEJ-0005e3-JG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:51:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1uEF-0001xz-0J
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611075097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IRiPqctSKZiiD2uC4BBymkbkIafhNzptzy1U5udM/Ow=;
 b=dA+Z1A2WvGUWyE/lZrUdWNZPaXrds04OslN7QYsdLYXQ0uG5cEvAMZOsgcCUCrUlRMBDW7
 Jsvi3AoPrD/twOyu0slFJvTO0Z1W2/dKu+KZHIrGh313jPknagrrp8byQVlAd1IX7gJnGM
 TqVjrKXPYaFR9tYA10IPhqMBuU58JO4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-_9BkLSunNKeHGvYQaEek3Q-1; Tue, 19 Jan 2021 11:51:36 -0500
X-MC-Unique: _9BkLSunNKeHGvYQaEek3Q-1
Received: by mail-ej1-f71.google.com with SMTP id b18so4535504ejz.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IRiPqctSKZiiD2uC4BBymkbkIafhNzptzy1U5udM/Ow=;
 b=aAgnxX4SV2SiI+3isrfwPX4AsXMvxTRHcBETw1OTbJnlrGGHunkTY9KQUUscwllOCc
 587EZ/uUsKA3EX/U3yLGjH2BkSDaXV94Eu4rpblkJVbgXwaPwStTpoqLESB1P3DhIFW4
 wWh3o81QXQ1/EkS5CcKv9PeSF9Epa1uvTfIOyCoeXJeZYljiss+SojgIcO5HdYPkx5xu
 OgJgDrTkolCmC0VquQQkTWF+EiIMfJpVuxX8jh/B/Hzc5Gts5E8Y05+8jXV84FX2azww
 kz6oDixoKjg5DRl22srHVzsM+2Rg91nTUXkBAhLFert/9zhnaFRaMFA3XRuUnoURelso
 wDQA==
X-Gm-Message-State: AOAM530K10IcEJ1yGO3HYBT2dm1igN3ssjz5AZBdiNxEV5H55M2J4XIj
 2ZLLOSHQ+21b68FcbRAIJ3wQCn9vEySWMVL6dK1Pt8wpERBB+K1T3XlShuwGeq60apqaJtsYYfg
 CYnnAz3tgm4zLmeQ=
X-Received: by 2002:a17:906:a011:: with SMTP id
 p17mr3526251ejy.30.1611075094868; 
 Tue, 19 Jan 2021 08:51:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIVIDgYfJJkVvrBdV18jV2meRG3ZI6b752uEPuFWujW+yhRLY1tW/qkQEjFARG5QrO+O/rpA==
X-Received: by 2002:a17:906:a011:: with SMTP id
 p17mr3526240ejy.30.1611075094726; 
 Tue, 19 Jan 2021 08:51:34 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s12sm12972122edu.28.2021.01.19.08.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 08:51:33 -0800 (PST)
Subject: Re: [PATCH] pci: add romsize property
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Haibin Zhang <haibinzhang@tencent.com>,
 David Edmondson <david.edmondson@oracle.com>
References: <20201218182736.1634344-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9b7e55a-0f90-6680-8e15-992997afdd38@redhat.com>
Date: Tue, 19 Jan 2021 17:51:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201218182736.1634344-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 dgilbert@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+pflash

On 12/18/20 7:27 PM, Paolo Bonzini wrote:
> This property can be useful for distros to set up known-good ROM sizes for
> migration purposes.  The VM will fail to start if the ROM is too large,
> and migration compatibility will not be broken if the ROM is too small.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/pci/pci.c             | 19 +++++++++++++++++--
>  hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
>  include/hw/pci/pci.h     |  1 +
>  3 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index d4349ea577..fd25253c2a 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -67,6 +67,7 @@ static void pcibus_reset(BusState *qbus);
>  static Property pci_props[] = {
>      DEFINE_PROP_PCI_DEVFN("addr", PCIDevice, devfn, -1),
>      DEFINE_PROP_STRING("romfile", PCIDevice, romfile),
> +    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),
>      DEFINE_PROP_UINT32("rombar",  PCIDevice, rom_bar, 1),
>      DEFINE_PROP_BIT("multifunction", PCIDevice, cap_present,
>                      QEMU_PCI_CAP_MULTIFUNCTION_BITNR, false),
> @@ -2106,6 +2107,11 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>      bool is_default_rom;
>      uint16_t class_id;
>  
> +    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
> +        error_setg(errp, "ROM size %d is not a power of two", pci_dev->romsize);
> +        return;
> +    }

Some cloud providers already complained the pow2 check in the pflash
device (wasting host storage). Personally I find using pow2 easier
and safer.

The pow2 check looks like a separate change however, maybe add in a
separate patch? Or maybe not :)

Regards,

Phil.


