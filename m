Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB90E36C1E5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:41:04 +0200 (CEST)
Received: from localhost ([::1]:35088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKDH-0002lT-RQ
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbK5r-0006YW-3b
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbK5m-0006pY-Qk
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619515998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=da4Rb0ApZV8joZksjjKLQehceSIl3qfU5bx9ONRxn5Y=;
 b=KeiYEpdkvO3S72eEfLQxFrdIwujkdJdqbvoM7c3gLCl6+Oo9My1x+qKlmmF2MgSIqIuAeN
 zVAGC+U7F8IApzploxJxqUcOJ3kxkpqHvWIubUo2ER1z/Y8OF1k1dt05ul2uT17z73xSv5
 sYYgFEuXP7i90f49n/PsNbv2IkKl8F8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-Rrf5GZkaPzG9I1hGLE54Bg-1; Tue, 27 Apr 2021 05:33:16 -0400
X-MC-Unique: Rrf5GZkaPzG9I1hGLE54Bg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 632EA107ACCA;
 Tue, 27 Apr 2021 09:33:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10F756064B;
 Tue, 27 Apr 2021 09:33:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 95F21113525D; Tue, 27 Apr 2021 11:33:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 02/22] qapi/source: [RFC] add "with_column" contextmanager
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-3-jsnow@redhat.com>
Date: Tue, 27 Apr 2021 11:33:13 +0200
In-Reply-To: <20210422030720.3685766-3-jsnow@redhat.com> (John Snow's message
 of "Wed, 21 Apr 2021 23:07:00 -0400")
Message-ID: <878s542ht2.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> This is a silly one, but... it's important to have fun.
>
> This patch isn't *needed*, it's here as an RFC. In trying to experiment
> with different ways to solve the problem addressed by the previous
> commit, I kept getting confused at how the "source location" string with
> line and column number was built across two different classes.
>
> (i.e. QAPISourceError appends the column, but QAPISourceInfo does not
> track column information natively.)
>
> I was afraid to try and fully implement column number directly in
> QAPISourceInfo on the chance that it might have undesirable effects, so
> I came up with a quick "hack" to centralize the 'location' information
> generation.
>
> It's a little goofy, but it works :')
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/error.py  |  8 +++-----
>  scripts/qapi/source.py | 23 ++++++++++++++++++++++-
>  2 files changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
> index e35e4ddb26a..6b04f56f8a2 100644
> --- a/scripts/qapi/error.py
> +++ b/scripts/qapi/error.py
> @@ -39,11 +39,9 @@ def __init__(self,
>  
>      def __str__(self) -> str:
>          assert self.info is not None
> -        loc = str(self.info)
> -        if self.col is not None:
> -            assert self.info.line is not None
> -            loc += ':%s' % self.col
> -        return loc + ': ' + self.msg
> +        with self.info.at_column(self.col):
> +            loc = str(self.info)
> +        return f"{loc}: {self.msg}"
>  
>  
>  class QAPISemError(QAPISourceError):
> diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
> index 1ade864d7b9..21090b9fe78 100644
> --- a/scripts/qapi/source.py
> +++ b/scripts/qapi/source.py
> @@ -9,8 +9,14 @@
>  # This work is licensed under the terms of the GNU GPL, version 2.
>  # See the COPYING file in the top-level directory.
>  
> +from contextlib import contextmanager
>  import copy
> -from typing import List, Optional, TypeVar
> +from typing import (
> +    Iterator,
> +    List,
> +    Optional,
> +    TypeVar,
> +)
>  
>  
>  class QAPISchemaPragma:
> @@ -35,6 +41,7 @@ def __init__(self, fname: str, line: int,
>                   parent: Optional['QAPISourceInfo']):
>          self.fname = fname
>          self.line = line
> +        self._column: Optional[int] = None
>          self.parent = parent
>          self.pragma: QAPISchemaPragma = (
>              parent.pragma if parent else QAPISchemaPragma()
> @@ -52,9 +59,14 @@ def next_line(self: T) -> T:
>          return info
>  
>      def loc(self) -> str:
> +        # column cannot be provided meaningfully when line is absent.
> +        assert self.line or self._column is None
> +
>          ret = self.fname
>          if self.line is not None:
>              ret += ':%d' % self.line
> +        if self._column is not None:
> +            ret += ':%d' % self._column
>          return ret
>  
>      def in_defn(self) -> str:
> @@ -71,5 +83,14 @@ def include_path(self) -> str:
>              parent = parent.parent
>          return ret
>  
> +    @contextmanager
> +    def at_column(self, column: Optional[int]) -> Iterator[None]:
> +        current_column = self._column
> +        try:
> +            self._column = column
> +            yield
> +        finally:
> +            self._column = current_column
> +
>      def __str__(self) -> str:
>          return self.include_path() + self.in_defn() + self.loc()

Uh...

We create one QAPISourceInfo instance per source line.  First line in
QAPISchemaParser.__init__()

        self.info = QAPISourceInfo(fname, 1, incl_info)

and subsequent ones in .accept()

                self.info = self.info.next_line()

These instances get shared by everything on their line.

Your patch adds a _column attribute to these objects.  Because it
applies to everything that shares the object, setting it is kind of
wrong.  You therefore only ever set it temporarily, in
QAPISourceError.__str__().

This works in the absence of concurrency (which means it just works,
this being Python), but *ugh*!

The obvious extension of QAPISourceInfo to columns would create one
instance per source character.  Too egregiously wasteful for my taste.

Let's start over with the *why*: what is it exactly that bothers you in
the code before this patch?  Is it the spatial distance between the
formatting of "file:line:col: msg" in QAPISourceError.__str_() and the
formatting of the file:line part in QAPISourceInfo.loc()?


