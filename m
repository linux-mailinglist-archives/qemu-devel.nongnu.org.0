Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F16616175
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:08:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqBa2-0007dt-DY; Wed, 02 Nov 2022 07:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oqBZI-0007bA-QC
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:06:05 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oqBZF-0004WJ-Ly
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=hNxkyqAjisj+xUwjnkcazuxxcaJFqU77e95yQMoazmE=; b=FsTNQYcFd9J7fAFIM5fc2uthlD
 wJ7akHGju7BbGXlkguw7ekS6OGlfKhvzDYZwkhY89mG1G3npt8CFvUGSo7LF8Gc0WyN7yHCCtZLpa
 mJCn6QVTE+3MA42Z+ir4CKsPyWn5BVGecVBNC9ZaWpd/DMzKZlYxKJyuC9DkPGaAZ/KtWOL8CiRS3
 WOwVmYYVvKBZ1V5UZB2+2ids41y+4ILTV70TxNUORqWaNjjG0E9HO4GnMJ1QVBMWu9p2axSfa1M69
 nfivMRa4n1bMxfobntQtg1uAVidOvnrAdkmU5bjQHw3rtDvLaAQtRDI2Tv7Tqyo+yqw7kL6CrDeLq
 sXg2ROMfmh3wARUw47tEdunT724Doc/QrwhhAMF9WjIP5S4EGt3+wjFjI+3Aex7SU2/shjePWuctl
 U+7KqSz0n9/82/ffv5vn6wZPeRUuVhnM7U5HHnK8uBJYRIuCqf7si4pRY7fNDXkKS+gEF7AvMbvjQ
 pRgvdLSmvbCsQP6RxOzy+Yc5DETTb+ryiq5BlUK8oGkD1fCuh6e1bKNWL8+/GGKvrr/mpiSTbI7rB
 4SCbLEScstGSBbU2ccvWDKQZlHhaAL5v/73oYFj0j8M0a80azB/7Xz+MsKk4eZRWc5gYIGWAMzfUo
 NyYv0jry07mg9jpr9r7qnFJ4A/MqInQIKGIqo4Rjc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Date: Wed, 02 Nov 2022 12:05:52 +0100
Message-ID: <4078234.fJnRZ6glpc@silver>
In-Reply-To: <MN2PR11MB417324B0200E8841884C5C2AEF399@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <3897101.9jAPQrlFHr@silver>
 <MN2PR11MB417324B0200E8841884C5C2AEF399@MN2PR11MB4173.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wednesday, November 2, 2022 4:07:35 AM CET Shi, Guohuai wrote:
> 
> > -----Original Message-----
> > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Sent: Wednesday, November 2, 2022 02:22
> > To: qemu-devel@nongnu.org
> > Cc: Greg Kurz <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>; Shi,
> > Guohuai <Guohuai.Shi@windriver.com>
> > Subject: Re: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
> > functions for 9pfs
> > 
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > 
> > On Tuesday, November 1, 2022 4:20:53 PM CET Shi, Guohuai wrote:
> > >
> > [...]
> > > > > > Windows POSIX API and MinGW library do not provide the NO_FOLLOW
> > > > > > flag, and do not allow opening a directory by POSIX open(). This
> > > > > > causes all
> > > > > > xxx_at() functions cannot work directly. However, we can provide
> > > > > > Windows handle based functions to emulate xxx_at() functions (e.g.:
> > > > > > openat_win32, utimensat_win32, etc.).
> > > > > >
> > > > > > Windows does not support extended attributes. 9pfs for Windows
> > > > > > uses NTFS ADS (Alternate Data Streams) to emulate extended
> > attributes.
> > > > > >
> > > > > > Windows does not provide POSIX compatible readlink(), and
> > > > > > symbolic link feature in 9pfs will be disabled on Windows.
> > > > >
> > > > > Wouldn't it be more user friendly if the relevant error locations
> > > > > would use something like error_report_once() and suggesting to
> > > > > enable
> > > > > mapped(-xattr) to make 9p symlinks on guest working if desired by the
> > user?
> > > > >
> > > > > Probably this error case would need to wrapped into a dedicated
> > > > > function, otherwise I guess error_report_once() would fire several
> > > > > times by different callers.
> > > > >
> > > >
> > > > Windows (MinGW) does not only support symlink, but also does not
> > > > have symlink definitions.
> > > > Windows does not support symlink flags S_IFLNK.
> > > >
> > > > So even I add symlink support by mapped-xattr, the MinGW library
> > > > does not have symlink flags and get a build error.
> > > > And this flags is defined by Windows header files.
> > > > The impact of adding a new flags to an pre-defined structure (struct
> > > > stat) is unknown.
> > > >
> > > > So I think it is not a good idea to do that.
> > >
> > > Because Windows does not support symlink, so error_report_once() and report
> > it to user will be OK.
> > > But mapped-xattr could not work.
> > 
> > Showing an error makes sense for "passthrough" security model, but not for
> > the "mapped" one.
> > 
> > Just to avoid misapprehensions: are you aware that there is already a system-
> > agnostic implementation for symlinks if "mapped" is used?
> > 
> > When mapped security model is enabled, then creating symlinks on guest will
> > simply create a corresponding *regular* file on host and the content of that
> > regular file on host is the pointing path as raw string. Additionally the
> > symlink flag is added to "virtfs.mode" xattr to mark that regular file as a
> > symlink, a virtual one that is. So this does not require any support for
> > symlinks by either the underlying host file system, nor by host OS.
> > 
> > Likewise interpreting and walking those virtual symlinks in "mapped" mode is
> > also implemented in the local fs driver already.
> 
> Yes, symlink can be supported by "mapped" mode.
> I mean that MinGW does not provide symlink mode flags "S_IFLNK" and some other related functions and defines.
> You can check with "9p.c": S_ISLNK, S_ISSOCK and S_ISFIFO are not valid on Windows (MinGW) host.
> So even I enabled symlink supported by "mapped" mode on local-agent code, "9p.c" can not be built.
> 
> So I disabled symlink totally, because MinGW interface does not support it.
> 
> To resolve this issue, MinGW should add the missing defines at first.

And what's wrong with something like the following?

#ifdef CONFIG_WIN32
...
#ifndef S_ISLNK
#define S_ISLNK(x) ...
#endif
...
#endif

Best regards,
Christian Schoenebeck



