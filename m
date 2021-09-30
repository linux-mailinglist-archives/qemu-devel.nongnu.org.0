Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6241D6B7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 11:47:18 +0200 (CEST)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVser-0001SK-2F
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 05:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVsdN-0000YU-9c
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:45:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVsdL-0002I4-17
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632995142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hFkIwd1ugNBfveGeQ60wOK6s9VJVn1EX0zkd0ztFizE=;
 b=iFMFVxMAlXUp7ABCsryBI51BQ3d7X3PKf/+c0hSJtWxyIKUlJOFEAKTMdCZTZKN2YsANsP
 6fkLts//4bVTN50VoODGCH6RUBMKGuLKSnwZhADGZDYa2B+XRPOM4NDIqmdL142ddZlR4z
 7EPc5SucayFHKoZKKrfN11w39H9/E2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-n61PQ06OMB6EahDWPVGdhA-1; Thu, 30 Sep 2021 05:45:37 -0400
X-MC-Unique: n61PQ06OMB6EahDWPVGdhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99AFE1044699;
 Thu, 30 Sep 2021 09:45:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2730E5F70B;
 Thu, 30 Sep 2021 09:45:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AB44E113865F; Thu, 30 Sep 2021 11:45:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 09/13] qapi/parser: add import cycle workaround
References: <20210929194428.1038496-1-jsnow@redhat.com>
 <20210929194428.1038496-10-jsnow@redhat.com>
Date: Thu, 30 Sep 2021 11:45:15 +0200
In-Reply-To: <20210929194428.1038496-10-jsnow@redhat.com> (John Snow's message
 of "Wed, 29 Sep 2021 15:44:24 -0400")
Message-ID: <87o88aqtw4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> There is a cycle that exists in the QAPI generator: [schema -> expr ->

"There is" or "there will be once we add strong type hints"?

> parser -> schema]. It exists because the QAPIDoc class needs the names
> of types defined by the schema module, but the schema module needs to
> import both expr.py/parser.py to do its actual parsing.
>
> Ultimately, the layering violation is that parser.py should not have any
> knowledge of specifics of the Schema. QAPIDoc performs double-duty here
> both as a parser *and* as a finalized object that is part of the schema.
>
> I see three paths here:
>
> (1) Just use the TYPE_CHECKING trick to eliminate the cycle which is only
>     present during static analysis.
>
> (2) Don't bother to annotate connect_member() et al, give them 'object'
>     or 'Any'. I don't particularly like this, because it diminishes the
>     usefulness of type hints for documentation purposes. Still, it's an
>     extremely quick fix.
>
> (3) Reimplement doc <--> definition correlation directly in schema.py,
>     integrating doc fields directly into QAPISchemaMember and relieving
>     the QAPIDoc class of the responsibility. Users of the information
>     would instead visit the members first and retrieve their
>     documentation instead of the inverse operation -- visiting the
>     documentation and retrieving their members.
>
> I prefer (3), but (1) is the easiest way to have my cake (strong type
> hints) and eat it too (Not have import cycles). Do (1) for now, but plan
> for (3). See also:
> https://mypy.readthedocs.io/en/latest/runtime_troubles.html#import-cycles
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index 123fc2f099c..30b1d98df0b 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -18,6 +18,7 @@
>  import os
>  import re
>  from typing import (
> +    TYPE_CHECKING,
>      Dict,
>      List,
>      Optional,
> @@ -30,6 +31,12 @@
>  from .source import QAPISourceInfo
>  
>  
> +if TYPE_CHECKING:
> +    # pylint: disable=cyclic-import
> +    # TODO: Remove cycle. [schema -> expr -> parser -> schema]
> +    from .schema import QAPISchemaFeature, QAPISchemaMember
> +
> +
>  # Return value alias for get_expr().
>  _ExprValue = Union[List[object], Dict[str, object], str, bool]
>  
> @@ -473,9 +480,9 @@ def append(self, line):
>      class ArgSection(Section):
>          def __init__(self, parser, name, indent=0):
>              super().__init__(parser, name, indent)
> -            self.member = None
> +            self.member: Optional['QAPISchemaMember'] = None
>  
> -        def connect(self, member):
> +        def connect(self, member: 'QAPISchemaMember') -> None:
>              self.member = member
>  
>      class NullSection(Section):
> @@ -750,14 +757,14 @@ def _append_freeform(self, line):
>                                   % match.group(1))
>          self._section.append(line)
>  
> -    def connect_member(self, member):
> +    def connect_member(self, member: 'QAPISchemaMember') -> None:
>          if member.name not in self.args:
>              # Undocumented TODO outlaw
>              self.args[member.name] = QAPIDoc.ArgSection(self._parser,
>                                                          member.name)
>          self.args[member.name].connect(member)
>  
> -    def connect_feature(self, feature):
> +    def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
>          if feature.name not in self.features:
>              raise QAPISemError(feature.info,
>                                 "feature '%s' lacks documentation"

This adds just the type hints that cause the cycle.  I like that,
because it illustrates the cycle.  Would be nice if the commit message
mentioned this, perhaps

  I prefer (3), but (1) is the easiest way to have my cake (strong type
  hints) and eat it too (Not have import cycles). Do (1) for now, but plan
  for (3). Also add the type hints that cause the cycle right away to
  illustrate. See also:
  https://mypy.readthedocs.io/en/latest/runtime_troubles.html#import-cycles

Slightly nicer, I think, would be swapping this and the next patch.
Then that one's commit message needs to say something like "except for a
few problematic ones, which the next commit will add".  Worthwhile?  Up
to you.


