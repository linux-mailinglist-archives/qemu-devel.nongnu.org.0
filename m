Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D872FD447
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:43:53 +0100 (CET)
Received: from localhost ([::1]:52622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FeC-0004Sr-Fi
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2Fbe-0002Oj-OJ
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:41:14 -0500
Received: from relay68.bu.edu ([128.197.228.73]:34702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2Fbc-0006t7-Nr
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:41:14 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 10KFdxs4019333
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 20 Jan 2021 10:40:06 -0500
Date: Wed, 20 Jan 2021 10:39:59 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: qemu broke booting of old RedHat floppies
Message-ID: <20210120153959.d5csl76elka777wt@mozz.bu.edu>
References: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@msgid.tls.msk.ru>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210120 1811, Michael Tokarev wrote:
> As someone noticed on IRC, old (2.x) RedHat floppies does not boot
> in current qemu.  When qemu is booted from floppy image at
>  https://archive.org/details/RedHatLinuxBootDisk521998
> (download the "ISO image" link there, it really is an 1.44 floppy),
> seabios says Boot failed and that's it.
> 
> I run git bisect with it, knowing that qemu 2.1 works fine, and
> it pointed out to this commit which is oldish qemu-2.5+:
> 
> commit 4812fa27fa75bce89738a82a191755853dd88408
> Author: John Snow <jsnow@redhat.com>
> Date:   Fri Jan 22 15:51:05 2016 -0500
> 
>     fdc: change auto fallback drive for ISA FDC to 288
> 
>     The 2.88 drive is more suitable as a default because
>     it can still read 1.44 images correctly, but the reverse
>     is not true.
> 
>     Since there exist virtio-win drivers that are shipped on
>     2.88 floppy images, this patch will allow VMs booted without
>     a floppy disk inserted to later insert a 2.88MB floppy and
>     have that work.
> 
>     This patch has been tested with msdos, freedos, fedora,
>     windows 8 and windows 10 without issue: if problems do
>     arise for certain guests being unable to cope with 2.88MB
>     drives as the default, they are in the minority and can use
>     type=144 as needed (or insert a proper boot medium and omit
>     type=144/288 or use type=auto) to obtain different drive types.
> 
>     As icing, the default will remain auto/144 for any pre-2.6
>     machine types, hopefully minimizing the impact of this change
>     in legacy hw to basically zero.
> 
>     Reviewed-by: Eric Blake <eblake@redhat.com>
>     Signed-off-by: John Snow <jsnow@redhat.com>
>     Message-id: 1453495865-9649-13-git-send-email-jsnow@redhat.com
> 
> Now, I don't even know where to put that "type=144/288/auto" thing,
> I tried this:
> 
>  -drive file=RedHatLinuxBootDisk521998.disk1of1.img,if=floppy,format=raw,type=144
> 
> but it says that format=raw does not support "type=144" option.
> 

There is a drive-type=144 option to -device floppy. Maybe that's where
it goes:
-drive id=fdc1,... -device floppy,drive=fdc1,drive-type=144

> And it's even more: I don't remember which size should be an 1.44Mb floppy :))
> The file size of that image is 1492992 bytes which does not look like it is of
> standard size, but I can't find which size it should be.
> 
> Thanks!
> 
> /mjt
> 

