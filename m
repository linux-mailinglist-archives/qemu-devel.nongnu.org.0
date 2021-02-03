Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A889D30DCAE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:27:06 +0100 (CET)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J7Z-0006Ia-Nc
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7J4X-0004Ix-9s
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:23:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7J4U-00088r-DN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612362233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=39LTC7XefwQTPHReSzSaXbA976s5n5mKozzqw4U1/Tw=;
 b=hp7yNl+L/SX7izildr9lMOufHtWrRKZT9nDA0MzxKW9zRIW48U1Kc4zILHQDvnKgpvUapS
 WZuMifA+fGE+jTA6w8NpH96lDtIOqHPnTuMWQmpKFIe1hEsY3RGL2MUTo3YKzcRE6Y8Y5z
 xg2LsREUA7Zz5yhabKUSdbkOT2Bsq9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-5ns1_LycOs2Eza5A1hkNPA-1; Wed, 03 Feb 2021 09:23:50 -0500
X-MC-Unique: 5ns1_LycOs2Eza5A1hkNPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A76161076205;
 Wed,  3 Feb 2021 14:23:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77B535D723;
 Wed,  3 Feb 2021 14:23:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EE767113865F; Wed,  3 Feb 2021 15:23:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 06/14] qapi/introspect.py: replace 'extra' dict with
 'comment' argument
References: <20210202174651.2274166-1-jsnow@redhat.com>
 <20210202174651.2274166-7-jsnow@redhat.com>
Date: Wed, 03 Feb 2021 15:23:47 +0100
In-Reply-To: <20210202174651.2274166-7-jsnow@redhat.com> (John Snow's message
 of "Tue, 2 Feb 2021 12:46:43 -0500")
Message-ID: <87tuqtteks.fsf@dusky.pond.sub.org>
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

> This is only used to pass in a dictionary with a comment already set, so
> skip the runaround and just accept the comment.
>
> This works because _tree_to_qlit() treats 'if': None; 'comment': None
> exactly like absent 'if'; 'comment'.

Confusing, because the two paragraphs talk about two different things:

1. Actual arguments for @extra are either None or {'comment': comment}.
   Simplify: replace parameter @extra by parameter @comment.

2. Dumb down the return value to always be of the form

    (obj {'if': ifcond, 'comment': comment})

I suspect splitting the patch is easier than crafting a clear commit
message for the combined one.

>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/introspect.py | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index d3fbf694ad2..0aa3b77109f 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -10,6 +10,8 @@
>  See the COPYING file in the top-level directory.
>  """
>  
> +from typing import Optional
> +
>  from .common import (
>      c_name,
>      gen_endif,
> @@ -24,11 +26,11 @@
>  )
>  
>  
> -def _make_tree(obj, ifcond, extra=None):
> -    if extra is None:
> -        extra = {}
> -    if ifcond:
> -        extra['if'] = ifcond
> +def _make_tree(obj, ifcond, comment=None):
> +    extra = {
> +        'if': ifcond,
> +        'comment': comment,
> +    }
>      return (obj, extra)

Obvious way to do just 1.:

   def _make_tree(obj, ifcond, comment=None):
       extra = {}
       if ifcond:
           extra['if'] = ifcond
       if comment:
           extra['comment'] = comment

>  
>  
> @@ -174,18 +176,18 @@ def _gen_features(features):
>          return [_make_tree(f.name, f.ifcond) for f in features]
>  
>      def _gen_tree(self, name, mtype, obj, ifcond, features):
> -        extra = None
> +        comment: Optional[str] = None
>          if mtype not in ('command', 'event', 'builtin', 'array'):
>              if not self._unmask:
>                  # Output a comment to make it easy to map masked names
>                  # back to the source when reading the generated output.
> -                extra = {'comment': '"%s" = %s' % (self._name(name), name)}
> +                comment = f'"{self._name(name)}" = {name}'
>              name = self._name(name)
>          obj['name'] = name
>          obj['meta-type'] = mtype
>          if features:
>              obj['features'] = self._gen_features(features)
> -        self._trees.append(_make_tree(obj, ifcond, extra))
> +        self._trees.append(_make_tree(obj, ifcond, comment))
>  
>      def _gen_member(self, member):
>          obj = {'name': member.name, 'type': self._use_type(member.type)}


