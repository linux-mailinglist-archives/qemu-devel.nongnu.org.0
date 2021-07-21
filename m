Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6573D1359
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:10:10 +0200 (CEST)
Received: from localhost ([::1]:49010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EnR-00088J-NJ
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6Eez-000413-UE
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6Eex-0002vl-Pt
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626883282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLWQ5iUarAM3x4K7kYlm0/lOMfjEEGrf1DkCaHpbm64=;
 b=NvNAmuKIIe1TcHLIXNrvZmDUlf7x7mKMRD9jbKj1SEytkjin07SOxQE7per9Yyn/yW/Fxu
 hv5PHvZ3G0zc2yYlMZtkZ59oGnqr/NrAzVPs/ZezQScU1mYNqgZTfz6AFCjD5h2PnvXCfY
 a033gBRYbdSo3hHyhy6Cbby8yyLPBuE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-2nRoRGaFMkKL152FSfHOEw-1; Wed, 21 Jul 2021 12:01:19 -0400
X-MC-Unique: 2nRoRGaFMkKL152FSfHOEw-1
Received: by mail-wr1-f70.google.com with SMTP id
 g9-20020adff3c90000b0290140a25efc6dso1201995wrp.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kLWQ5iUarAM3x4K7kYlm0/lOMfjEEGrf1DkCaHpbm64=;
 b=fbHKvdZRNol+wvPjr3xLkZZlERw/wlfoB8Tiz6XjCA/YtRou019jYX5aMJRdO2zY7G
 w3nU4u+Sqiw9fLLbQN7xrG8EvygObPWnxXkOiB+MIv/LnascdTEJWVnPSAqCJjDPJL3H
 tRYO8J64b9EMQbGjHQ6OXlDgjeb4aJeR6351webX2+LH5kV/SId9eUMVV1q6yns6Jwpc
 ESHwXrh3mCh/F8mBXznMVa9H++qf1hqkUZYdAGxjskjYcSOuD29SvcCzyQKol/w3Gp8z
 s7BEQnCbelmgRAA08IaxhN+GR8pOXCp33xK1rTIcvv4pVgX69YYFjMiMl8dIhI5lGWud
 iUvA==
X-Gm-Message-State: AOAM533MLEYCwxcxf/1GGMzjKq+Km4pBpnM+LR6oq6gGbuuuQObuqPp1
 5e35zN4WRiiMkIIOJ7fvLOA/cbywjOD0mNa/qATXGNJcmErZJF75Tv+e5b09mgcDSo7u9eu1WSL
 HgPfOs7YuygAJF00=
X-Received: by 2002:a5d:6481:: with SMTP id o1mr44713455wri.164.1626883278317; 
 Wed, 21 Jul 2021 09:01:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkuDQ1Tq7XUsJIyosLlL7Jsv8YTH6JnAstn/M0sr4ApJUWRSwQHp2kP83NBkLcfhlCSq9QKg==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr44713409wri.164.1626883278004; 
 Wed, 21 Jul 2021 09:01:18 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id p11sm26803147wro.78.2021.07.21.09.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 09:01:17 -0700 (PDT)
Subject: Re: [PULL v3 05/19] hw/acpi/ich9: Set ACPI PCI hot-plug as default on
 Q35
To: Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
 <20210716151416.155127-6-mst@redhat.com>
 <f8de5dbc-ed4c-ba99-8981-583fa42961cb@redhat.com>
 <73728485-d133-e629-46ee-2ca586b71de6@redhat.com>
 <20210721165934.2f81f3f3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <75446ede-1918-1ef6-02ef-4f7f12302323@redhat.com>
Date: Wed, 21 Jul 2021 18:01:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721165934.2f81f3f3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Julia Suvorova <jusual@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 4:59 PM, Igor Mammedov wrote:
> On Tue, 20 Jul 2021 14:56:06 +0200
> Laurent Vivier <lvivier@redhat.com> wrote:
>> On 20/07/2021 13:38, Laurent Vivier wrote:
>>> On 16/07/2021 17:15, Michael S. Tsirkin wrote:  
>>>> From: Julia Suvorova <jusual@redhat.com>
>>>>
>>>> Q35 has three different types of PCI devices hot-plug: PCIe Native,
>>>> SHPC Native and ACPI hot-plug. This patch changes the default choice
>>>> for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
>>>> ability to use SHPC and PCIe Native for hot-plugged bridges.
>>>>
>>>> This is a list of the PCIe Native hot-plug issues that led to this
>>>> change:
>>>>     * no racy behavior during boot (see 110c477c2ed)
>>>>     * no delay during deleting - after the actual power off software
>>>>       must wait at least 1 second before indicating about it. This case
>>>>       is quite important for users, it even has its own bug:
>>>>           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
>>>>     * no timer-based behavior - in addition to the previous example,
>>>>       the attention button has a 5-second waiting period, during which
>>>>       the operation can be canceled with a second press. While this
>>>>       looks fine for manual button control, automation will result in
>>>>       the need to queue or drop events, and the software receiving
>>>>       events in all sort of unspecified combinations of attention/power
>>>>       indicator states, which is racy and uppredictable.
>>>>     * fixes:
>>>>         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
>>>>         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
>>>>
>>>> To return to PCIe Native hot-plug:
>>>>     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
>>>>
>>>> Known issue: older linux guests need the following flag
>>>> to allow hotplugged pci express devices to use io:
>>>>         -device pcie-root-port,io-reserve=4096.
>>>> io is unusual for pci express so this seems minor.
>>>> We'll fix this by a follow up patch.
>>>>
>>>> Signed-off-by: Julia Suvorova <jusual@redhat.com>
>>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>>> Message-Id: <20210713004205.775386-6-jusual@redhat.com>
>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>>>> ---

>> It also happens with non-VFIO device like e1000e:
>>
>> ...
>> -device e1000e,bus=pcie-root-port-1,addr=0x0,id=hostdev0 \
>                      ^^^^^^^^^^^^^
> ACPI hotplug operates on slot level, so functions greater than 0 are not considered,
> hence unexpected ACPI error. For above CLI, setting 'addr' on root-ports to dedicated slots
> should fix issue.
> 
> The same will happen on PC machine if you assign bridge to any function other than 0.
> 
> Following should fix ACPI error:
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 17836149fe..e2345bd7d0 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -527,7 +527,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>              QLIST_FOREACH(sec, &bus->child, sibling) {
>                  int32_t devfn = sec->parent_dev->devfn;
>  
> -                if (pci_bus_is_root(sec)) {
> +                if (pci_bus_is_root(sec) || PCI_FUNC(devfn)) {
>                      continue;
>                  }
> 
> but unplug request will stay ignored if root port/bridge is not on function 0.

Shouldn't we emit a warning/error if a such config is used?


