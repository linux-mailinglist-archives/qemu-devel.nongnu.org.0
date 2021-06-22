Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB643B0A17
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:15:51 +0200 (CEST)
Received: from localhost ([::1]:40424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvj42-0002iT-9G
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lvj1r-00009P-Db
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 12:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lvj1n-0003dt-8J
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 12:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624378409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3d46BWSzHA/knyPRlvDZrwuXeSE1BfWR31Euwq6HM0=;
 b=QeXzZLKjK7RBNeFJU02BV8bIasV9W5IF30ZDxTR07vaT7izN0sHmoc01emzBjhIgMCp8Vk
 Ag0ykvPADWkiTq+ks+UALdEPtsqt042hqew72i0fvfL6NkChuIvHXlTwb9ORaMKX3ldWvv
 HZY0P+U/DBh2TwjZB5e3myC+ZiV4vZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-D36IaQ4PNAOABphPeNVrkg-1; Tue, 22 Jun 2021 12:13:26 -0400
X-MC-Unique: D36IaQ4PNAOABphPeNVrkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA24181C860;
 Tue, 22 Jun 2021 16:13:25 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-52.ams2.redhat.com
 [10.36.115.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 330CA5D9DE;
 Tue, 22 Jun 2021 16:13:24 +0000 (UTC)
Subject: Re: Too slow edk2 bios boot?
To: Bin Meng <bmeng.cn@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <CAEUhbmWMzo7ZhZLjk_ScBv=AskOY670L62ujqm76tgC5Zjbq4A@mail.gmail.com>
 <20210618114650.mge72lslmr7cakxw@sirius.home.kraxel.org>
 <CAEUhbmW0kh9wKtSQJUCgwzmbCehvrWg6L2xn65jPokLwEjO45A@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <66fed11e-9b74-0ca0-4922-0d4fe344b962@redhat.com>
Date: Tue, 22 Jun 2021 18:13:23 +0200
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW0kh9wKtSQJUCgwzmbCehvrWg6L2xn65jPokLwEjO45A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/18/21 15:06, Bin Meng wrote:
> On Fri, Jun 18, 2021 at 7:46 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
>> On Fri, Jun 18, 2021 at 06:46:57PM +0800, Bin Meng wrote:
>>> Hi Laszlo,
>>>
>>> Using the QEMU shipped edk2 bios, for i386, it boots very quickly to
>>> the EFI shell.
>>>
>>> $ qemu-system-i386 -nographic -pflash edk2-i386-code.fd

Ouch. Don't do this. If you use just one pflash chip, then a unified FD file is expected in that chip, containing both varstore and firmware executable.

Upstream QEMU does not bundle / install unified FD files however. What it provides are separate executables and varstore *templates*.

If you don't want to create a permanent variable store file for your VM, from the template called "edk2-i386-vars.fd", then the minimum command line is something like this:

qemu-system-i386 \
  -drive if=pflash,unit=0,format=raw,readonly=on,file=edk2-i386-code.fd \
  -drive if=pflash,unit=1,format=raw,snapshot=on,file=edk2-i386-vars.fd \

(Nowadays I should use the "blockdev" syntax instead of "-drive", but I've not updated my scripts thus far ;))


>>>
>>> However with x86_64, it takes a very long time to boot to the EFI
>>> shell. It seems it got stuck in the PXE boot. Any ideas?
>>
>> One year ago ia32 efi netboot support was dropped (and you are the first
>> who noticed 😎 ).

I certainly noticed:

http://mid.mail-archive.com/e6078611-789f-027b-bea5-759e02b10eee@redhat.com


>>
> 
> I guess not many people play with ia32 these days :)
> 
> 
>>
>> commit 9ed02fbb847277bef88dbe6a677cf3e5f39e5a38
>> Author: Gerd Hoffmann <kraxel@redhat.com>
>> Date:   Wed Jul 22 12:24:35 2020 +0200
>>
>>     ipxe: drop ia32 efi roms
>>
>>     UEFI on ia32 never really took off.  Basically the BIOS -> UEFI shift
>>     came too late, x64 was widespread already, so vendors went from BIOS
>>     straight to UEFI on x64.
>>
>>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>
>>
>>> I checked the boot manager, and it seems only 64-bit edk2 bios has
>>> built-in PXE boot while 32-bit does not.
>>
>> It isn't edk2 but the nic boot roms, but yes, lack of pxe support on
>> ia32 is the root cause.
>>
> 
> Got it.
> 
> 
>>> Any idea to speed up this whole PXE boot thing?
>>
>> qemu -nic none ?
>>
> 
> Yep this works. Thanks a lot!

If you need neither NICs nor disks in your guest at all, then "-nic none" is indeed the simplest solution.

Thanks,
Laszlo


