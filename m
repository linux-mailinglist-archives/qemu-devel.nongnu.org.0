Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F809300844
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 17:09:44 +0100 (CET)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2z0J-0006hV-8r
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 11:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2yyv-0005KJ-3h
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:08:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2yyr-00021h-Vf
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611331691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y+g/ocM/V10d0IZAqkp0rKZ1jX5iQljRGGro64GiU+o=;
 b=W9vo5guH5UaX8dgzrck1vhRJeLFpN2mkTKWzRi30PNk/Jy5mcktgBB2peS8Qt+3JV0hdPF
 Z8QQ155n/n9s6MfwVOet9WsZAwi9Rkm7I4ZuwilZTHOvz8spu9nArDk/wwLzq7jZmDOULW
 slEa5TGaKoXgVYw4fyLx3Wmt8yyKua4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-ZExRwlTpNo21ohpK1xKSMg-1; Fri, 22 Jan 2021 11:08:09 -0500
X-MC-Unique: ZExRwlTpNo21ohpK1xKSMg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D312780A5C1;
 Fri, 22 Jan 2021 16:08:07 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 149BC10016F7;
 Fri, 22 Jan 2021 16:08:05 +0000 (UTC)
Date: Fri, 22 Jan 2021 17:08:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 10/11] iotests: rewrite check into python
Message-ID: <20210122160804.GJ15866@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-11-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210116134424.82867-11-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
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

> diff --git a/tests/check-block.sh b/tests/check-block.sh
> index fb4c1baae9..26eb1c0a9b 100755
> --- a/tests/check-block.sh
> +++ b/tests/check-block.sh
> @@ -69,7 +69,7 @@ export QEMU_CHECK_BLOCK_AUTO=1
>  
>  ret=0
>  for fmt in $format_list ; do
> -    ./check -makecheck -$fmt $group || ret=1
> +    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
>  done

When I add an echo to print that command line, it seems that ${PYTHON}
is empty for me. Is this expected?

>  exit $ret
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 952762d5ed..914321806a 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
[...]
> -
> -# Set qemu-io cache mode with $CACHEMODE we have
> -QEMU_IO_OPTIONS="$QEMU_IO_OPTIONS --cache $CACHEMODE"
> -# Set qemu-io aio mode with $AIOMODE we have
> -QEMU_IO_OPTIONS="$QEMU_IO_OPTIONS --aio $AIOMODE"
> -
> -QEMU_IO_OPTIONS_NO_FMT="$QEMU_IO_OPTIONS"

TestEnv sets the attribute, but forgets to include
QEMU_IO_OPTIONS_NO_FMT in env_variables, so I think it's not actually
exported.

> -if [ "$IMGOPTSSYNTAX" != "true" ]; then
> -    QEMU_IO_OPTIONS="$QEMU_IO_OPTIONS -f $IMGFMT"
> -fi
> -
> -# Set default options for qemu-img create -o if they were not specified
> -if [ "$IMGFMT" == "qcow2" ] && ! (echo "$IMGOPTS" | grep "compat=" > /dev/null); then
> -    IMGOPTS=$(_optstr_add "$IMGOPTS" "compat=1.1")
> -fi

You dropped this one, which makes sense because it's already the default
in 'qemu-img create'. Maybe the commit message could mention it as a
difference.

> -if [ "$IMGFMT" == "luks" ] && ! (echo "$IMGOPTS" | grep "iter-time=" > /dev/null); then
> -    IMGOPTS=$(_optstr_add "$IMGOPTS" "iter-time=10")
> -fi
> -if [ "$IMGFMT" == "vmdk" ] && ! (echo "$IMGOPTS" | grep "zeroed_grain=" > /dev/null); then
> -    IMGOPTS=$(_optstr_add "$IMGOPTS" "zeroed_grain=on")
> -fi
> -
> -if [ -z "$SAMPLE_IMG_DIR" ]; then
> -        SAMPLE_IMG_DIR="$source_iotests/sample_images"
> -fi
> -
> -export TEST_DIR
> -export SOCK_DIR
> -export SAMPLE_IMG_DIR
> -
> -if [ -s $tmp.list ]
> -then
> -    # found some valid test numbers ... this is good
> -    :
> -else
> -    if $have_test_arg
> -    then
> -        # had test numbers, but none in group file ... do nothing
> -        touch $tmp.list
> -    else
> -        # no test numbers, do everything from group file
> -        sed -n -e '/^[0-9][0-9][0-9]*/s/^\([0-9]*\).*/\1/p' <"$source_iotests/group" >$tmp.list
> -    fi
> -fi
> -
> -# should be sort -n, but this did not work for Linux when this
> -# was ported from IRIX
> -#
> -list=$(sort $tmp.list)
> -rm -f $tmp.list $tmp.tmp $tmp.sed
> -
> -if [ -z "$QEMU_PROG" ]
> -then
> -    if [ -x "$build_iotests/qemu" ]; then
> -        export QEMU_PROG="$build_iotests/qemu"
> -    elif [ -x "$build_root/qemu-system-${qemu_arch}" ]; then
> -        export QEMU_PROG="$build_root/qemu-system-${qemu_arch}"
> -    else
> -        pushd "$build_root" > /dev/null
> -        for binary in qemu-system-*
> -        do
> -            if [ -x "$binary" ]
> -            then
> -                export QEMU_PROG="$build_root/$binary"
> -                break
> -            fi
> -        done
> -        popd > /dev/null
> -        [ "$QEMU_PROG" = "" ] && _init_error "qemu not found"
> -    fi

