Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A23323AA9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:41:57 +0100 (CET)
Received: from localhost ([::1]:42098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErcC-0004oc-Jp
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEraA-0003x6-Qx
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:39:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEra7-0003vM-Vf
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614163186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r/wtpEfKI3qHX+pZbdI68O5I5E/SSRyklOJPs285rJE=;
 b=iNYy3r6Nkxu6JIuZZyzy8PXnwr9DdyRHAPnDG3cahq5hURtFysOZgj+ICGrsTEu3IN+Ca+
 SE4PPN3i9juxE6X+CWZP3G8ENKJ381nLffGSZX1hihCMSPSo2snoIkjoh8iIjsNKTjGnJW
 fz5R7sXEj7pvqfhk547ID/nKvcYFVlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-eP0E_BMfPqSo0iRyMiAeiA-1; Wed, 24 Feb 2021 05:39:44 -0500
X-MC-Unique: eP0E_BMfPqSo0iRyMiAeiA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1A321005501;
 Wed, 24 Feb 2021 10:39:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC6A219C46;
 Wed, 24 Feb 2021 10:39:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3C32E113860F; Wed, 24 Feb 2021 11:39:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 06/16] qapi/expr.py: Check type of 'data' member
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-7-jsnow@redhat.com>
Date: Wed, 24 Feb 2021 11:39:42 +0100
In-Reply-To: <20210223003408.964543-7-jsnow@redhat.com> (John Snow's message
 of "Mon, 22 Feb 2021 19:33:58 -0500")
Message-ID: <87zgzt4ump.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

> Iterating over the members of data isn't going to work if it's not some
> form of dict anyway, but for the sake of mypy, formalize it.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  scripts/qapi/expr.py | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index c97e8ce8a4d..afa6bd07769 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -254,6 +254,9 @@ def check_union(expr, info):
>              raise QAPISemError(info, "'discriminator' requires 'base'")
>          check_name_is_str(discriminator, info, "'discriminator'")
>  
> +    if not isinstance(members, dict):
> +        raise QAPISemError(info, "'data' must be an object")
> +
>      for (key, value) in members.items():
>          source = "'data' member '%s'" % key
>          check_name_str(key, info, source)
> @@ -267,6 +270,10 @@ def check_alternate(expr, info):
>  
>      if not members:
>          raise QAPISemError(info, "'data' must not be empty")
> +
> +    if not isinstance(members, dict):
> +        raise QAPISemError(info, "'data' must be an object")
> +
>      for (key, value) in members.items():
>          source = "'data' member '%s'" % key
>          check_name_str(key, info, source)

All errors require a negative test.

If an error is unreachable, it should be an assertion instead.

If these new errors are reachable, the commit might be a bug fix.


