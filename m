Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7FF346248
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:06:04 +0100 (CET)
Received: from localhost ([::1]:55832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOibb-0008Co-3r
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lOiZx-0007Oa-Fk; Tue, 23 Mar 2021 11:04:22 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:23624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lOiZu-00027O-3n; Tue, 23 Mar 2021 11:04:21 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 4834E46201;
 Tue, 23 Mar 2021 16:04:12 +0100 (CET)
Message-ID: <a1a1b783-6217-cb22-0dd8-fab9b7971542@proxmox.com>
Date: Tue, 23 Mar 2021 16:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Content-Language: en-US
To: Vitaly Cheptsov <cheptsov@ispras.ru>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
 <20210322114116-mutt-send-email-mst@kernel.org>
 <B813DBC6-B989-4630-B2DE-8F5825484E78@ispras.ru>
 <20210323104542-mutt-send-email-mst@kernel.org>
 <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
From: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH] i386/acpi: restore device paths for pre-5.1 vms
In-Reply-To: <71AD039B-775A-4DF3-B16D-4BC3768A20AC@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=t.lamprecht@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu devel list <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.03.21 15:55, Vitaly Cheptsov wrote:
>> 23 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2021 =D0=B3., =D0=B2 17:48, Michael =
S. Tsirkin <mst@redhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=
=B0):
>>
>> The issue is with people who installed a VM using 5.1 qemu,
>> migrated to 5.2, booted there and set a config on a device
>> e.g. IP on a NIC.
>> They now have a 5.1 machine type but changing uid back
>> like we do will break these VMs.
>>
>> Unlikley to be common but let's at least create a way for these people=

>> to used these VMs.
>>
> They can simply set the 5.2 VM version in such a case. I do not want to=20
let this legacy hack to be enabled in any modern QEMU VM version, as it v=
iolates ACPI specification and makes the life more difficult for various =
other software like bootloaders and operating systems.

Yeah here I agree with Vitaly, if they already used 5.2 and made some con=
figurations
for those "new" devices they can just keep using 5.2?

If some of the devices got configured on 5.1 and some on 5.2 there's noth=
ing we can
do anyway, from a QEMU POV - there the user always need to choose one mac=
hine version
and fix up the device configured while on the other machine.


