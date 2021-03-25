Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15CC349480
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:48:55 +0100 (CET)
Received: from localhost ([::1]:55706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRI7-00008c-1Q
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPRFK-00073I-AR
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:46:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPRF4-00035r-Jf
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616683541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z2yG9QTTbRFPH+TXnOoeoYyfRddWoA0fdCeId4ctAk4=;
 b=DchdVDH/pQLdsA33tL/HsSY+6beaTUHKDXVy3T7k3VnSQdKEbBrAJW19DA+/6k1bAmiHZa
 u9Iz5SFTv3Xp9M0L+v4elpb9+XNl7GYOFW/qy+Eo7F2Gii5p7gPTEV+HOzZr71rGyK75r+
 4+sC76YY9kgGtmm+/jEP/7lbGXReuas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-RNQBssVTNSq6co9zBE1aJw-1; Thu, 25 Mar 2021 10:45:39 -0400
X-MC-Unique: RNQBssVTNSq6co9zBE1aJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CC9964A96;
 Thu, 25 Mar 2021 14:45:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 594011F7;
 Thu, 25 Mar 2021 14:45:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E2F4111327E1; Thu, 25 Mar 2021 15:45:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 11/19] qapi/expr.py: Modify check_keys to accept any
 Collection
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-12-jsnow@redhat.com>
Date: Thu, 25 Mar 2021 15:45:36 +0100
In-Reply-To: <20210325060356.4040114-12-jsnow@redhat.com> (John Snow's message
 of "Thu, 25 Mar 2021 02:03:48 -0400")
Message-ID: <87im5fs35b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

John Snow <jsnow@redhat.com> writes:

> This is a minor adjustment that allows the 'required' and 'optional'
> keys fields to take a default value of an empty, immutable sequence (the
> empty tuple).
>
> This reveals a quirk of this function, which is that "a + b" is
> list-specific behavior. We can accept a wider variety of types if we
> avoid that behavior. Using Collection allows us to accept things like
> lists, tuples, sets, and so on.
>
> (Iterable would also have worked, but Iterable also includes things like
> generator expressions which are consumed upon iteration, which would
> require a rewrite to make sure that each input was only traversed once.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>

The commit message confused me briefly, until I realized v3 of this
patch came later in the series, where it modified check_keys() type
hints and added default values.

What about this:

  This is a minor adjustment that lets parameters @required and
  @optional take tuple arguments, in particular ().  Later patches will
  make use of that.

> ---
>  scripts/qapi/expr.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 505e67bd21..7e22723b50 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -100,7 +100,7 @@ def pprint(elems):
>              "%s misses key%s %s"
>              % (source, 's' if len(missing) > 1 else '',
>                 pprint(missing)))
> -    allowed = set(required + optional)
> +    allowed = set(required) | set(optional)
>      unknown = set(value) - allowed
>      if unknown:
>          raise QAPISemError(


