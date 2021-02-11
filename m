Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309DC318F10
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:47:51 +0100 (CET)
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEC5-0006IX-Uj
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lAE81-0004QO-OW; Thu, 11 Feb 2021 10:43:37 -0500
Received: from relay64.bu.edu ([128.197.228.104]:47180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lAE7y-0004iP-K9; Thu, 11 Feb 2021 10:43:36 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11BFgS33026575
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 11 Feb 2021 10:42:31 -0500
Date: Thu, 11 Feb 2021 10:42:28 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default
 with 'null-co' driver
Message-ID: <20210211154228.izwdqb33dxtnu65n@mozz.bu.edu>
References: <20210211142656.3818078-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210211142656.3818078-1-philmd@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210211 1526, Philippe Mathieu-Daudé wrote:
> The null-co driver doesn't zeroize buffer in its default config,
> because it is designed for testing and tests want to run fast.
> However this confuses security researchers (access to uninit
> buffers).
> 

Interesting.. Is there an example bug report, where it raised alarms
because of an un-zeroed null-co:// buffer?
-Alex

> A one-line patch supposed which became a painful one, because
> there is so many different syntax to express the same usage:
> 
>  opt = qdict_new();
>  qdict_put_str(opt, "read-zeroes", "off");
>  null_bs = bdrv_open("null-co://", NULL, opt, BDRV_O_RDWR | BDRV_O_PROTOCOL,
>                      &error_abort);
> 
> vm.qmp('blockdev-add', driver='null-co', read_zeroes=False, ...)
> 
> vm.add_drive_raw("id=drive0,driver=null-co,read-zeroes=off,if=none")
> 
>     blk0 = { 'node-name': 'src',
>         'driver': 'null-co',
>         'read-zeroes': 'off' }
> 
>     'file': {
>         'driver': 'null-co',
>         'read-zeroes': False,
>     }
> 
>     "file": {
>         "driver": "null-co",
>         "read-zeroes": "off"
>     }
> 
>     { "execute": "blockdev-add",
>       "arguments": {
>           "driver": "null-co",
>           "read-zeroes": false,
>           "node-name": "disk0"
>         }
>     }
> 
> opts = {'driver': 'null-co,read-zeroes=off', 'node-name': 'root', 'size': 1024}
> 
> qemu -drive driver=null-co,read-zeroes=off
> 
> qemu-io ... "json:{'driver': 'null-co', 'read-zeroes': false, 'size': 65536}"
> 
> qemu-img null-co://,read-zeroes=off
> 
> qemu-img ... -o data_file="json:{'driver':'null-co',,'read-zeroes':false,,'size':'4294967296'}"
> 
> There are probably more.
> 
> Anyhow, the iotests I am not sure and should be audited are 056, 155
> (I don't understand the syntax) and 162.
> 
> Please review,
> 
> Phil.
> 
> Philippe Mathieu-Daud=C3=A9 (2):
>   block: Explicit null-co uses 'read-zeroes=3Dfalse'
>   block/null: Enable 'read-zeroes' mode by default
> 
>  docs/devel/testing.rst                     | 14 +++++++-------
>  tests/qtest/fuzz/generic_fuzz_configs.h    | 11 ++++++-----
>  block/null.c                               |  2 +-
>  tests/test-bdrv-drain.c                    | 10 ++++++++--
>  tests/acceptance/virtio_check_params.py    |  2 +-
>  tests/perf/block/qcow2/convert-blockstatus |  6 +++---
>  tests/qemu-iotests/040                     |  2 +-
>  tests/qemu-iotests/041                     | 12 ++++++++----
>  tests/qemu-iotests/051                     |  2 +-
>  tests/qemu-iotests/051.out                 |  2 +-
>  tests/qemu-iotests/051.pc.out              |  4 ++--
>  tests/qemu-iotests/087                     |  6 ++++--
>  tests/qemu-iotests/118                     |  2 +-
>  tests/qemu-iotests/133                     |  2 +-
>  tests/qemu-iotests/153                     |  8 ++++----
>  tests/qemu-iotests/184                     |  2 ++
>  tests/qemu-iotests/184.out                 | 10 +++++-----
>  tests/qemu-iotests/218                     |  3 +++
>  tests/qemu-iotests/224                     |  3 ++-
>  tests/qemu-iotests/224.out                 |  8 ++++----
>  tests/qemu-iotests/225                     |  2 +-
>  tests/qemu-iotests/227                     |  4 ++--
>  tests/qemu-iotests/227.out                 |  4 ++--
>  tests/qemu-iotests/228                     |  2 +-
>  tests/qemu-iotests/235                     |  1 +
>  tests/qemu-iotests/245                     |  2 +-
>  tests/qemu-iotests/270                     |  2 +-
>  tests/qemu-iotests/283                     |  3 ++-
>  tests/qemu-iotests/283.out                 |  4 ++--
>  tests/qemu-iotests/299                     |  1 +
>  tests/qemu-iotests/299.out                 |  2 +-
>  tests/qemu-iotests/300                     |  4 ++--
>  32 files changed, 82 insertions(+), 60 deletions(-)
> 
> --=20
> 2.26.2
> 
> 

