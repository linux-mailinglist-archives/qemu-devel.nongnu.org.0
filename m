Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAD32DF3A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 02:48:12 +0100 (CET)
Received: from localhost ([::1]:43270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHzZb-0005cW-Km
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 20:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHzYo-000570-NW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:47:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHzYn-0002dS-CV
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614908840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lp414zuE8WhOHjoVcnUPrtYl8xWum1tMdwstdGHwclM=;
 b=GVVMhi48irNvdS56PXoe3h5g1fD7k1csq2xSECCCcjSjgRC+/djTB9+j8vEGu8zCK7SqtY
 ZQtdHOWQ4nMEYERzPm1m0cAc0cU58ial0lZzhearSlDuKpNR3AWUcFPD1lDtK/UaEzu1gm
 2NJ0gjxGCv/hIXdgl0hZWQ9m4mT99gU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-cg02LBgBPdyOIRHpL2XMnw-1; Thu, 04 Mar 2021 20:47:17 -0500
X-MC-Unique: cg02LBgBPdyOIRHpL2XMnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C799F80006E;
 Fri,  5 Mar 2021 01:47:15 +0000 (UTC)
Received: from [10.10.118.103] (ovpn-118-103.rdu2.redhat.com [10.10.118.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AEAA60C0F;
 Fri,  5 Mar 2021 01:47:15 +0000 (UTC)
Subject: Re: [PATCH v2 5/8] simplebench/bench_block_job: handle error in
 BLOCK_JOB_COMPLETED
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
 <20210304101738.20248-6-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <3c5b3169-f3c2-77aa-6a23-ed61b26d32f1@redhat.com>
Date: Thu, 4 Mar 2021 20:47:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304101738.20248-6-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 5:17 AM, Vladimir Sementsov-Ogievskiy wrote:
> We should not report success if there is an error in final event.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/bench_block_job.py | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
> index 8f8385ccce..71d2e489c8 100755
> --- a/scripts/simplebench/bench_block_job.py
> +++ b/scripts/simplebench/bench_block_job.py
> @@ -70,6 +70,10 @@ def bench_block_job(cmd, cmd_args, qemu_args):
>               vm.shutdown()
>               return {'error': 'block-job failed: ' + str(e),
>                       'vm-log': vm.get_log()}
> +        if 'error' in e['data']:
> +            vm.shutdown()
> +            return {'error': 'block-job failed: ' + e['data']['error'],
> +                    'vm-log': vm.get_log()}
>           end_ms = e['timestamp']['seconds'] * 1000000 + \
>               e['timestamp']['microseconds']
>       finally:
> 

"Yes, the block job completed -- but not how you wanted it to."

Reviewed-by: John Snow <jsnow@redhat.com>


