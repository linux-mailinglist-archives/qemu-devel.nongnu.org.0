Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F32F54DED1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:23:55 +0200 (CEST)
Received: from localhost ([::1]:39774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mfK-0001Sk-J1
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1o1mZk-0005Qf-Q0
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:18:10 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:57218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1o1mZg-0008TE-IP
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:18:06 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-38z1qM-ANI2pIvzrZmncTQ-1; Thu, 16 Jun 2022 06:18:00 -0400
X-MC-Unique: 38z1qM-ANI2pIvzrZmncTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C388C1C14489;
 Thu, 16 Jun 2022 10:17:59 +0000 (UTC)
Received: from bahia (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47BF32166B26;
 Thu, 16 Jun 2022 10:17:59 +0000 (UTC)
Date: Thu, 16 Jun 2022 12:17:57 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 5/7] 9pfs: fix 'Twalk' to only send error if no
 component walked
Message-ID: <20220616075217.087941be@bahia>
In-Reply-To: <9146815.PM5Uiz2McI@silver>
References: <cover.1647339025.git.qemu_oss@crudebyte.com>
 <bc73e24258a75dc29458024c7936c8a036c3eac5.1647339025.git.qemu_oss@crudebyte.com>
 <20220615175249.21c497f3@bahia> <9146815.PM5Uiz2McI@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Jun 2022 18:36:46 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 15. Juni 2022 17:52:49 CEST Greg Kurz wrote:
> > On Tue, 15 Mar 2022 11:08:39 +0100
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Current implementation of 'Twalk' request handling always sends an
> > > 'Rerror'
> > > 
> > > response if any error occured. The 9p2000 protocol spec says though:
> > >   "
> > >   If the first element cannot be walked for any reason, Rerror is
> > >   returned.
> > >   Otherwise, the walk will return an Rwalk message containing nwqid qids
> > >   corresponding, in order, to the files that are visited by the nwqid
> > >   successful elementwise walks; nwqid is therefore either nwname or the
> > >   index
> > >   of the first elementwise walk that failed.
> > >   "
> > >   
> > >   http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor33
> > > 
> > > For that reason we are no longer leaving from an error path in function
> > > v9fs_walk(), unless really no path component could be walked successfully
> > > or if the request has been interrupted.
> > > 
> > > Local variable 'nwalked' counts and reflects the number of path components
> > > successfully processed by background I/O thread, whereas local variable
> > > 'name_idx' subsequently counts and reflects the number of path components
> > > eventually accepted successfully by 9p server controller portion.
> > > 
> > > New local variable 'any_err' is an aggregate variable reflecting whether
> > > any error occurred at all, while already existing variable 'err' only
> > > reflects the last error.
> > > 
> > > Despite QIDs being delivered to client in a more relaxed way now, it is
> > > important to note though that fid still must remain unaffected if any
> > > error
> > > occurred.
> > > 
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > > 
> > >  hw/9pfs/9p.c | 43 +++++++++++++++++++++++++++----------------
> > >  1 file changed, 27 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index 298f4e6548..e770972a71 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -1766,7 +1766,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > > 
> > >  {
> > >  
> > >      int name_idx, nwalked;
> > >      g_autofree V9fsQID *qids = NULL;
> > > 
> > > -    int i, err = 0;
> > > +    int i, err = 0, any_err = 0;
> > > 
> > >      V9fsPath dpath, path;
> > >      P9ARRAY_REF(V9fsPath) pathes = NULL;
> > >      uint16_t nwnames;
> > > 
> > > @@ -1832,19 +1832,20 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > > 
> > >       * driver code altogether inside the following block.
> > >       */
> > >      
> > >      v9fs_co_run_in_worker({
> > > 
> > > +        nwalked = 0;
> > > 
> > >          if (v9fs_request_cancelled(pdu)) {
> > > 
> > > -            err = -EINTR;
> > > +            any_err |= err = -EINTR;
> > 
> > Not super fan of such constructs but I cannot think of anything
> > better.. so be it ! :-)
> 
> Mwa, :( and I thought this was a slick (though probably yet again unorthodox) 
> way to handle aggregate errors.
> 
> [...]
> > > @@ -1874,12 +1875,12 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > > 
> > >      /*
> > >      
> > >       * Handle all the rest of this Twalk request on main thread ...
> > >       */
> > > 
> > > -    if (err < 0) {
> > > +    if ((err < 0 && !nwalked) || err == -EINTR) {
> > 
> > So this is making an exception to the spec excerpt you're mentioning
> > in the changelog.
> > 
> > EINTR can only come from the v9fs_request_cancelled(pdu) == true case,
> > since QEMU doesn't have signal handlers AFAIK. This would be the result
> > of a TFLUSH , likely to handle ^C from the client side. I guess that in
> > that peculiar case, it quite makes sense to return RERROR/RLERROR instead
> > of the "degraded" RWALK that the end user isn't waiting for. To sum up,
> > TFLUSH behavior prevails on TWALK. Please add a comment though since
> > this isn't super obvious in the spec.
> 
> Yes, everything you said is depicting this exception here precisely, and I 
> agree that it deserves a comment for further clarification, which I'll simply 
> add on my end to avoid the noise.
> 
> Does the following sound good to you?
> 
> "NOTE: -EINTR is an exception where we deviate from the protocol spec and 
> simply send an (R)Lerror response instead of bothering to assemble a 
> (deducted) Rwalk response; because -EINTR is always the result of a Tflush 
> request, so client would no longer wait for a response in this case anyway."
> 

LGTM

> > Apart from that, LGTM.
> > 
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Thanks for your reviews, much appreciated!
> 

Sorry for the 3-month delay...

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
> 
> 


