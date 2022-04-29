Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932205149E2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 14:50:26 +0200 (CEST)
Received: from localhost ([::1]:40598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkQ4n-0002OY-Ej
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 08:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nkQ14-0000XU-EA; Fri, 29 Apr 2022 08:46:34 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:46463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nkQ12-0004pL-2O; Fri, 29 Apr 2022 08:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=lRQBS/wDcdCGthupCtpu0SBCu0oM4Ob54p+qNRobC1E=; b=sRAZS6PIOjBlH8ek2KgC/hxwat
 BtT3Ukn7Higf8zVxsGWZzZsW53vp0nUVB7s9Sv8bAZ9zUFt7RXdhIxEosf10DqAr9HDkgOPdqHQT1
 o6wx5EYKVl3snpOsIu+wta7BlwBYorbjHD2o28rUuKPGohhXlkQAU1UcsjyyLtaf3NXnS5G6Sj1M3
 KaoqgQu+2CgV0AiKIfxN2aQ0XiotZtr+cmKL8Uey2WD6APlysrQoGFdrt6pvffInvXkyaHSWQ1VIb
 g5UioiNLn3xpyQu2X25bC43hQvfa2NLpGWOcsQ1uqsVuHXfK2AL/tkNMcNgxVrSpLrkS+COyNjpCw
 gSx/Rq9/oRoyvmXNX+CcKsa1AcAF2mZy/WxQvQK5eowneenbRRrNSuo21AmAGoPb/Fox5ZCLfmjPC
 KpWBf+pfkIayKNn0nSI1TxdK44VZ/o7rYCzNxjDwhPE4QMWXMrCbl5REdX+pTR//lKlJLxqv+cq/k
 T1RK9bWsM328GzM9zOuBW5duloqc9oLb0hAcUlcLZNkFOoo/AMpnrPYNRret6V4vLMoIMs4TQavaG
 OCEfSt9D0AXHuco5xQGcMM/ylsDvZGpeHTSYBfFrJs9eqteM29bGPK0IE6ktwQ+RpStMQ4QfCZTJl
 H34ROE0CVudCqnceBxIio2ysM+/kKygNBGQL+I9cs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, Greg Kurz <groug@kaod.org>, 
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Guohuai Shi <guohuai.shi@windriver.com>
Subject: Re: [PATCH v5 4/6] 9pfs: fix wrong errno being sent to Linux client
 on macOS host
Date: Fri, 29 Apr 2022 14:46:26 +0200
Message-ID: <7406109.yuWpBpk2tO@silver>
In-Reply-To: <CAEUhbmUVb_MLEGbKaJKjL023KUDUy=wvf9KCNn+NeAMW0SeELg@mail.gmail.com>
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
 <b322ab298a62069e527d2b032028bdc9115afacd.1651228001.git.qemu_oss@crudebyte.com>
 <CAEUhbmUVb_MLEGbKaJKjL023KUDUy=wvf9KCNn+NeAMW0SeELg@mail.gmail.com>
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

On Freitag, 29. April 2022 13:28:39 CEST Bin Meng wrote:
> On Fri, Apr 29, 2022 at 7:16 PM Christian Schoenebeck
> 
> <qemu_oss@crudebyte.com> wrote:
> > Linux and macOS only share some errno definitions with equal macro
> > name and value. In fact most mappings for errno are completely
> > different on the two systems.
> > 
> > This patch converts some important errno values from macOS host to
> > corresponding Linux errno values before eventually sending such error
> > codes along with 'Rlerror' replies (if 9p2000.L is used that is). Not
> > having translated errnos before violated the 9p2000.L protocol spec,
> > 
> > which says:
> >   "
> >   size[4] Rlerror tag[2] ecode[4]
> >   
> >   ... ecode is a numerical Linux errno.
> >   "
> >   
> >   https://github.com/chaos/diod/wiki/protocol#lerror----return-error-code
> > 
> > This patch fixes a bunch of misbehaviours when running a Linux client
> > 
> > on macOS host. For instance this patch fixes:
> >   mount -t 9p -o posixacl ...
> > 
> > on Linux guest if security_mode=mapped was used for 9p server, which
> > refused to mount successfully, because macOS returned ENOATTR==93
> > when client tried to retrieve POSIX ACL xattrs, because errno 93
> > is defined as EPROTONOSUPPORT==93 on Linux, so Linux client believed
> > that xattrs were not supported by filesystem on host in general.
> 
> This issue looks exact the same issue we were trying to fix when
> supporting 9p on Windows host,
> 
> What we did is like this:
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20220425142705.2099270-> 10-bmeng.cn@gmail.com/
> 
> But we had some questions in mind (see the commit message of our
> patch, and below)
> 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Link: https://lore.kernel.org/qemu-devel/20220421124835.3e664669@bahia/
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > ---
> > 
> >  hw/9pfs/9p-util.h | 30 ++++++++++++++++++++++++++++++
> >  hw/9pfs/9p.c      |  2 ++
> >  2 files changed, 32 insertions(+)
> > 
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index 2cc9a5dbfb..c3526144c9 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -58,6 +58,36 @@ static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
> > 
> >  #endif
> >  }
> > 
> > +/* Translates errno from host -> Linux if needed */
> > +static inline int errno_to_dotl(int err) {
> > +#if defined(CONFIG_LINUX)
> > +    /* nothing to translate (Linux -> Linux) */
> > +#elif defined(CONFIG_DARWIN)
> > +    /*
> > +     * translation mandatory for macOS hosts
> > +     *
> > +     * FIXME: Only most important errnos translated here yet, this should
> > be +     * extended to as many errnos being translated as possible in
> > future. +     */
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
> What happens if a macOS guest is running on QEMU from a macOS host?
> Here all macOS errnos are translated to the Linux errnos. Will macOS
> be happy?

Look at the commit log of this patch: it is a matter of which protocol is used 
(currently there are 3 [1] protocol versions):

   * 9p2000: nothing to translate here, as this protocol version does not
     return a numeric error code, it only returns an error string (and we are 
     no longer supporting 9p2000 version in QEMU anyway BTW [1]):
     http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor27

   * 9p2000.L: errno *must* be in Linux errno mapping:
     https://github.com/chaos/diod/wiki/protocol#lerror----return-error-code

   * 9p2000.u: this one returns both an error code and error string, and it 
     says the error string should be preferred being interpreted by client:
     http://ericvh.github.io/9p-rfc/rfc9p2000.u.html#anchor15

In this patch here I only translated errno for 9p2000.L, whereas you are 
always translating it, no matter wich protocol version is used. You might 
argue that there should be a translation for 9p2000.u as well, but in the end 
we don't know the OS running on guest in this case. It could be Linux or 
something else.

[1] https://wiki.qemu.org/Documentation/9p#9p_Protocol

Best regards,
Christian Schoenebeck

> 
> > +#else
> > +#error Missing errno translation to Linux for this host system
> > +#endif
> > +    return err;
> > +}
> > +
> > 
> >  #ifdef CONFIG_DARWIN
> >  #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
> >  #define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 4a296a0b94..0cd0c14c2a 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1054,6 +1054,8 @@ static void coroutine_fn pdu_complete(V9fsPDU *pdu,
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
> > 
> > --
> 
> Regards,
> Bin



