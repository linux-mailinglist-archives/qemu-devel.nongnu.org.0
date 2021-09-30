Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83C41D5A2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:46:50 +0200 (CEST)
Received: from localhost ([::1]:33968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVriL-0006Fr-6T
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVre5-0004HT-GI
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:42:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mVre1-0000D0-Eh
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632991339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JE10gGUBb1Zh10JFPP+5kIKfnoM1j71cTBeMNqCUJG4=;
 b=NWncsrtbG1hWQSlVrnqb22tC+QwD9IfHEaJdSFQFWWGeBaXXNSvenJytcZltifVWk0zE+L
 w5e/Bydu1NJBpbDckr1dE+vOasijXqTgRFKSr3P0mcm7ikQvaphrIzn8LaKHv3bHy/0Ylb
 EKSd59tPr+izkcsOG9VDMKz1D+0rlR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-ly7Y4C39MzW4eNIGPjuv_w-1; Thu, 30 Sep 2021 04:42:17 -0400
X-MC-Unique: ly7Y4C39MzW4eNIGPjuv_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D25B51923763;
 Thu, 30 Sep 2021 08:42:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6377F19730;
 Thu, 30 Sep 2021 08:42:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B95CA113865F; Thu, 30 Sep 2021 10:42:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 05/13] qapi/parser: improve detection of '@symbol:'
 preface
References: <20210929194428.1038496-1-jsnow@redhat.com>
 <20210929194428.1038496-6-jsnow@redhat.com>
Date: Thu, 30 Sep 2021 10:42:08 +0200
In-Reply-To: <20210929194428.1038496-6-jsnow@redhat.com> (John Snow's message
 of "Wed, 29 Sep 2021 15:44:20 -0400")
Message-ID: <875yuisbdr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

> Leading and trailing whitespace are now discarded, addressing the FIXME
> comment. A new error is raised to detect this accidental case.
>
> Parsing for args sections is left alone here; the 'name' variable is
> moved into the only block where it is used.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> Tangentially related to delinting in that removing 'FIXME' comments is a
> goal for pylint. My goal is to allow 'TODO' to be checked in, but
> 'FIXME' should be fixed prior to inclusion.
>
> Arbitrary, but that's life for you.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py                              | 13 ++++++++-----
>  tests/qapi-schema/doc-whitespace-leading-symbol.err |  1 +
>  .../qapi-schema/doc-whitespace-leading-symbol.json  |  6 ++++++
>  tests/qapi-schema/doc-whitespace-leading-symbol.out |  0
>  .../qapi-schema/doc-whitespace-trailing-symbol.err  |  1 +
>  .../qapi-schema/doc-whitespace-trailing-symbol.json |  6 ++++++
>  .../qapi-schema/doc-whitespace-trailing-symbol.out  |  0
>  tests/qapi-schema/meson.build                       |  2 ++
>  8 files changed, 24 insertions(+), 5 deletions(-)
>  create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.err
>  create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.json
>  create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.out
>  create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.err
>  create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.json
>  create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.out
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index bfd2dbfd9a2..2f93a752f66 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -549,18 +549,21 @@ def _append_body_line(self, line):
>  
>          Else, append the line to the current section.
>          """
> -        name = line.split(' ', 1)[0]
> -        # FIXME not nice: things like '#  @foo:' and '# @foo: ' aren't
> -        # recognized, and get silently treated as ordinary text
> -        if not self.symbol and not self.body.text and line.startswith('@'):
> -            if not line.endswith(':'):
> +        stripped = line.strip()
> +
> +        if not self.symbol and not self.body.text and stripped.startswith('@'):
> +            if not stripped.endswith(':'):
>                  raise QAPIParseError(self._parser, "line should end with ':'")
> +            if not stripped == line:
> +                raise QAPIParseError(
> +                    self._parser, "extra whitespace around symbol declaration")

This rejects both leading and trailing whitespace.  Rejecting leading
whitespace is good.  Rejecting trailing whitespace feels a bit pedantic,
and it might not extend to the related case I'll point out below.

Have you considered a regexp instead?  Say

           match = re.match(r'(\s*)@([^:]*)(:?)(\s*)(.*)$', line)

Then match.group(n) is

     n=1  leading whitespace, if any
     n=2  symbol
     n=3  trailing colon, if any
     n=4  trailing whitespace, if any
     n=5  trailing text, if any

Omit the subgroups you don't need.

>              self.symbol = line[1:-1]
>              # FIXME invalid names other than the empty string aren't flagged
>              if not self.symbol:
>                  raise QAPIParseError(self._parser, "invalid name")
>          elif self.symbol:
>              # This is a definition documentation block
> +            name = line.split(' ', 1)[0]
>              if name.startswith('@') and name.endswith(':'):
>                  self._append_line = self._append_args_line
>                  self._append_args_line(line)

Same issue here, and in _append_args_line().  To reproduce, I hacked up
doc-good.json like so

    diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
    index 86dc25d2bd..977fcbad48 100644
    --- a/tests/qapi-schema/doc-good.json
    +++ b/tests/qapi-schema/doc-good.json
    @@ -133,7 +133,7 @@
     ##
     # @cmd:
     #
    -# @arg1: the first argument
    +#  @arg1: the first argument
     #
     # @arg2: the second
     #        argument

and got

    $ PYTHONPATH=/work/armbru/qemu/scripts python3 /work/armbru/qemu/tests/qapi-schema/test-qapi.py -d tests/qapi-schema doc-good.json
    doc-good FAIL
    --- tests/qapi-schema/doc-good.out
    +++ 
    @@ -149,12 +149,12 @@
     == Another subsection
     doc symbol=cmd
         body=
    -
    -    arg=arg1
    -the first argument
    +@arg1: the first argument
         arg=arg2
     the second
     argument
    +    arg=arg1
    +
         arg=arg3

         feature=cmd-feat1

[...]


