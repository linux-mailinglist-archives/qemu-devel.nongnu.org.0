Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626018E550
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Mar 2020 23:51:25 +0100 (CET)
Received: from localhost ([::1]:41512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFmxf-0002gr-TA
	for lists+qemu-devel@lfdr.de; Sat, 21 Mar 2020 18:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFmwt-00025E-Ng
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 18:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFmws-0003Fm-0N
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 18:50:35 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:11184)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1jFmwr-0003D2-QI
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 18:50:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 65757747871;
 Sat, 21 Mar 2020 23:50:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 461DE7476D5; Sat, 21 Mar 2020 23:50:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 44AD97475F6;
 Sat, 21 Mar 2020 23:50:23 +0100 (CET)
Date: Sat, 21 Mar 2020 23:50:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: deprecation of in-tree builds
In-Reply-To: <CAFEAcA8E6goDHb-7kKCTp=wSpBsuJcfjMmLP0EgymiEL348r4A@mail.gmail.com>
Message-ID: <alpine.BSF.2.22.395.2003212338020.36211@zero.eik.bme.hu>
References: <CAFEAcA8E6goDHb-7kKCTp=wSpBsuJcfjMmLP0EgymiEL348r4A@mail.gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 Mar 2020, Peter Maydell wrote:
> AIUI from Paolo, the intention is to deprecate and eventually
> stop supporting "in-tree" builds, so that the only option is
> building in a separate build directory. I thought we should
> probably mention that in the 5.0 changelog, so I wrote up some
> text:
>
> https://wiki.qemu.org/ChangeLog/5.0#Build_Information
>
> Suggestions for changes/comments etc welcome.
>
> (One thing we will need to fix before we can do separate build
> tree is the Coverity Scan build process, which (a) does an
> in-tree build (b) can't be easily switched to a builddir because
> all the source paths get baked into the scan results and moving
> to a builddir changes them all...)
>
> We could also make configure actively warn if used in
> the source tree.

This was discussed before. I think instead of annoying people with a 
warning, rather configure should be changed to create a build dir if run 
from source and have a Makefile in top dir that runs make -C builddir so 
people don't have to care about this or change their ways and can continue 
to run configure && make from source dir but you don't have to support 
in-tree build. Then you can deprecate in-tree builds but supporting only 
out-of-tree without this convenience would not just unnecessarily annoy 
those who prefer working in a single tree but people (and apparently some 
tools) expect sources to build with usual configure; make; make install so 
that should be the minimum to support.

Regards,
BALATON Zoltan

