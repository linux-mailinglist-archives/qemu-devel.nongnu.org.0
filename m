Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858222F4D0A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:25:01 +0100 (CET)
Received: from localhost ([::1]:44864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzh51-0001x1-Nv
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzgrJ-0006Xi-Qm
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:10:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzgrB-0005ND-OX
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610547040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ogEiPkALWbNBQWl88oYmRTXhF5lKFOGPqJIbrasZgUY=;
 b=J/LROw4QNpm/wC9pj2fzeLsdyXXcDIhw5rMR5BhYowZnY2j6Lw8ltdtPDphabKJ8Aqhj9S
 N2l0GEsYeIMhEK+pvBo52yOAkS32VT5BcIKUUZLlBM+fbun8skOSQ37IF0HbEbC3+jEWh6
 lvCRSvv3wy1xelIzw0u32Hf8eyc3ajA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-ZtS4Tf2EOfW2a7yWEQwrpQ-1; Wed, 13 Jan 2021 09:10:38 -0500
X-MC-Unique: ZtS4Tf2EOfW2a7yWEQwrpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89CBC100D92E;
 Wed, 13 Jan 2021 14:10:23 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-103.ams2.redhat.com
 [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8461DE2DA;
 Wed, 13 Jan 2021 14:10:22 +0000 (UTC)
Subject: Re: [PATCH 4/7] iotests/129: Use throttle node
To: qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-5-mreitz@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0bbc2785-cfeb-ac64-6c19-5d86e7a0ca75@redhat.com>
Date: Wed, 13 Jan 2021 15:10:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113140616.150283-5-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.01.21 15:06, Max Reitz wrote:
> Throttling on the BB has not affected block jobs in a while, so it is
> possible that one of the jobs in 129 finishes before the VM is stopped.
> We can fix that by running the job from a throttle node.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/129 | 39 +++++++++++++++------------------------
>   1 file changed, 15 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index dd23bb2e5a..febc806398 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129

[...]

> @@ -53,33 +51,26 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>       def do_test_stop(self, cmd, **args):
>           """Test 'stop' while block job is running on a throttled drive.
>           The 'stop' command shouldn't drain the job"""
> -        params = {"device": "drive0",
> -                  "bps": 1024,
> -                  "bps_rd": 0,
> -                  "bps_wr": 0,
> -                  "iops": 0,
> -                  "iops_rd": 0,
> -                  "iops_wr": 0,
> -                 }
> -        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
> -                             **params)
> -        self.assert_qmp(result, 'return', {})
>           result = self.vm.qmp(cmd, **args)
>           self.assert_qmp(result, 'return', {})
> +
>           result = self.vm.qmp("stop")
>           self.assert_qmp(result, 'return', {})
>           result = self.vm.qmp("query-block-jobs")
> +
>           self.assert_qmp(result, 'return[0]/status', 'running')
>           self.assert_qmp(result, 'return[0]/ready', False)
>   
> +        self.vm.qmp("block-job-cancel", device="drive0", force=True)
> +

Sorry, somewhere along the way I forgot to remove this block-job-cancel. 
  It’s still from
https://lists.nongnu.org/archive/html/qemu-block/2019-06/msg00499.html 
and I don’t know why I added it there.  It should probably go.

('stop' should have drained, that’s the point, so there shouldn’t be any 
further delay if we quit the VM without cancelling the job.)

Max


