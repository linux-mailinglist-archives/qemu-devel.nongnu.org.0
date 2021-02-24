Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF732398A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 10:34:01 +0100 (CET)
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEqYS-0006mp-Dn
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 04:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEqV8-0004nx-BU
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:30:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEqV0-0006gs-F7
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614159025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f3ZxrnD9VsT63iduo3e+4bEE4l7Lw5oeuHGCk0qLhRk=;
 b=Uqh1ODd5YTA0twO+CS1FvoYaKFanyHrFF8xVzKr7CMIf38bN0dlK7HwjKaTxqLuVnRSXNr
 qAQOkS/dv+QMuk9Ba5XrQ6ytGnY2Ft965Q2pksjY754krqh+ceC1G3L1JiS0yXf+iJgNGd
 Efvp7ZTON2lWf0tnv1VavjJfVueuXmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-WvUyZMdNNQOh8DGrlCmpAA-1; Wed, 24 Feb 2021 04:30:15 -0500
X-MC-Unique: WvUyZMdNNQOh8DGrlCmpAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB7DC6D4E8;
 Wed, 24 Feb 2021 09:30:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65E3D5D74A;
 Wed, 24 Feb 2021 09:30:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E4AC8113860F; Wed, 24 Feb 2021 10:30:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 02/16] qapi/expr.py: Check for dict instead of
 OrderedDict
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-3-jsnow@redhat.com>
Date: Wed, 24 Feb 2021 10:30:12 +0100
In-Reply-To: <20210223003408.964543-3-jsnow@redhat.com> (John Snow's message
 of "Mon, 22 Feb 2021 19:33:54 -0500")
Message-ID: <87a6rt7qzf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> OrderedDict is a subtype of dict, so we can check for a more general
> form. These functions do not themselves depend on it being any
> particular type.

True.  The actual arguments can only be OrderedDict, though.  I think we
refrained from relaxing to dict in these helpers because we felt
"staying ordered" is clearer.

We're *this* close to mooting the point, because

    Changed in version 3.7: Dictionary order is guaranteed to be
    insertion order. This behavior was an implementation detail of
    CPython from 3.6.

https://docs.python.org/3.7/library/stdtypes.html

Is messing with it necessary for later work?  If not, is it a worthwhile
improvement?

> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi/expr.py | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 35695c4c653..5694c501fa3 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -14,7 +14,6 @@
>  # This work is licensed under the terms of the GNU GPL, version 2.
>  # See the COPYING file in the top-level directory.
>  
> -from collections import OrderedDict
>  import re
>  
>  from .common import c_name
> @@ -131,7 +130,7 @@ def check_if_str(ifcond):
>  
>  
>  def normalize_members(members):
> -    if isinstance(members, OrderedDict):
> +    if isinstance(members, dict):
>          for key, arg in members.items():
>              if isinstance(arg, dict):
>                  continue
> @@ -162,7 +161,7 @@ def check_type(value, info, source,
>      if not allow_dict:
>          raise QAPISemError(info, "%s should be a type name" % source)
>  
> -    if not isinstance(value, OrderedDict):
> +    if not isinstance(value, dict):
>          raise QAPISemError(info,
>                             "%s should be an object or type name" % source)


