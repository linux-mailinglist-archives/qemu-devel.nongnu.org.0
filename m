Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2348F616215
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:53:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqCHs-0003WI-Pa; Wed, 02 Nov 2022 07:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oqCHL-0003Q7-Ps
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:51:38 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oqCHJ-0001S6-SO
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=stwO0qYng6jS3MpCGU3s5noxodAAC3H1CHMeRyA1rU4=; b=Qt0r5hzI93PQG3DHy4YpDKTOKg
 OwjOmbElnbwkhYp7YUpI3PzaNwC1nZE4/R+PwFm3DrnmNOYHRae7XxxrdJOuTkKpy0R0DCKMAzv3+
 /RbZXILQjj+TEMBD88yEhwQZNhuvxD22nBq10+eafo1UMtBOF4qxb5if3elKwAYQ2zFwD83gdjKYV
 u3pNig5QSrAxbym0UYshXgUPh3y/jjUe9hBuAXxMVFQdsj/D17lr7S6DAgr628o3ImA8PnrpNFsrU
 wxIVXa1RRWF/i+WY9MqST6ed21X99goXRXegGBv2QRLuFneCE1dg7fbSSAonS3B6WMWhzFO4Vz+JT
 oDCTn5xmRWDFMiUOpGSt6Epui1tOkhhstjKr5U80FA3ZvgL6b/RlHl8DGDpT2VD8+zCRPrOkoJryB
 8dK7N7Zp82yGa7XD+DP9pDjtQQpWalAg5cZBXhRq7t7n9E6WH9et4nZfspUzat10tk6HB/KZwAXGs
 YwIDIypv1fe3M2S3XhNjrh6KI3Y41hRqfQD9pp1kIJV/v4Wr/+7Xw9b+5rEdM2Y0imeAM6WEcmQn+
 xD8tw5Xf4p6a2eq5n22e5IWmws60MO97Xmd3nnPcQcmD5lGEM1hiR4UHRZ/Vx4TGsu3fAyLzJkmg4
 rpyNQm+msLONYY+0af71mtzM/7H/umwjPN5JCcz+4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>,
 "Shi, Guohuai" <Guohuai.Shi@windriver.com>
Subject: Re: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Date: Wed, 02 Nov 2022 12:51:23 +0100
Message-ID: <2320533.1nU5s8ClW0@silver>
In-Reply-To: <DM6PR11MB4171DB9E7C848BD9A0465EACEF399@DM6PR11MB4171.namprd11.prod.outlook.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <4078234.fJnRZ6glpc@silver>
 <DM6PR11MB4171DB9E7C848BD9A0465EACEF399@DM6PR11MB4171.namprd11.prod.outlook.com>
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

On Wednesday, November 2, 2022 12:28:08 PM CET Shi, Guohuai wrote:
> 
[...]
> > >
> > > Yes, symlink can be supported by "mapped" mode.
> > > I mean that MinGW does not provide symlink mode flags "S_IFLNK" and some
> > other related functions and defines.
> > > You can check with "9p.c": S_ISLNK, S_ISSOCK and S_ISFIFO are not valid on
> > Windows (MinGW) host.
> > > So even I enabled symlink supported by "mapped" mode on local-agent code,
> > "9p.c" can not be built.
> > >
> > > So I disabled symlink totally, because MinGW interface does not support it.
> > >
> > > To resolve this issue, MinGW should add the missing defines at first.
> > 
> > And what's wrong with something like the following?
> > 
> > #ifdef CONFIG_WIN32
> > ...
> > #ifndef S_ISLNK
> > #define S_ISLNK(x) ...
> > #endif
> > ...
> > #endif
> > 
> 
> It is OK to add this just for current solution.
> My concern is:
> mode_t is a 16-bit value which store permission value in lower 12-bit and file type in higher 4-bit.
> Windows does not document the other value for file type defines:
> 
> // from MS SDK header file:
> 
> #define _S_IFMT   0xF000 // File type mask
> #define _S_IFDIR  0x4000 // Directory
> #define _S_IFCHR  0x2000 // Character special
> #define _S_IFIFO  0x1000 // Pipe
> #define _S_IFREG  0x8000 // Regular
> 
> If we add a new type, is it a risk that the un-document value may be used by Windows internally and cause some compatible issue?
> Or if Windows use this some values in the future cause conflict?

We don't have a crystal ball, but there are ways to handle this responsibly:
At compile-time you could error out badly if there is anything we don't
expect, like all of a sudden some of the macros we explicitly define for
Windows are unexpectly there, and telling developers, hey somebody should look
at this.

And at runtime you could add an assert() if some these values are all of a
sudden filled. Because that's what we currently don't expect, as we are
occupying them.

Best regards,
Christian Schoenebeck



