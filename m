Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A979C285027
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 18:47:26 +0200 (CEST)
Received: from localhost ([::1]:39434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPq7Z-0004VT-P8
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 12:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPq6d-000455-Et
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:46:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPq6a-0001qu-Hr
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 12:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602002782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMufXsKnKCqttKvixuu/HlvstKfkrcUd4TsDYAg1nAM=;
 b=L5UUnye0DHEDWNoTbI34YY7zt7B0MnoMjVvys5VZmbcx+Lj9R+2vLgwDQeIyPfS5VbcRb1
 SnKgiu+N+RYciGrjS+tiP4EuBJETBYJn6I2lzUsxYHmGaTEwXYWKXm+eTqKEtW7ZACj7D7
 to6ErzVhozABxjqvzFe1bAj7IWvdFrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-5lt3L6e1OuKebeGM8MPozQ-1; Tue, 06 Oct 2020 12:46:19 -0400
X-MC-Unique: 5lt3L6e1OuKebeGM8MPozQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DCFF344F3
 for <qemu-devel@nongnu.org>; Tue,  6 Oct 2020 16:46:18 +0000 (UTC)
Received: from [10.10.120.38] (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4A445C1C4;
 Tue,  6 Oct 2020 16:46:17 +0000 (UTC)
Subject: Re: [PATCH v5 03/36] qapi-gen: Separate arg-parsing from generation
To: Markus Armbruster <armbru@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-4-jsnow@redhat.com>
 <87imbntvw9.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <4419bbce-c0d8-865d-bed6-08d27809ba6b@redhat.com>
Date: Tue, 6 Oct 2020 12:46:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87imbntvw9.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/20 7:51 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> This is a minor re-work of the entrypoint script. It isolates a
>> generate() method from the actual command-line mechanism.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>> Tested-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   scripts/qapi-gen.py | 85 +++++++++++++++++++++++++++++++++------------
>>   1 file changed, 62 insertions(+), 23 deletions(-)
>>
>> diff --git a/scripts/qapi-gen.py b/scripts/qapi-gen.py
>> index 541e8c1f55d..117b396a595 100644
>> --- a/scripts/qapi-gen.py
>> +++ b/scripts/qapi-gen.py
>> @@ -1,30 +1,77 @@
>>   #!/usr/bin/env python3
>> -# QAPI generator
>> -#
>> +
>>   # This work is licensed under the terms of the GNU GPL, version 2 or later.
>>   # See the COPYING file in the top-level directory.
>>   
>> +"""
>> +QAPI Generator
>> +
>> +This script is the main entry point for generating C code from the QAPI schema.
>> +"""
>>   
>>   import argparse
>>   import re
>>   import sys
>>   
>>   from qapi.commands import gen_commands
>> +from qapi.error import QAPIError
>>   from qapi.events import gen_events
>>   from qapi.introspect import gen_introspect
>> -from qapi.schema import QAPIError, QAPISchema
>> +from qapi.schema import QAPISchema
>>   from qapi.types import gen_types
>>   from qapi.visit import gen_visit
> 
> Unrelated cleanup.  Okay.
> 
>>   
>>   
>> -def main(argv):
>> +DEFAULT_OUTPUT_DIR = ''
>> +DEFAULT_PREFIX = ''
>> +
>> +
>> +def generate(schema_file: str,
>> +             output_dir: str,
>> +             prefix: str,
>> +             unmask: bool = False,
>> +             builtins: bool = False) -> None:
>> +    """
>> +    generate uses a given schema to produce C code in the target directory.
>> +
>> +    :param schema_file: The primary QAPI schema file.
>> +    :param output_dir: The output directory to store generated code.
>> +    :param prefix: Optional C-code prefix for symbol names.
>> +    :param unmask: Expose non-ABI names through introspection?
>> +    :param builtins: Generate code for built-in types?
>> +
>> +    :raise QAPIError: On failures.
>> +    """
>> +    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
>> +    if match.end() != len(prefix):
>> +        msg = "funny character '{:s}' in prefix '{:s}'".format(
>> +            prefix[match.end()], prefix)
>> +        raise QAPIError('', None, msg)
> 
> Uh...
> 
>      $ python3 scripts/qapi-gen.py --prefix=@ x
>      scripts/qapi-gen.py: : funny character '@' in prefix '@'
> 
> Unwanted " :".
> 
> This is due to a hack: you pass '' for info (*quack*).  Everything else
> passes QAPISourceInfo (I believe).
> 
> Is it really a good idea to do this in generate?  It's not about
> generating code, it's about validating a CLI option.
> 
>> +
>> +    schema = QAPISchema(schema_file)
>> +    gen_types(schema, output_dir, prefix, builtins)
>> +    gen_visit(schema, output_dir, prefix, builtins)
>> +    gen_commands(schema, output_dir, prefix)
>> +    gen_events(schema, output_dir, prefix)
>> +    gen_introspect(schema, output_dir, prefix, unmask)
>> +
>> +
>> +def main() -> int:
>> +    """
>> +    gapi-gen shell script entrypoint.
>> +    Expects arguments via sys.argv, see --help for details.
>> +
>> +    :return: int, 0 on success, 1 on failure.
>> +    """
>>       parser = argparse.ArgumentParser(
>>           description='Generate code from a QAPI schema')
>>       parser.add_argument('-b', '--builtins', action='store_true',
>>                           help="generate code for built-in types")
>> -    parser.add_argument('-o', '--output-dir', action='store', default='',
>> +    parser.add_argument('-o', '--output-dir', action='store',
>> +                        default=DEFAULT_OUTPUT_DIR,
>>                           help="write output to directory OUTPUT_DIR")
>> -    parser.add_argument('-p', '--prefix', action='store', default='',
>> +    parser.add_argument('-p', '--prefix', action='store',
>> +                        default=DEFAULT_PREFIX,
>>                           help="prefix for symbols")
> 
> I don't like the changes to default=, because:
> 
> 1. They are only losely related to the patch's purpose.
> 
> 2. They split the definition of the CLI: most of it is here, except for
> defaults, which are defined elsewhere.
> 
> 3. The defaults will not change, and nothing else uses the constants.
> 
>>       parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
>>                           dest='unmask',
>> @@ -32,25 +79,17 @@ def main(argv):
>>       parser.add_argument('schema', action='store')
>>       args = parser.parse_args()
>>   
>> -    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', args.prefix)
>> -    if match.end() != len(args.prefix):
>> -        print("%s: 'funny character '%s' in argument of --prefix"
>> -              % (sys.argv[0], args.prefix[match.end()]),
>> -              file=sys.stderr)
>> -        sys.exit(1)
>> -
>>       try:
>> -        schema = QAPISchema(args.schema)
>> +        generate(args.schema,
>> +                 output_dir=args.output_dir,
>> +                 prefix=args.prefix,
>> +                 unmask=args.unmask,
>> +                 builtins=args.builtins)
>>       except QAPIError as err:
>> -        print(err, file=sys.stderr)
>> -        exit(1)
>> -
>> -    gen_types(schema, args.output_dir, args.prefix, args.builtins)
>> -    gen_visit(schema, args.output_dir, args.prefix, args.builtins)
>> -    gen_commands(schema, args.output_dir, args.prefix)
>> -    gen_events(schema, args.output_dir, args.prefix)
>> -    gen_introspect(schema, args.output_dir, args.prefix, args.unmask)
>> +        print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
>> +        return 1
>> +    return 0
> 
> Subtle change: you move the gen_FOO() into the try ... except.  Okay;
> they don't raise QAPIError, but perhaps worth a mention in the commit
> message.
> 
>>   
>>   
>>   if __name__ == '__main__':
>> -    main(sys.argv)
>> +    sys.exit(main())
> 
> "Python was designed to be easy to understand and fun to use."
> Ha ha ha.
> 
Here's a Fixup that requires more (but obvious) Fixups to later patches 
in this series. (The next patch needs the same changes re-applied to the 
now-moved file.)

A note: I add a FIXME, but when I respin my error series, it will take 
care of this piece. This is just the quickest, dumbest way to victory in 
the interim. It is not worth engineering a better solution, because 
there is one waiting in part 4 already.

(Future knowledge: I add a QAPIError that does not define its arguments 
that inherits Exception and is used as the basis for all error classes 
in QAPI; and the contextual error that requires "info" is changed to 
inherit from QAPIError. This is useful as a "package-level" error, one 
in which that *all* errors in this package inherit from. We already 
achieve that, but we needed a more general form to serve as the root of 
that inheritance tree.)


diff --git a/scripts/qapi-gen.py b/scripts/qapi-gen.py
index 117b396a595..c62c4e93323 100644
--- a/scripts/qapi-gen.py
+++ b/scripts/qapi-gen.py
@@ -22,10 +22,6 @@
  from qapi.visit import gen_visit


-DEFAULT_OUTPUT_DIR = ''
-DEFAULT_PREFIX = ''
-
-
  def generate(schema_file: str,
               output_dir: str,
               prefix: str,
@@ -68,10 +64,10 @@ def main() -> int:
      parser.add_argument('-b', '--builtins', action='store_true',
                          help="generate code for built-in types")
      parser.add_argument('-o', '--output-dir', action='store',
-                        default=DEFAULT_OUTPUT_DIR,
+                        default='',
                          help="write output to directory OUTPUT_DIR")
      parser.add_argument('-p', '--prefix', action='store',
-                        default=DEFAULT_PREFIX,
+                        default='',
                          help="prefix for symbols")
      parser.add_argument('-u', '--unmask-non-abi-names', 
action='store_true',
                          dest='unmask',
diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index ae60d9e2fe8..f5a818ae35f 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -21,6 +21,9 @@ def __init__(self, info, col, msg):

      def __str__(self):
+        # FIXME: We need a general-purpose no-context error class.
+        if not self.info:
+            return self.msg
          loc = str(self.info)
          if self.col is not None:
              assert self.info.line is not None
              loc += ':%s' % self.col


