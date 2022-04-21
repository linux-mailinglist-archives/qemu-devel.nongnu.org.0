Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54C4509F59
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:10:45 +0200 (CEST)
Received: from localhost ([::1]:47036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVe0-0004TL-TS
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhVGh-0001XV-0f
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:46:39 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:40999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhVGc-0008Hf-BE
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:46:36 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-eJtaR1AqM4yr-NGzsa7yFg-1; Thu, 21 Apr 2022 07:46:29 -0400
X-MC-Unique: eJtaR1AqM4yr-NGzsa7yFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C82B2805346;
 Thu, 21 Apr 2022 11:46:29 +0000 (UTC)
Received: from bahia (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0481040D016A;
 Thu, 21 Apr 2022 11:46:27 +0000 (UTC)
Date: Thu, 21 Apr 2022 13:46:26 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 4/5] 9pfs: fix wrong errno being sent to Linux client on
 macOS host
Message-ID: <20220421134626.52726efa@bahia>
In-Reply-To: <3250585.T8RbiGE4XJ@silver>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <c32aafaa3f29424fc13ae86b369c9baf1ceb0ec6.1650370027.git.qemu_oss@crudebyte.com>
 <20220421124835.3e664669@bahia> <3250585.T8RbiGE4XJ@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 13:13:08 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 21. April 2022 12:48:35 CEST Greg Kurz wrote:
> > On Tue, 19 Apr 2022 13:41:59 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Linux and macOS only share some errno definitions with equal macro
> > > name and value. In fact most mappings for errno are completely
> > > different on the two systems.
> > > 
> > > This patch converts some important errno values from macOS host to
> > > corresponding Linux errno values before eventually sending such error
> > > codes along with Tlerror replies (if 9p2000.L is used that is), which
> > > fixes a bunch of misbehaviours when running a Linux client on macOS
> > > host.
> > 
> > This even fixes an actual protocol violation :
> > 
> > lerror -- return error code
> > 
> > size[4] Rlerror tag[2] ecode[4]
> > 
> > lerror replaces the reply message used in a successful call. ecode is a
> > numerical Linux errno.
> > ^^^^^^^^^^^^^^^^^^^^^
> > 
> > Taken from
> > https://github.com/chaos/diod/wiki/protocol#lerror----return-error-code
> 
> Again, something to add to the commit log?
> 

IMHO a protocol violation is important enough to be mentioned but
I'll leave it to you.

> > > For instance this patch fixes:
> > >   mount -t 9p -o posixacl ...
> > > 
> > > on Linux guest if security_mode=mapped was used for 9p server, which
> > > refused to mount successfully, because macOS returned ENOATTR==93
> > > when client tried to retrieve POSIX ACL xattrs, because errno 93
> > > is defined as EPROTONOSUPPORT==93 on Linux, so Linux client believed
> > > that xattrs were not supported by filesystem on host in general.
> > > 
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > > 
> > >  hw/9pfs/9p.c | 27 +++++++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index d953035e1c..becc41cbfd 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -57,6 +57,31 @@ enum {
> > > 
> > >  P9ARRAY_DEFINE_TYPE(V9fsPath, v9fs_path_free);
> > > 
> > > +/* Translates errno from host -> Linux if needed */
> > > +static int errno_to_dotl(int err) {
> > > +#if defined(CONFIG_LINUX)
> > > +    /* nothing to translate (Linux -> Linux) */
> > > +#elif defined(CONFIG_DARWIN)
> > > +    /* translation mandatory for macOS hosts */
> > > +    if (err == ENAMETOOLONG) {
> > > +        err = 36; /* ==ENAMETOOLONG on Linux */
> > > +    } else if (err == ENOTEMPTY) {
> > > +        err = 39; /* ==ENOTEMPTY on Linux */
> > > +    } else if (err == ELOOP) {
> > > +        err = 40; /* ==ELOOP on Linux */
> > > +    } else if (err == ENOATTR) {
> > > +        err = 61; /* ==ENODATA on Linux */
> > > +    } else if (err == ENOTSUP) {
> > > +        err = 95; /* ==EOPNOTSUPP on Linux */
> > > +    } else if (err == EOPNOTSUPP) {
> > > +        err = 95; /* ==EOPNOTSUPP on Linux */
> > > +    }
> > 
> > I'm assuming you have audited all errnos, right ? Just to be sure
> > that this won't bite anymore.
> 
> Depends on what you mean with "all". Like I wrote in the commit log, for now I 
> translated in this patch those errnos that I identified as important, and 
> those are audited by me of course (checked the man pages for what errors are 
> expected as result from calls on Linux vs. macOS side and looked up numeric 
> values from header files on both sides, tests).
> 

I was pretty sure you'd have done that at least :-)

> However if you rather mean really all errnos that were ever defined on Linux 
> and macOS, then the answer is no. That would probably quite some work, and I'm 
> not sure if you could just try to translate them dry, i.e. by just looking at 
> the headers or something.
> 

But yes I was rather meaning the full errno set.

> So yes, your concern is justified. The question is, should this all be 
> translated right now already, or would it be OK to address this minimum set of 
> errno translation for now (especially for qemu-stable) and then later address 
> the rest?
> 

My concern is about the maintenance burden of investigating future
implementations of this issue, so I'd say it is mostly up to you
as the principal maintainer. Maybe leave a FIXME comment in the code
that the list of translated errnos isn't exhaustive at least ?

> On the long term you would probably import the Linux errno header file into 
> the code base, then prefix the individual macros with something like 
> DOTL_ENODATA, etc. and then use those macros for translating the errnos 
> instead of using literal numerics, maybe using GCC's designated array 
> initializers then.
> 

This would make sense indeed since 9p2000.L explicitly mentions the
numerical linux errnos.

> > > +#else
> > > +#error Missing errno translation to Linux for this host system
> > > +#endif
> > > +    return err;
> > > +}
> > > +
> > 
> > As with the other patch, I'd rather move this magic to 9p-util.h .
> 
> Makes sense. There is indeed already too much utility code piled up in 9p.c.
> 
> > >  static ssize_t pdu_marshal(V9fsPDU *pdu, size_t offset, const char *fmt,
> > >  ...) {
> > >  
> > >      ssize_t ret;
> > > 
> > > @@ -1054,6 +1079,8 @@ static void coroutine_fn pdu_complete(V9fsPDU *pdu,
> > > ssize_t len)> 
> > >              }
> > >              len += ret;
> > >              id = P9_RERROR;
> > > 
> > > +        } else {
> > > +            err = errno_to_dotl(err);
> > > 
> > >          }
> > >          
> > >          ret = pdu_marshal(pdu, len, "d", err);
> 
> 


