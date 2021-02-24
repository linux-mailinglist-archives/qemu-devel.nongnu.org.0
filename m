Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D1C323BE6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:33:28 +0100 (CET)
Received: from localhost ([::1]:50366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtM7-0003WI-UK
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEtLH-000370-35
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:32:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEtLF-0004L6-Cp
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614169952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FbPyt8k2C5wDwRp0DZZy1GYdDQisduwvaP+ca/u6tzY=;
 b=Zg+rOGV/I3waDKGfnxTd1mLWwJOCxaDKKezRD7lip8nQX8ZYb1tmsIZMvXzyzaJC4hJT5I
 Z3iLKX2DZCPk9hCNGtSo+Sj9IMHyNggTPk/viwn0QmqN/yuPm0iC8tPxQcbXhOv/QvDHbh
 vUEeIiyrIuyUmp4oRdunMs98vDNK/gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-wYppaqb5O7azXA7OOcKcbw-1; Wed, 24 Feb 2021 07:32:30 -0500
X-MC-Unique: wYppaqb5O7azXA7OOcKcbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CD09126D;
 Wed, 24 Feb 2021 12:32:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D25E60CDE;
 Wed, 24 Feb 2021 12:32:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B2019113860F; Wed, 24 Feb 2021 13:32:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 07/16] qapi/expr.py: Add casts in a few select cases
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-8-jsnow@redhat.com>
Date: Wed, 24 Feb 2021 13:32:27 +0100
In-Reply-To: <20210223003408.964543-8-jsnow@redhat.com> (John Snow's message
 of "Mon, 22 Feb 2021 19:33:59 -0500")
Message-ID: <87zgzt1w9w.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> Casts are instructions to the type checker only, they aren't "safe" and
> should probably be avoided in general. In this case, when we perform
> type checking on a nested structure, the type of each field does not
> "stick".
>
> We don't need to assert that something is a str if we've already checked
> that it is -- use a cast instead for these cases.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi/expr.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index afa6bd07769..f45d6be1f4c 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -15,7 +15,7 @@
>  # See the COPYING file in the top-level directory.
>  
>  import re
> -from typing import MutableMapping, Optional
> +from typing import MutableMapping, Optional, cast
>  
>  from .common import c_name
>  from .error import QAPISemError
> @@ -232,7 +232,7 @@ def check_enum(expr, info):
>  
>  
>  def check_struct(expr, info):
> -    name = expr['struct']
> +    name = cast(str, expr['struct'])  # Asserted in check_exprs
>      members = expr['data']
>  

I believe you need this only so you can declare check_type()'s
allow_dict to be Optional[str].  More busy-work around allow_dict...

I'm tempted to ask for allow_dict: Any and call it a day.

>      check_type(members, info, "'data'", allow_dict=name)
> @@ -240,7 +240,7 @@ def check_struct(expr, info):
>  
>  
>  def check_union(expr, info):
> -    name = expr['union']
> +    name = cast(str, expr['union'])  # Asserted in check_exprs
>      base = expr.get('base')
>      discriminator = expr.get('discriminator')
>      members = expr['data']

Likwewise.

> @@ -337,7 +337,7 @@ def check_exprs(exprs):
>          else:
>              raise QAPISemError(info, "expression is missing metatype")
>  
> -        name = expr[meta]
> +        name = cast(str, expr[meta])  # Asserted right below:

"Checked", not "asserted".

>          check_name_is_str(name, info, "'%s'" % meta)
>          info.set_defn(meta, name)
>          check_defn_name_str(name, info, meta)


Cast before check gives me a queasy feeling.  It's lying to the type
checker.

Hamfisted way to avoid lying:

           check_name_is_str(expr[meta], ...)
           name = cast(str, expr[meta])

Something like

           name = check_name_is_str(name, ...)

might be neater, but then we'd have to find a better function name.


