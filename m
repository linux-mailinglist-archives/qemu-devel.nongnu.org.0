Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CE8286EDB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 08:53:07 +0200 (CEST)
Received: from localhost ([::1]:44736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQPnV-0004Bm-U5
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 02:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQPm5-0003jj-HP
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 02:51:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQPm1-0001SJ-Je
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 02:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602139890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=amZgRW4PlZK94RN2tJD3FIHYW9vI7sdYFqUezQ1j9vo=;
 b=BixosWsrUxvIEYRwIbrPivb85wAApjUNgdv0C3GA/RmSd7R8EfAvYUyp3ivTfN+Lq4tJ4l
 l1wxyvAC2Ueqxd87Sz/L/zYbsAKOeY0T3WGq5ZZKTDNmK29Lu0stZVWasgHue/6hKYvdtS
 VnvIWTbHBWqCCUuxKVxcNbPUhwQFwjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-W0uzJv-rOSmigRSei40plg-1; Thu, 08 Oct 2020 02:51:28 -0400
X-MC-Unique: W0uzJv-rOSmigRSei40plg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB415107AD74
 for <qemu-devel@nongnu.org>; Thu,  8 Oct 2020 06:51:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8418955764;
 Thu,  8 Oct 2020 06:51:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EEF5111329C1; Thu,  8 Oct 2020 08:51:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 03/36] qapi-gen: Separate arg-parsing from generation
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-4-jsnow@redhat.com>
 <877ds2jw6t.fsf@dusky.pond.sub.org>
 <007985f2-2872-1ab7-16aa-19414ba8cc78@redhat.com>
Date: Thu, 08 Oct 2020 08:51:25 +0200
In-Reply-To: <007985f2-2872-1ab7-16aa-19414ba8cc78@redhat.com> (John Snow's
 message of "Wed, 7 Oct 2020 10:36:46 -0400")
Message-ID: <87d01t43de.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

> On 10/7/20 4:07 AM, Markus Armbruster wrote:
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
>>> +
>>> +    :param schema_file: The primary QAPI schema file.
>>> +    :param output_dir: The output directory to store generated code.
>>> +    :param prefix: Optional C-code prefix for symbol names.
>>> +    :param unmask: Expose non-ABI names through introspection?
>>> +    :param builtins: Generate code for built-in types?
>>> +
>>> +    :raise QAPIError: On failures.
>>> +    """
>>> +    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
>>> +    if match.end() != len(prefix):
>>> +        msg = "funny character '{:s}' in prefix '{:s}'".format(
>>> +            prefix[match.end()], prefix)
>>> +        raise QAPIError('', None, msg)
>>> +
>>> +    schema = QAPISchema(schema_file)
>>> +    gen_types(schema, output_dir, prefix, builtins)
>>> +    gen_visit(schema, output_dir, prefix, builtins)
>>> +    gen_commands(schema, output_dir, prefix)
>>> +    gen_events(schema, output_dir, prefix)
>>> +    gen_introspect(schema, output_dir, prefix, unmask)
>>> +
>>> +
>>> +def main() -> int:
>>> +    """
>>> +    gapi-gen shell script entrypoint.
>> What's a "shell script entrypoint"?
>> Python docs talk about "when [...] run as a script":
>> https://docs.python.org/3/library/__main__.html
>> Similar:
>> https://docs.python.org/3/tutorial/modules.html#executing-modules-as-scripts
>> 
>
> "entrypoint" is Python garble for a function that can be registered as
> a callable from the command line.
>
> So in a theoretical setup.py, you'd do something like:
>
> 'entry_points': {
>   'console_scripts': [
>     'qapi-gen = qapi.main:main',
>   ]
> }
>
> so when I say "shell script entrypoint", I am referring to a shell
> script (I mean: it has a shebang and can be executed by an interactive 
> shell process) that calls the entrypoint.

It can be executed by any process.  See execve(2):

       pathname must be either a binary executable, or a script starting  with
       a line of the form:

           #!interpreter [optional-arg]

       For details of the latter case, see "Interpreter scripts" below.

"Entry point" makes sense in Python context, "script entry point" also
makes sense (since every Python program is a script, script is
redundant, but not wrong).  "Shell script entry point" is misleading.

> Once (if) QAPI migrates to ./python/qemu/qapi, it will be possible to
> just generate that script.
>
> (i.e. doing `pip install qemu.qapi` will install a 'qapi-gen' CLI
> script for you. this is how packages like sphinx create the
> 'sphinx-build' script, etc.)
>
>>> +    Expects arguments via sys.argv, see --help for details.
>>> +
>>> +    :return: int, 0 on success, 1 on failure.
>>> +    """
>>>       parser = argparse.ArgumentParser(
>>>           description='Generate code from a QAPI schema')
>>>       parser.add_argument('-b', '--builtins', action='store_true',
>>>                           help="generate code for built-in types")
>>> -    parser.add_argument('-o', '--output-dir', action='store', default='',
>>> +    parser.add_argument('-o', '--output-dir', action='store',
>>> +                        default=DEFAULT_OUTPUT_DIR,
>>>                           help="write output to directory OUTPUT_DIR")
>>> -    parser.add_argument('-p', '--prefix', action='store', default='',
>>> +    parser.add_argument('-p', '--prefix', action='store',
>>> +                        default=DEFAULT_PREFIX,
>>>                           help="prefix for symbols")
>>>       parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
>>>                           dest='unmask',
>>> @@ -32,25 +79,17 @@ def main(argv):
>>>       parser.add_argument('schema', action='store')
>>>       args = parser.parse_args()
>>>   -    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?',
>>> args.prefix)
>>> -    if match.end() != len(args.prefix):
>>> -        print("%s: 'funny character '%s' in argument of --prefix"
>>> -              % (sys.argv[0], args.prefix[match.end()]),
>>> -              file=sys.stderr)
>>> -        sys.exit(1)
>>> -
>>>       try:
>>> -        schema = QAPISchema(args.schema)
>>> +        generate(args.schema,
>>> +                 output_dir=args.output_dir,
>>> +                 prefix=args.prefix,
>>> +                 unmask=args.unmask,
>>> +                 builtins=args.builtins)
>>>       except QAPIError as err:
>>> -        print(err, file=sys.stderr)
>>> -        exit(1)
>>> -
>>> -    gen_types(schema, args.output_dir, args.prefix, args.builtins)
>>> -    gen_visit(schema, args.output_dir, args.prefix, args.builtins)
>>> -    gen_commands(schema, args.output_dir, args.prefix)
>>> -    gen_events(schema, args.output_dir, args.prefix)
>>> -    gen_introspect(schema, args.output_dir, args.prefix, args.unmask)
>>> +        print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
>>> +        return 1
>>> +    return 0
>>>     
>>>   if __name__ == '__main__':
>>> -    main(sys.argv)
>>> +    sys.exit(main())
>> What does sys.exit() really buy us here?  I'm asking because both
>> spots
>> in the Python docs I referenced above do without.
>> 
>
> It just pushes the sys.exit out of the main function so it can be
> invoked by other machinery. (And takes the return code from main and 
> turns it into the return code for the process.)
>
> I don't think it winds up mattering for simple "console_script" entry
> points, but you don't want the called function to exit and deny the 
> caller the chance to do their own tidying post-call.
>
> You've already offered a "YAGNI", but it's just the convention I tend
> to stick to for how to structure entry points.

I'm not questioning the conventional if __name__ == '__main__' menuett.
I wonder why *we* need sys.exit() where the examples in the Python docs
don't.


