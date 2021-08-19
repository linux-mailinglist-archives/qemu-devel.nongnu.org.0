Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A980F3F1E2A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:39:54 +0200 (CEST)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGl57-0004TY-PH
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGl2o-0000XZ-A5
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGl2k-0008Em-Sj
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629391046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJXVlVh3PEbm/tKm2zuoUraOq6sI0ExwGw4Hd8knJCk=;
 b=PHSzHA2jcI241lVrima3QCisjxoYD/oQFVIH4LEVNZpop08ZeOpoItLq+J79jEsM8seudO
 NgTKMxgp9K6L9RRUzrFOikSipy0HguKUPlyHLJsArBe/wwZKUYnFjqNMIxzXvbnLiN4IvK
 /Kv9w0ZnnkDdgbEImMcXB+asU8PUwhE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-dvBo__PvN4OwMFUCR1iqVQ-1; Thu, 19 Aug 2021 12:37:23 -0400
X-MC-Unique: dvBo__PvN4OwMFUCR1iqVQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so1861444wru.19
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RJXVlVh3PEbm/tKm2zuoUraOq6sI0ExwGw4Hd8knJCk=;
 b=bISrkpqH8RJACeSqNgOdiiBkGAhMeuG5Qb7VI/7a2lQi0TLXnv2qDqyErKWOXgQY/a
 ruIfpqVebJRd6R5gGHW9wwNXG7Xb+2GjxRWtb7olaLD4ggA191DC8O8rjMkeuy/u2RwN
 M4qGM/vTytgmVualJ99X/E8bi2itlBGFssRe9iQuP22NvWpkmURYvcMv5x0SJAIDeUzS
 2GiAe4DaP57bdmIJMr/TzOHrdiJw0R8Tv5zseK+xiCoB7vvv0ycHqD1GwXE9Y/RUobVs
 WFzT0tPkLpqgY/ZCJS4N83CsjW7qImecdJU1U1Ni41WE7zP/rOKdHJHHrHIu3Fg5nxV2
 eUOg==
X-Gm-Message-State: AOAM531D2QVsD8qv4l0t2gNT8waPICGJZf5ea9kIWarGGNTbm6hV7ErU
 rxfIxJx6r/rT5106WvQ6mvxKaRLmJ0b89a43KADignu+2ADXBcq5VdaSVwVHBk35CGrzLfBwdpu
 mCjum8TxEPQKsJP8=
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr4993976wrw.368.1629391042075; 
 Thu, 19 Aug 2021 09:37:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9fgqV2pD522aHq9ixVdQk79tUp/s+iGAExLalE44PgE5Twe4RfQ2S8aFc0nwR8Cm2G+TQfA==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr4993950wrw.368.1629391041814; 
 Thu, 19 Aug 2021 09:37:21 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 p14sm8063850wmi.42.2021.08.19.09.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 09:37:21 -0700 (PDT)
Subject: Re: [PATCH 1/3] simplebench: add img_bench_templater.py
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
 <20210724133846.64614-2-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <784f21b4-f990-f0af-1f24-caa2c66144bf@redhat.com>
Date: Thu, 19 Aug 2021 18:37:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210724133846.64614-2-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.07.21 15:38, Vladimir Sementsov-Ogievskiy wrote:
> Add simple grammar-parsing template benchmark.

This doesn’t really say much, and FWIW, for like ten minutes I thought 
this would do something completely different than it did (while I was 
trying to parse the help text).

(I thought this was about formatting an existing test’s output, and that 
“template” were kind of the wrong word, but then it turned out it’s 
exactly the right word, only that this is not about using a test’s 
output as a template, but actually using a template of a test (i.e. a 
test template, not a template test) to generate test instances to 
run...  Which of course is much cooler.)

Functionality-wise, as far as I understand (of course I have no 
knowledge of lark), this looks good to me.  And it’s really quite cool.

