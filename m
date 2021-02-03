Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF9730DBC6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 14:51:11 +0100 (CET)
Received: from localhost ([::1]:53042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7IYo-0007Hs-1f
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 08:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7IXM-0006oS-2W
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:49:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7IXJ-0001LO-Lv
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 08:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612360175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AnbJdrnI73kYqC2KKQZZykVBbRFTWWCPCRVCqDYBxDU=;
 b=TUlTbo/MKpIDLyjkWulBzVJWlGJjvHrzVctPNDk8MgY2+tJl5W5TOqlhjZkQhIs6ZRdVtm
 xPlsmLbCDd9PR1SZ9yq9USUkXgsChRajHOdQ8XArJ44kdfVHyVhHPXEnzmDdLHwdyvcu/j
 v63f6y7wAHxVG15ruxV35L/B5b/D8QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-W1tupNCDNAKDnsFgZc1TDw-1; Wed, 03 Feb 2021 08:49:26 -0500
X-MC-Unique: W1tupNCDNAKDnsFgZc1TDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A9F0801960;
 Wed,  3 Feb 2021 13:49:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EED0F5D9E8;
 Wed,  3 Feb 2021 13:49:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 865E0113865F; Wed,  3 Feb 2021 14:49:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 02/14] qapi/introspect.py: use _make_tree for
 features nodes
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-3-jsnow@redhat.com>
Date: Wed, 03 Feb 2021 14:49:23 +0100
In-Reply-To: <20210202174651.2274166-3-jsnow@redhat.com> (John Snow's message
 of "Tue, 2 Feb 2021 12:46:39 -0500")
Message-ID: <87czxhuuqk.fsf@dusky.pond.sub.org>
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

> At present, we open-code this in _make_tree itself; but if the structure
> of the tree changes, this is brittle. Use an explicit recursive call to
> _make_tree when appropriate to help keep the interior node typing
> consistent.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index 43ab4be1f77..3295a15c98e 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -30,7 +30,9 @@ def _make_tree(obj, ifcond, features, extra=None):
>      if ifcond:
>          extra['if'] = ifcond
>      if features:
> -        obj['features'] = [(f.name, {'if': f.ifcond}) for f in features]
> +        obj['features'] = [
> +            _make_tree(f.name, f.ifcond, None) for f in features
> +        ]
>      if extra:
>          return (obj, extra)
>      return obj

The commit message made me expect a patch that improves the code without
changing its behavior.  This is not the case.  We go from

    obj['features'] = [(f.name, {'if': f.ifcond}) for f in features]

to

    obj['features'] = [_make_tree(f.name, f.ifcond) for f in features]

where

    _make_tree(f.name, f.ifcond)
    = (f.name, {'if': f.ifcond})       if f.ifcond
    = f.name                           else

Differs when not f.ifcond.  Feels like an improvement.  However, the
commit message did not prepare me for it.


