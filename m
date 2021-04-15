Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFB93602A2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 08:47:11 +0200 (CEST)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWvmQ-0001zG-5G
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 02:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWvkX-0001RB-Ai
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 02:45:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWvkT-0001ue-7i
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 02:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618469107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jSPHUywHVT+XFbCa0uo/qwalvan/jMhU/eieLHW7k7g=;
 b=ZKTXUFtTcGUXqIjgI3zMTafwfIsyWkwXjL+nDi9IbXCrSWBJz4HsrCoWmTB55j5n82CdA/
 UN9x4i4CaFXWg3ZOEBxDzpthO/6buHGgu6F0KU0qiHmRQnRAB4ZvY5oDf4poLtu7dxKCkK
 qvxolw7lJvGkIksc8ohuZt5JUMiTyfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-l8lAosBTNJSUFF20QpVvQw-1; Thu, 15 Apr 2021 02:45:02 -0400
X-MC-Unique: l8lAosBTNJSUFF20QpVvQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CC90107ACCA;
 Thu, 15 Apr 2021 06:45:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3472D6062F;
 Thu, 15 Apr 2021 06:44:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B1693113525D; Thu, 15 Apr 2021 08:44:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/8] qapi/error: Repurpose QAPIError as a generic
 exception base class
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-2-jsnow@redhat.com>
Date: Thu, 15 Apr 2021 08:44:57 +0200
In-Reply-To: <20210330171844.1197918-2-jsnow@redhat.com> (John Snow's message
 of "Tue, 30 Mar 2021 13:18:37 -0400")
Message-ID: <87mtu0gi6u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Rename QAPIError to QAPISourceError, and then create a new QAPIError
> class that serves as the basis for all of our other custom exceptions.

Isn't the existing QAPIError such a base class already?  Peeking
ahead...  aha, your new base class is abstract.  Can you explain why we
that's useful?

> Add docstrings to explain the intended function of each error class.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/sphinx/qapidoc.py |  3 ++-
>  scripts/qapi/error.py  | 11 +++++++++--
>  scripts/qapi/schema.py |  5 +++--
>  3 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index b7b86b5dff..458b1f477e 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -34,7 +34,8 @@
>  from sphinx.util.nodes import nested_parse_with_titles
>  import sphinx
>  from qapi.gen import QAPISchemaVisitor
> -from qapi.schema import QAPIError, QAPISemError, QAPISchema
> +from qapi.error import QAPIError, QAPISemError
> +from qapi.schema import QAPISchema
>  
>  
>  # Sphinx up to 1.6 uses AutodocReporter; 1.7 and later
> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
> index ae60d9e2fe..126dda7c9b 100644
> --- a/scripts/qapi/error.py
> +++ b/scripts/qapi/error.py
> @@ -13,6 +13,11 @@
>  
>  
>  class QAPIError(Exception):
> +    """Base class for all exceptions from the QAPI package."""
> +
> +
> +class QAPISourceError(QAPIError):
> +    """Error class for all exceptions identifying a source location."""
>      def __init__(self, info, col, msg):
>          Exception.__init__(self)
>          self.info = info
> @@ -27,7 +32,8 @@ def __str__(self):
>          return loc + ': ' + self.msg
>  
>  
> -class QAPIParseError(QAPIError):
> +class QAPIParseError(QAPISourceError):
> +    """Error class for all QAPI schema parsing errors."""
>      def __init__(self, parser, msg):
>          col = 1
>          for ch in parser.src[parser.line_pos:parser.pos]:
> @@ -38,6 +44,7 @@ def __init__(self, parser, msg):
>          super().__init__(parser.info, col, msg)
>  
>  
> -class QAPISemError(QAPIError):
> +class QAPISemError(QAPISourceError):
> +    """Error class for semantic QAPI errors."""
>      def __init__(self, info, msg):
>          super().__init__(info, None, msg)
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 01cdd753cd..1849c3e45f 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -20,7 +20,7 @@
>  from typing import Optional
>  
>  from .common import POINTER_SUFFIX, c_name
> -from .error import QAPIError, QAPISemError
> +from .error import QAPISemError, QAPISourceError
>  from .expr import check_exprs
>  from .parser import QAPISchemaParser
>  
> @@ -878,7 +878,8 @@ def _def_entity(self, ent):
>          other_ent = self._entity_dict.get(ent.name)
>          if other_ent:
>              if other_ent.info:
> -                where = QAPIError(other_ent.info, None, "previous definition")
> +                where = QAPISourceError(other_ent.info, None,
> +                                        "previous definition")
>                  raise QAPISemError(
>                      ent.info,
>                      "'%s' is already defined\n%s" % (ent.name, where))


