Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD252F5528
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 00:22:48 +0100 (CET)
Received: from localhost ([::1]:56988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzpTT-0002qm-BY
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 18:22:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzpRW-00027K-CF
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:20:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzpRT-0000ve-Ic
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610580042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgqJAvx6yz8NSasuoDRzrACXUEJbS/dlJDJXK5uamnI=;
 b=CCXDM5xwiJ5LXarpFmComTQRfcgCiJuv5tbdOyTk5ePlFLfgYCtNwsXaRg/8e7pU61oiW9
 VsxrVMgPBikyrmukEhVeJAPVG6BU45iQxmnN8aJc0NA1zC2wFPnw6pdjIg83sfbtYhRPZ2
 v28qG06V7MR1rmHfI5zB469mhkAYADM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-oR09SptgNlStwQ1KqlAIZw-1; Wed, 13 Jan 2021 18:20:40 -0500
X-MC-Unique: oR09SptgNlStwQ1KqlAIZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC637190A7A0;
 Wed, 13 Jan 2021 23:20:38 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF495D71F;
 Wed, 13 Jan 2021 23:20:36 +0000 (UTC)
Subject: Re: [PATCH v6 10/11] iotests: rewrite check into python
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-11-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <50b239fc-8105-2491-09d6-687c5826de23@redhat.com>
Date: Wed, 13 Jan 2021 17:20:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109122631.167314-11-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

On 1/9/21 6:26 AM, Vladimir Sementsov-Ogievskiy wrote:
> Just use classes introduced in previous three commits. Behavior
> difference is described in these three commits.
> 
> Drop group file, as it becomes unused.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/check | 994 ++-------------------------------------
>  tests/qemu-iotests/group | 321 -------------
>  2 files changed, 28 insertions(+), 1287 deletions(-)
>  delete mode 100644 tests/qemu-iotests/group

The bulk of the work was done in the earlier patches, and my python
review is weak; but I can confirm that with this patch applied, my usual
attempts at running ./check still appeared to work for me.  That's not
the same as proving you did 1:1 feature translation (and in fact, your
commit message documented dropping some features like -v), but if 'make
check' and CI tools still run, I'm okay leaving it up to developers to
complain about any other feature that they used but which go missing (or
to implement it).

Tested-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 952762d5ed..48bb3128c3 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -1,7 +1,8 @@
> -#!/usr/bin/env bash
> +#!/usr/bin/env python3
>  #
> -# Copyright (C) 2009 Red Hat, Inc.
> -# Copyright (c) 2000-2002,2006 Silicon Graphics, Inc.  All Rights Reserved.
> +# Configure environment and run group of tests in it.
> +#
> +# Copyright (c) 2020 Virtuozzo International GmbH

You may want to claim 2021 as well.

> +import sys
> +import os
> +from findtests import find_tests, TestFinder
> +from testenv import TestEnv
> +from testrunner import TestRunner
> +
> +if __name__ == '__main__':
> +    if len(sys.argv) == 2 and sys.argv[1] in ['-h', '--help']:
> +        print('Usage: ./check [options] [testlist]')
> +        print()
> +        TestFinder.get_argparser().print_help()
> +        print()
> +        TestEnv.get_argparser().print_help()
> +        print()
> +        TestRunner.get_argparser().print_help()
> +        exit()
> +
> +    env = TestEnv(sys.argv[1:])
> +    tests, remaining_argv = find_tests(env.remaining_argv,
> +                                       test_dir=env.source_iotests)
> +
> +    with TestRunner(remaining_argv, env) as tr:
> +        assert not tr.remaining_argv
> +        tr.run_tests([os.path.join(env.source_iotests, t) for t in tests])

A lot shorter for the main engine ;)

> diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
> deleted file mode 100644
> index bc5bc324fe..0000000000
> --- a/tests/qemu-iotests/group
> +++ /dev/null
> @@ -1,321 +0,0 @@
> -#
> -# QA groups control file
> -# Defines test groups

Happy to see this conflict magnet go!

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


