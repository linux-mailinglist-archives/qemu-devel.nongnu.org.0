Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D479D31B3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 21:50:09 +0200 (CEST)
Received: from localhost ([::1]:43782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIeRs-00012K-3F
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 15:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iIeOn-0007sq-Qt
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iIeOl-0004mZ-Me
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:46:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21421)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iIeOf-0004kw-RL; Thu, 10 Oct 2019 15:46:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E762518C8902;
 Thu, 10 Oct 2019 19:46:48 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 769F75D6B2;
 Thu, 10 Oct 2019 19:46:48 +0000 (UTC)
Subject: Re: [PATCH 21/23] iotests/240: Create socket in $SOCK_DIR
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191010152457.17713-1-mreitz@redhat.com>
 <20191010152457.17713-22-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <60f9be44-da26-33ec-24a5-759b7277647f@redhat.com>
Date: Thu, 10 Oct 2019 14:46:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191010152457.17713-22-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Thu, 10 Oct 2019 19:46:48 +0000 (UTC)
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
>   tests/qemu-iotests/240 | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/240 b/tests/qemu-iotests/240
> index f73bc07d80..8b4337b58d 100755
> --- a/tests/qemu-iotests/240
> +++ b/tests/qemu-iotests/240
> @@ -29,7 +29,7 @@ status=1	# failure is the default!
>   
>   _cleanup()
>   {
> -    rm -f "$TEST_DIR/nbd"
> +    rm -f "$SOCK_DIR/nbd"
>   }
>   trap "_cleanup; exit \$status" 0 1 2 3 15
>   
> @@ -135,7 +135,7 @@ echo
>   run_qemu <<EOF
>   { "execute": "qmp_capabilities" }
>   { "execute": "blockdev-add", "arguments": {"driver": "null-co", "read-zeroes": true, "node-name": "hd0", "read-only": true}}
> -{ "execute": "nbd-server-start", "arguments": {"addr":{"type":"unix","data":{"path":"$TEST_DIR/nbd"}}}}
> +{ "execute": "nbd-server-start", "arguments": {"addr":{"type":"unix","data":{"path":"$SOCK_DIR/nbd"}}}}
>   { "execute": "nbd-server-add", "arguments": {"device":"hd0"}}
>   { "execute": "object-add", "arguments": {"qom-type": "iothread", "id": "iothread0"}}
>   { "execute": "device_add", "arguments": {"id": "scsi0", "driver": "${virtio_scsi}", "iothread": "iothread0"}}
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

