Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D90A513318
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:56:57 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2lT-0000Wd-Lf
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nk2Xm-0008UB-2B; Thu, 28 Apr 2022 07:42:46 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:41653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nk2Xk-0004Pc-2i; Thu, 28 Apr 2022 07:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=JEjx05k9VnmkYQxSNNhjnULtVzy70mjecuT1kI33Kjo=; b=vI2YqxNMT9/NHSLjjWpk4ng9d6
 xLT603uvEGEAHGgqMuDBwwltREPTRa8jjIYi8wqe+s6Feixs/636JfxvYFapdNFf8cmqbDaQ1VImW
 /VP+1K2H3vNkVPid9rw2rs3vsRXVseKCLJ0R0yJZoaDZtY1ODFOqd167tSRExCT0OMFs1PAKR88GV
 3u/ij5UCclBSKeAUQ+UBOcf2sjIb6GBNRfl7l+FWJIDr69IxZ0wAPizD+hlYJfC49AinR3oGZyLgR
 y213Vjjg3/Iwt7uHkQD0q//KmTNWf7rotI6S2iHbCrAT/4oZHK4BA2BnnEQg97mSxi2nxAqzTD/uj
 pOWgJyWy+inCi+g/iz59jjJ2tBrlaSHQdiwFq0szjEnfOpE9TkCDTTmzXr8lDMsg9l6fPEQjEIRj2
 n8Ej/FbaM/ZIkTcvpleDoqWFNb0EUcmGt5NzW0GtBj7XyWQ0auts8kIbqJuOu0HNMLYYl4OKOJzpc
 ZH0J8713XjPjaztFfdyDa7XZNc3E8+sKfu/tJSWihPXA2fwG1nspS+wjFVS8pUZ2vBqAXYEGLFPJJ
 RLgmPBIUJnXdHVxmAL5gtC1wfFRt8y2k50a86rJdeuabvbzoUtLeYe3+nMjadYQT/znmq/FHCRYae
 SqQyqaAfYuqsW9Cu+O90VYdv0nPPlNUiSWIFDd8ow=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v4 1/6] 9pfs: fix qemu_mknodat(S_IFREG) on macOS
Date: Thu, 28 Apr 2022 13:42:25 +0200
Message-ID: <3989771.T3hWByohnE@silver>
In-Reply-To: <20220427221612.75febe47@bahia>
References: <cover.1651085921.git.qemu_oss@crudebyte.com>
 <a5338eada3c5130046785014c185ec4fa0ddeaa7.1651085921.git.qemu_oss@crudebyte.com>
 <20220427221612.75febe47@bahia>
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

On Mittwoch, 27. April 2022 22:16:12 CEST Greg Kurz wrote:
> On Wed, 27 Apr 2022 20:54:04 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > mknod() on macOS does not support creating regular files, so
> > divert to openat_file() if S_IFREG is passed with mode argument.
> > 
> > Furthermore, 'man 2 mknodat' on Linux says: "Zero file type is
> > equivalent to type S_IFREG".
> 
> Thinking again I have mixed feelings about this... qemu_mknodat()
> should certainly match POSIX semantics, even non-portable, as
> described in [1] but I'm not sure it should mimic linux-specific
> behaviors.
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/mknod.html
> 
> > Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Reviewed-by: Will Cohen <wwcohen@gmail.com>
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > ---
> > 
> >  hw/9pfs/9p-util-darwin.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > index bec0253474..e24d09763a 100644
> > --- a/hw/9pfs/9p-util-darwin.c
> > +++ b/hw/9pfs/9p-util-darwin.c
> > @@ -77,6 +77,15 @@ int fsetxattrat_nofollow(int dirfd, const char
> > *filename, const char *name,> 
> >  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> >  {
> >  
> >      int preserved_errno, err;
> > 
> > +
> > +    if (S_ISREG(mode) || !(mode & S_IFMT)) {
> 
> ... so maybe I'd just check S_ISREG() here. Not a request, just food
> for thought : sticking to POSIX semantics might help to make the code
> more portable across all the new host supports that are showing up
> these days.

Well, handling !(mode & S_IFMT) (i.e. "zero file type") is needed "somewhere" 
for 9p2000.L to behave as expected on macOS hosts. So you might argue this 
could rather be handled in 9p.c instead and there only if protocol is exactly 
9p2000.L.

OTOH I currently don't see an issue here providing that default behaviour.

Best regards,
Christian Schoenebeck

> > +        int fd = openat_file(dirfd, filename, O_CREAT, mode);
> > +        if (fd == -1) {
> > +            return fd;
> > +        }
> > +        close(fd);
> > +        return 0;
> > +    }
> > 
> >      if (!pthread_fchdir_np) {
> >      
> >          error_report_once("pthread_fchdir_np() not available on this
> >          version of macOS"); return -ENOTSUP;



