Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614592F856D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 20:29:47 +0100 (CET)
Received: from localhost ([::1]:54286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Un4-00027B-EW
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 14:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0Ukx-0000zI-Mi
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:27:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0Uku-0004eC-8L
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610738849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+znXuIJJW3/ro4R22FFVgxw8vFyvVEkb6484PQXKko=;
 b=aZYhgZC1/RHcpKj+VKFafA+s4gOczUN6ao7rMNRIgApsKkunOu87d/NEyuK8IEm49KwnAI
 OcvzGL6flAgOfUbkxy4l3BueFDArRM8UCp6QugXMtn7G/uaJr41MA67jTx13mTwUtwIVYX
 GLdD8S9/hZwZXqvSRwKv50KFWMhTucg=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-yppq83d7MA6oMazVUbTveQ-1; Fri, 15 Jan 2021 14:27:26 -0500
X-MC-Unique: yppq83d7MA6oMazVUbTveQ-1
Received: by mail-ua1-f70.google.com with SMTP id 62so1597239uak.18
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 11:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z+znXuIJJW3/ro4R22FFVgxw8vFyvVEkb6484PQXKko=;
 b=Bc9iZfAbTZ+3W2OHt5fnnXaQZh0oVEHWizYKBMJKKxMaFEmIuQyRvsdyrI239lx0gE
 fZ9ZEjZUldaQ/SdFGMfBd803hqxzjurCxS1YkHWYCFvdcPsgu0d+Bi3J+d1fPNc6uXCd
 V2WbtXe7HkW+/u6kZFVJbKOmVxlgKUIUN6iLeoVDkavYN7FUwYGKJ9zbLQmZu16NdzKw
 DOopvYO+LcMrK2klIVTcEIOin3YR2kXdtaMktxpU+ynL9t9BFg/uzv+VAc4j5F4adqFu
 9kqi4uhdba/fVlyRB4WcATGjQCdBvch8cKvO9HjN5ZNuu9mZIFF4pZnNkJu+jFG/dgso
 jkWQ==
X-Gm-Message-State: AOAM532ALwFE6NgJYxNnULp+XEw5BLGR/2ptrCuaN6XurDBjx0lQBKvR
 a2wM8D61rlEphlAMK3Ini0aHhdAsXGuvvuns/2oSxNYox6KaOd7CQA7EiEeU5WFlsD8FeSekEEU
 FFhUtj/0Bq2yeSA2aE34hMhRgk1UtNgQ=
X-Received: by 2002:ab0:6f97:: with SMTP id f23mr10398871uav.5.1610738846307; 
 Fri, 15 Jan 2021 11:27:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGm/0ZK65cDeOxhi/mDVkv4KQogSWKnIyHIGAWDXMMsEuOmNnBlRDdlkKn3+tBZK7nfgcORhOji3Oh8C64oMI=
X-Received: by 2002:ab0:6f97:: with SMTP id f23mr10398845uav.5.1610738845971; 
 Fri, 15 Jan 2021 11:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20210115174315.30949-1-mreitz@redhat.com>
 <20210115174315.30949-3-mreitz@redhat.com>
In-Reply-To: <20210115174315.30949-3-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 16:27:00 -0300
Message-ID: <CAKJDGDbf=bWEuR-LkOJNN5t9EDYR7kqcb-6DDBskX-aPntjhzg@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] iotests/297: Rewrite in Python and extend reach
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 2:43 PM Max Reitz <mreitz@redhat.com> wrote:
>
> Instead of checking iotests.py only, check all Python files in the
> qemu-iotests/ directory.  Of course, most of them do not pass, so there
> is an extensive skip list for now.  (The only files that do pass are
> 209, 254, 283, and iotests.py.)
>
> (Alternatively, we could have the opposite, i.e. an explicit list of
> files that we do want to check, but I think it is better to check files
> by default.)
>
> Unless started in debug mode (./check -d), the output has no information
> on which files are tested, so we will not have a problem e.g. with
> backports, where some files may be missing when compared to upstream.
>
> Besides the technical rewrite, some more things are changed:
>
> - For the pylint invocation, PYTHONPATH is adjusted.  This mirrors
>   setting MYPYPATH for mypy.
>
> - Also, MYPYPATH is now derived from PYTHONPATH, so that we include
>   paths set by the environment.  Maybe at some point we want to let the
>   check script add '../../python/' to PYTHONPATH so that iotests.py does
>   not need to do that.
>
> - Passing --notes=FIXME,XXX to pylint suppresses warnings for TODO
>   comments.  TODO is fine, we do not need 297 to complain about such
>   comments.
>
> - The "Success" line from mypy's output is suppressed, because (A) it
>   does not add useful information, and (B) it would leak information
>   about the files having been tested to the reference output, which we
>   decidedly do not want.
>
> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/297     | 110 +++++++++++++++++++++++++++++--------
>  tests/qemu-iotests/297.out |   5 +-
>  2 files changed, 90 insertions(+), 25 deletions(-)
>
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index 5c5420712b..fa9e2cac78 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env bash
> +#!/usr/bin/env python3
>  #
>  # Copyright (C) 2020 Red Hat, Inc.
>  #
> @@ -15,30 +15,96 @@
>  # You should have received a copy of the GNU General Public License
>  # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>
> -seq=$(basename $0)
> -echo "QA output created by $seq"
> +import os
> +import re
> +import shutil
> +import subprocess
> +import sys
>
> -status=1       # failure is the default!
> +import iotests
>
> -# get standard environment
> -. ./common.rc
>
> -if ! type -p "pylint-3" > /dev/null; then
> -    _notrun "pylint-3 not found"
> -fi
> -if ! type -p "mypy" > /dev/null; then
> -    _notrun "mypy not found"
> -fi
> +# TODO: Empty this list!
> +SKIP_FILES = (
> +    '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
> +    '096', '118', '124', '129', '132', '136', '139', '147', '148', '149',
> +    '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
> +    '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
> +    '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
> +    '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
> +    '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
> +    '299', '300', '302', '303', '304', '307',
> +    'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
> +)
>
> -pylint-3 --score=n iotests.py
>
> -MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
> -    --disallow-any-generics --disallow-incomplete-defs \
> -    --disallow-untyped-decorators --no-implicit-optional \
> -    --warn-redundant-casts --warn-unused-ignores \
> -    --no-implicit-reexport iotests.py
> +def is_python_file(filename):
> +    if not os.path.isfile(filename):
> +        return False
>
> -# success, all done
> -echo "*** done"
> -rm -f $seq.full
> -status=0
> +    if filename.endswith('.py'):
> +        return True
> +
> +    with open(filename) as f:
> +        try:
> +            first_line = f.readline()
> +            return re.match('^#!.*python', first_line) is not None
> +        except UnicodeDecodeError:  # Ignore binary files
> +            return False
> +
> +
> +def run_linters():
> +    files = [filename for filename in (set(os.listdir('.')) - set(SKIP_FILES))
> +             if is_python_file(filename)]
> +
> +    iotests.logger.debug('Files to be checked:')
> +    iotests.logger.debug(', '.join(sorted(files)))
> +
> +    print('=== pylint ===')
> +    sys.stdout.flush()
> +
> +    # Todo notes are fine, but fixme's or xxx's should probably just be
> +    # fixed (in tests, at least)
> +    env = os.environ.copy()
> +    try:
> +        env['PYTHONPATH'] += ':../../python/'

Do you have any objection to using os.path.dirname and os.path.join
here? This would make the code more pythonic.

> +    except KeyError:
> +        env['PYTHONPATH'] = '../../python/'

Same here. You could do it once, before the 'try' and use it inside.

Other than that,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


