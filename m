Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF544BBE68
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 00:25:39 +0200 (CEST)
Received: from localhost ([::1]:36472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCWm2-0007Jw-Vu
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 18:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58843)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peff@peff.net>) id 1iCWkm-0006gh-Ad
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 18:24:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peff@peff.net>) id 1iCWkl-0004Zp-1g
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 18:24:20 -0400
Received: from cloud.peff.net ([104.130.231.41]:49134)
 by eggs.gnu.org with smtp (Exim 4.71) (envelope-from <peff@peff.net>)
 id 1iCWkj-0004Yb-0s
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 18:24:18 -0400
Received: (qmail 30872 invoked by uid 109); 23 Sep 2019 22:24:16 -0000
Received: from Unknown (HELO peff.net) (10.0.1.2)
 by cloud.peff.net (qpsmtpd/0.94) with SMTP; Mon, 23 Sep 2019 22:24:16 +0000
Authentication-Results: cloud.peff.net; auth=none
Received: (qmail 4891 invoked by uid 111); 23 Sep 2019 22:26:37 -0000
Received: from sigill.intra.peff.net (HELO sigill.intra.peff.net) (10.0.0.7)
 by peff.net (qpsmtpd/0.94) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPS;
 Mon, 23 Sep 2019 18:26:37 -0400
Authentication-Results: peff.net; auth=none
Date: Mon, 23 Sep 2019 18:24:15 -0400
From: Jeff King <peff@peff.net>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [Qemu-devel] [PATCH v6 0/4] 9p: Fix file ID collisions
Message-ID: <20190923222415.GA22495@sigill.intra.peff.net>
References: <cover.1566503584.git.qemu_oss@crudebyte.com>
 <305577c2-709a-b632-4056-6582771176ac@redhat.com>
 <20190909142511.GA20726@sigill.intra.peff.net>
 <56046367.TiUlWITyhT@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56046367.TiUlWITyhT@silver>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 104.130.231.41
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
Cc: berrange@redhat.com, stefanha@gmail.com, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, git@vger.kernel.org, antonios.motakis@huawei.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 23, 2019 at 01:19:18PM +0200, Christian Schoenebeck wrote:

> >  	if (cmit_fmt_is_mail(pp->fmt)) {
> > -		if (pp->from_ident && ident_cmp(pp->from_ident, &ident)) {
> > +		if (pp->always_use_in_body_from ||
> > +		    (pp->from_ident && ident_cmp(pp->from_ident, &ident))) {
> >  			struct strbuf buf = STRBUF_INIT;
> > 
> >  			strbuf_addstr(&buf, "From: ");
> > 
> > but most of the work would be ferrying that option from the command line
> > down to the pretty-print code.
> > 
> > That would work in conjunction with "--from" to avoid a duplicate. It
> > might require send-email learning about the option to avoid doing its
> > own in-body-from management. If you only care about send-email, it might
> > be easier to just add the option there.
> 
> Would it simplify the changes in git if that would be made a
> "git config [--global]" setting only? That is, would that probably simplify 
> that task to one simple function call there in pretty.c?

I think a config option would make sense, but we generally try to avoid
adding a config option that doesn't have a matching command-line option.

I also think saving implementation work there is orthogonal. You can as
easily make a global "always_use_in_body_from" as you can call a global
config_get_bool("format-patch.always_use_in_body_from"). :)

And anyway, it's not _that_ much work to pass it around. At least as
much would go into writing documentation and tests. One of the reasons I
left the patch above as a sketch is that I'm not 100% convinced this is
a useful feature. Somebody caring enough about it to make a real patch
would send a signal there.

> On the other hand, considering the already existing --from argument and 
> "format.from" config option:
> https://git-scm.com/docs/git-config#Documentation/git-config.txt-formatfrom
> 
> Wouldn't it make sense to just drop the currently existing sender != author 
> string comparison in git and simply always add the "From:" line to the email's 
> body if "format.from yes" is used, instead of introducing a suggested 2nd 
> (e.g. "always-from") option? I mean sure automatically removing redundant 
> information in the generated emails if sender == author sounds nice on first 
> thought, but does it address anything useful in practice to justify 
> introduction of a 2nd related option?

Yes, the resulting mail would be correct, in the sense that it could be
applied just fine by git-am. But I think it would be uglier. IOW, I
consider the presence of the in-body From to be a clue that something
interesting is going on (like forwarding somebody else's patch). So from
my perspective, it would just be useless noise. Other communities may
have different opinions, though (I think I have seen some kernel folks
always including all of the possible in-body headers, including Date).
But it seems like it makes sense to keep both possibilities.

-Peff