I just found the documentation confusing, so I have some suggestions for 
it below.

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/img_bench_templater.py | 85 ++++++++++++++++++++++
>   scripts/simplebench/table_templater.py     | 62 ++++++++++++++++
>   2 files changed, 147 insertions(+)
>   create mode 100755 scripts/simplebench/img_bench_templater.py
>   create mode 100644 scripts/simplebench/table_templater.py
>
> diff --git a/scripts/simplebench/img_bench_templater.py b/scripts/simplebench/img_bench_templater.py
> new file mode 100755
> index 0000000000..d18a243d35
> --- /dev/null
> +++ b/scripts/simplebench/img_bench_templater.py
> @@ -0,0 +1,85 @@
> +#!/usr/bin/env python3
> +#
> +# Run img-bench template tests
> +#
> +# Copyright (c) 2021 Virtuozzo International GmbH.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +
> +import sys
> +import subprocess
> +import re
> +import json
> +
> +import simplebench
> +from results_to_text import results_to_text
> +from table_templater import Templater
> +
> +
> +def bench_func(env, case):
> +    test = templater.gen(env['data'], case['data'])
> +
> +    p = subprocess.run(test, shell=True, stdout=subprocess.PIPE,
> +                       stderr=subprocess.STDOUT, universal_newlines=True)
> +
> +    if p.returncode == 0:
> +        try:
> +            m = re.search(r'Run completed in (\d+.\d+) seconds.', p.stdout)
> +            return {'seconds': float(m.group(1))}
> +        except Exception:
> +            return {'error': f'failed to parse qemu-img output: {p.stdout}'}
> +    else:
> +        return {'error': f'qemu-img failed: {p.returncode}: {p.stdout}'}
> +
> +
> +if __name__ == '__main__':
> +    if len(sys.argv) > 1:
> +        print("""
> +Usage: no arguments. Just pass template test to stdin. Template test is

FWIW, I completely misunderstood this.

At first, this sounded really ambiguous to me; then I thought that 
clearly this must mean that one should pipe the test’s output to this 
script, i.e.

$ path/to/test.sh | scripts/simplebench/img_bench_templater.py

But now after reading more, I finally understand that this is not what 
is meant, but actually literally passing some template of a test script 
to this script, i.e.

$ scripts/simplebench/img_bench_templater.py < path/to/test-template.sh

So, two things; first, I believe it should be a “test template”, not a 
“template test”, because this is about templates for a test, not about a 
test that has something to do with templates.

Second, perhaps we should start with what this does.

Perhaps:

“This script generates performance tests from a test template (example 
below), runs them, and displays the results in a table. The template is 
read from stdin.  It must be written in bash and end with a `qemu-img 
bench` invocation (whose result is parsed to get the test instance’s 
result).”?

> +a bash script, last command should be qemu-img bench (it's output is parsed
> +to get a result). For templating use the following synax:

“Use the following syntax in the template to create the various 
different test instances:”?

> +
> +  column templating: {var1|var2|...} - test will use different values in
> +  different columns. You may use several {} constructions in the test, in this
> +  case product of all choice-sets will be used.
> +
> +  row templating: [var1|var2|...] - similar thing to define rows (test-cases)
> +
> +Test tempalate example:

*template

> +
> +Assume you want to compare two qemu-img binaries, called qemu-img-old and
> +qemu-img-new in your build directory in two test-cases with 4K writes and 64K
> +writes. Test may look like this:

I’d prefer s/Test/The template/.

> +
> +qemu_img=/path/to/qemu/build/qemu-img-{old|new}
> +$qemu_img create -f qcow2 /ssd/x.qcow2 1G
> +$qemu_img bench -c 100 -d 8 [-s 4K|-s 64K] -w -t none -n /ssd/x.qcow2
> +
> +If pass it to stdin of img_bench_templater.py, the resulting comparison table

s/If pass it/When passing this/

> +will contain two columns (for two binaries) and two rows (for two test-cases).
> +""")
> +        sys.exit()
> +
> +    templater = Templater(sys.stdin.read())
> +
> +    envs = [{'id': ' / '.join(x), 'data': x} for x in templater.columns]
> +    cases = [{'id': ' / '.join(x), 'data': x} for x in templater.rows]
> +
> +    result = simplebench.bench(bench_func, envs, cases, count=5,
> +                               initial_run=False)
> +    print(results_to_text(result))
> +    with open('results.json', 'w') as f:
> +        json.dump(result, f, indent=4)

Is this worth documenting?

> diff --git a/scripts/simplebench/table_templater.py b/scripts/simplebench/table_templater.py
> new file mode 100644
> index 0000000000..950f3b3024
> --- /dev/null
> +++ b/scripts/simplebench/table_templater.py
> @@ -0,0 +1,62 @@
> +# Parser for test templates
> +#
> +# Copyright (c) 2021 Virtuozzo International GmbH.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +import itertools
> +from lark import Lark
> +
> +grammar = """
> +start: ( text | column_switch | row_switch )+
> +
> +column_switch: "{" text ["|" text]+ "}"
> +row_switch: "[" text ["|" text]+ "]"
> +text: /[^|{}\[\]]+/

So I have no idea how this really works, of course, but does this mean 
that the `text` pattern cannot contain pipe symbols?  I.e. that you 
cannot use pipes in the test template?

Hanna

> +"""
> +
> +parser = Lark(grammar)
> +
> +class Templater:
> +    def __init__(self, template):
> +        self.tree = parser.parse(template)
> +
> +        c_switches = []
> +        r_switches = []
> +        for x in self.tree.children:
> +            if x.data == 'column_switch':
> +                c_switches.append([el.children[0].value for el in x.children])
> +            elif x.data == 'row_switch':
> +                r_switches.append([el.children[0].value for el in x.children])
> +
> +        self.columns = list(itertools.product(*c_switches))
> +        self.rows = list(itertools.product(*r_switches))
> +
> +    def gen(self, column, row):
> +        i = 0
> +        j = 0
> +        result = []
> +
> +        for x in self.tree.children:
> +            if x.data == 'text':
> +                result.append(x.children[0].value)
> +            elif x.data == 'column_switch':
> +                result.append(column[i])
> +                i += 1
> +            elif x.data == 'row_switch':
> +                result.append(row[j])
> +                j += 1
> +
> +        return ''.join(result)


