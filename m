Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA2E286F11
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 09:16:36 +0200 (CEST)
Received: from localhost ([::1]:44312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQQAE-0000nz-SC
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 03:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQQ94-0000GB-NN
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 03:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQQ91-0004ao-Tg
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 03:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602141317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OqEp9Q+pFMby7MxaiusxWhNKmCWEaHBevuTybLxYk6M=;
 b=jAhesoOTpNBzZxjqZhVhaTnQ6jjNSOHD58SChWi3LISSGEyuuQ8MMAq8MENM2yya8NDijD
 dF8JrjkkmODLhyJ8MZRLMnf2bd5vJyRswbtfzHkuExS1PrBghl3WULHkvNIhZUtye7OJzu
 IZCL4AdnBTZPsGeqefSqtmIbbBx1gdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-iCj4z40fPsWD0nqlx8Yjtg-1; Thu, 08 Oct 2020 03:15:16 -0400
X-MC-Unique: iCj4z40fPsWD0nqlx8Yjtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29F06805EF6
 for <qemu-devel@nongnu.org>; Thu,  8 Oct 2020 07:15:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C19B319D7C;
 Thu,  8 Oct 2020 07:15:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3B63811329C1; Thu,  8 Oct 2020 09:15:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 03/36] qapi-gen: Separate arg-parsing from generation
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-4-jsnow@redhat.com>
 <87r1qaihen.fsf@dusky.pond.sub.org>
 <50e590af-deff-3864-9abd-710a30eaa804@redhat.com>
Date: Thu, 08 Oct 2020 09:15:13 +0200
In-Reply-To: <50e590af-deff-3864-9abd-710a30eaa804@redhat.com> (John Snow's
 message of "Wed, 7 Oct 2020 10:41:47 -0400")
Message-ID: <878sch429q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 01:56:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> On 10/7/20 4:12 AM, Markus Armbruster wrote:
>> I keep stumbling over things in later patches that turn out to go back
>> to this one.
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> This is a minor re-work of the entrypoint script. It isolates a
>>> generate() method from the actual command-line mechanism.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>>> Tested-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>   scripts/qapi-gen.py | 85 +++++++++++++++++++++++++++++++++------------
>>>   1 file changed, 62 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/scripts/qapi-gen.py b/scripts/qapi-gen.py
>>> index 541e8c1f55d..117b396a595 100644
>>> --- a/scripts/qapi-gen.py
>>> +++ b/scripts/qapi-gen.py
>>> @@ -1,30 +1,77 @@
>>>   #!/usr/bin/env python3
>>> -# QAPI generator
>>> -#
>>> +
>>>   # This work is licensed under the terms of the GNU GPL, version 2 or later.
>>>   # See the COPYING file in the top-level directory.
>>>   +"""
>>> +QAPI Generator
>>> +
>>> +This script is the main entry point for generating C code from the QAPI schema.
>> PEP 8: For flowing long blocks of text with fewer structural
>> restrictions (docstrings or comments), the line length should be limited
>> to 72 characters.
>> 
>
> Eugh. OK, but I don't have a good way to check or enforce this,
> admittedly. I have to change my emacs settings to understand this when
> I hit the reflow key. I don't know if the python mode has a
> context-aware reflow length.
>
> ("I don't disagree, but I'm not immediately sure right now how I will
> make sure I, or anyone else, complies with this. Low priority as a
> result?")

Emacs Python mode is close enough by default: fill-paragraph (bound to
M-q) uses variable fill-column, which defaults to 70.  If you want the
extra two columns PEP 8 grants you, I can show you how to bump it to 72
just for Python mode.

You can use fill-paragraph for code, too.  I don't myself, because I
disagree with its line breaking decisions too often (and so does PEP 8).
A better Python mode would break code lines more neatly, and with the
width defaulting to 79.

>>> +"""
>>>     import argparse
>>>   import re
>>>   import sys
>>>     from qapi.commands import gen_commands
>>> +from qapi.error import QAPIError
>>>   from qapi.events import gen_events
>>>   from qapi.introspect import gen_introspect
>>> -from qapi.schema import QAPIError, QAPISchema
>>> +from qapi.schema import QAPISchema
>>>   from qapi.types import gen_types
>>>   from qapi.visit import gen_visit
>>>     
>>> -def main(argv):
>>> +DEFAULT_OUTPUT_DIR = ''
>>> +DEFAULT_PREFIX = ''
>>> +
>>> +
>>> +def generate(schema_file: str,
>>> +             output_dir: str,
>>> +             prefix: str,
>>> +             unmask: bool = False,
>>> +             builtins: bool = False) -> None:
>>> +    """
>>> +    generate uses a given schema to produce C code in the target directory.
>> PEP 257: The docstring is a phrase ending in a period.  It
>> prescribes
>> the function or method's effect as a command ("Do this", "Return that"),
>> not as a description; e.g. don't write "Returns the pathname ...".
>> Suggest
>>         Generate C code for the given schema into the target
>> directory.
>> 
>
> OK. I don't mind trying to foster a consistent tone. I clearly
> didn't. I will add a note to my style guide todo.
>
> I give you permission to change the voice in any of my docstrings, or
> to adjust the phrasing to be more technically accurate as you see
> fit. You are the primary maintainer of this code, of course, and you
> will know best.
>
> It will be quicker to give you full permission to just change any of
> the docstrings as you see fit than it will be to play review-respin
> ping-pong.

Me rewriting your commits without your consent is putting words in your
mouth, which I don't want to do.

We can still reduce ping-pong: whenever I can, I don't just say "this
needs improvement", I propose improvements.  If you disagree, we talk.
Else, if you have to respin, you make a reasonable effort to take them.
Else, the remaining improvements are trivial (because no respin), and
I'll make them in my tree.

>>> +
>>> +    :param schema_file: The primary QAPI schema file.
>>> +    :param output_dir: The output directory to store generated code.
>>> +    :param prefix: Optional C-code prefix for symbol names.
>>> +    :param unmask: Expose non-ABI names through introspection?
>>> +    :param builtins: Generate code for built-in types?
>>> +
>>> +    :raise QAPIError: On failures.
>>> +    """
>> [...]
>> 


