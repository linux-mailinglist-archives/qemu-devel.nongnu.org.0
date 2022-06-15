Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFFD54CEE4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:41:37 +0200 (CEST)
Received: from localhost ([::1]:35456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1W5I-00033G-9u
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1o1W0j-0000qa-HJ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:36:53 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:58329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1o1W0h-0004ZU-FX
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=4rgjD+B9AkaMv/+FHTB92MJ6L2I4qTqZKLt2wQt1amU=; b=FAXWsDr+FM8RTp+wJgSo+3+j1N
 lW8GDVBg0jvnGGrR46lUVvsGCvyX1DQ7ef3xo9exHQN370g7c8RrRULtG3sHXlXjlgbVEpqzGUM75
 iFyILjGhX6V8wPQgiOItrYccvWVKTA8sFAn2kvrGQ+L7pVC2s6t9j2tXz9ZOd32mfnLbtY4UyXiOn
 ZpJhV+nyuDsPlVcoC0fHONAFPG62+kEuZ5cKKH/UCTN3zpbP3Yo3o7lUnxsSL/JtMZ1nriWcddV0N
 zz1pQc/vivvtLcJCetVA1JzWxo+AIGNi0BP+eL6FiJVuNkIsY7S6k26OkykKiGU2SYGYuJUdOotlo
 qlaJIsv5dgwypUELzHCcZlpxOs+0fhneuQPZivkrFsLMo9Is0zZ01vt8+dEfejrlb/x0IbiwjEfkL
 XgrImL1NVeqApDmrWsV1SbbKZ1M7zNlMk1B6gUb8yKTfnCy7ciWioQt30jwJbJJru5SCDvpygiIc4
 6uR8SA6gubasuQS2mmuNuChKQgKKYAk26tmWHW0RuWQm4sf3NoRC3EIHpso7ckGBgcWois4glAOZN
 HgCRY+3FxJxEunP3uGgfW78eLkzfyEGB/fnvADfC0WsXOv+jO+Kv8AZbXI6QpZDV7iiJO7QY2InDZ
 gphvOvDqoLVl81JOIqGpTobMexE2Zcpy64RsdJJP0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 5/7] 9pfs: fix 'Twalk' to only send error if no
 component walked
Date: Wed, 15 Jun 2022 18:36:46 +0200
Message-ID: <9146815.PM5Uiz2McI@silver>
In-Reply-To: <20220615175249.21c497f3@bahia>
References: <cover.1647339025.git.qemu_oss@crudebyte.com>
 <bc73e24258a75dc29458024c7936c8a036c3eac5.1647339025.git.qemu_oss@crudebyte.com>
 <20220615175249.21c497f3@bahia>
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

On Mittwoch, 15. Juni 2022 17:52:49 CEST Greg Kurz wrote:
> On Tue, 15 Mar 2022 11:08:39 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Current implementation of 'Twalk' request handling always sends an
> > 'Rerror'
> > 
> > response if any error occured. The 9p2000 protocol spec says though:
> >   "
> >   If the first element cannot be walked for any reason, Rerror is
> >   returned.
> >   Otherwise, the walk will return an Rwalk message containing nwqid qids
> >   corresponding, in order, to the files that are visited by the nwqid
> >   successful elementwise walks; nwqid is therefore either nwname or the
> >   index
> >   of the first elementwise walk that failed.
> >   "
> >   
> >   http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor33
> > 
> > For that reason we are no longer leaving from an error path in function
> > v9fs_walk(), unless really no path component could be walked successfully
> > or if the request has been interrupted.
> > 
> > Local variable 'nwalked' counts and reflects the number of path components
> > successfully processed by background I/O thread, whereas local variable
> > 'name_idx' subsequently counts and reflects the number of path components
> > eventually accepted successfully by 9p server controller portion.
> > 
> > New local variable 'any_err' is an aggregate variable reflecting whether
> > any error occurred at all, while already existing variable 'err' only
> > reflects the last error.
> > 
> > Despite QIDs being delivered to client in a more relaxed way now, it is
> > important to note though that fid still must remain unaffected if any
> > error
> > occurred.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  hw/9pfs/9p.c | 43 +++++++++++++++++++++++++++----------------
> >  1 file changed, 27 insertions(+), 16 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 298f4e6548..e770972a71 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1766,7 +1766,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > 
> >  {
> >  
> >      int name_idx, nwalked;
> >      g_autofree V9fsQID *qids = NULL;
> > 
> > -    int i, err = 0;
> > +    int i, err = 0, any_err = 0;
> > 
> >      V9fsPath dpath, path;
> >      P9ARRAY_REF(V9fsPath) pathes = NULL;
> >      uint16_t nwnames;
> > 
> > @@ -1832,19 +1832,20 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > 
> >       * driver code altogether inside the following block.
> >       */
> >      
> >      v9fs_co_run_in_worker({
> > 
> > +        nwalked = 0;
> > 
> >          if (v9fs_request_cancelled(pdu)) {
> > 
> > -            err = -EINTR;
> > +            any_err |= err = -EINTR;
> 
> Not super fan of such constructs but I cannot think of anything
> better.. so be it ! :-)

Mwa, :( and I thought this was a slick (though probably yet again unorthodox) 
way to handle aggregate errors.

[...]
> > @@ -1874,12 +1875,12 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > 
> >      /*
> >      
> >       * Handle all the rest of this Twalk request on main thread ...
> >       */
> > 
> > -    if (err < 0) {
> > +    if ((err < 0 && !nwalked) || err == -EINTR) {
> 
> So this is making an exception to the spec excerpt you're mentioning
> in the changelog.
> 
> EINTR can only come from the v9fs_request_cancelled(pdu) == true case,
> since QEMU doesn't have signal handlers AFAIK. This would be the result
> of a TFLUSH , likely to handle ^C from the client side. I guess that in
> that peculiar case, it quite makes sense to return RERROR/RLERROR instead
> of the "degraded" RWALK that the end user isn't waiting for. To sum up,
> TFLUSH behavior prevails on TWALK. Please add a comment though since
> this isn't super obvious in the spec.

Yes, everything you said is depicting this exception here precisely, and I 
agree that it deserves a comment for further clarification, which I'll simply 
add on my end to avoid the noise.

Does the following sound good to you?

"NOTE: -EINTR is an exception where we deviate from the protocol spec and 
simply send an (R)Lerror response instead of bothering to assemble a 
(deducted) Rwalk response; because -EINTR is always the result of a Tflush 
request, so client would no longer wait for a response in this case anyway."

> Apart from that, LGTM.
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks for your reviews, much appreciated!

Best regards,
Christian Schoenebeck



