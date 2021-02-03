Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A830DD12
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:41:54 +0100 (CET)
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JLt-0007ER-TS
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7JBA-0004Da-5c
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:30:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7JB8-00037u-Ai
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612362645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KzXVeWGHPyuxLDxLGS7jFat1Y9XqgfPUa2pok7YXQ68=;
 b=EIz64CDIUc7JUWIo0VUQiqZ+WqlK6dYY1vF+19QzyDiX+Y/Xm65NIOEJP6BHKNiEyylZH2
 Q9KAqR10zBshxRsngDsIyTAQVBmjFejk6e0g5eQoM3ovcvg4X8ubtVVgSfUjGsmRfEqtS/
 qw6Q+flke3wQv6lpHuyqG0Bu9f5HglM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-0nIvyhBgOiytRs_EJRDh4Q-1; Wed, 03 Feb 2021 09:30:44 -0500
X-MC-Unique: 0nIvyhBgOiytRs_EJRDh4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5E8DC73A5;
 Wed,  3 Feb 2021 14:30:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B69F65D6A8;
 Wed,  3 Feb 2021 14:30:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 49C9E113865F; Wed,  3 Feb 2021 15:30:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 07/14] qapi/introspect.py: Introduce preliminary tree
 typing
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-8-jsnow@redhat.com>
Date: Wed, 03 Feb 2021 15:30:41 +0100
In-Reply-To: <20210202174651.2274166-8-jsnow@redhat.com> (John Snow's message
 of "Tue, 2 Feb 2021 12:46:44 -0500")
Message-ID: <87im79te9a.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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

> The types will be used in forthcoming patches to add typing. These types
> describe the layout and structure of the objects passed to
> _tree_to_qlit, but lack the power to describe annotations until the next
> commit.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 0aa3b77109f..b82efe16f6e 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -10,7 +10,13 @@
>  See the COPYING file in the top-level directory.
>  """
>  
> -from typing import Optional
> +from typing import (
> +    Any,
> +    Dict,
> +    List,
> +    Optional,
> +    Union,
> +)
>  
>  from .common import (
>      c_name,
> @@ -26,6 +32,28 @@
>  )
>  
>  
> +# This module constructs a tree data structure that is used to
> +# generate the introspection information for QEMU. It behaves similarly
> +# to a JSON value.
> +#
> +# A complexity over JSON is that our values may or may not be annotated.
> +#
> +# Un-annotated values may be:
> +#     Scalar: str, bool, None.
> +#     Non-scalar: List, Dict
> +# _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
> +#
> +# With optional annotations, the type of all values is:
> +# TreeValue = Union[_value, Annotated[_value]]
> +#
> +# Sadly, mypy does not support recursive types, so we must approximate this.
> +_stub = Any
> +_scalar = Union[str, bool, None]
> +_nonscalar = Union[Dict[str, _stub], List[_stub]]
> +_value = Union[_scalar, _nonscalar]
> +# TreeValue = Union[_value, 'Annotated[_value]']

Why is TreeValue commented out?  Oh, because Annotated doesn't exist,
yet.

Possibly less confusing:

   # A complexity over JSON is that our values may or may not be annotated.
   #
   # Un-annotated values may be:
   #     Scalar: str, bool, None.
   #     Non-scalar: List, Dict
   # _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
   #
   # With optional annotations, the type of all values is:
   # TODO
   #
   # Sadly, mypy does not support recursive types, so we must approximate this.
   _stub = Any
   _scalar = Union[str, bool, None]
   _nonscalar = Union[Dict[str, _stub], List[_stub]]
   _value = Union[_scalar, _nonscalar]

or even just

   # A complexity over JSON is that our values may or may not be annotated.
   #
   # Un-annotated values may be:
   #     Scalar: str, bool, None.
   #     Non-scalar: List, Dict
   # _value = Union[str, bool, None, Dict[str, TreeValue], List[TreeValue]]
   #
   # Sadly, mypy does not support recursive types, so we must approximate this.
   _stub = Any
   _scalar = Union[str, bool, None]
   _nonscalar = Union[Dict[str, _stub], List[_stub]]
   _value = Union[_scalar, _nonscalar]

> +
> +
>  def _make_tree(obj, ifcond, comment=None):
>      extra = {
>          'if': ifcond,


