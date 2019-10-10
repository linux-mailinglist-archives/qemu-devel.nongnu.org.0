Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF79D31B8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 21:54:06 +0200 (CEST)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIeVh-0004nc-UR
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 15:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iIeT2-00039S-GQ
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:51:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iIeT1-0006Jw-B0
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:51:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56420)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iIeSx-0006Hc-Da; Thu, 10 Oct 2019 15:51:15 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 886683090FDE;
 Thu, 10 Oct 2019 19:51:14 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1938F1001B08;
 Thu, 10 Oct 2019 19:51:14 +0000 (UTC)
Subject: Re: [PATCH 23/23] iotests: Drop TEST_DIR filter from _filter_nbd
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191010152457.17713-1-mreitz@redhat.com>
 <20191010152457.17713-24-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f4348129-7979-57db-0619-aa97130d1014@redhat.com>
Date: Thu, 10 Oct 2019 14:51:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191010152457.17713-24-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 10 Oct 2019 19:51:14 +0000 (UTC)
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
> Sockets should be placed into $SOCK_DIR instead of $TEST_DIR, so remove
> the $TEST_DIR filter from _filter_nbd.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/common.filter | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
> index cd42f5e7e3..f870e00e44 100644
> --- a/tests/qemu-iotests/common.filter
> +++ b/tests/qemu-iotests/common.filter
> @@ -221,7 +221,6 @@ _filter_nbd()
>       # Filter out the TCP port number since this changes between runs.
>       $SED -e '/nbd\/.*\.c:/d' \
>           -e 's#127\.0\.0\.1:[0-9]*#127.0.0.1:PORT#g' \
> -        -e "s#?socket=$SOCK_DIR#?socket=TEST_DIR#g" \
>           -e "s#?socket=$SOCK_DIR#?socket=SOCK_DIR#g" \

Whoops - you have a bug in patch 4.  Once that is fixed, then deleting 
the line:

         -e "s#?socket=$TEST_DIR#?socket=TEST_DIR#g" \

here is appropriate.  So with that amendment to the series,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

