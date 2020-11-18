Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA12B80A8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:37:52 +0100 (CET)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPWp-0000mW-Nn
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfPVz-0000M3-3F
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:36:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfPVx-0004Nz-43
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605713815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZHRXcX9rinoRtXHQnhkZbH17fBPxrlB9CblfOXJgXWo=;
 b=Pgz+mVZVlwk6q46SVqyLSUGFOEAoND1THmvO/fpmPoHBgXcE2f9YNpJaXTorAq2HDisosz
 PxBWhKiXsPyWAbUkMiml1k5nepZ9NVC7AR59keCtWz+hta0EQmiSv7xz/yglswyKkrCWwP
 ftMk+vfjM4ns7hQlyDzh/iLrnVidFJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-UC2jWmdfNg6MgQNBFqVq5g-1; Wed, 18 Nov 2020 10:36:53 -0500
X-MC-Unique: UC2jWmdfNg6MgQNBFqVq5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2E13134C44
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 15:36:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 136E31964E;
 Wed, 18 Nov 2020 15:36:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 94CE211358BA; Wed, 18 Nov 2020 16:36:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 06/16] qapi/expr.py: Check type of 'data' member
References: <20201026213637.47087-1-jsnow@redhat.com>
 <20201026213637.47087-7-jsnow@redhat.com>
Date: Wed, 18 Nov 2020 16:36:49 +0100
In-Reply-To: <20201026213637.47087-7-jsnow@redhat.com> (John Snow's message of
 "Mon, 26 Oct 2020 17:36:27 -0400")
Message-ID: <877dqiismm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

> Iterating over the members of data isn't going to work if it's not some
> form of dict anyway, but for type safety, formalize it.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  scripts/qapi/expr.py | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 864363881682..2654a72e8333 100644
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

No raise without a test case covering it.

Add the test case *first*.  Just in case it demonstrates a frontend bug.
I believe these two are such bugs.


