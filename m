Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1508E3493FE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:27:57 +0100 (CET)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQxo-0000oV-3l
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPQwH-0007ug-WF
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPQwE-0007rj-Bg
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616682377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=78ZwTTlDO6F/8dB94TMrthM5ILoBImy0wmvfQXBeXV4=;
 b=VDvsfrvW4i69bxKrFikYdLCBSCI4MbORtx2Z1oxceyXeNAAeVzuhrcbK4+hNATP0XN+uZ8
 SD4ogH/r1ACIn9RD4G4rqCUNMDGMCzq/IxmiflRbaEht4IhvUyxKHcDKL0RO+lyXgpdXv9
 ML0J0dMp7T61cHbpHeamX/0PcoV73l4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-Eka8OTofMOeTeZsQlzlKPg-1; Thu, 25 Mar 2021 10:26:15 -0400
X-MC-Unique: Eka8OTofMOeTeZsQlzlKPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25A26801817;
 Thu, 25 Mar 2021 14:26:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9EC160C17;
 Thu, 25 Mar 2021 14:26:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7EC5F11327E1; Thu, 25 Mar 2021 15:26:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 09/19] qapi/expr.py: Check type of 'data' member
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-10-jsnow@redhat.com>
Date: Thu, 25 Mar 2021 15:26:12 +0100
In-Reply-To: <20210325060356.4040114-10-jsnow@redhat.com> (John Snow's message
 of "Thu, 25 Mar 2021 02:03:46 -0400")
Message-ID: <87r1k3s41n.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Suggest

    qapi/expr.py: Check type of union and alternate 'data' member

John Snow <jsnow@redhat.com> writes:

> We don't actually check, so the user can get some unpleasant stacktraces.

Let's point to the new tests here.

> Formalize it.

Huh?

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py                              | 7 +++++++
>  tests/qapi-schema/alternate-invalid-data-type.err | 2 ++
>  tests/qapi-schema/union-invalid-data-type.err     | 2 ++
>  3 files changed, 11 insertions(+)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 73e7d8cb0d..ca5ab7bfda 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -281,6 +281,9 @@ def check_union(expr, info):
>              raise QAPISemError(info, "'discriminator' requires 'base'")
>          check_name_is_str(discriminator, info, "'discriminator'")
>  
> +    if not isinstance(members, dict):
> +        raise QAPISemError(info, "'data' must be an object")
> +
>      for (key, value) in members.items():
>          source = "'data' member '%s'" % key
>          if discriminator is None:
> @@ -296,6 +299,10 @@ def check_alternate(expr, info):
>  
>      if not members:
>          raise QAPISemError(info, "'data' must not be empty")
> +
> +    if not isinstance(members, dict):
> +        raise QAPISemError(info, "'data' must be an object")
> +
>      for (key, value) in members.items():
>          source = "'data' member '%s'" % key
>          check_name_lower(key, info, source)
> diff --git a/tests/qapi-schema/alternate-invalid-data-type.err b/tests/qapi-schema/alternate-invalid-data-type.err
> index e69de29bb2..c7301ccb00 100644
> --- a/tests/qapi-schema/alternate-invalid-data-type.err
> +++ b/tests/qapi-schema/alternate-invalid-data-type.err
> @@ -0,0 +1,2 @@
> +alternate-invalid-data-type.json: In alternate 'Alt':
> +alternate-invalid-data-type.json:2: 'data' must be an object
> diff --git a/tests/qapi-schema/union-invalid-data-type.err b/tests/qapi-schema/union-invalid-data-type.err
> index e69de29bb2..b71c3400c5 100644
> --- a/tests/qapi-schema/union-invalid-data-type.err
> +++ b/tests/qapi-schema/union-invalid-data-type.err
> @@ -0,0 +1,2 @@
> +union-invalid-data-type.json: In union 'TestUnion':
> +union-invalid-data-type.json:9: 'data' must be an object


