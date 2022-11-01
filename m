Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C510615181
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 19:23:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opvu9-0001tS-PM; Tue, 01 Nov 2022 14:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1opvu7-0001oM-GB
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 14:22:27 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1opvu4-0003ud-PY
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 14:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=XMa1901fId51gChKiekdr4JSXyOreM8QhLZa0MKwkjE=; b=kJx9M6sXusTZUz0xZqTlNCrL6l
 8vV5yuV9OdbmXThG4V5mdwJLH05s1xmQ0YJiTOBzWWWezbHMvSwW1qXccufpBuLp0fl9NMS5PJIaK
 3UMio3+x4wwSc023IyhuEGbtT1Clhm3zQdc2dnknKZSe6EUmXVZJDhXzA2tAGAhyxPaNWvBX6o2fc
 gSWRLfrEUFhxFG6kdHTTAvC78/2N/0WjTOI/ry1zVh+luoqocq6aW+4j3Q1FPx8bvIhDiyNsXgjqe
 a9Sy6XNwfymE/LJ9Qd8hVEtzqY9vope+Aiy79lFAOKZ9EvRRV8/fNPLzBbXOVj5Eh+cuSfvCYW7Yv
 3VyTzWaNapYLwUu8dXVE8NeIPWO8mnNTaD4SU2vk60qSZyPhK1pm9qHpRFLzxEC14VywnO0h6KlrA
 yTgWHFnBdyNtM4KwraW/zUN6jHBWmr9ytBiPrSVsDXp18ac93dzlI4yuw591HQt3u5uIEyx8z938X
 I1Aae9QtLLVbOv0tw8Lqs+UISKSB3HrY1fEadszlklsOH+DWcrypB+YtKfChE8QtKGXnIcCZzvjsS
 7sQJe5BKaiyiUlvKiG6TH8kmMN9vqoANK7UqLIxntaQriFeuHQM3rV1QLDClOvtICzYZXnlWiNQ7a
 BWJ5FXflfZ3A2F/mpMNF2t98SSR5yr25UNmrr2kqY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Date: Tue, 01 Nov 2022 19:22:16 +0100
Message-ID: <3897101.9jAPQrlFHr@silver>
In-Reply-To: <MN2PR11MB41739F85097B0DDA663F3436EF369@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <MN2PR11MB4173701AB6DB44A06CEDC2F2EF369@MN2PR11MB4173.namprd11.prod.outlook.com>
 <MN2PR11MB41739F85097B0DDA663F3436EF369@MN2PR11MB4173.namprd11.prod.outlook.com>
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

On Tuesday, November 1, 2022 4:20:53 PM CET Shi, Guohuai wrote:
> 
[...]
> > > > Windows POSIX API and MinGW library do not provide the NO_FOLLOW
> > > > flag, and do not allow opening a directory by POSIX open(). This
> > > > causes all
> > > > xxx_at() functions cannot work directly. However, we can provide
> > > > Windows handle based functions to emulate xxx_at() functions (e.g.:
> > > > openat_win32, utimensat_win32, etc.).
> > > >
> > > > Windows does not support extended attributes. 9pfs for Windows uses
> > > > NTFS ADS (Alternate Data Streams) to emulate extended attributes.
> > > >
> > > > Windows does not provide POSIX compatible readlink(), and symbolic
> > > > link feature in 9pfs will be disabled on Windows.
> > >
> > > Wouldn't it be more user friendly if the relevant error locations
> > > would use something like error_report_once() and suggesting to enable
> > > mapped(-xattr) to make 9p symlinks on guest working if desired by the user?
> > >
> > > Probably this error case would need to wrapped into a dedicated
> > > function, otherwise I guess error_report_once() would fire several
> > > times by different callers.
> > >
> > 
> > Windows (MinGW) does not only support symlink, but also does not have symlink
> > definitions.
> > Windows does not support symlink flags S_IFLNK.
> > 
> > So even I add symlink support by mapped-xattr, the MinGW library does not
> > have symlink flags and get a build error.
> > And this flags is defined by Windows header files.
> > The impact of adding a new flags to an pre-defined structure (struct stat) is
> > unknown.
> > 
> > So I think it is not a good idea to do that.
> 
> Because Windows does not support symlink, so error_report_once() and report it to user will be OK.
> But mapped-xattr could not work.

Showing an error makes sense for "passthrough" security model, but not for the
"mapped" one.

Just to avoid misapprehensions: are you aware that there is already a system-
agnostic implementation for symlinks if "mapped" is used?

When mapped security model is enabled, then creating symlinks on guest will
simply create a corresponding *regular* file on host and the content of that
regular file on host is the pointing path as raw string. Additionally the
symlink flag is added to "virtfs.mode" xattr to mark that regular file as a
symlink, a virtual one that is. So this does not require any support for
symlinks by either the underlying host file system, nor by host OS.

Likewise interpreting and walking those virtual symlinks in "mapped" mode is
also implemented in the local fs driver already.

Best regards,
Christian Schoenebeck



