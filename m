Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980A3323AA1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:37:41 +0100 (CET)
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErY4-0002tB-Lj
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lErWZ-0002RF-50
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:36:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lErWX-0002Cj-Hm
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614162964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4lOGmh+6QeYCIMLXiEx2KpMBjEjVIFRa2yg6Y5mdTu4=;
 b=StQbY9Ra4QHkI9L7KjGdpoXqXYz4COUyYXzIfJyZKaz+TQOITgOfSrWmsbYp8RtWXPbllK
 QIG/WSXfxD08/K0bRvwvX31RhSHVhDJUVzppPCRR+3HIrOMNo25Vrrsf8wiP+fQOQzto6a
 OW80b/gSmRRJz5ChmQad8qmmJOcWQxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-TR5Y0jEjP2mBnQ6CFrH1og-1; Wed, 24 Feb 2021 05:35:57 -0500
X-MC-Unique: TR5Y0jEjP2mBnQ6CFrH1og-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C42CD801965;
 Wed, 24 Feb 2021 10:35:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94D935D9D0;
 Wed, 24 Feb 2021 10:35:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 24D83113860F; Wed, 24 Feb 2021 11:35:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 04/16] qapi/expr.py: Add assertion for union type
 'check_dict'
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-5-jsnow@redhat.com>
Date: Wed, 24 Feb 2021 11:35:55 +0100
In-Reply-To: <20210223003408.964543-5-jsnow@redhat.com> (John Snow's message
 of "Mon, 22 Feb 2021 19:33:56 -0500")
Message-ID: <874ki169dg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

> mypy isn't fond of allowing you to check for bool membership in a
> collection of str elements. Guard this lookup for precisely when we were
> given a name.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi/expr.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 783282b53ce..138fab0711f 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -173,7 +173,9 @@ def check_type(value, info, source,
>          raise QAPISemError(info,
>                             "%s should be an object or type name" % source)
>  
> -    permit_upper = allow_dict in info.pragma.name_case_whitelist
> +    permit_upper = False
> +    if isinstance(allow_dict, str):
> +        permit_upper = allow_dict in info.pragma.name_case_whitelist
>  
>      # value is a dictionary, check that each member is okay
>      for (key, arg) in value.items():

Busy-work like this can make me doubt typing is worth the notational
overhead.

There must a less awkward way to plumb "upper case okay" through
check_type() to check_name_is_str().  But we're typing what we have.


