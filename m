Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EEC5ECCC2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 21:18:30 +0200 (CEST)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odG67-00048z-It
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 15:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1odFzg-0007sC-Rp; Tue, 27 Sep 2022 15:11:51 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:49707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1odFzf-0001IO-9T; Tue, 27 Sep 2022 15:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Pzsc0eOp89LfYHRSWOiIums0ZByaWn4gdCHMpBSyFaY=; b=Po4LCp+i2DACdg7zsQSrJXELhl
 DGBtLGejmQZ8Cg/bqVyVusTzEraQEsIZXEqwHCA8PMH1k+teKw0E5jvtR9U0Sf3kWqhU4XZkxjDmB
 48iQWwYI6DovKLn27pZyvbxUZF1mDyEWnegwirwKpOEmBf971dlS8Il0d2E5QQ4PAxvmKxkN2bGos
 0vpvRjy1nzimzpI6rCdfqBUbX82GaT3y8Q2PXP2Fzc++Vsc+gbipPdGEGyTzWGNZvJpBkBPOkTMMw
 utYHN21gWSa3G5/dHW44y2kdJZ81k4bfbfY0Xy3TTp9kO3tQ0eHgH90srx+8DwMCcgwRldkYao9Mk
 IkLPwF/Z+4TnbXowTSOS/VwWm7BuPAp/crp9sa/blLSVQEwOawKkpk3JO5hZMGUvxL6ut6gI7tULb
 OOrz+UzI2Mdmi1bVdKfmPsAlV2KAGha98C2/tA1ihQW/5phr3IAahwSV6KfDlrI7kvhPegEk674Ke
 VnY/Iwn7sO4QpT/1pQFu8Wx3Bo22GM6xpt6VxjMuN5xBwUoFciNnXRxbyrOR+LWOxjwLAQCvYv1sq
 JuHJHOdYXH8KG2WYtG1Bc+zrg58KVA75AGn/jxAYP37BnKske/wyV1VHSILRWSVppvo8MrrI4Vpeo
 E0jlrLTrqXclbxtkW6TqQZY6C7ik9XXH6pp9kfAPI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Qemu-block <qemu-block@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Linus Heckemann <git@sphalerite.org>
Subject: Re: [PATCH v5] 9pfs: use GHashTable for fid table
Date: Tue, 27 Sep 2022 21:10:52 +0200
Message-ID: <7301097.N5VPtqMtvv@silver>
In-Reply-To: <ygasfkcx30u.fsf@localhost>
References: <20220927142503.1694674-1-git@sphalerite.org>
 <ygasfkcx30u.fsf@localhost>
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

On Dienstag, 27. September 2022 17:14:57 CEST Linus Heckemann wrote:
> Linus Heckemann <git@sphalerite.org> writes:
> >  static void coroutine_fn virtfs_reset(V9fsPDU *pdu)
> >  {
> >  
> >      V9fsState *s = pdu->s;
> >      V9fsFidState *fidp;
> > 
> > +    GList *freeing;
> > +    /* Get a list of all the values (fid states) in the table, which we
> > then... */ +    g_autoptr(GList) fids = g_hash_table_get_values(s->fids);
> > 
> > -    /* Free all fids */
> > -    while (!QSIMPLEQ_EMPTY(&s->fid_list)) {
> > -        /* Get fid */
> > -        fidp = QSIMPLEQ_FIRST(&s->fid_list);
> > -        fidp->ref++;
> > +    /* ... remove from the table, taking over ownership. */
> > +    g_hash_table_steal_all(s->fids);
> > 
> > -        /* Clunk fid */
> > -        QSIMPLEQ_REMOVE(&s->fid_list, fidp, V9fsFidState, next);
> > +    /*
> > +     * This allows us to release our references to them asynchronously
> > without +     * iterating over the hash table and risking iterator
> > invalidation +     * through concurrent modifications.
> > +     */
> > +    for (freeing = fids; freeing; freeing = freeing->next) {
> > +        fidp = freeing->data;
> > +        fidp->ref++;
> > 
> >          fidp->clunked = true;
> > 
> > -
> > 
> >          put_fid(pdu, fidp);
> >      
> >      }
> >  
> >  }
> 
> I'm not sure if this implementation is correct. I'm concerned that it
> may result in dangling references, but haven't been able to find a
> client that will send the TVERSION request on a connection that's
> already been used in other ways, as opposed to when the connection is
> first established. I suspect this will be very rare in general, so it
> might be good to have a test case somewhere.

Always welcome! :)
https://wiki.qemu.org/Documentation/9p#Test_Cases

If you do, then please add the test as a separate patch.

Best regards,
Christian Schoenebeck



