Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBB5D2EA4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 18:32:37 +0200 (CEST)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIbMh-0004F5-Un
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 12:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1iIbDf-0003UC-8x
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 12:23:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1iIbDd-0003OV-9v
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 12:23:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41782)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1iIbDd-0003OO-3o
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 12:23:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0DA9B3090FDF;
 Thu, 10 Oct 2019 16:23:12 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-48.rdu2.redhat.com
 [10.10.120.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 030CF5C1B2;
 Thu, 10 Oct 2019 16:23:00 +0000 (UTC)
Subject: Re: [PATCH 3/4] hw/i386: add facility to expose CPU topology over
 fw-cfg
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20191008105259.5378-1-lersek@redhat.com>
 <20191008105259.5378-4-lersek@redhat.com>
 <20191008175931.483af366@redhat.com>
 <20191010055733-mutt-send-email-mst@kernel.org>
 <20191010144812.20fd8b5d@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0032ef80-4e75-5802-8a7a-098e9ff57cfa@redhat.com>
Date: Thu, 10 Oct 2019 18:23:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191010144812.20fd8b5d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 10 Oct 2019 16:23:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/19 14:48, Igor Mammedov wrote:

> it doesn't really matter if it's ACPI blob or fw_cfg,
> what firmware needs is a table of possible CPUs with APIC IDs.

To repeat my previous point:

Not necessarily taking sides between "data table" and "register block",
but *if* we opt for "data table", then it *must* be fw_cfg.

> But if we go this route (i.e. not reuse CPU hotplug interface),
> the table alone is not enough, one would need to build a protocol
> between ACPI and firmware to communicate what CPUs to (un)hotplug.

That's for sure, yes -- for finding out what CPU has been hotplugged,
the hotplug SMI handler in the firmware has to look at the register
block no matter what.

The "data table" vs "register block" question only arises *afterwards*,
for translating the CPU selector (fetched from the register block) to
the APIC-ID domain. (The generic edk2 infrastructure requires APIC-IDs).

Thanks
Laszlo

