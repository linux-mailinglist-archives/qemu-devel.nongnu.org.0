Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C232696C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 19:53:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTVQV-0008Ut-2X
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 13:53:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTVOz-0007qe-UT
	for qemu-devel@nongnu.org; Wed, 22 May 2019 13:51:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTVOz-0005XQ-0e
	for qemu-devel@nongnu.org; Wed, 22 May 2019 13:51:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51728)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hTVOw-0005Vv-RV; Wed, 22 May 2019 13:51:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE8E575724;
	Wed, 22 May 2019 17:51:41 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A80C54D9E8;
	Wed, 22 May 2019 17:51:34 +0000 (UTC)
Date: Wed, 22 May 2019 14:51:32 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190522175132.GU10764@habkost.net>
References: <20190521200657.5377-1-jsnow@redhat.com>
	<20190521200657.5377-2-jsnow@redhat.com>
	<CAFEAcA9mEHvQ9TBGpvfVoDx-pKB9Cyc-JWeUUh2Hc0Uxb1GjuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9mEHvQ9TBGpvfVoDx-pKB9Cyc-JWeUUh2Hc0Uxb1GjuQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 22 May 2019 17:51:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] sphinx: add qmp_lexer
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Qemu-block <qemu-block@nongnu.org>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 22, 2019 at 09:49:27AM +0100, Peter Maydell wrote:
> On Tue, 21 May 2019 at 21:07, John Snow <jsnow@redhat.com> wrote:
> >
> > Sphinx, through Pygments, does not like annotated json examples very
> > much. In some versions of Sphinx (1.7), it will render the non-json
> > portions of code blocks in red, but in newer versions (2.0) it will
> > throw an exception and not highlight the block at all. Though we can
> > suppress this warning, it doesn't bring back highlighting on non-strict
> > json blocks.
> >
> > We can alleviate this by creating a custom lexer for QMP examples that
> > allows us to properly highlight these examples in a robust way, keeping
> > our directionality notations.
> 
> > diff --git a/docs/sphinx/qmp_lexer.py b/docs/sphinx/qmp_lexer.py
> > new file mode 100644
> > index 0000000000..f619f11139
> > --- /dev/null
> > +++ b/docs/sphinx/qmp_lexer.py
> > @@ -0,0 +1,34 @@
> > +# QEMU Monitor Protocol Lexer Extension
> > +#
> > +# Copyright (C) 2019, Red Hat Inc.
> > +#
> > +# Authors:
> > +#  Eduardo Habkost <ehabkost@redhat.com>
> > +#  John Snow <jsnow@redhat.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2.  See
> > +# the COPYING file in the top-level directory.
> 
> Did you definitely mean 2-only and not 2-or-later ?

John asked if I was OK with GPLv2 before submitting the patch,
but I'm also OK with 2-or-later.

-- 
Eduardo

