Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FDE1B784F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 16:29:51 +0200 (CEST)
Received: from localhost ([::1]:39777 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRzKv-0008MM-KJ
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 10:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRzJA-0005FA-SO
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:28:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRzJA-0001ON-DJ
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:28:00 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21793
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jRzJA-0001MG-0r
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 10:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587738478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGNTA+SHNQqhjVk8UDZN/nvsSiL/57vMc6AvvbcnvHA=;
 b=QFQTQGqR3lr5GgIHhvS8g8/oYC+n8c4CeAJDzJzTrNBLrRwjY+NiKn37qtk21pzto5Gmxl
 uLWwKGNfCHbTv7iRDeeRBX4J0aO/dE28shUf2j488BKTkOPJ1vodzf3kDLUfQ0qO6YtaWt
 Ar28kOLBEIDSWVKv1BTsb0fipZSBMXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-Sh8Beyf_Pyu68GgHBgCbOg-1; Fri, 24 Apr 2020 10:27:57 -0400
X-MC-Unique: Sh8Beyf_Pyu68GgHBgCbOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45A30107ACF2;
 Fri, 24 Apr 2020 14:27:56 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C2B56084A;
 Fri, 24 Apr 2020 14:27:55 +0000 (UTC)
Subject: Re: [PATCH] iotests/041: Fix NBD socket path
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200424134626.78945-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ebe8f6d0-c111-8472-4391-315d2fca50e8@redhat.com>
Date: Fri, 24 Apr 2020 09:27:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424134626.78945-1-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 02:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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

On 4/24/20 8:46 AM, Max Reitz wrote:
> We should put all UNIX socket files into the sock_dir, not test_dir.
> 
> Reported-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/041 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

I'm happy to queue this through my NBD tree, if you don't beat me to it 
through an iotest pull request.

> diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
> index 5d67bf14bf..46bf1f6c81 100755
> --- a/tests/qemu-iotests/041
> +++ b/tests/qemu-iotests/041
> @@ -35,7 +35,7 @@ quorum_img3 = os.path.join(iotests.test_dir, 'quorum3.img')
>   quorum_repair_img = os.path.join(iotests.test_dir, 'quorum_repair.img')
>   quorum_snapshot_file = os.path.join(iotests.test_dir, 'quorum_snapshot.img')
>   
> -nbd_sock_path = os.path.join(iotests.test_dir, 'nbd.sock')
> +nbd_sock_path = os.path.join(iotests.sock_dir, 'nbd.sock')
>   
>   class TestSingleDrive(iotests.QMPTestCase):
>       image_len = 1 * 1024 * 1024 # MB
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