I think this else branch is kind of important (if there is no system
emulator binary for the host architecture, find _any_ system emulator
binary that was built). I can't find its equivalent in the new code.

> -fi
> -export QEMU_PROG="$(type -p "$QEMU_PROG")"
> -
> -export QEMU_OPTIONS="-nodefaults -display none -accel qtest"
> -case "$QEMU_PROG" in
> -    *qemu-system-arm|*qemu-system-aarch64)
> -        export QEMU_OPTIONS="$QEMU_OPTIONS -machine virt"
> -        ;;
> -    *qemu-system-avr)
> -        export QEMU_OPTIONS="$QEMU_OPTIONS -machine mega2560"
> -        ;;
> -    *qemu-system-rx)
> -        export QEMU_OPTIONS="$QEMU_OPTIONS -machine gdbsim-r5f562n8"
> -        ;;
> -    *qemu-system-tricore)
> -        export QEMU_OPTIONS="-$QEMU_OPTIONS -machine tricore_testboard"
> -        ;;
> -esac
> -
> -if [ -z "$QEMU_IMG_PROG" ]; then
> -    if [ -x "$build_iotests/qemu-img" ]; then
> -        export QEMU_IMG_PROG="$build_iotests/qemu-img"
> -    elif [ -x "$build_root/qemu-img" ]; then
> -        export QEMU_IMG_PROG="$build_root/qemu-img"
> -    else
> -        _init_error "qemu-img not found"
> -    fi
> -fi
> -export QEMU_IMG_PROG="$(type -p "$QEMU_IMG_PROG")"
> -
> -if [ -z "$QEMU_IO_PROG" ]; then
> -    if [ -x "$build_iotests/qemu-io" ]; then
> -        export QEMU_IO_PROG="$build_iotests/qemu-io"
> -    elif [ -x "$build_root/qemu-io" ]; then
> -        export QEMU_IO_PROG="$build_root/qemu-io"
> -    else
> -        _init_error "qemu-io not found"
> -    fi
> -fi
> -export QEMU_IO_PROG="$(type -p "$QEMU_IO_PROG")"
> -
> -if [ -z $QEMU_NBD_PROG ]; then
> -    if [ -x "$build_iotests/qemu-nbd" ]; then
> -        export QEMU_NBD_PROG="$build_iotests/qemu-nbd"
> -    elif [ -x "$build_root/qemu-nbd" ]; then
> -        export QEMU_NBD_PROG="$build_root/qemu-nbd"
> -    else
> -        _init_error "qemu-nbd not found"
> -    fi
> -fi
> -export QEMU_NBD_PROG="$(type -p "$QEMU_NBD_PROG")"
> -
> -if [ -z "$QSD_PROG" ]; then
> -    if [ -x "$build_iotests/qemu-storage-daemon" ]; then
> -        export QSD_PROG="$build_iotests/qemu-storage-daemon"
> -    elif [ -x "$build_root/storage-daemon/qemu-storage-daemon" ]; then
> -        export QSD_PROG="$build_root/storage-daemon/qemu-storage-daemon"
> -    else
> -        _init_error "qemu-storage-daemon not found"
> -    fi
> -fi
> -export QSD_PROG="$(type -p "$QSD_PROG")"
> -
> -if [ -x "$build_iotests/socket_scm_helper" ]
> -then
> -    export SOCKET_SCM_HELPER="$build_iotests/socket_scm_helper"
> -fi
> -
> -python_usable=false
> -if $PYTHON -c 'import sys; sys.exit(0 if sys.version_info >= (3,6) else 1)'

This is not checked any more. Probably okay because building QEMU
already requires 3.6 now.

> -then
> -    # Our python framework also requires virtio-blk
> -    if "$QEMU_PROG" -M none -device help | grep -q virtio-blk >/dev/null 2>&1

It looks like we lost this check, too? This will probably cause failures
on more exotic architectures.

> -    then
> -        python_usable=true
> -    else
> -        python_unusable_because="Missing virtio-blk in QEMU binary"
> -    fi
> -else
> -    python_unusable_because="Unsupported Python version"
> -fi
[...]
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

-valgrind is parsed, but the result is never used.

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

s/exlude_groups/exclude_groups/

Here the squashed in part:

>     group_local = os.path.join(env.source_iotests, 'group.local')
>     if os.path.isfile(group_local):
>         try:
>             testfinder.add_group_file(group_local)
>         except ValueError as e:
>             sys.exit(f"Filed to parse group file '{group_local}': {e}")

s/Filed/Failed/

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

Maybe it would be worth catching KeyboardInterrupt somewhere? I always
get frightened when I press Ctrl-C and get a stack trace. :-)

Could even be done in the TestRunner, so that the result summary can
still be printed for those tests that were already completed.

Kevin


