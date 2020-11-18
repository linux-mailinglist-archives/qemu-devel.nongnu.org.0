Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE462B80FE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:42:52 +0100 (CET)
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPbf-0002pl-SC
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfPaJ-00027I-DI
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:41:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfPaF-0004zR-1p
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:41:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605714081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9VgRxDbcLyUj/OuH+sOyoFGgtscRVSCy0AOffCxO/eU=;
 b=e6aNMs0hBpYt5YShIDzrIpz6kjSJahcxvFcD1rXLVuSNa6V2GqRmWWbOrebJ33y34PAG8P
 Cral6BiZTIl9NP52WMqilntD9vgs2e7b9/EDlOKUw8Icw5ZNc+4a3f1i7WxBc+d+c+EOGO
 MZ2/mDEQucSOE83N37HNn59QlQdESGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-xnY6nVquODyIFmFihLLT8Q-1; Wed, 18 Nov 2020 10:41:20 -0500
X-MC-Unique: xnY6nVquODyIFmFihLLT8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E90BE8144E1
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 15:41:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B88C260843;
 Wed, 18 Nov 2020 15:41:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 082E311358BA; Wed, 18 Nov 2020 16:41:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 07/16] qapi/expr.py: Add casts in a few select cases
References: <20201026213637.47087-1-jsnow@redhat.com>
 <20201026213637.47087-8-jsnow@redhat.com>
Date: Wed, 18 Nov 2020 16:41:16 +0100
In-Reply-To: <20201026213637.47087-8-jsnow@redhat.com> (John Snow's message of
 "Mon, 26 Oct 2020 17:36:28 -0400")
Message-ID: <873616isf7.fsf@dusky.pond.sub.org>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
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
> index 2654a72e8333..b8720b723377 100644
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

Suggest # check_exprs() ensures this

>      members = expr['data']
>  
>      check_type(members, info, "'data'", allow_dict=name)
> @@ -240,7 +240,7 @@ def check_struct(expr, info):
>  
>  
>  def check_union(expr, info):
> -    name = expr['union']
> +    name = cast(str, expr['union'])  # Asserted in check_exprs

Likewise.

>      base = expr.get('base')
>      discriminator = expr.get('discriminator')
>      members = expr['data']
> @@ -337,7 +337,7 @@ def check_exprs(exprs):
>          else:
>              raise QAPISemError(info, "expression is missing metatype")
>  
> -        name = expr[meta]
> +        name = cast(str, expr[meta])  # asserted right below:
>          check_name_is_str(name, info, "'%s'" % meta)

Uh, why do we need to cast then?

It's not actually "asserted".  check_name_is_str() ensures str by
raising an error if not str.

>          info.set_defn(meta, name)
>          check_defn_name_str(name, info, meta)


