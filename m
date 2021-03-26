Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E88349E30
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:42:20 +0100 (CET)
Received: from localhost ([::1]:60618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaYN-0000Zk-8V
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPaWl-00083O-2Q
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 20:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPaWg-0001b1-PQ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 20:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616719232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7mqHcJCH3x7awnXGQlLfmxhTOyKBRLelfIAqd6Na0Y=;
 b=ctGraLuTKG8bs+9Tw7IjQnkoGER0eYZwdZZagVrNQoJnwzyOgWSGCdgqXnqPOMe3MQECeY
 /YQkblSVEwvuQFjOaPKDHTHe5vHfNHeJYc8jvd9uSc5nW0iabJpsXLT2JkA553RDM2JMev
 CoCkROWC+G0OV1LJBdVfDdCJL1nx6qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-J_RgnWXxNGmQVOSKBU2PbA-1; Thu, 25 Mar 2021 20:40:29 -0400
X-MC-Unique: J_RgnWXxNGmQVOSKBU2PbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 082B7107ACCD;
 Fri, 26 Mar 2021 00:40:28 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1FBF1972B;
 Fri, 26 Mar 2021 00:40:26 +0000 (UTC)
Subject: Re: [PATCH v4 00/19] qapi: static typing conversion, pt3
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210325060356.4040114-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <29167224-8eb8-4ecb-523e-dd535037ff7e@redhat.com>
Date: Thu, 25 Mar 2021 20:40:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 2:03 AM, John Snow wrote:
> Hi, this series adds static types to the QAPI module.
> This is part three, and it focuses on expr.py.
> 
> Environment:
> - Python >= 3.6, <= 3.8 *
> - mypy >= 0.770
> - pylint >= 2.6.0
> - flake8
> - isort
> 
> Every commit should pass with (from ./scripts/):
>   - flake8 qapi/
>   - pylint --rcfile=qapi/pylintrc qapi/
>   - mypy --config-file=qapi/mypy.ini qapi/
>   - pushd qapi && isort -c . && popd
> 
> V4:
> 
> Patch 2 is exploratory.
> Patch 8 is broken and should be merged into Patch 9.
> Patches 17-19 are optional and I'd sooner you drop them than have to respin.
> 
> 001/19:[down] 'qapi/expr: Comment cleanup'
> 002/19:[down] 'flake8: Enforce shorter line length for comments and docstrings'
> 003/19:[----] [--] 'qapi/expr.py: Remove 'info' argument from nested check_if_str'
> 004/19:[----] [--] 'qapi/expr.py: Check for dict instead of OrderedDict'
> 005/19:[0011] [FC] 'qapi/expr.py: constrain incoming expression types'
> 006/19:[0006] [FC] 'qapi/expr.py: Add assertion for union type 'check_dict''
> 007/19:[----] [--] 'qapi/expr.py: move string check upwards in check_type'
> 008/19:[down] 'qapi: add tests for invalid 'data' field type'
> 009/19:[0004] [FC] 'qapi/expr.py: Check type of 'data' member'
> 010/19:[0008] [FC] 'qapi/expr.py: Add casts in a few select cases'
> 011/19:[0005] [FC] 'qapi/expr.py: Modify check_keys to accept any Collection'
> 012/19:[0057] [FC] 'qapi/expr.py: add type hint annotations'
> 013/19:[0032] [FC] 'qapi/expr.py: Consolidate check_if_str calls in check_if'
> 014/19:[0016] [FC] 'qapi/expr.py: Remove single-letter variable'
> 015/19:[----] [--] 'qapi/expr.py: enable pylint checks'
> 016/19:[0168] [FC] 'qapi/expr.py: Add docstrings'
> 017/19:[----] [-C] 'qapi/expr.py: Use tuples instead of lists for static data'
> 018/19:[----] [-C] 'qapi/expr.py: move related checks inside check_xxx functions'
> 019/19:[0003] [FC] 'qapi/expr.py: Use an expression checker dispatch table'
> 
> - Add test patch to demonstrate 72col docstring enforcement. (Not a fan.)
> - Changed MutableMapping type to regular ol' dict.
> - Added tests for alternate and union to see what happens when we pass a list
>    for 'data' instead. (It crashes.)
> - Rewrote a bunch of the docstrings.
> - Updated type hints for rc0
> - Rebased on latest master, incorporating latest qapi changes.
> - Addressed most feedback, some exceptions;
>    - Kept isinstance check for dict; it is strictly more convenient to me and it
>      does not cause breakages. It won't cause breakages.
> 
> RFCs/notes:
> 
> - I'd be flabbergasted if anyone reads these.
> 
> John Snow (19):
>    qapi/expr: Comment cleanup
>    flake8: Enforce shorter line length for comments and docstrings
>    qapi/expr.py: Remove 'info' argument from nested check_if_str
>    qapi/expr.py: Check for dict instead of OrderedDict
>    qapi/expr.py: constrain incoming expression types
>    qapi/expr.py: Add assertion for union type 'check_dict'
>    qapi/expr.py: move string check upwards in check_type
>    qapi: add tests for invalid 'data' field type
>    qapi/expr.py: Check type of 'data' member
>    qapi/expr.py: Add casts in a few select cases
>    qapi/expr.py: Modify check_keys to accept any Collection
>    qapi/expr.py: add type hint annotations
>    qapi/expr.py: Consolidate check_if_str calls in check_if
>    qapi/expr.py: Remove single-letter variable
>    qapi/expr.py: enable pylint checks
>    qapi/expr.py: Add docstrings
>    qapi/expr.py: Use tuples instead of lists for static data
>    qapi/expr.py: move related checks inside check_xxx functions
>    qapi/expr.py: Use an expression checker dispatch table
> 
>   scripts/qapi/.flake8                          |   1 +
>   scripts/qapi/common.py                        |   8 +-
>   scripts/qapi/events.py                        |   9 +-
>   scripts/qapi/expr.py                          | 499 +++++++++++++-----
>   scripts/qapi/gen.py                           |   8 +-
>   scripts/qapi/introspect.py                    |   8 +-
>   scripts/qapi/main.py                          |   4 +-
>   scripts/qapi/mypy.ini                         |   5 -
>   scripts/qapi/parser.py                        |  15 +-
>   scripts/qapi/pylintrc                         |   1 -
>   scripts/qapi/schema.py                        |  23 +-
>   scripts/qapi/types.py                         |   7 +-
>   .../alternate-invalid-data-type.err           |   2 +
>   .../alternate-invalid-data-type.json          |   4 +
>   .../alternate-invalid-data-type.out           |   0
>   tests/qapi-schema/meson.build                 |   2 +
>   tests/qapi-schema/union-invalid-data-type.err |   2 +
>   .../qapi-schema/union-invalid-data-type.json  |  13 +
>   tests/qapi-schema/union-invalid-data-type.out |   0
>   19 files changed, 449 insertions(+), 162 deletions(-)
>   create mode 100644 tests/qapi-schema/alternate-invalid-data-type.err
>   create mode 100644 tests/qapi-schema/alternate-invalid-data-type.json
>   create mode 100644 tests/qapi-schema/alternate-invalid-data-type.out
>   create mode 100644 tests/qapi-schema/union-invalid-data-type.err
>   create mode 100644 tests/qapi-schema/union-invalid-data-type.json
>   create mode 100644 tests/qapi-schema/union-invalid-data-type.out
> 

To https://gitlab.com/jsnow/qemu.git
  + ba5dba933a...e5f101c2f1 python-qapi-cleanup-pt3 -> 
python-qapi-cleanup-pt3 (forced update)

Should include all of the feedback from the list today, I didn't send it 
back out to list to see what happens with the giant docstring patch.


