Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C65B2FF1FD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:32:59 +0100 (CET)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dpK-00015p-7O
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2dfu-0001do-B0
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:23:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2dfq-0001RL-7o
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611249788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VCcbgOW5Wz91xzlbj7g+RTjBSK9SIniN07w1BYnktEY=;
 b=Y0gM/XSBPeno55F8MmWz4YO2hTbideSrZ6ZDuUk7XyLh1/M5FPGK2bfJDJa4sw6qTPdi0a
 e9QHUplJzhl1pQw1cz8zIy00wX4M8nTs8IitnFRpRozV9+p5iQBfFU5WnT6s2blknTotcV
 7T2ZswmFJ1fr9s52ALy9LJxbU8cihKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-W1fT8cTkMkiPa7Q5M58SBw-1; Thu, 21 Jan 2021 12:23:03 -0500
X-MC-Unique: W1fT8cTkMkiPa7Q5M58SBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A80E180E460;
 Thu, 21 Jan 2021 17:23:01 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A106D60BF3;
 Thu, 21 Jan 2021 17:23:00 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-11-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v7 10/11] iotests: rewrite check into python
Message-ID: <4b50156b-e5ca-f3f4-32de-6ce540640aef@redhat.com>
Date: Thu, 21 Jan 2021 11:22:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-11-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/21 7:44 AM, Vladimir Sementsov-Ogievskiy wrote:
> Just use classes introduced in previous three commits. Behavior
> difference is described in these three commits.
> 
> Drop group file, as it becomes unused.
> 
> Drop common.env: now check is in python, and for tests we use same
> python interpreter that runs the check itself. Use build environment
> PYTHON in check-block instead, to keep "make check" use the same
> python.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

> +++ b/tests/qemu-iotests/check
> @@ -1,7 +1,8 @@
> -#!/usr/bin/env bash
> +#!/usr/bin/env python3
>  #
> -# Copyright (C) 2009 Red Hat, Inc.
> -# Copyright (c) 2000-2002,2006 Silicon Graphics, Inc.  All Rights Reserved.
> +# Configure environment and run group of tests in it.
> +#
> +# Copyright (c) 2020-2021 Virtuozzo International GmbH

Normally dropping old copyrights is suspicious, but as this is a
complete rewrite, it makes sense here.

> -exit
> +import os
> +import sys
> +import argparse
> +from findtests import TestFinder
> +from testenv import TestEnv
> +from testrunner import TestRunner
> +
> +
> +def make_argparser() -> argparse.ArgumentParser:
> +    p = argparse.ArgumentParser(description="Test run options")
> +
> +    p.add_argument('-n', '--dry-run', action='store_true',
> +                   help='show me, do not run tests')
> +    p.add_argument('-makecheck', action='store_true',
> +                   help='pretty print output for make check')
> +
> +    p.add_argument('-d', dest='debug', action='store_true', help='debug')
> +    p.add_argument('-misalign', action='store_true',
> +                   help='misalign memory allocations')
> +
> +    g_env = p.add_argument_group('test environment options')
> +    mg = g_env.add_mutually_exclusive_group()
> +    # We don't set default for cachemode, as we need to distinguish dafult

default

