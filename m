Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E247741C3E8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 13:55:07 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVYAz-0007Gp-V1
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 07:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mVY3C-0003rw-An
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:47:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mVY3A-0007Mx-3y
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:47:02 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E4E1C40495;
 Wed, 29 Sep 2021 14:46:56 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C9CF48E;
 Wed, 29 Sep 2021 14:46:56 +0300 (MSK)
Subject: Re: blockdev driver=file,filename=/dev/block forbidden?
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <ed1f265b-6db8-846e-cb52-09c3999d07bf@msgid.tls.msk.ru>
 <YVRPeq/1RI0/LPOG@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <1232448f-c7e4-9d97-c667-4400bf279109@msgid.tls.msk.ru>
Date: Wed, 29 Sep 2021 14:46:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVRPeq/1RI0/LPOG@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

29.09.2021 14:35, Daniel P. Berrangé wrote:
> On Wed, Sep 29, 2021 at 02:21:58PM +0300, Michael Tokarev wrote:
>> Commit 8d17adf34f501ded65a106572740760f0a75577c
>> "block: remove support for using "file" driver with block/char devices"
>> explicitly forbids usage of file driver for block devices.
>>
>> But _why_?
>>
>> Hasn't we always used file for everything on *nix? And what's the _actual_
>> difference between file and host_device?
> 
> There are various things QEMU does differently for plain files vs
> block devices. The check for read-only volume, determining data
> transfer size, media geometry, supporting discard. This is seen
> in the BlockDriver structs that have different callbacks for each.

Well, I took a look at file-posix.c meanwhile.
And I see no actual reason to require the user to change driver.
It definitely is not user-friendly :)

It can open the file (with 'file' driver) and check if it is a
regular file or a block (or char) device, and use corresponding
callbacks in each case. Or just remember the "blockiness" of the
underlying file and do a simple if() around it.

Having the user to *require* to change driver like this is.. strange.

I often use symlinks in our VM scripts which points to file or a block
device - eg, a vm with a name grabs all /guest/name-foo.img - be these
regular files or symlinks to /dev/mapper/foo..  And while it is
not that big issue to change a script to add detection of blkdev/file,
it is definitely not as easy for a user. And the thing is again - why
qemu can't do that automatically, this is exactly the place where computers
are good for..

Yes, some "sub-parameters" are different.  There, we can either error-out
for a given parameter when it can't be used for a given file "type", or
can have some relaxed warning instead.  But when there's no such specific
parameters are given, I for one see no reason to require the user to
change configuration when qemu itself can trivially figure it out..

I can (try to) produce a patch of this theme.

>> Please note this change has been added to qemu long before libvirt has
>> been adapted (I guess there's no released libvirt can be used with
>> qemu 6.0+).
> 
> Can you show your libvirt guest XML config that is causing trouble, as
> it has done the right thing here for  a long while AFAIK, so I suspect
> a mis-configuration.

This started as https://bugs.debian.org/993688 which leads to
https://gitlab.com/libvirt/libvirt/-/issues/212 which created only
3 weeks ago. While the commit in question has been committed
in February.

Thanks!

/mjt

