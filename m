Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56925D61C4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 13:54:14 +0200 (CEST)
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJyvV-000252-Dx
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 07:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iJyPw-00085K-GM
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:21:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iJyPv-0006bl-AS
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:21:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34102)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iJyPs-0006XU-Eo; Mon, 14 Oct 2019 07:21:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ADEDF308FC23;
 Mon, 14 Oct 2019 11:21:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8096608A5;
 Mon, 14 Oct 2019 11:21:27 +0000 (UTC)
Date: Mon, 14 Oct 2019 13:21:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 4/5] iotests: Skip "make check-block" if QEMU does not
 support virtio-blk
Message-ID: <20191014112126.GF7173@localhost.localdomain>
References: <20191011145047.19051-1-thuth@redhat.com>
 <20191011145047.19051-5-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011145047.19051-5-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 14 Oct 2019 11:21:31 +0000 (UTC)
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.10.2019 um 16:50 hat Thomas Huth geschrieben:
> The next patch is going to add some python-based tests to the "auto"
> group, and these tests require virtio-blk to work properly. Running
> iotests without virtio-blk likely does not make too much sense anyway,
> so instead of adding a check for the availability of virtio-blk to each
> and every test (which does not sound very appealing), let's rather add
> a check for this at the top level in the check-block.sh script instead
> (so that it is possible to run "make check" without the "check-block"
> part for qemu-system-tricore for example).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/check-block.sh | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/check-block.sh b/tests/check-block.sh
> index 679aedec50..7582347ec2 100755
> --- a/tests/check-block.sh
> +++ b/tests/check-block.sh
> @@ -26,10 +26,24 @@ if grep -q "CFLAGS.*-fsanitize" config-host.mak 2>/dev/null ; then
>      exit 0
>  fi
>  
> -if [ -z "$(find . -name 'qemu-system-*' -print)" ]; then
> +if [ -n "$QEMU_PROG" ]; then
> +    qemu_prog="$QEMU_PROG"
> +else
> +    for binary in *-softmmu/qemu-system-* ; do
> +        if [ -x "$binary" ]; then
> +            qemu_prog="$binary"
> +            break
> +        fi

Wouldn't it be better to check the availability of virtio-blk here, so
that if the current binary doesn't support it, we keep searching and
maybe pick up a different binary that supports it?

Or actually, should we work with a whitelist? We already need separate
code for s390 and x86_64 in some places to choose between -pci and -ccw,
and the presence of some virtio-blk doesn't mean that we know the
specifics of how to add a virtio-blk device for this target. This
suggests that blindly using a random binary might not be possible, but
tests may have to be adapted before the target can be whitelisted.

Kevin

> +    done
> +fi
> +if [ -z "$qemu_prog" ]; then
>      echo "No qemu-system binary available ==> Not running the qemu-iotests."
>      exit 0
>  fi
> +if ! "$qemu_prog" -M none -device help | grep virtio-blk >/dev/null 2>&1 ; then
> +    echo "$qemu_prog does not support virtio-blk ==> Not running the qemu-iotests."
> +    exit 0
> +fi
>  
>  if ! command -v bash >/dev/null 2>&1 ; then
>      echo "bash not available ==> Not running the qemu-iotests."
> -- 
> 2.18.1
> 

