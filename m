Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB872509E67
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:17:28 +0200 (CEST)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUoR-0007qD-R5
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhUkP-0004eh-MS; Thu, 21 Apr 2022 07:13:17 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nhUkN-0002Ni-Jr; Thu, 21 Apr 2022 07:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=5xj4lHTGU31X4aeBdD389fJtgdEIgeJr9GpwMBwuuXk=; b=N1HR8X8rBY2t4NXFXuWsyUk3Vp
 xDqh2EdxrrQfwFRhzL4dGOBfgoGw3yvkKMNHji2fkJcVOEPFm5m/3EbEjwO7p7709g1B10jjPosZL
 vSKaac1EXg/8f15Xjm87i2nlS1vksErdNGV+pwO301DDxRthxGLLG8qLvb3pUMNiDwl0QBA1yMQxt
 e/IdlWfhHXmKjmoOQg1qhNGx6N1RB6J6NdE2ZdK5l8NJaBClta8mMdDYXX/PdcOxfAQtOzaJSnzyl
 E1OFbYlSph+m2ppL3sg8aTbnmj3Ljt+zJALebXUztEh5hNN8Fs94WfIOdvMsi3Vl9Emtumidrycoh
 Pg+cfbagBHKEaLijvDE9eeBUFfwtrCSz7P3eBEkjNbbUrPkO3qRQWTCMCKpMqd9bAlD2rBDSvULX/
 aM5Z7OtwXGg6g+zNFHsCSA2KLwb/FFhd+Rv+cSIdUHm4JipkaEkG1+AC1DrQ6KXTNwkO2EPpdJf3p
 BCm8FzWz+GWivqaUc8GvpH4ckLAos+x5c7Ij5JJmyuhn45H7RgRkoEeuSrkkEQ7Wfr6K5cFeE9+jk
 XQgEo4E/WWMMYUVhoXhrsgHOuwTcJFGkc4NOmxCZSBCby4cfVj4mC9/XdDxrNnEGQGZgoQ1632UFX
 QOf7HorsJwoSJC3Vw8yct6kl+67DBXoqjt8s6oox4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, Will Cohen <wwcohen@gmail.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Subject: Re: [PATCH 4/5] 9pfs: fix wrong errno being sent to Linux client on
 macOS host
Date: Thu, 21 Apr 2022 13:13:08 +0200
Message-ID: <3250585.T8RbiGE4XJ@silver>
In-Reply-To: <20220421124835.3e664669@bahia>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
 <c32aafaa3f29424fc13ae86b369c9baf1ceb0ec6.1650370027.git.qemu_oss@crudebyte.com>
 <20220421124835.3e664669@bahia>
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

On Donnerstag, 21. April 2022 12:48:35 CEST Greg Kurz wrote:
> On Tue, 19 Apr 2022 13:41:59 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Linux and macOS only share some errno definitions with equal macro
> > name and value. In fact most mappings for errno are completely
> > different on the two systems.
> > 
> > This patch converts some important errno values from macOS host to
> > corresponding Linux errno values before eventually sending such error
> > codes along with Tlerror replies (if 9p2000.L is used that is), which
> > fixes a bunch of misbehaviours when running a Linux client on macOS
> > host.
> 
> This even fixes an actual protocol violation :
> 
> lerror -- return error code
> 
> size[4] Rlerror tag[2] ecode[4]
> 
> lerror replaces the reply message used in a successful call. ecode is a
> numerical Linux errno.
> ^^^^^^^^^^^^^^^^^^^^^
> 
> Taken from
> https://github.com/chaos/diod/wiki/protocol#lerror----return-error-code

Again, something to add to the commit log?

> > For instance this patch fixes:
> >   mount -t 9p -o posixacl ...
> > 
> > on Linux guest if security_mode=mapped was used for 9p server, which
> > refused to mount successfully, because macOS returned ENOATTR==93
> > when client tried to retrieve POSIX ACL xattrs, because errno 93
> > is defined as EPROTONOSUPPORT==93 on Linux, so Linux client believed
> > that xattrs were not supported by filesystem on host in general.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  hw/9pfs/9p.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index d953035e1c..becc41cbfd 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -57,6 +57,31 @@ enum {
> > 
> >  P9ARRAY_DEFINE_TYPE(V9fsPath, v9fs_path_free);
> > 
> > +/* Translates errno from host -> Linux if needed */
> > +static int errno_to_dotl(int err) {
> > +#if defined(CONFIG_LINUX)
> > +    /* nothing to translate (Linux -> Linux) */
> > +#elif defined(CONFIG_DARWIN)
> > +    /* translation mandatory for macOS hosts */
> > +    if (err == ENAMETOOLONG) {
> > +        err = 36; /* ==ENAMETOOLONG on Linux */
> > +    } else if (err == ENOTEMPTY) {
> > +        err = 39; /* ==ENOTEMPTY on Linux */
> > +    } else if (err == ELOOP) {
> > +        err = 40; /* ==ELOOP on Linux */
> > +    } else if (err == ENOATTR) {
> > +        err = 61; /* ==ENODATA on Linux */
> > +    } else if (err == ENOTSUP) {
> > +        err = 95; /* ==EOPNOTSUPP on Linux */
> > +    } else if (err == EOPNOTSUPP) {
> > +        err = 95; /* ==EOPNOTSUPP on Linux */
> > +    }
> 
> I'm assuming you have audited all errnos, right ? Just to be sure
> that this won't bite anymore.

Depends on what you mean with "all". Like I wrote in the commit log, for now I 
translated in this patch those errnos that I identified as important, and 
those are audited by me of course (checked the man pages for what errors are 
expected as result from calls on Linux vs. macOS side and looked up numeric 
values from header files on both sides, tests).

However if you rather mean really all errnos that were ever defined on Linux 
and macOS, then the answer is no. That would probably quite some work, and I'm 
not sure if you could just try to translate them dry, i.e. by just looking at 
the headers or something.

So yes, your concern is justified. The question is, should this all be 
translated right now already, or would it be OK to address this minimum set of 
errno translation for now (especially for qemu-stable) and then later address 
the rest?

On the long term you would probably import the Linux errno header file into 
the code base, then prefix the individual macros with something like 
DOTL_ENODATA, etc. and then use those macros for translating the errnos 
instead of using literal numerics, maybe using GCC's designated array 
initializers then.

> > +#else
> > +#error Missing errno translation to Linux for this host system
> > +#endif
> > +    return err;
> > +}
> > +
> 
> As with the other patch, I'd rather move this magic to 9p-util.h .

Makes sense. There is indeed already too much utility code piled up in 9p.c.

> >  static ssize_t pdu_marshal(V9fsPDU *pdu, size_t offset, const char *fmt,
> >  ...) {
> >  
> >      ssize_t ret;
> > 
> > @@ -1054,6 +1079,8 @@ static void coroutine_fn pdu_complete(V9fsPDU *pdu,
> > ssize_t len)> 
> >              }
> >              len += ret;
> >              id = P9_RERROR;
> > 
> > +        } else {
> > +            err = errno_to_dotl(err);
> > 
> >          }
> >          
> >          ret = pdu_marshal(pdu, len, "d", err);



