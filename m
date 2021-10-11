Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8580A429612
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:50:23 +0200 (CEST)
Received: from localhost ([::1]:49660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzRO-0001XW-Jz
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZzPA-0008Vl-63
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:48:04 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZzP7-00086g-Sa
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:48:03 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B1FE7755F86;
 Mon, 11 Oct 2021 19:47:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8F984748F4B; Mon, 11 Oct 2021 19:47:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8DBD0748F52;
 Mon, 11 Oct 2021 19:47:59 +0200 (CEST)
Date: Mon, 11 Oct 2021 19:47:59 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: ACPI endianness
In-Reply-To: <20211011115521-mutt-send-email-mst@kernel.org>
Message-ID: <864f1144-b2ba-c5ab-cff2-2fce3518f4ab@eik.bme.hu>
References: <957db5ec-fc70-418-44d9-da4f81f5b98@eik.bme.hu>
 <612d2f0b-f312-073d-b796-c76357ba51a2@redhat.com>
 <d8284c4-c2e7-15e9-bec5-b2f619e1e6ad@eik.bme.hu>
 <20211011080528-mutt-send-email-mst@kernel.org>
 <327dd794-f698-3187-c17d-80b33db664b@eik.bme.hu>
 <20211011093206-mutt-send-email-mst@kernel.org>
 <f247499d-ced0-5b98-85ac-57a79b72816a@eik.bme.hu>
 <20211011115521-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Oct 2021, Michael S. Tsirkin wrote:
> On Mon, Oct 11, 2021 at 03:51:01PM +0200, BALATON Zoltan wrote:
>>> ... but given we did not previously do the read, maybe we should keep
>>> it that way at least for the time being.
>>
>> How do you know there was no read before this write? Did you check it? I've
>> only added a printf in the write method and saw the value was swapped but
>> did not check if there was a read before that. There are no traces in these
>> methods so maybe I would not see it unless adding a printf there too.
>
> All I am saying is that qemu did not convert a write into
> a read+write.

OK confirmed that by disabling pm_io_space_update() in hw/isa/vt82c686.c 
so the via-pm region is never mapped and then modifying the log messages 
for invalid accesses (patch sent separately) I get:

~ # poweroff
Sent SIGKILL to all processes
Requesting system poweroff
pci_cfg_write vt82c686b-usb-uhci 12:3 @0xc0 <- 0x8f00
pci_cfg_write vt82c686b-usb-uhci 12:2 @0xc0 <- 0x8f00
[   16.498465] reboot: Power down
Invalid write at addr 0xFE000F05, size 1, region '(null)', reason: rejected
Invalid write at addr 0xF05, size 1, region '(null)', reason: rejected

So the guest only tries to write one byte but not sure if the read 
generated within memory.c would show up in these logs. I suspect if you 
fixed that you'd get all sorts of problems with other device models so the 
less likely to break anything fix would be to go back to native endian for 
acpi but I wait for what you come up with. I'd like this to be fixed one 
way or another for 6.2 and fixing endianness would probably be enough for 
that.

Regards,
BALATON Zoltan

