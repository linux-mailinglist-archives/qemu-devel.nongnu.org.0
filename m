Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADA54EEC63
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:27:25 +0200 (CEST)
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naFR5-00046k-UO
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:27:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1naFOf-0003HY-06
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:24:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:52789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1naFOd-0002rd-3h
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=kdJLES6HERqmnU0rxY+4yjpPUDTcB1947oNFJ/0Rd2E=; b=NVL/YYwpJpKc8jmjn+FbEYSAK0
 XPNCZM8ewE4xE1VXoE98pAEnqxl9PWe0f1iC5ZUjjfbdNocmORJx2IsEFff2OV0Bi2+zI1YJOYAxF
 bcdtnqYyITKS/edVa1TlLoAuluTmljIGEr/jUUvuxC3uwKel5qnL7B0f/VPkeInyevS0Ra7qoWEp4
 +zd59EQZ4EMPJidb9znTXskPMysTG2McKFTTe1wSK5xxQSjmcpejJc0PNjXU/GmoeU/ISg8oqrYgZ
 EwXYU5bOLjMGYKqKV2PvH2edttsvtEujIZuuKJTrNP/fVTiX8tpEurpuuEf0DjuGHXm45cHMpG2LG
 FPjJLrHn/Abn4mtyZ6dzkZZcEeNy7Oj4GGOpJ8ujLhDg4l4YWVgdw57OySenOZCi7ervrhRBDWn36
 XpA1syoXYq7jw/w1QohcS/JgbmtEAtEf7Llo7XLl2Dyr3/lB9+Q0B55kXdQLYKhKjbLVYV6jWkDVb
 HYOowxpxdB6lOiVmw656tzK0WZ9VNxbGHUz2aoU03AHl7uyG1uz8vAmQtj7196arsHBHc1f2+4POf
 hivMvrk8h8C/jI25omnKXIj2D6a3DPghohJgS+HvZuyJJiLrNZJlPT/oHPA0BuaQDVgW7yZUfjuPK
 bCMkgNXdVKbgfT+9xKOrdtPO+2Fslh5mJZXTxByl0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu Developers <qemu-devel@nongnu.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?=
 <philippe.mathieu.daude@gmail.com>, Fabian Franz <fabianfranz.oss@gmail.com>, 
 Michael Roitzsch <reactorcontrol@icloud.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is
Subject: Re: [PATCH v2] 9p: move P9_XATTR_SIZE_MAX from 9p.h to 9p.c
Date: Fri, 01 Apr 2022 13:24:45 +0200
Message-ID: <3101022.I2tbfQ6fGH@silver>
In-Reply-To: <fa63b692-a1be-d4f9-d2ee-e8e4c1af4890@redhat.com>
References: <20220331182651.887-1-wwcohen@gmail.com>
 <CAB26zV2UkS4unxXkTLiF8T5aY9YaCpcUd2DRbzb0_FHTt+uyyw@mail.gmail.com>
 <fa63b692-a1be-d4f9-d2ee-e8e4c1af4890@redhat.com>
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

On Freitag, 1. April 2022 13:01:31 CEST Thomas Huth wrote:
> On 31/03/2022 22.06, Will Cohen wrote:
> > On Thu, Mar 31, 2022 at 4:00 PM Peter Maydell <peter.maydell@linaro.org
> > 
> > <mailto:peter.maydell@linaro.org>> wrote:
> >     On Thu, 31 Mar 2022 at 19:27, Will Cohen <wwcohen@gmail.com
> >     
> >     <mailto:wwcohen@gmail.com>> wrote:
> >      > The patch set adding 9p functionality to darwin introduced an issue
> >      > where limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c,
> >      > though the referenced constant is needed in 9p.h. This commit fixes
> >      > that
> >      > issue by moving the definition of P9_XATTR_SIZE_MAX, which uses
> >      > XATTR_SIZE_MAX, to also be in 9p.c.
> >      > 
> >      > Additionally, this commit moves the location of the system headers
> >      > include in 9p.c to occur before the project headers.
> >      > 
> >      > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/950
> >     
> >     <https://gitlab.com/qemu-project/qemu/-/issues/950>
> >     
> >      > Fixes: 38d7fd68b0 ("9p: darwin: Move
> >      > XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX")
> >      > 
> >      > Signed-off-by: Will Cohen <wwcohen@gmail.com
> >      > <mailto:wwcohen@gmail.com>>
> >      > ---
> >      >
> >      >  hw/9pfs/9p.c | 28 +++++++++++++++++++++++-----
> >      >  hw/9pfs/9p.h | 18 ------------------
> >      >  2 files changed, 23 insertions(+), 23 deletions(-)
> >      >
> >      > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> >      > index dcaa602d4c..b9152c7882 100644
> >      > --- a/hw/9pfs/9p.c
> >      > +++ b/hw/9pfs/9p.c
> >      > @@ -16,6 +16,11 @@
> >      >
> >      >   * https://wiki.qemu.org/Documentation/9p
> >     
> >     <https://wiki.qemu.org/Documentation/9p>
> >     
> >      >   */
> >      >
> >      > +#ifdef CONFIG_LINUX
> >      > +#include <linux/limits.h>
> >      > +#else
> >      > +#include <limits.h>
> >      > +#endif
> >      >
> >      >  #include "qemu/osdep.h"
> >     
> >     osdep.h must always be the first include line in any .c file.
> > 
> > Understood, apologies -- if there's other changes for a v3 I can resubmit
> > accordingly, but if this otherwise looks okay then I would be fine with a
> > QEMU maintainer adjusting the header placement as needed when preparing
> > for
> > submission to the main tree.
> 
> Makes sense. I'm currently assembling a pull req with some misc fixes for
> 7.0 ... if Christian & Greg do not have any other patches pending right now,
> I could throw this in, with the osdep.h location fixed.
> 
>   Thomas

That would be appreciated, nothing else for 7.0 at this point. Thanks Thomas!

Best regards,
Christian Schoenebeck



