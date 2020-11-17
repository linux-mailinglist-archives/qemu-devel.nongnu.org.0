Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07E92B6CA1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 19:10:45 +0100 (CET)
Received: from localhost ([::1]:32832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf5RD-00048E-GA
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 13:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kf5PT-0003Vw-Uh
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:08:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kf5PQ-0001a2-Oy
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 13:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605636531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FBLzXN81evM9ILLNKH0X4ILZBfVFClZD7ZlCYqRfydM=;
 b=RC1oUYGTVW4DpDXJUB+Z5gY1tQvm1VdfwBzSHPZotrtRNHfKPkQ5YiGPuNR8VphbfqtLzh
 fjkpa8IgPCntR65qN5zr4WnC2HD5JMk2uMsZdtUFKs9aCAKmqu3N9wxW3J7akbzCubmn80
 DSlCXLj/Ls6cFYcszsTe/g5fkyZz6FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-InLd1_auMN6JcqxB43K43w-1; Tue, 17 Nov 2020 13:08:49 -0500
X-MC-Unique: InLd1_auMN6JcqxB43K43w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D638159
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 18:08:48 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7943B19930;
 Tue, 17 Nov 2020 18:08:48 +0000 (UTC)
Date: Tue, 17 Nov 2020 13:08:47 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 02/16] qapi/expr.py: Check for dict instead of
 OrderedDict
Message-ID: <20201117180847.GI1235237@habkost.net>
References: <20201026213637.47087-1-jsnow@redhat.com>
 <20201026213637.47087-3-jsnow@redhat.com>
 <87y2j0q73n.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y2j0q73n.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 05:30:04PM +0100, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
> > OrderedDict is a subtype of dict, so we can check for a more general form.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> > Reviewed-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  scripts/qapi/expr.py | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> > index 35695c4c653b..5694c501fa38 100644
> > --- a/scripts/qapi/expr.py
> > +++ b/scripts/qapi/expr.py
> > @@ -14,7 +14,6 @@
> >  # This work is licensed under the terms of the GNU GPL, version 2.
> >  # See the COPYING file in the top-level directory.
> >  
> > -from collections import OrderedDict
> >  import re
> >  
> >  from .common import c_name
> > @@ -131,7 +130,7 @@ def check_if_str(ifcond):
> >  
> >  
> >  def normalize_members(members):
> > -    if isinstance(members, OrderedDict):
> > +    if isinstance(members, dict):
> >          for key, arg in members.items():
> >              if isinstance(arg, dict):
> >                  continue
> > @@ -162,7 +161,7 @@ def check_type(value, info, source,
> >      if not allow_dict:
> >          raise QAPISemError(info, "%s should be a type name" % source)
> >  
> > -    if not isinstance(value, OrderedDict):
> > +    if not isinstance(value, dict):
> >          raise QAPISemError(info,
> >                             "%s should be an object or type name" % source)
> 
> Plain dict remembers insertion order since Python 3.6, but it wasn't
> formally promised until 3.7.  
> 
> Can we simply ditch OrderedDict entirely?

In theory, our build requirement is "Python >= 3.6", not
"CPython >= 3.6".  In practice, I don't expect anybody to ever
use any other Python implementation except CPython to build QEMU.

I think we can get rid of OrderedDict if you really want to.

-- 
Eduardo