> +    # from user input later.
> +    mg.add_argument('-nocache', dest='cachemode', action='store_const',
> +                    const='none', help='set cache mode "none" (O_DIRECT), '
> +                    'sets CACHEMODE environment variable')
> +    mg.add_argument('-c', dest='cachemode',
> +                    help='sets CACHEMODE environment variable')
> +
> +    g_env.add_argument('-i', dest='aiomode', default='threads',
> +                       help='sets AIOMODE environment variable')
> +
> +    p.set_defaults(imgfmt='raw', imgproto='file')
> +
> +    format_list = ['raw', 'bochs', 'cloop', 'parallels', 'qcow', 'qcow2',
> +                   'qed', 'vdi', 'vpc', 'vhdx', 'vmdk', 'luks', 'dmg']
> +    g_fmt = p.add_argument_group(
> +        '  image format options',
> +        'The following options set the IMGFMT environment variable. '
> +        'At most one choice is allowed, default is "raw"')
> +    mg = g_fmt.add_mutually_exclusive_group()
> +    for fmt in format_list:
> +        mg.add_argument('-' + fmt, dest='imgfmt', action='store_const',
> +                        const=fmt, help=f'test {fmt}')
> +
> +    protocol_list = ['file', 'rbd', 'sheepdoc', 'nbd', 'ssh', 'nfs',

sheepdog

> +                     'fuse']
> +    g_prt = p.add_argument_group(
> +        '  image protocol options',
> +        'The following options set the IMGPROTO environment variable. '
> +        'At most one choice is allowed, default is "file"')
> +    mg = g_prt.add_mutually_exclusive_group()
> +    for prt in protocol_list:
> +        mg.add_argument('-' + prt, dest='imgproto', action='store_const',
> +                        const=prt, help=f'test {prt}')
> +
> +    g_bash = p.add_argument_group('bash tests options',
> +                                  'The following options are ignored by '
> +                                  'python tests.')
> +    # TODO: make support for the following options in iotests.py
> +    g_bash.add_argument('-o', dest='imgopts',
> +                        help='options to pass to qemu-img create/convert, '
> +                        'sets IMGOPTS environment variable')
> +    g_bash.add_argument('-valgrind', dest='VALGRIND_QEMU',
> +                        action='store_const', const='y',
> +                        help='use valgrind, sets VALGRIND_QEMU environment '
> +                        'variable')
> +
> +    g_sel = p.add_argument_group('test selecting options',
> +                                 'The following options specify test set '
> +                                 'to run.')
> +    g_sel.add_argument('-g', '--groups', metavar='group1,...',
> +                       help='include tests from these groups')
> +    g_sel.add_argument('-x', '--exclude-groups', metavar='group1,...',
> +                       help='exclude tests from these groups')
> +    g_sel.add_argument('--start-from', metavar='TEST',
> +                       help='Start from specified test: make sorted sequence '
> +                       'of tests as usual and then drop tests from the first '
> +                       'one to TEST (not inclusive). This may be used to '
> +                       'rerun failed ./check command, starting from the '
> +                       'middle of the process.')
> +    g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
> +                       help='tests to run')
> +
> +    return p

The change to drop ranges and instead use --start-from makes sense (you
can't do ranges of named files); it will take a minor adjustment to my
keyboarding habits to get used to, but I don't see it as a show-stopper
as iotests are for developers and not promised to be a stable interface.

> +
> +
> +if __name__ == '__main__':
> +    args = make_argparser().parse_args()
> +
> +    env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
> +                  aiomode=args.aiomode, cachemode=args.cachemode,
> +                  imgopts=args.imgopts, misalign=args.misalign,
> +                  debug=args.debug)
> +
> +    testfinder = TestFinder(test_dir=env.source_iotests)
> +
> +    groups = args.groups.split(',') if args.groups else None
> +    x_groups = args.exlude_groups.split(',') if args.exclude_groups else None
> +
> +    try:
> +        tests = testfinder.find_tests(groups=groups, exclude_groups=x_groups,
> +                                      tests=args.tests,
> +                                      start_from=args.start_from)
> +        if not tests:
> +            raise ValueError('No tests selected')
> +    except ValueError as e:
> +        sys.exit(e)
> +
> +    if args.dry_run:
> +        print('\n'.join(tests))
> +    else:
> +        with TestRunner(env, args.makecheck) as tr:
> +            tr.run_tests([os.path.join(env.source_iotests, t) for t in tests])

Other than the typo, this looks like a fairly straightforward conversion
of the old shell code, but at present, I'm only comfortable giving:

Tested-by: Eric Blake <eblake@redhat.com>

(of course assuming you fix the typo that broke ./check -sheepdog)

The longer we sit on this series, the more merge conflicts it will
introduce (new tests need to add their own #group header line); the
changes to fix those conflicts should be obvious, but I hope we get
another reviewer soon.  I'm wondering if I should take the second half
of this series (since I already sent the pull request for the first half
since it touched NBD tests), or let Max take it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


