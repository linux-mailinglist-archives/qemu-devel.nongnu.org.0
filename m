Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C70630D95
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 09:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owJXt-0007WN-Q4; Sat, 19 Nov 2022 03:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1owJXp-0007W4-Dw
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 03:49:49 -0500
Received: from mailout12.t-online.de ([194.25.134.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1owJXn-0000KG-AA
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 03:49:49 -0500
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout12.t-online.de (Postfix) with SMTP id 3E534CF21;
 Sat, 19 Nov 2022 09:49:41 +0100 (CET)
Received: from [192.168.211.200] ([84.175.228.229]) by fwd73.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1owJXg-0pQ9210; Sat, 19 Nov 2022 09:49:40 +0100
Message-ID: <d40911ad-201f-7367-cb3e-5fcaf5ad4710@t-online.de>
Date: Sat, 19 Nov 2022 09:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PULL v4 46/83] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML
 routines and let bus ennumeration generate AML
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, kraxel@redhat.com,
 stefanha@gmail.com, qemu-devel@nongnu.org
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-47-mst@redhat.com>
 <d1e1b4a5-1200-dad7-4e82-eacdbd71b92d@t-online.de>
 <20221118140836.73d76e08@imammedo.users.ipa.redhat.com>
 <20221118155517.2a44026d@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20221118155517.2a44026d@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1668847780-2588998D-C2A6250E/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d22ea99-2c84-4527-b8a5-69263046436b
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Am 18.11.22 um 15:55 schrieb Igor Mammedov:
> On Fri, 18 Nov 2022 14:08:36 +0100
> Igor Mammedov <imammedo@redhat.com> wrote:
>
>> On Thu, 17 Nov 2022 22:51:46 +0100
>> Volker Rümelin <vr_qemu@t-online.de> wrote:
> [...]
>>> since this patch SeaBIOS no longer detects the PS/2 keyboard. This means
>>> there's no keyboard in SeaBIOS, GRUB or FreeDOS. OVMF and Linux detect
>>> the PS/2 keyboard without issues.
>>>
>>> Here are a few lines from the SeaBIOS debug log.
>>>
>>> table(50434146)=0x007e1971 (via rsdt)
>>> ACPI: parse DSDT at 0x007e0040 (len 6449)
>>> parse_termlist: parse error, skip from 92/465
>>> Scan for VGA option rom
>>> Running option rom at c000:0003
>>> Start SeaVGABIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
>>>
>>> and later
>>>
>>> SeaBIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
>>> ACPI: no PS/2 keyboard present
> it was a bug on SeaBIOS side, we need it to parse Alias term in AML
> instead of choking on it
>
> proposed patch:
>   https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/RGPL7HESH5U5JRLEO6FP77CZVHZK5J65/
>
> PS:
> it's probably too late for it to make into 7.2
>

The proposed patch works.

It may still be an option to revert the commit 47a373faa6 (acpi: pc/q35: 
drop ad-hoc PCI-ISA bridge AML routines and let bus ennumeration 
generate AML). If an older QEMU version is migrated to QEMU 7.2.0 and 
later and the guest reboots afterwards, it may end up without a working 
keyboard because the migrated SeaBIOS is an older version.

With best regards,
Volker

