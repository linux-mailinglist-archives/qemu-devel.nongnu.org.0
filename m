Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA61509F90
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:24:56 +0200 (CEST)
Received: from localhost ([::1]:44310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVrj-0005ew-W7
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhVnu-0002kW-31; Thu, 21 Apr 2022 08:20:58 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:49191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhVnr-0005ZS-DJ; Thu, 21 Apr 2022 08:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=g6fePjwJIu7uKmkrQQL+/eH1tsubc6Gw7nyXI8zSugk=; b=bWFF5XoDUD5EturrXXXNXyNlcl
 N5ACHBra24IXxi0CmV0oSwMPCBp8UsTVo2d4CGiNltMAYpYuHqKVaXS7HYLtxS/nrzom41cFSLHLT
 IXoCvEIB95X7+4KUVMk/boezz6nD2cGGSMGRjBRtrGVlzbZ03AuAcQrCttDxyWdJSJo62cPRYyar8
 w5PvwoyGi537FXhAbMSi2XfkvRsc0xyGsPyAIkB7YhSYmk6ZyMygL09QApyVH/fiQmAnQIPXInv4U
 94tB4/CuPvOsiSLYB15sLNdVxeZqas/vf9+Fdj4UnFBGY1vKtkXH/f3z75D0ZxcmmzBNCn1E8GCN8
 yVqaNyOYU8ehyBcWmL+1/pfbmr8POOSLFS9QEC68rMglFrIpA5FLZ4e3qkdajgI0ezAv+kSZ5rttI
 qvVHIWdlbR8PVE1gFxSRZBinwa4swr3cd/17TS22ApTNInvZWqcC99nCvQTdF1Jg/bvOT+tfffnKI
 F7mKWC4hJEis/4id5018pUyfEpqY5Ujg3OdYGWmBhLRZuysBtOlngoQyLl9G3W2tVatRzPYZkUM1I
 vD3yTJQkQi68z6MgStqPRxqE+CcUf5LKMFIrr6i/RDylRJGhJMf1tcchFpLVAM7NwTPazvgwnpThe
 9l+EVqze21pK7vVYlov8fIHVYJS5lY3w4s88gPiN4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 4/5] 9pfs: fix wrong errno being sent to Linux client on
 macOS host
Date: Thu, 21 Apr 2022 14:20:50 +0200
Message-ID: <2789542.yvXY0umSai@silver>
In-Reply-To: <20220421134626.52726efa@bahia>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <3250585.T8RbiGE4XJ@silver> <20220421134626.52726efa@bahia>
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

On Donnerstag, 21. April 2022 13:46:26 CEST Greg Kurz wrote:
> On Thu, 21 Apr 2022 13:13:08 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Donnerstag, 21. April 2022 12:48:35 CEST Greg Kurz wrote:
> > > On Tue, 19 Apr 2022 13:41:59 +0200
> > > 
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > Linux and macOS only share some errno definitions with equal macro
> > > > name and value. In fact most mappings for errno are completely
> > > > different on the two systems.
> > > > 
> > > > This patch converts some important errno values from macOS host to
> > > > corresponding Linux errno values before eventually sending such error
> > > > codes along with Tlerror replies (if 9p2000.L is used that is), which
> > > > fixes a bunch of misbehaviours when running a Linux client on macOS
> > > > host.
> > > 
> > > This even fixes an actual protocol violation :
> > > 
> > > lerror -- return error code
> > > 
> > > size[4] Rlerror tag[2] ecode[4]
> > > 
> > > lerror replaces the reply message used in a successful call. ecode is a
> > > numerical Linux errno.
> > > ^^^^^^^^^^^^^^^^^^^^^
> > > 
> > > Taken from
> > > https://github.com/chaos/diod/wiki/protocol#lerror----return-error-code
> > 
> > Again, something to add to the commit log?
> 
> IMHO a protocol violation is important enough to be mentioned but
> I'll leave it to you.

Ok, will do.

