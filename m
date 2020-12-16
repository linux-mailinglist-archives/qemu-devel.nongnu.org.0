Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AAC2DBD73
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:23:49 +0100 (CET)
Received: from localhost ([::1]:42358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpT2C-0007oO-NJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpT1M-0007Dn-LP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:22:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpT1J-0002gn-8M
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608110572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gyEo9nx1poAdCg+5AVdLVbpDXxIOSkhInXcuEe2akOQ=;
 b=X9sewwe7H3S02M02ZdyMLuryGvUZ3iXBMZwSXpkAWPeyShqltznJ+RsbopFivDKv9tAtIb
 Qub/GiaoOCumYIK1bTqq8iYNtqGBxoXTpojW3/aDndilGxEse/fY4VkAqDbQEB0l/x7WjR
 nPp2zLB7G3m3KK2lQ+iXbnY5vUD2apQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-AWnYwY6IONqrbOcDhW47ow-1; Wed, 16 Dec 2020 04:22:50 -0500
X-MC-Unique: AWnYwY6IONqrbOcDhW47ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25E41CC624
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 09:22:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D62F75D9D7;
 Wed, 16 Dec 2020 09:22:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 691A311329A5; Wed, 16 Dec 2020 10:22:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 06/12] qapi/source: Add builtin null-object sentinel
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-7-jsnow@redhat.com>
Date: Wed, 16 Dec 2020 10:22:44 +0100
In-Reply-To: <20201214235327.1007124-7-jsnow@redhat.com> (John Snow's message
 of "Mon, 14 Dec 2020 18:53:21 -0500")
Message-ID: <87r1nqrtp7.fsf@dusky.pond.sub.org>
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> We use None to represent an object that has no source information
> because it's a builtin. This complicates interface typing, since many
> interfaces expect that there is an info object available to print errors
> with.
>
> Introduce a special QAPISourceInfo that represents these built-ins so
> that if an error should so happen to occur relating to one of these
> builtins that we will be able to print its information, and interface
> typing becomes simpler: you will always have a source info object.

Two aspects mixed up:

1. Represent "no source info" as special QAPISourceInfo instead of
   None

   This is what de-complicates interface typing.

2. On error with "no source info", don't crash.

   I have my doubts on this one.

   Such an error means the QAPI code generator screwed up, at least in
   theory.  Crashing is only proper.  It gets the screwup fixed.

   In practice, errors due to interactions between built-in stuff and
   user-defined stuff could conceivably escape testing.  I can't
   remember such a case offhand.

   Will the "no source info" error be more useful than a crash?
   Possibly.  Will it get the screwup fixed?  Maybe not.

Can we separate the two aspects?

>
> This object will evaluate as False, so "if info" is a valid idiomatic
> construct.

Suggest s/is a valid/remains a valid/.

Not 100% sure we'll want to keep this idiom, but now is not the time to
worry about that.

>
> NB: It was intentional to not allow empty constructors or similar to
> create "empty" source info objects; callers must explicitly invoke
> 'builtin()' to pro-actively opt into using the sentinel. This should
> prevent use-by-accident.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/source.py | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
> index d7a79a9b8aee..64af7318cb67 100644
> --- a/scripts/qapi/source.py
> +++ b/scripts/qapi/source.py
> @@ -11,7 +11,12 @@
>  
>  import copy
>  import sys
> -from typing import List, Optional, TypeVar
> +from typing import (
> +    List,
> +    Optional,
> +    Type,
> +    TypeVar,
> +)
>  
>  
>  class QAPISchemaPragma:
> @@ -41,6 +46,17 @@ def __init__(self, fname: str, line: int,
>          self.defn_meta: Optional[str] = None
>          self.defn_name: Optional[str] = None
>  
> +    @classmethod
> +    def builtin(cls: Type[T]) -> T:
> +        """
> +        Create a SourceInfo object corresponding to a builtin definition.

Let's spell it built-in for consistency with existing comments.

Could perhaps shorten "a SourceInfo object" to "an instance".

> +        """
> +        return cls('', -1, None)

No users?  Peeking ahead... aha, they are in Patch 08.  Any particular
reason for putting PATCH 07 between the two?  Could PATCH 08 be squashed
into this one?

> +
> +    def __bool__(self) -> bool:
> +        # "if info: ..." is false if info is the builtin sentinel.
> +        return bool(self.fname)

Nitpicking...  "The builtin sentinel" suggests there is just one.  PATCH
08 creates several.  I don't mind, but let's say something like "if
@info corresponds to a built-in definition".

> +
>      def set_defn(self, meta: str, name: str) -> None:
>          self.defn_meta = meta
>          self.defn_name = name
> @@ -73,4 +89,6 @@ def include_path(self) -> str:
>          return ret
>  
>      def __str__(self) -> str:
> +        if not bool(self):
> +            return '[builtin]'
>          return self.include_path() + self.in_defn() + self.loc()

Looks like we can separate the two aspects easily:

       def __str__(self) -> str:
  +        assert not bool(self)
           return self.include_path() + self.in_defn() + self.loc()


