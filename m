Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D8284B23
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 13:53:29 +0200 (CEST)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPlX6-0004G1-Pe
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 07:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kPlVR-0003Qy-7I
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 07:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kPlVM-0001t5-VI
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 07:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601985099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jxKsXwEy0bVjBI+KdbdS4VoQproQRkNYqxmkgrVR8Jo=;
 b=Hj3/jOgh2ewyZvRSEtXk362dR/XgcSqG2+W0RZcUWMpOfxEDNIOqRLz/uuS1oe4NxGnxeS
 H6FdwZkdTKqZGh5s/fp4M7NZwkoP0uExQySwlyozXCsNr1BHO80ILXokFu1ByMojt2DasB
 XLGGL6QOQdAsoBFXmPzakuO5eCrS88o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-zaKTywANMBqVzuFylnQRGg-1; Tue, 06 Oct 2020 07:51:37 -0400
X-MC-Unique: zaKTywANMBqVzuFylnQRGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA4088015B0
 for <qemu-devel@nongnu.org>; Tue,  6 Oct 2020 11:51:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 620B01002382;
 Tue,  6 Oct 2020 11:51:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A1B9411329C1; Tue,  6 Oct 2020 13:51:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 03/36] qapi-gen: Separate arg-parsing from generation
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-4-jsnow@redhat.com>
Date: Tue, 06 Oct 2020 13:51:34 +0200
In-Reply-To: <20201005195158.2348217-4-jsnow@redhat.com> (John Snow's message
 of "Mon, 5 Oct 2020 15:51:25 -0400")
Message-ID: <87imbntvw9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> This is a minor re-work of the entrypoint script. It isolates a
> generate() method from the actual command-line mechanism.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi-gen.py | 85 +++++++++++++++++++++++++++++++++------------
>  1 file changed, 62 insertions(+), 23 deletions(-)
>
> diff --git a/scripts/qapi-gen.py b/scripts/qapi-gen.py
> index 541e8c1f55d..117b396a595 100644
> --- a/scripts/qapi-gen.py
> +++ b/scripts/qapi-gen.py
> @@ -1,30 +1,77 @@
>  #!/usr/bin/env python3
> -# QAPI generator
> -#
> +
>  # This work is licensed under the terms of the GNU GPL, version 2 or later.
>  # See the COPYING file in the top-level directory.
>  
> +"""
> +QAPI Generator
> +
> +This script is the main entry point for generating C code from the QAPI schema.
> +"""
>  
>  import argparse
>  import re
>  import sys
>  
>  from qapi.commands import gen_commands
> +from qapi.error import QAPIError
>  from qapi.events import gen_events
>  from qapi.introspect import gen_introspect
> -from qapi.schema import QAPIError, QAPISchema
> +from qapi.schema import QAPISchema
>  from qapi.types import gen_types
>  from qapi.visit import gen_visit

Unrelated cleanup.  Okay.

>  
>  
> -def main(argv):
> +DEFAULT_OUTPUT_DIR = ''
> +DEFAULT_PREFIX = ''
> +
> +
> +def generate(schema_file: str,
> +             output_dir: str,
> +             prefix: str,
> +             unmask: bool = False,
> +             builtins: bool = False) -> None:
> +    """
> +    generate uses a given schema to produce C code in the target directory.
> +
> +    :param schema_file: The primary QAPI schema file.
> +    :param output_dir: The output directory to store generated code.
> +    :param prefix: Optional C-code prefix for symbol names.
> +    :param unmask: Expose non-ABI names through introspection?
> +    :param builtins: Generate code for built-in types?
> +
> +    :raise QAPIError: On failures.
> +    """
> +    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
> +    if match.end() != len(prefix):
> +        msg = "funny character '{:s}' in prefix '{:s}'".format(
> +            prefix[match.end()], prefix)
> +        raise QAPIError('', None, msg)

Uh...

    $ python3 scripts/qapi-gen.py --prefix=@ x
    scripts/qapi-gen.py: : funny character '@' in prefix '@'

Unwanted " :".

This is due to a hack: you pass '' for info (*quack*).  Everything else
passes QAPISourceInfo (I believe).

Is it really a good idea to do this in generate?  It's not about
generating code, it's about validating a CLI option.

> +
> +    schema = QAPISchema(schema_file)
> +    gen_types(schema, output_dir, prefix, builtins)
> +    gen_visit(schema, output_dir, prefix, builtins)
> +    gen_commands(schema, output_dir, prefix)
> +    gen_events(schema, output_dir, prefix)
> +    gen_introspect(schema, output_dir, prefix, unmask)
> +
> +
> +def main() -> int:
> +    """
> +    gapi-gen shell script entrypoint.
> +    Expects arguments via sys.argv, see --help for details.
> +
> +    :return: int, 0 on success, 1 on failure.
> +    """
>      parser = argparse.ArgumentParser(
>          description='Generate code from a QAPI schema')
>      parser.add_argument('-b', '--builtins', action='store_true',
>                          help="generate code for built-in types")
> -    parser.add_argument('-o', '--output-dir', action='store', default='',
> +    parser.add_argument('-o', '--output-dir', action='store',
> +                        default=DEFAULT_OUTPUT_DIR,
>                          help="write output to directory OUTPUT_DIR")
> -    parser.add_argument('-p', '--prefix', action='store', default='',
> +    parser.add_argument('-p', '--prefix', action='store',
> +                        default=DEFAULT_PREFIX,
>                          help="prefix for symbols")

I don't like the changes to default=, because:

1. They are only losely related to the patch's purpose.

2. They split the definition of the CLI: most of it is here, except for
defaults, which are defined elsewhere.

3. The defaults will not change, and nothing else uses the constants.

>      parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
>                          dest='unmask',
> @@ -32,25 +79,17 @@ def main(argv):
>      parser.add_argument('schema', action='store')
>      args = parser.parse_args()
>  
> -    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', args.prefix)
> -    if match.end() != len(args.prefix):
> -        print("%s: 'funny character '%s' in argument of --prefix"
> -              % (sys.argv[0], args.prefix[match.end()]),
> -              file=sys.stderr)
> -        sys.exit(1)
> -
>      try:
> -        schema = QAPISchema(args.schema)
> +        generate(args.schema,
> +                 output_dir=args.output_dir,
> +                 prefix=args.prefix,
> +                 unmask=args.unmask,
> +                 builtins=args.builtins)
>      except QAPIError as err:
> -        print(err, file=sys.stderr)
> -        exit(1)
> -
> -    gen_types(schema, args.output_dir, args.prefix, args.builtins)
> -    gen_visit(schema, args.output_dir, args.prefix, args.builtins)
> -    gen_commands(schema, args.output_dir, args.prefix)
> -    gen_events(schema, args.output_dir, args.prefix)
> -    gen_introspect(schema, args.output_dir, args.prefix, args.unmask)
> +        print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
> +        return 1
> +    return 0

Subtle change: you move the gen_FOO() into the try ... except.  Okay;
they don't raise QAPIError, but perhaps worth a mention in the commit
message.

>  
>  
>  if __name__ == '__main__':
> -    main(sys.argv)
> +    sys.exit(main())

"Python was designed to be easy to understand and fun to use."
Ha ha ha.


