Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E687145C3C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 20:06:20 +0100 (CET)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuLKU-00071l-Hw
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 14:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39180)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iuLJN-0006Rh-PU
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 14:05:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iuLJM-00026l-Ch
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 14:05:09 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31184
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iuLJM-00026Z-94
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 14:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579719908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30SZmRA2xejv59ZfqompxqAfZvFjDxyeRp/UL9zGzLs=;
 b=h8m3RQ/CrduWXWiwYyAgeEPM3b7s2FItK1lrO98GQRX4sK5ATziA28Ybs9l8o4z1bXD6d0
 zfWHEebATxbS3Smr17IYNjCLMgS+q1qbnv9kkl6Bq9nYAJ5i/FFNVmNmV5h7C6No2PEfYc
 J8eMqPbkjaSNOACPzDGncaUbrZCQvfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Z0Nuf2D2PMue-L3cV-bJZw-1; Wed, 22 Jan 2020 14:05:03 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD1968010CC;
 Wed, 22 Jan 2020 19:05:02 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8C286106E;
 Wed, 22 Jan 2020 19:05:01 +0000 (UTC)
Subject: Re: [PATCH v2 5/5] iotests: Add test for image creation fallback
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200122164532.178040-1-mreitz@redhat.com>
 <20200122164532.178040-6-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <066405c1-83be-cddc-929a-9eaf628360f8@redhat.com>
Date: Wed, 22 Jan 2020 13:05:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122164532.178040-6-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Z0Nuf2D2PMue-L3cV-bJZw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/20 10:45 AM, Max Reitz wrote:
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

> +
> +_make_test_img 64M
> +
> +echo
> +echo '--- Testing creation ---'
> +
> +$QEMU_IMG create -f qcow2 "$TEST_IMG" 64M | _filter_img_create
> +$QEMU_IMG info "$TEST_IMG" | _filter_img_info
> +
> +echo
> +echo '--- Testing creation for which the node would need to grow ---'
> +
> +$QEMU_IMG create -f qcow2 -o preallocation=metadata "$TEST_IMG" 64M 2>&1 \
> +    | _filter_img_create
> +
> +# success, all done
> +echo "*** done"
> +rm -f $seq.full
> +status=0
> diff --git a/tests/qemu-iotests/259.out b/tests/qemu-iotests/259.out

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


