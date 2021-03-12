Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3D3385DF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:28:27 +0100 (CET)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbHe-0007sl-6r
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lKbCa-0002Cz-I6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:23:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lKbCY-0001G9-Kh
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615530189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8zKfwBA7jczki+7h5Nm5ZrTgLo6WQIW3eShBX+IkT4=;
 b=GD3h9dSA1av3TIPbkIrgND5RtDtGD2ewZDD8u1aHG1b12l41nJ3q26QSvhbt8z9nzdMH/p
 gCuQqWZS3kFgYYhlchTcnzzoiTnlw9MBUA6dT9800MsaNPcMy/Jwh1FKGscnQt16En756C
 16BcCyRCMImVM82dT/lOGIwbtQxoyXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-RIQGOPkMMW-BJNQGRn_oyA-1; Fri, 12 Mar 2021 01:23:06 -0500
X-MC-Unique: RIQGOPkMMW-BJNQGRn_oyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1443817468;
 Fri, 12 Mar 2021 06:23:05 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 719CC5C1C5;
 Fri, 12 Mar 2021 06:23:05 +0000 (UTC)
Subject: Re: qemu broke booting of old RedHat floppies
To: Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
References: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@msgid.tls.msk.ru>
 <b7f858e1-5fdf-44c5-cc4e-033c43df9c4e@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <a72265ef-979d-e23d-f6a4-3f950b1d50c0@redhat.com>
Date: Fri, 12 Mar 2021 01:23:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b7f858e1-5fdf-44c5-cc4e-033c43df9c4e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 10:41 AM, Thomas Huth wrote:
> On 20/01/2021 16.11, Michael Tokarev wrote:
>> As someone noticed on IRC, old (2.x) RedHat floppies does not boot
>> in current qemu.  When qemu is booted from floppy image at
>>   https://archive.org/details/RedHatLinuxBootDisk521998
>> (download the "ISO image" link there, it really is an 1.44 floppy),
>> seabios says Boot failed and that's it.
>>
>> I run git bisect with it, knowing that qemu 2.1 works fine, and
>> it pointed out to this commit which is oldish qemu-2.5+:
> [...]
>> Now, I don't even know where to put that "type=144/288/auto" thing,
>> I tried this:
>>
>>   -drive 
>> file=RedHatLinuxBootDisk521998.disk1of1.img,if=floppy,format=raw,type=144
>>
>> but it says that format=raw does not support "type=144" option.
> 
> Try:
> 
>   qemu-system-x86_64 -drive 
> if=none,file=RedHatLinuxBootDisk521998.disk1of1.img,format=raw,id=dr1 
> -device floppy,drive-type=144,drive=dr1
> 
>> And it's even more: I don't remember which size should be an 1.44Mb 
>> floppy :))
>> The file size of that image is 1492992 bytes which does not look like 
>> it is of
>> standard size, but I can't find which size it should be.
> 
> As mentioned on IRC already, it's likely a disk with 81 tracks instead 
> of 80 tracks, so it's bigger than the usual 1.44 MB floppy disk images 
> and thus QEMU likely misdetects it by default.
> 
>   Thomas
> 
> 

Whoops, yes, the auto-detection doesn't really seem to understand what's 
going on here.

./i386-softmmu/qemu-system-i386 -drive 
if=none,format=raw,file=../../../../Downloads/RedHatLinuxBootDisk521998.disk1of1.img,id=dr1 
-device floppy,drive-type=auto,drive=dr1

this fails, as does drive-type=288.
drive-type=144 works, though.

Digging a tiny bit:

- auto chooses a (36, 80, 1) geometry (It assumes the 288 type.)
- 288 chooses the same geometry.
- 144 chooses (18, 80, 1) => 2880 sectors

None of these choices actually get the geometry right, because the 
fd_formats[] table just ... doesn't have that geometry in the table. It 
only works under the 144 type because when it just gives up and picks a 
geometry, it picks the first geometry under the 1.44MB section.

When it defaults to 2.88 instead, it picks the first geometry under the 
2.88MB section.

Adding an explicit (18, 81, 1) choice improves our mileage:

- auto -> (18, 81, 1)
- 144 -> (18, 81, 1)
- 288 -> (18, 81, 1)

and fixes the boot.


diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 198940e737..4269c0c754 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -122,6 +122,7 @@ static const FDFormat fd_formats[] = {
      /* First entry is default format */
      /* 1.44 MB 3"1/2 floppy disks */
      { FLOPPY_DRIVE_TYPE_144, 18, 80, 1, FDRIVE_RATE_500K, }, /* 3.5" 
2880 */
+    { FLOPPY_DRIVE_TYPE_144, 18, 81, 1, FDRIVE_RATE_500K, },
      { FLOPPY_DRIVE_TYPE_144, 20, 80, 1, FDRIVE_RATE_500K, }, /* 3.5" 
3200 */
      { FLOPPY_DRIVE_TYPE_144, 21, 80, 1, FDRIVE_RATE_500K, },
      { FLOPPY_DRIVE_TYPE_144, 21, 82, 1, FDRIVE_RATE_500K, },



Do you have the name of the person who reported this on IRC so I can add 
a credit?

--js


