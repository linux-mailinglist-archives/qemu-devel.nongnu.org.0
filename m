Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E453E2F4D95
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:49 +0100 (CET)
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhU0-0006NK-Vb
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzhRh-0005fs-FE
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzhRb-00050i-Jk
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610549294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=og7N9jXuhJxxPc9iJt3sCKmHBUST633DqW6co6gxs2Q=;
 b=c7h2Oe0o+1t9lXM2J0VjBPi2x9GDslZMsJ4MXz160aVLFCSfqR8XW8mkCgrnoSn+y/mMxo
 ULFbxCGSO/X/ygW+gwASC+ZdbqU3deRAim87gfv6SAiwG2O9YT8z1U33t1TZ3++YpkdWqT
 OWQf0FlTOx8oUzuFaYggLf5H5kOWcqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-3vk7U8rvNROgSAbNSQJg4A-1; Wed, 13 Jan 2021 09:48:12 -0500
X-MC-Unique: 3vk7U8rvNROgSAbNSQJg4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E003D8144E2;
 Wed, 13 Jan 2021 14:48:11 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EEDA1F0;
 Wed, 13 Jan 2021 14:48:11 +0000 (UTC)
Subject: Re: [PATCH 3/7] iotests/129: Do not check @busy
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-4-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <80c7fac7-8422-c7e5-f841-db1d9004b64e@redhat.com>
Date: Wed, 13 Jan 2021 08:48:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113140616.150283-4-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 8:06 AM, Max Reitz wrote:
> @busy is false when the job is paused, which happens all the time
> because that is how jobs yield (e.g. for mirror at least since commit
> 565ac01f8d3).
> 
> Back when 129 was added (2015), perhaps there was no better way of
> checking whether the job was still actually running.  Now we have the
> @status field (as of 58b295ba52c, i.e. 2018), which can give us exactly
> that information.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/129 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index 2fc65ada6a..dd23bb2e5a 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -69,7 +69,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>          result = self.vm.qmp("stop")
>          self.assert_qmp(result, 'return', {})
>          result = self.vm.qmp("query-block-jobs")
> -        self.assert_qmp(result, 'return[0]/busy', True)
> +        self.assert_qmp(result, 'return[0]/status', 'running')
>          self.assert_qmp(result, 'return[0]/ready', False)
>  
>      def test_drive_mirror(self):
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


