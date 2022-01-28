Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B6849FFF5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:11:53 +0100 (CET)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDViv-00046V-NJ
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:11:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDVFO-0006tS-0i; Fri, 28 Jan 2022 12:41:18 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:46387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nDVFG-0001Ih-Md; Fri, 28 Jan 2022 12:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=6CIiuW8I/+WHayZKdOMJwl3is3Xgiy9lvaG+foETCs4=; b=cbXe1V7kQLpXws2hR+ocU2u+jp
 LjDsu6l8MDlqJOvLiv3C+7zbHsvapu8hN16T534vyX5Q7G8Msk2C4fbKRhCWQx/Ajvv6rnZaWuB3w
 3l8qcKR/dzMW52fdXJldJ+gWNicydeJlFZiHdvpzJB2lf0RFm4F6rNjFXpNkuSUWdFiML3FIcAkWh
 qYRcG6Mqok5tvxwFwklR4Kl0ZGOXB8e8Cizdn2Dc5EQxUpi9jbewtt/AvgutkNazae57hbTXNKM68
 HQ+gddvUL1ksKJ/O+z/MweDxsTeMJOySHo3Zp1ZstOjaWwT8bJCKi+Bj1eDvciidxfqWpSCL9qRcV
 FIiHbGEDYgsI6QO2X42H5NOERlUTQA/XFaiwvf5rasD5K/fW7VdMPSphf8Ml6VA+x6bU/zB0cZ+tR
 qq9JmTxc3rLnJ1c08/lkFkkjEfW3jKBlPbVUU7VwLHDrhtNTqLMbs0lVTW6VBHCsaPssKyyfyOyg+
 IX+pG79xW/wBdHWT0m8NMopy57qM8IEJYJQ1bfmN7uJXzZMtwRgyXxXgkp2h1fHubmVUHGr9El/ir
 AFVRUWct9ZDtt3ZaUckqjCoqc1MMkAoRnpxV3Zm0J/0VokbmMRGeqz4sHPamIyqD5Mc6HZuNSLSIP
 JU5Y+T1KpexMqdca4rIih0ktY25siix5YbiT9x7JU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, qemu-stable@nongnu.org, ldv@altlinux.org,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Fri, 28 Jan 2022 18:40:59 +0100
Message-ID: <1768416.RRnjqH5RSi@silver>
In-Reply-To: <20220128162401.vbnffmghae3zgrfo@altlinux.org>
References: <20220127212734.218900-1-vt@altlinux.org>
 <2533498.9Ea8Rob0xc@silver> <20220128162401.vbnffmghae3zgrfo@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 28. Januar 2022 17:24:01 CET Vitaly Chikunov wrote:
> > > diff --git a/util/osdep.c b/util/osdep.c
> > > index 42a0a4986a..e39d1071fd 100644
> > > --- a/util/osdep.c
> > > +++ b/util/osdep.c
> > > @@ -33,6 +33,7 @@
> > > 
> > >  extern int madvise(char *, size_t, int);
> > >  #endif
> > > 
> > > +#include <dirent.h>
> > 
> > Wouldn't that break Windows builds?
> 
> Possible, but I don't have windows build to test. What would you
> suggest as better fix?
> 
> I took as example `util/path.c' which includes `dirent.h' too, but it is
> not handled anyway different than `util/osdep.c'

AFAICS the current expectation is to build QEMU for Windows with a POSIX-aware 
toolchain like msys2, cygwin or some cross compiler:
https://wiki.qemu.org/Hosts/W32

So I suggest leave it as is, it should be fine. Otherwise we can still wrap it 
into something like

	#if !defined(WIN32)
	...
	#endif

later on if really required.

Best regards,
Christian Schoenebeck



