Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB115A26D0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:24:50 +0200 (CEST)
Received: from localhost ([::1]:54728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRXSC-0005nW-UF
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:24:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oRXKX-0007kn-6N
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:16:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:55667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oRXKS-0006C2-PR
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=SRDuGkhP93EoNG8hXSBzEMC8lIcD0PrwQm7JQf4oj6k=; b=lq8qe5Ea0M75OfzFVlb4Gf3ovi
 hzx3GVawptomIsehwW50d/FkoIkM6XzepDS5NDjotRYj71Gc0Oa2AEmIqqjQM9NSjsEP1LrmsilqJ
 608jJtpt7yV68FjX9A+4nDDchcixNG3MD0BLcZTN38hkKHvONHdLxa5fLiYjSZ7NipXsfkmS/OPP/
 zzcRg/SA67BX87xsATEADxDI3HvaOjzGRmc+P9reaoh57vvhJDz4VpG5fOIiue4LGlUUkz24G0V/U
 BrYkZjswYP99n3bnr2OFLEDIqTb67QDFcfPp4WSLfmSaAqISJgh9AABXRiUSghAEprIyGk/YMcDpa
 Ier0VHitt4bdS9UFRdP3P3j87/Nj/enVmvRURF8ak4Vp86iq51g1BUOl3xOIPxhqrBTHOUaR7Tyun
 u4rnxQZvF75MkPSyqXGtfX0acpnhg7Mg4rLMMTSqPkpEN98o2t5uGd13lqkqnX0laErcpeVhPvKJD
 4CAvZeHdMktSiCti1UISJTw0hkU+x4A8Jw7FW4y8+PL7ZIBoI3MVc9NvwZtYBjpsgvHlw6Cr+kDZU
 Z7a2JMJKalJdHDZy663kSU1N/5N9oK41P9auCEopGn0J4+4vKwDVAxHzRISb1O4rBlaEZjZLJmcRk
 hbla5YypqY5+DMs8Pg7lpofQExDIzeCvvtyaH3ktU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 09/51] fsdev/virtfs-proxy-helper: Use
 g_mkdir_with_parents()
Date: Fri, 26 Aug 2022 13:16:44 +0200
Message-ID: <17308910.sOD9EhOjFm@silver>
In-Reply-To: <CAEUhbmUWScohEG7aV9UfU1ARj5y6wmam+uqJ4zyFMHnyfwzr=Q@mail.gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <1709102.QJTYiT9k8f@silver>
 <CAEUhbmUWScohEG7aV9UfU1ARj5y6wmam+uqJ4zyFMHnyfwzr=Q@mail.gmail.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Freitag, 26. August 2022 12:30:20 CEST Bin Meng wrote:
> On Fri, Aug 26, 2022 at 6:09 PM Christian Schoenebeck
> 
> <qemu_oss@crudebyte.com> wrote:
> > On Mittwoch, 24. August 2022 11:39:47 CEST Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > > 
> > > Use the same g_mkdir_with_parents() call to create a directory on
> > > all platforms.
> > 
> > The same would be g_mkdir(), not g_mkdir_with_parents(), so please use
> > that
> > instead.
> 
> No, g_mkdir() is a deprecated API.

Where did you got that from? AFAICS g_mkdir() does not seem to be deprecated:
https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/gstdio.c#L1201
https://gitlab.gnome.org/GNOME/glib/-/blob/main/glib/gstdio.h#L131

> Search result (https://docs.gtk.org/glib/?q=mkdir) shows only
> g_mkdir_with_parents().

Yeah, but that does not say that it was deprecated.

> Regards,
> Bin



