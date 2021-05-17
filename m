Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E7E382D29
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:17:31 +0200 (CEST)
Received: from localhost ([::1]:45062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lid7i-0004SN-BI
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lid4w-0003Bh-4y
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:14:38 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:42105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lid4u-0000ED-0N
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=G8EpdzRQ77gE/lfuIDT/HVcG1gjQ3QS3H4WqIit+Ooo=; b=LZAVYhjnA41TVfLGmEwVHNGU5m
 YqH31Hmfxmh9lYcMNftyCDuS/zhZ1i5viUE6YhdeGQtxOtytkoZRBYAR/f1XwirldYorbrg+I3BLa
 ekO11+WOahsB8KDNE00uAurXFGN77Bz1sqimlkdQCkqPRmVQFk48Z0KnS3HxNo5Ioot0sgKvOrTA+
 xj9icwlaekLcdvIOrJis9aUm6bCdJmCQuIK3yWOMeoHcGLleoXN1GA8ZjwpXN1HymsbVVeGDI4YDY
 tV78avLA7pVz3ze7HnFXYMWdvtBWJNgNRvFRZ+Rmh6CZEHahRIt/23pDaBewBRSMAuKV3RvYX5+in
 ozQz7Y5+R08WbkN7zTu2tF4LrAF93HQOO6Fzo1bh6j4v9omfTGYCMd3lgwlxYhx+wYiWCZNPJ3Vgo
 E2z1X4g7CpSfC7yFp4Vg5504c3y08W1+QiFw3ofHFBh63W2tl7I5UcqIznpY82INEfrEjQSXtdlD5
 u65Vy7HAjRFBDXYckqxWSP+7eRs73V+gA2GHJXa4rkn4XHRTaA/DgOr5GdomdFEDf4QK1/G2ezakO
 w4il14EPSpzaNmdezSWLIZs9d05K0hIidzP+tu89m3nDzzhdaOuHirx2MqPyGuZXT+Y2xrpMhlyv9
 VZT5bgf3tQxkRBMzNqvIWjyEz4IOpI5XJCtWEFNbM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: simplify v9fs_walk()
Date: Mon, 17 May 2021 15:14:23 +0200
Message-ID: <81064612.2HtOhVY35N@silver>
In-Reply-To: <20210517133509.05d1f4f9@bahia.lan>
References: <E1liKiz-0006BC-Ja@lizzy.crudebyte.com>
 <20210517133509.05d1f4f9@bahia.lan>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 17. Mai 2021 13:35:09 CEST Greg Kurz wrote:
> On Sun, 16 May 2021 17:55:34 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > There is only one comparison between nwnames and P9_MAXWELEM required.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> 
> Nice catch. It's been there for a decade :)
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Now that was a quick response! Queued, thanks!

https://github.com/cschoenebeck/qemu/commits/9p.next

> 
> >  hw/9pfs/9p.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 0fa776af09..89aa07db78 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1739,7 +1739,11 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > 
> >      trace_v9fs_walk(pdu->tag, pdu->id, fid, newfid, nwnames);
> > 
> > -    if (nwnames && nwnames <= P9_MAXWELEM) {
> > +    if (nwnames > P9_MAXWELEM) {
> > +        err = -EINVAL;
> > +        goto out_nofid;
> > +    }
> > +    if (nwnames) {
> > 
> >          wnames = g_new0(V9fsString, nwnames);
> >          qids   = g_new0(V9fsQID, nwnames);
> >          for (i = 0; i < nwnames; i++) {
> > 
> > @@ -1753,9 +1757,6 @@ static void coroutine_fn v9fs_walk(void *opaque)
> > 
> >              }
> >              offset += err;
> >          
> >          }
> > 
> > -    } else if (nwnames > P9_MAXWELEM) {
> > -        err = -EINVAL;
> > -        goto out_nofid;
> > 
> >      }
> >      fidp = get_fid(pdu, fid);
> >      if (fidp == NULL) {



