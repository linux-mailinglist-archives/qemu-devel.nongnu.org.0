Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A536ADF01
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:44:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWfr-00086H-V1; Tue, 07 Mar 2023 07:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pZWfq-000856-1R
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:44:10 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pZWfo-00032e-1l
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=knKEXYSA4AD4zYeVLOOaU1i3D6U5amQSLfWFdEa/DIU=; b=s2LaPrZxfZnEPIcOKd7impy2rh
 VX7p9YvSaVCvtydhhlWknN4vcSRltglUUc7LB8Jez5ch/JkwEx6YPagotzkI8CHYqrWbulIzXzUxY
 0syzq2nByJj+JockMHERetcxtvlhG4U2udkJCHsY62fFFWPZLEXgeKA9ruj1IeNo5lfEFsBgMhxTn
 lUmFYX2RHnsBmDQCI6mDHXbQOXYhJZIAXKqg3+AZwcGDXzGGPCX+8vi7iQx42qeAe95yCtY7D96my
 SteMryMFPdpfp9aTUJ48zDzcY4Qb5ZmEa7g+S9OOFpWrrtv4KQkWf7Ul9FfHaRYyI+suWWqlLrdwV
 KPwYPhzZb7i0FsZ1J+N6dM+fCxuCjZjc5nI68JnxDqD743roJIimJK4fzmDUcCxfTQYFNHwO9VIb7
 9o3/alJ/hauQ4bgddfJDUaW00CI06h04o61+gkbuQ0eAmM8ZqiCNBqLCTxgGTnZdH+tK/d/gt57ft
 SBcXL/Ehqw48Z2nuzTyItbsMSmQ9Suf5bc9RehD1dc58fBcRRAS36KwiJW89e2CVWBWGqq+A4Pl5t
 793MFVVvByiTYGZDrUDNFdVAVOl7ei6RWjNQqlAiHdozo5Jwwwaebx6ci1QELSBUIeApeCG8AtZ8L
 xCRm9qEPR6PpIKKjrqZnduVR6k6nX2UVsXWziXZIU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v5 00/16] hw/9pfs: Add 9pfs support for Windows
Date: Tue, 07 Mar 2023 13:44:04 +0100
Message-ID: <2011311.pL4TEuyVgO@silver>
In-Reply-To: <CAEUhbmXaq=TJ8U+a9xkohacP8OfZyGkuZKxwffrqNKdYE0=OOw@mail.gmail.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <5311946.tteGgEznqY@silver>
 <CAEUhbmXaq=TJ8U+a9xkohacP8OfZyGkuZKxwffrqNKdYE0=OOw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Monday, March 6, 2023 3:56:49 PM CET Bin Meng wrote:
> On Mon, Mar 6, 2023 at 10:15=E2=80=AFPM Christian Schoenebeck
> <qemu_oss@crudebyte.com> wrote:
> >
> > On Monday, February 20, 2023 11:07:59 AM CET Bin Meng wrote:
> > > At present there is no Windows support for 9p file system.
> > > This series adds initial Windows support for 9p file system.
> > >
> > > 'local' file system backend driver is supported on Windows,
> > > including open, read, write, close, rename, remove, etc.
> > > All security models are supported. The mapped (mapped-xattr)
> > > security model is implemented using NTFS Alternate Data Stream
> > > (ADS) so the 9p export path shall be on an NTFS partition.
> > >
> > > 'synth' driver is adapted for Windows too so that we can now
> > > run qtests on Windows for 9p related regression testing.
> > >
> > > Example command line to test:
> > >   "-fsdev local,path=3Dc:\msys64,security_model=3Dmapped,id=3Dp9 -dev=
ice
> > virtio-9p-pci,fsdev=3Dp9,mount_tag=3Dp9fs"
> > >
> > > Changes in v5:
> > > - rework Windows specific xxxdir() APIs implementation
> >
> > I didn't have the chance to look at this v5 yet.
> >
> > In general it would help for review to point out in the cover letter wh=
ich
> > patch(es) have changed, what decisions you have made and why.
> >
> > In this case I guess that's patch 4.
> >
>=20
> Yes, it's patch 4, and v5 is reworked following your comments
> regarding patch 4 of v4.

:) The point was we only discussed suboptimal individual options (each one
with pros and cons), not one compelling solution.

Never mind, I'll look at your code changes.

Best regards,
Christian Schoenebeck



