Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7A304B94
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 22:32:42 +0100 (CET)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Vx3-0004sO-Ks
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 16:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l4Vuv-0003pe-Rx
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:30:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l4Vup-0001ox-7p
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611696622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGUY0B7ekf2Udf3K3MjX1udBg9zT8yQNoDuLmidOrds=;
 b=R54w2HlWEw5EKZZ05cZTikKxWaeDTzS/wgPOskkfrriC53FEEvkI62uGWS/4G/ANa0kf1P
 FMjQV0X3o6IQfiPdCMsFdTPsdz1DeA7Ql9Izhb1ILStJWG6M5GrjyOA98wGpgijAuh/JPX
 lVoLFZ5G7Ie2bt2xX2HqU3lydLjTE88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-Of3azrrLOz6Qr7yjpPrfrQ-1; Tue, 26 Jan 2021 16:30:19 -0500
X-MC-Unique: Of3azrrLOz6Qr7yjpPrfrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A56A8017FB;
 Tue, 26 Jan 2021 21:30:18 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1AF85D760;
 Tue, 26 Jan 2021 21:30:15 +0000 (UTC)
Subject: Re: [PATCH v5 03/10] iotests: Move try_remove to iotests.py
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210118105720.14824-1-mreitz@redhat.com>
 <20210118105720.14824-4-mreitz@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <591e79e6-a54d-0bb7-2ea5-e7cb2877d27e@redhat.com>
Date: Tue, 26 Jan 2021 16:30:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118105720.14824-4-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 5:57 AM, Max Reitz wrote:
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   tests/qemu-iotests/124        |  8 +-------
>   tests/qemu-iotests/iotests.py | 11 +++++++----
>   2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/qemu-iotests/124 b/tests/qemu-iotests/124
> index 3705cbb6b3..e40eeb50b9 100755
> --- a/tests/qemu-iotests/124
> +++ b/tests/qemu-iotests/124
> @@ -22,6 +22,7 @@
>   
>   import os
>   import iotests
> +from iotests import try_remove
>   
>   
>   def io_write_patterns(img, patterns):
> @@ -29,13 +30,6 @@ def io_write_patterns(img, patterns):
>           iotests.qemu_io('-c', 'write -P%s %s %s' % pattern, img)
>   
>   
> -def try_remove(img):
> -    try:
> -        os.remove(img)
> -    except OSError:
> -        pass
> -
> -
>   def transaction_action(action, **kwargs):
>       return {
>           'type': action,
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 52facb8e04..a69b4cdc4e 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -523,12 +523,15 @@ class FilePath:
>           return False
>   
>   
> +def try_remove(img):
> +    try:
> +        os.remove(img)
> +    except OSError:
> +        pass
> +
>   def file_path_remover():
>       for path in reversed(file_path_remover.paths):
> -        try:
> -            os.remove(path)
> -        except OSError:
> -            pass
> +        try_remove(path)
>   
>   
>   def file_path(*names, base_dir=test_dir):
> 

For what it's worth, at the time I wrote this I barely knew Python. I'd 
use FileNotFoundError instead now, which is a subclass of OSError.

Not your baby, not your problem.

Reviewed-by: John Snow <jsnow@redhat.com>


