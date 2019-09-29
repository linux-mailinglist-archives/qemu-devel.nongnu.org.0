Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142D0C1660
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Sep 2019 18:53:07 +0200 (CEST)
Received: from localhost ([::1]:41120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEcRV-0000H7-UO
	for lists+qemu-devel@lfdr.de; Sun, 29 Sep 2019 12:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55432)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iEc9N-0001q3-R7
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 12:34:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iEc9M-0005cH-HZ
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 12:34:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60342)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iEc9J-0005Z0-Ql; Sun, 29 Sep 2019 12:34:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1AF6AC049E17;
 Sun, 29 Sep 2019 16:34:17 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D42CF60C05;
 Sun, 29 Sep 2019 16:34:15 +0000 (UTC)
Message-ID: <037a6ded4b29435dec32fe71f12613315915aeca.camel@redhat.com>
Subject: Re: [PATCH 14/18] iotests: Make 110 work with data_file
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Date: Sun, 29 Sep 2019 19:34:14 +0300
In-Reply-To: <20190927094242.11152-15-mreitz@redhat.com>
References: <20190927094242.11152-1-mreitz@redhat.com>
 <20190927094242.11152-15-mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Sun, 29 Sep 2019 16:34:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2019-09-27 at 11:42 +0200, Max Reitz wrote:
> The only difference is that the json:{} filename of the image looks
> different.  We actually do not care about that filename in this test, we
> are only interested in (1) that there is a json:{} filename, and (2)
> whether the backing filename can be constructed.
> 
> So just filter out the json:{} data, thus making this test pass both
> with and without data_file.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/110     | 7 +++++--
>  tests/qemu-iotests/110.out | 4 ++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/110 b/tests/qemu-iotests/110
> index f78df0e6e1..34459dcd60 100755
> --- a/tests/qemu-iotests/110
> +++ b/tests/qemu-iotests/110
> @@ -67,6 +67,7 @@ echo
>  # Across blkdebug without a config file, you cannot reconstruct filenames, so
>  # qemu is incapable of knowing the directory of the top image from the filename
>  # alone. However, using bdrv_dirname(), it should still work.
> +# (Filter out the json:{} filename so this test works with external data files)
>  TEST_IMG="json:{
>      'driver': '$IMGFMT',
>      'file': {
> @@ -82,7 +83,8 @@ TEST_IMG="json:{
>              }
>          ]
>      }
> -}" _img_info | _filter_img_info | grep -v 'backing file format'
> +}" _img_info | _filter_img_info | grep -v 'backing file format' \
> +    | sed -e 's#^image: json:.*#image: json:{ /* filtered */ }#'
>  
>  echo
>  echo '=== Backing name is always relative to the backed image ==='
> @@ -114,7 +116,8 @@ TEST_IMG="json:{
>              }
>          ]
>      }
> -}" _img_info | _filter_img_info | grep -v 'backing file format'
> +}" _img_info | _filter_img_info | grep -v 'backing file format' \
> +    | sed -e 's#^image: json:.*#image: json:{ /* filtered */ }#'
>  
>  
>  # success, all done
> diff --git a/tests/qemu-iotests/110.out b/tests/qemu-iotests/110.out
> index f60b26390e..f835553a99 100644
> --- a/tests/qemu-iotests/110.out
> +++ b/tests/qemu-iotests/110.out
> @@ -11,7 +11,7 @@ backing file: t.IMGFMT.base (actual path: TEST_DIR/t.IMGFMT.base)
>  
>  === Non-reconstructable filename ===
>  
> -image: json:{"driver": "IMGFMT", "file": {"set-state.0.event": "read_aio", "image": {"driver": "file", "filename": "TEST_DIR/t.IMGFMT"}, "driver": "blkdebug", "set-state.0.new_state": 42}}
> +image: json:{ /* filtered */ }
>  file format: IMGFMT
>  virtual size: 64 MiB (67108864 bytes)
>  backing file: t.IMGFMT.base (actual path: TEST_DIR/t.IMGFMT.base)
> @@ -22,7 +22,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=t.IMGFMT.b
>  
>  === Nodes without a common directory ===
>  
> -image: json:{"driver": "IMGFMT", "file": {"children": [{"driver": "file", "filename": "TEST_DIR/t.IMGFMT"}, {"driver": "file", "filename": "TEST_DIR/t.IMGFMT.copy"}], "driver": "quorum", "vote-
> threshold": 1}}
> +image: json:{ /* filtered */ }
>  file format: IMGFMT
>  virtual size: 64 MiB (67108864 bytes)
>  backing file: t.IMGFMT.base (cannot determine actual path)

Again, maybe put that into the common.filter, so new tests won't need to copy&paste this?
Also maybe remove the image name completely from output, thus not needing the more complex regex?

Best regards,
	Maxim Levitsky



