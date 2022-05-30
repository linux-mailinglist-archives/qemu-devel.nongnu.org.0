Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B85380D9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:27:14 +0200 (CEST)
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgMT-0007UJ-AQ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nvgD8-00060X-CD
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:17:35 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nvg1g-00046C-OE
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:05:47 -0400
Received: from [192.168.15.104] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 6318E2077F;
 Mon, 30 May 2022 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1653919532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuqF1IkLmaIrdAevfWjxwx0a4RlEgP32XwJ7Qfg70EY=;
 b=VgXvaVLUeFm4umJ1BYPRXsCW+O6jqdualtNU98DRhK3A/K9O4gE6dt71E0jjBiu5+7fcc6
 eI3Mk9ZxDzqMIIqBvY2G00s/tLuBxd0DwJ9WSP2kNINHjLrKBTXRo6XGaznkWB4G4gAMe3
 S28c5wUN2AjBzfxSOqpv6cmNAJMeVII=
Message-ID: <5a7b14fa-15ef-42c2-1072-d0aec0795718@greensocs.com>
Date: Mon, 30 May 2022 16:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v5 0/3] Sysbus device generic QAPI plug support
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
 <e494e267-acbf-e6bd-5590-22b6ae2d2a55@ilande.co.uk>
 <1a71b7ee-aac6-a191-5a9c-472d46999ff1@greensocs.com>
 <CAFEAcA8UTLiab5Tg19y7pdJwyuqqxcrxL-9QmzK9r9skGVVGYQ@mail.gmail.com>
 <7fbee09c-449d-a6a5-3616-d8839df1b7a6@ilande.co.uk>
 <732960bf-f3ab-6b61-7e6e-967fe4360280@greensocs.com>
 <CAFEAcA_BinJMmqdTBoCs3V-dqSRQ_jjL7FpdMxCr1etZgn0i_A@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA_BinJMmqdTBoCs3V-dqSRQ_jjL7FpdMxCr1etZgn0i_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/30/22 12:25, Peter Maydell wrote:
> On Mon, 30 May 2022 at 10:50, Damien Hedde <damien.hedde@greensocs.com> wrote:
>> TYPE_SYS_BUS_DEVICE also comes with reset support.
>> If a device is on not on any bus it is not reached by the root sysbus
>> reset which propagates to every device (and other sub-buses).
>> Even if we move all the mmio/sysbus-irq logic into TYPE_DEVICE, we will
>> still miss that. The bus is needed to handle the reset.
>> For devices created in machine init code, we have the option to do it in
>> the machine reset handler. But for user created device, this is an issue.
> 
> Yes, the missing reset support in TYPE_DEVICE is a design
> flaw that we really should try to address.
> 
>> If we end up putting in TYPE_DEVICE support for mmios, interrupts and
>> some way to do the bus reset. What would be the difference between the
>> current TYPE_SYS_BUS_DEVICE ?
> 
> There would be none, and the idea would be to get rid of
> TYPE_SYS_BUS_DEVICE entirely...
> 

Do you expect the bus object to disappear in the process (bus-less 
system) or transforming the sysbus into a ~TYPE_BUS thing ?

Assuming we manage to sort out this does cold plugging using the 
following scenario looks ok ? (regarding having to issue one command to 
create the device AND some commands to handle memory-region and 
interrupt lines)

 > device_add driver=ibex-uart id=uart chardev=serial0
 > sysbus-mmio-map device=uart addr=1073741824
 > qom-set path=uart property=sysbus-irq[0] value=plic/unnamed-gpio-in[1]

TYPE_DEVICE or TYPE_SYS_BUS_DEVICE, my goal is still to be able to 
cold-plug a "ibex-uart" define its memory map and choose which irq I 
wire where.

Thanks,
Damien

