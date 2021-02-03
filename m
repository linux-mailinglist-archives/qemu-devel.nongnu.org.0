Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F230E623
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 23:36:28 +0100 (CET)
Received: from localhost ([::1]:59754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ql7-0002E2-R0
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 17:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l7Q2p-0004iP-BE
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l7Q2k-0005DQ-6I
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612389029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bg0HvWctJPhmXbHQOtBu+fEPsbz5KGhLy2Y4UPHTtKI=;
 b=fV9BhTJPWWl8ryX/kEQ7L9PlPXpheGMkhISvisk+tbt9XHPJ6B/1wNfxjOuTH6SxyDrJBJ
 vMDPIpY/DEEHLAlTeY2D1Dl2u195BaabdRePhY9Au9KdDdmFcwUf43PaCC2z+uGFHt06/d
 k5vN7NPsX9ZZY3Pr2MwLfxU8xAGlbow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-ffMtswocN_OoY2NW4f7VjA-1; Wed, 03 Feb 2021 16:50:28 -0500
X-MC-Unique: ffMtswocN_OoY2NW4f7VjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40D4F15720;
 Wed,  3 Feb 2021 21:50:27 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08BC15886C;
 Wed,  3 Feb 2021 21:50:26 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:50:26 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 08/14] qapi/introspect.py: create a typed 'Annotated'
 data strutcure
Message-ID: <20210203215026.GB126021@habkost.net>
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-9-jsnow@redhat.com>
 <878s85tdh3.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <878s85tdh3.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 03:47:36PM +0100, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
> > Presently, we use a tuple to attach a dict containing annotations
> > (comments and compile-time conditionals) to a tree node. This is
> > undesirable because dicts are difficult to strongly type; promoting it
> > to a real class allows us to name the values and types of the
> > annotations we are expecting.
> >
> > In terms of typing, the Annotated<T> type serves as a generic container
> > where the annotated node's type is preserved, allowing for greater
> > specificity than we'd be able to provide without a generic.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
[...]
> > +class Annotated(Generic[_NodeT]):
> > +    """
> > +    Annotated generally contains a SchemaInfo-like type (as a dict),
> > +    But it also used to wrap comments/ifconds around scalar leaf values,
> > +    for the benefit of features and enums.
> > +    """
> > +    # Remove after 3.7 adds @dataclass:
> 
> Make this
> 
>        # TODO Remove after Python 3.7 ...
> 
> to give us a fighting chance to remember.
> 
> > +    # pylint: disable=too-few-public-methods
> > +    def __init__(self, value: _NodeT, ifcond: Iterable[str],
> > +                 comment: Optional[str] = None):
> 
> Why not simply value: _value?

Example:
  x = C(1)
  y: C[int]
  y = C('x')  # mistake

Declaring value as _NodeT does:
- Make the inferred type of x be Annotated[int].
- Catch the mistake above.

-- 
Eduardo


