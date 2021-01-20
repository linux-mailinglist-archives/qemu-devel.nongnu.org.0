Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5742FD3C1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:19:55 +0100 (CET)
Received: from localhost ([::1]:36320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FH0-0007XR-9J
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1l2F9L-0006wt-JA
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:11:59 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:52637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1l2F9F-0005U7-Iq
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:11:58 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9551240655;
 Wed, 20 Jan 2021 18:11:41 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 981EA5B;
 Wed, 20 Jan 2021 18:11:41 +0300 (MSK)
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: qemu broke booting of old RedHat floppies
Message-ID: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@msgid.tls.msk.ru>
Date: Wed, 20 Jan 2021 18:11:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

As someone noticed on IRC, old (2.x) RedHat floppies does not boot
in current qemu.  When qemu is booted from floppy image at
  https://archive.org/details/RedHatLinuxBootDisk521998
(download the "ISO image" link there, it really is an 1.44 floppy),
seabios says Boot failed and that's it.

I run git bisect with it, knowing that qemu 2.1 works fine, and
it pointed out to this commit which is oldish qemu-2.5+:

commit 4812fa27fa75bce89738a82a191755853dd88408
Author: John Snow <jsnow@redhat.com>
Date:   Fri Jan 22 15:51:05 2016 -0500

     fdc: change auto fallback drive for ISA FDC to 288

     The 2.88 drive is more suitable as a default because
     it can still read 1.44 images correctly, but the reverse
     is not true.

     Since there exist virtio-win drivers that are shipped on
     2.88 floppy images, this patch will allow VMs booted without
     a floppy disk inserted to later insert a 2.88MB floppy and
     have that work.

     This patch has been tested with msdos, freedos, fedora,
     windows 8 and windows 10 without issue: if problems do
     arise for certain guests being unable to cope with 2.88MB
     drives as the default, they are in the minority and can use
     type=144 as needed (or insert a proper boot medium and omit
     type=144/288 or use type=auto) to obtain different drive types.

     As icing, the default will remain auto/144 for any pre-2.6
     machine types, hopefully minimizing the impact of this change
     in legacy hw to basically zero.

     Reviewed-by: Eric Blake <eblake@redhat.com>
     Signed-off-by: John Snow <jsnow@redhat.com>
     Message-id: 1453495865-9649-13-git-send-email-jsnow@redhat.com

Now, I don't even know where to put that "type=144/288/auto" thing,
I tried this:

  -drive file=RedHatLinuxBootDisk521998.disk1of1.img,if=floppy,format=raw,type=144

but it says that format=raw does not support "type=144" option.

And it's even more: I don't remember which size should be an 1.44Mb floppy :))
The file size of that image is 1492992 bytes which does not look like it is of
standard size, but I can't find which size it should be.

Thanks!

/mjt