> > > > For instance this patch fixes:
> > > >   mount -t 9p -o posixacl ...
> > > > 
> > > > on Linux guest if security_mode=mapped was used for 9p server, which
> > > > refused to mount successfully, because macOS returned ENOATTR==93
> > > > when client tried to retrieve POSIX ACL xattrs, because errno 93
> > > > is defined as EPROTONOSUPPORT==93 on Linux, so Linux client believed
> > > > that xattrs were not supported by filesystem on host in general.
> > > > 
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > ---
> > > > 
> > > >  hw/9pfs/9p.c | 27 +++++++++++++++++++++++++++
> > > >  1 file changed, 27 insertions(+)
> > > > 
> > > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > > index d953035e1c..becc41cbfd 100644
> > > > --- a/hw/9pfs/9p.c
> > > > +++ b/hw/9pfs/9p.c
> > > > @@ -57,6 +57,31 @@ enum {
> > > > 
> > > >  P9ARRAY_DEFINE_TYPE(V9fsPath, v9fs_path_free);
> > > > 
> > > > +/* Translates errno from host -> Linux if needed */
> > > > +static int errno_to_dotl(int err) {
> > > > +#if defined(CONFIG_LINUX)
> > > > +    /* nothing to translate (Linux -> Linux) */
> > > > +#elif defined(CONFIG_DARWIN)
> > > > +    /* translation mandatory for macOS hosts */
> > > > +    if (err == ENAMETOOLONG) {
> > > > +        err = 36; /* ==ENAMETOOLONG on Linux */
> > > > +    } else if (err == ENOTEMPTY) {
> > > > +        err = 39; /* ==ENOTEMPTY on Linux */
> > > > +    } else if (err == ELOOP) {
> > > > +        err = 40; /* ==ELOOP on Linux */
> > > > +    } else if (err == ENOATTR) {
> > > > +        err = 61; /* ==ENODATA on Linux */
> > > > +    } else if (err == ENOTSUP) {
> > > > +        err = 95; /* ==EOPNOTSUPP on Linux */
> > > > +    } else if (err == EOPNOTSUPP) {
> > > > +        err = 95; /* ==EOPNOTSUPP on Linux */
> > > > +    }
> > > 
> > > I'm assuming you have audited all errnos, right ? Just to be sure
> > > that this won't bite anymore.
> > 
> > Depends on what you mean with "all". Like I wrote in the commit log, for
> > now I translated in this patch those errnos that I identified as
> > important, and those are audited by me of course (checked the man pages
> > for what errors are expected as result from calls on Linux vs. macOS side
> > and looked up numeric values from header files on both sides, tests).
> 
> I was pretty sure you'd have done that at least :-)
> 
> > However if you rather mean really all errnos that were ever defined on
> > Linux and macOS, then the answer is no. That would probably quite some
> > work, and I'm not sure if you could just try to translate them dry, i.e.
> > by just looking at the headers or something.
> 
> But yes I was rather meaning the full errno set.
> 
> > So yes, your concern is justified. The question is, should this all be
> > translated right now already, or would it be OK to address this minimum
> > set of errno translation for now (especially for qemu-stable) and then
> > later address the rest?
> 
> My concern is about the maintenance burden of investigating future
> implementations of this issue, so I'd say it is mostly up to you
> as the principal maintainer. Maybe leave a FIXME comment in the code
> that the list of translated errnos isn't exhaustive at least ?

I stick to this minimal approach with FIXME comment then for now. I have 
tested this patch thoroughly on macOS and did not encounter similar issues. So 
I think it is good enough as first-aid patch at least.

The aforementioned case-insensitive filesystem issues are a higher priority 
from my PoV, because they trigger various misbehaviour in my tests.

Best regards,
Christian Schoenebeck

> > On the long term you would probably import the Linux errno header file
> > into
> > the code base, then prefix the individual macros with something like
> > DOTL_ENODATA, etc. and then use those macros for translating the errnos
> > instead of using literal numerics, maybe using GCC's designated array
> > initializers then.
> 
> This would make sense indeed since 9p2000.L explicitly mentions the
> numerical linux errnos.
> 
> > > > +#else
> > > > +#error Missing errno translation to Linux for this host system
> > > > +#endif
> > > > +    return err;
> > > > +}
> > > > +
> > > 
> > > As with the other patch, I'd rather move this magic to 9p-util.h .
> > 
> > Makes sense. There is indeed already too much utility code piled up in
> > 9p.c.> 
> > > >  static ssize_t pdu_marshal(V9fsPDU *pdu, size_t offset, const char
> > > >  *fmt,
> > > >  ...) {
> > > >  
> > > >      ssize_t ret;
> > > > 
> > > > @@ -1054,6 +1079,8 @@ static void coroutine_fn pdu_complete(V9fsPDU
> > > > *pdu,
> > > > ssize_t len)>
> > > > 
> > > >              }
> > > >              len += ret;
> > > >              id = P9_RERROR;
> > > > 
> > > > +        } else {
> > > > +            err = errno_to_dotl(err);
> > > > 
> > > >          }
> > > >          
> > > >          ret = pdu_marshal(pdu, len, "d", err);



