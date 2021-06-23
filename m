Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2D23B1D94
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:24:23 +0200 (CEST)
Received: from localhost ([::1]:37818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4jm-0007bx-Tc
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lw4iy-0006fL-SR
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:23:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lw4iw-0001UQ-CS
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624461809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYEUPgF2uizxuBxSWbBgqbEsCIOd6Rj9poqKLBUmgNw=;
 b=FfL8JwdQb18ulRBoBbwgS4j173g5kCyJ3kuOfy52Icj2CgZqzg7upWenC439Pp+/ojL0ul
 Mo2r9Fz6pMq/eEj1/CzdywdirKWHYWKQt1jPt09nf6Uf0DAVFM6Qs+Hb/g84LgQAk0E1br
 CBE0Ioj37CFaSLx+G5Waf5dWgUV17uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-m3yuJKYpMYmoTGJ1SWO9xw-1; Wed, 23 Jun 2021 11:23:26 -0400
X-MC-Unique: m3yuJKYpMYmoTGJ1SWO9xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57C901054F90;
 Wed, 23 Jun 2021 15:23:25 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 187BA10016F4;
 Wed, 23 Jun 2021 15:23:20 +0000 (UTC)
Subject: Re: Too slow edk2 bios boot?
To: Bin Meng <bmeng.cn@gmail.com>
References: <CAEUhbmWMzo7ZhZLjk_ScBv=AskOY670L62ujqm76tgC5Zjbq4A@mail.gmail.com>
 <20210618114650.mge72lslmr7cakxw@sirius.home.kraxel.org>
 <CAEUhbmW0kh9wKtSQJUCgwzmbCehvrWg6L2xn65jPokLwEjO45A@mail.gmail.com>
 <66fed11e-9b74-0ca0-4922-0d4fe344b962@redhat.com>
 <CAEUhbmWP3Wi-vL-ACyMtwTbukdHNQArXAE0gHFaHYHAW4ONuKg@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <df47fd61-a04b-8739-b80f-bf9f4ad5e618@redhat.com>
Date: Wed, 23 Jun 2021 17:23:19 +0200
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWP3Wi-vL-ACyMtwTbukdHNQArXAE0gHFaHYHAW4ONuKg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/23/21 07:47, Bin Meng wrote:
> Hi Laszlo,
> 
> On Wed, Jun 23, 2021 at 12:13 AM Laszlo Ersek <lersek@redhat.com> wrote:
> 
>> On 06/18/21 15:06, Bin Meng wrote:
>>> On Fri, Jun 18, 2021 at 7:46 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>>>
>>>> On Fri, Jun 18, 2021 at 06:46:57PM +0800, Bin Meng wrote:
>>>>> Hi Laszlo,
>>>>>
>>>>> Using the QEMU shipped edk2 bios, for i386, it boots very quickly to
>>>>> the EFI shell.
>>>>>
>>>>> $ qemu-system-i386 -nographic -pflash edk2-i386-code.fd
>>
>> Ouch. Don't do this. If you use just one pflash chip, then a unified FD
>> file is expected in that chip, containing both varstore and firmware
>> executable.
>>
>> Upstream QEMU does not bundle / install unified FD files however. What it
>> provides are separate executables and varstore *templates*.
>>
>> If you don't want to create a permanent variable store file for your VM,
>> from the template called "edk2-i386-vars.fd", then the minimum command line
>> is something like this:
>>
>> qemu-system-i386 \
>>   -drive if=pflash,unit=0,format=raw,readonly=on,file=edk2-i386-code.fd \
>>   -drive if=pflash,unit=1,format=raw,snapshot=on,file=edk2-i386-vars.fd \
>>
>> (Nowadays I should use the "blockdev" syntax instead of "-drive", but I've
>> not updated my scripts thus far ;))
>>
> 
> Thank you. I suggest we document this in the QEMU documentation [1]

Already documented in "docs/interop/firmware.json".

>>>> qemu -nic none ?
>>>>
>>>
>>> Yep this works. Thanks a lot!
>>
>> If you need neither NICs nor disks in your guest at all, then "-nic none"
>> is indeed the simplest solution.
>>
> 
> If using NICs in the guest, then we have to adjust the order in the BIOS
> boot menu?

No; assuming you have a device (NIC or disk) you'd like to boot off of,
and a NIC you wouldn't, specify the "bootindex" device property for the
devices in the first category (with the desired decimal indices), and
omit the "bootindex" device property for the devices in the second category.

Thanks
Laszlo


