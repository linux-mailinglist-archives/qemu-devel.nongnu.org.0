Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953A30E4D7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:21:29 +0100 (CET)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PaZ-0006am-Pr
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l7PXt-0005PI-Rj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:18:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l7PXq-0001Dz-NE
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612387117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VPRUgpLWjOm+MWsXywGRRFNsh+DTUbWoJthF8dgtDv0=;
 b=NG+NV6/6yh6WgRmDKXA01st5aVExtMk17DSjlZOxspA+RWdx86qMDyHWqjKqs93yvstIJO
 nvKr3MKgV0vL6NgX7+HO+fRHQD8+ngag7XUeCpgTrT2Mf/dN3gzSLHAZqhcPk2hxpBmSJq
 XVxOvKcR6OaegOzsBB/VwTAW4LYk91o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-63zI2ckFPTKg5Xj14TEpSg-1; Wed, 03 Feb 2021 16:18:35 -0500
X-MC-Unique: 63zI2ckFPTKg5Xj14TEpSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFCE6107ACE8;
 Wed,  3 Feb 2021 21:18:34 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55F8FE179;
 Wed,  3 Feb 2021 21:18:34 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:18:33 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 04/14] qapi/introspect.py: guard against
 ifcond/comment misuse
Message-ID: <20210203211833.GA126021@habkost.net>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-5-jsnow@redhat.com>
 <874kitutv4.fsf@dusky.pond.sub.org>
 <fc2f7fd7-b212-ca3a-ef87-a05c4cd297cf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fc2f7fd7-b212-ca3a-ef87-a05c4cd297cf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 03:42:54PM -0500, John Snow wrote:
> On 2/3/21 9:08 AM, Markus Armbruster wrote:
> > John Snow <jsnow@redhat.com> writes:
> > 
> > > _tree_to_qlit is called recursively on dict values alone; at such a
> > > point in generating output it is too late to apply an ifcond. Similarly,
> > > comments do not necessarily have a "tidy" place they can be printed in
> > > such a circumstance.
> > > 
> > > Forbid this usage.
> > > 
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   scripts/qapi/introspect.py | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> > > index 4749f65ea3c..ccdf4f1c0d0 100644
> > > --- a/scripts/qapi/introspect.py
> > > +++ b/scripts/qapi/introspect.py
> > > @@ -43,6 +43,12 @@ def indent(level):
> > >           ifobj, extra = obj
> > >           ifcond = extra.get('if')
> > >           comment = extra.get('comment')
> > > +
> > > +        # NB: _tree_to_qlit is called recursively on the values of a key:value
> > > +        # pair; those values can't be decorated with comments or conditionals.
> > > +        msg = "dict values cannot have attached comments or if-conditionals."
> > > +        assert not suppress_first_indent, msg
> > > +
> > >           ret = ''
> > >           if comment:
> > >               ret += indent(level) + '/* %s */\n' % comment
> > 
> > This uses @suppress_first_indent as a proxy for "@obj is a value in a
> > dict".  Works, because we pass suppress_first_indent=True exactly
> > there.  Took me a minute to see, though.
> > 
[...]
> Anyway, this was an attempt to clear up that misunderstanding for reviewers
> less familiar with these structures, and to guard against future code in
> particular that may misunderstand it.
> 
> It isn't (to my recollection) necessary for mypy. If you want to remove it,
> I think I'd like Eduardo to sign off on that matter.

Thanks for taking it into consideration.

I like having extra comments and extra asserts on cases like this
one.  It helps us see mistakes more easily, and to identify
future opportunities for cleaning up the code.

But I don't want to delay important work because of details that
don't seem to make the code objectively worse.  So I won't argue
about this.

-- 
Eduardo


