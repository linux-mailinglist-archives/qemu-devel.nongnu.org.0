Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28FD31B7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 21:53:29 +0200 (CEST)
Received: from localhost ([::1]:43822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIeV6-000404-Kj
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 15:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38420)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iIeS9-0002aZ-RQ
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iIeS8-0005mb-NN
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:50:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36370)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iIeS6-0005lh-Ck; Thu, 10 Oct 2019 15:50:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61F5E3018ECB;
 Thu, 10 Oct 2019 19:50:21 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB816100EBD9;
 Thu, 10 Oct 2019 19:50:20 +0000 (UTC)
Subject: Re: [PATCH 04/23] iotests: Filter $SOCK_DIR
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191010152457.17713-1-mreitz@redhat.com>
 <20191010152457.17713-5-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <727638b4-8588-76eb-1428-9b2a9a8df380@redhat.com>
Date: Thu, 10 Oct 2019 14:50:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191010152457.17713-5-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 10 Oct 2019 19:50:21 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/19 10:24 AM, Max Reitz wrote:
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/common.filter | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 

> @@ -218,7 +221,8 @@ _filter_nbd()
>       # Filter out the TCP port number since this changes between runs.
>       $SED -e '/nbd\/.*\.c:/d' \
>           -e 's#127\.0\.0\.1:[0-9]*#127.0.0.1:PORT#g' \
> -        -e "s#?socket=$TEST_DIR#?socket=TEST_DIR#g" \
> +        -e "s#?socket=$SOCK_DIR#?socket=TEST_DIR#g" \
> +        -e "s#?socket=$SOCK_DIR#?socket=SOCK_DIR#g" \
>           -e 's#\(foo\|PORT/\?\|.sock\): Failed to .*$#\1#'

This goes away in 23, but this looks crazy.  Don't you really want the 
first line to replace $TEST_DIR with TEST_DIR (not $SOCK_DIR with 
TEST_DIR)?  Otherwise, bisection is likely to break until all the 
intermediate patches have made the conversion to stop using TEST_DIR.

I already gave R-b, but you'll need to fix this one.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

