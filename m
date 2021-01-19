Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A72FBB7E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:44:41 +0100 (CET)
Received: from localhost ([::1]:55216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tBL-0004IZ-My
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l1svq-0005Dt-7e
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:28:34 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:37617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l1svn-0003kb-Na
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=fU7D8/GKM3GrkKWDvbbu7bHZcl3ubPsO22Mln1ssEBo=; b=Un/q1Ys2Mv6nLGbYK16Uvg8vsN
 KntZweUf5/UpyXbWwhyogmB+6HjHKiGgDi7QQHH7vPe26DbjX1VElJ/lPlwgjbs1mZfPx96FdOrhr
 InkONLg/Kt3LrqTKnIQwhru4/9Oi7qAg3JX+n3ybf520+v5heJ1S4SbdST0xBkJQ952CnfnjLfDku
 N4DAnTMA85MSFDS0Wg+SG0XGowv6vEQG9/wFbfcTzXGQHWqvGOEzMXOBJJVy4Ji9z97AqR2dgM+IF
 Mo9o3Wmqv0Bq5wxwx0DjnOKMxRM9uhP1Pv/6JazbmN59+gX6ISMPKN7cfqcV8z2SGADeZNQsXbxsd
 3faOWbtJY2vY2D4h9+71RSgHp5WuenizX4F5cGiP7Zf3wVjgz/iaRY3ejLn/PVEf9RTi3PpDy5v/o
 qW61WXkVNVcCsHhyxoeu//FH4uw5rRUS51ec809ywImOzQg24NYiEp92xUIm27cfK2qsMhACFX+5q
 t+R17HyoFV0rvRoBzsjgLcYU7mTlntE71df0Y9mhaLSL7EM9ohJ4NuJZ5hFYILSe9iTr/mr4aFd94
 bReCnTdskNVCXzxrRB73qSeiimaOZdubGNdwKHTuJEyGY99iERbbUCynXDAXOQj7+Flrfb0WUhlhd
 m/C8hslA5IoEwViaKOwxKp/bP7TxhWNmZRLaXzvXU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 2/3] 9pfs: Convert V9fsFidState::fid_list to QSIMPLEQ
Date: Tue, 19 Jan 2021 16:28:01 +0100
Message-ID: <2181983.BdRbxLO5hT@silver>
In-Reply-To: <20210119153407.208c4df7@bahia.lan>
References: <20210118142300.801516-1-groug@kaod.org>
 <1901754.QplClEOiAT@silver> <20210119153407.208c4df7@bahia.lan>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 19. Januar 2021 15:34:07 CET Greg Kurz wrote:
> On Tue, 19 Jan 2021 14:31:26 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Montag, 18. Januar 2021 15:22:59 CET Greg Kurz wrote:
> > > The fid_list is currently open-coded. This doesn't seem to serve any
> > > purpose that cannot be met with QEMU's generic lists. Let's go for a
> > > QSIMPLEQ : this will allow to add new fids at the end of the list and
> > > to improve the logic in v9fs_mark_fids_unreclaim().
> > > 
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > 
> > In general LGTM hence:
> > 
> > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > 
> > Some comments below ...
> > 
> > > ---
> > > 
> > >  hw/9pfs/9p.c | 41 ++++++++++++++++++-----------------------
> > >  hw/9pfs/9p.h |  4 ++--
> > >  2 files changed, 20 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index 37c3379b7462..b65f320e6518 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -260,7 +260,7 @@ static V9fsFidState *coroutine_fn get_fid(V9fsPDU
> > > *pdu,
> > > int32_t fid) V9fsFidState *f;
> > > 
> > >      V9fsState *s = pdu->s;
> > > 
> > > -    for (f = s->fid_list; f; f = f->next) {
> > > +    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> > > 
> > >          BUG_ON(f->clunked);
> > >          if (f->fid == fid) {
> > >          
> > >              /*
> > > 
> > > @@ -295,7 +295,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> > > fid) {
> > > 
> > >      V9fsFidState *f;
> > > 
> > > -    for (f = s->fid_list; f; f = f->next) {
> > > +    QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
> > > 
> > >          /* If fid is already there return NULL */
> > >          BUG_ON(f->clunked);
> > >          if (f->fid == fid) {
> > > 
> > > @@ -311,8 +311,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> > > fid) * reclaim won't close the file descriptor
> > > 
> > >       */
> > >      
> > >      f->flags |= FID_REFERENCED;
> > > 
> > > -    f->next = s->fid_list;
> > > -    s->fid_list = f;
> > > +    QSIMPLEQ_INSERT_HEAD(&s->fid_list, f, next);
> > 
> > Not related to this series, but I wonder why queue.h wraps everything
> > into:
> > 
> > do {
> > 
> > 	...
> > 
> > } while (0);
> 
> Note, this is do { ... } while (0) *without* the trailing semi-colon, which
> is the corner stone of this trick.

Yes, I got that. What I meant was, unless I am missing something, a simple 
compound statement (without trailing semi-colon) a.k.a. a 'block' is the more 
common way to handle this, like:

#define QSIMPLEQ_INIT(head) {                                        \
    (head)->sqh_first = NULL;                                        \
    (head)->sqh_last = &(head)->sqh_first;                           \
}

Third patch tomorrow ... thanks Greg!

Best regards,
Christian Schoenebeck



