Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4362B1A4D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:50:37 +0100 (CET)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXbA-0002Fc-3C
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdXZs-0001TH-Vj
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdXZm-0004EI-Mj
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605268149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbNx3S4ijlakBrQ8QVjB8eTeUs6NCtdvMFM1ZDFvbv8=;
 b=AuUKIYrTyI8nNDk7KziCM0/mLT0Biq09zWFRdkyDhQA6alCSAoRvA/tPNekBgVcvviOEx0
 CRMMNZW0RV4FGu3XT+LuDvT7ZKhlYvtpSOXPM2LLpA9A214lQQ4yczsnd/sGhFyYpVyBp0
 5a05WoywDZbADLAHz19/PcMy1RwPexE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-MMzuooIPNXSmlxqe3kq4jQ-1; Fri, 13 Nov 2020 06:49:08 -0500
X-MC-Unique: MMzuooIPNXSmlxqe3kq4jQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD2B2803F6A;
 Fri, 13 Nov 2020 11:49:06 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-96.ams2.redhat.com
 [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F1365D9E8;
 Fri, 13 Nov 2020 11:49:05 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] quorum: Implement bdrv_co_pwrite_zeroes()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1605111801.git.berto@igalia.com>
 <2faad461e6bffc4a50547547b8c20c39e0f544e8.1605111801.git.berto@igalia.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5b5e73f3-a045-268d-e82a-f652668a8f02@redhat.com>
Date: Fri, 13 Nov 2020 12:49:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2faad461e6bffc4a50547547b8c20c39e0f544e8.1605111801.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tao Xu <tao3.xu@intel.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.20 17:53, Alberto Garcia wrote:
> This simply calls bdrv_co_pwrite_zeroes() in all children
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   block/quorum.c             | 18 ++++++++++++++++--
>   tests/qemu-iotests/312     |  7 +++++++
>   tests/qemu-iotests/312.out |  4 ++++
>   3 files changed, 27 insertions(+), 2 deletions(-)

Should we set supported_zero_flags to something?  I think we can at 
least set BDRV_REQ_NO_FALLBACK.  We could also try BDRV_REQ_FUA.

> diff --git a/block/quorum.c b/block/quorum.c
> index 9691a9bee9..c81572f513 100644
> --- a/block/quorum.c
> +++ b/block/quorum.c
> @@ -692,8 +692,13 @@ static void write_quorum_entry(void *opaque)
>       QuorumChildRequest *sacb = &acb->qcrs[i];
>   
>       sacb->bs = s->children[i]->bs;
> -    sacb->ret = bdrv_co_pwritev(s->children[i], acb->offset, acb->bytes,
> -                                acb->qiov, acb->flags);
> +    if (acb->flags & BDRV_REQ_ZERO_WRITE) {
> +        sacb->ret = bdrv_co_pwrite_zeroes(s->children[i], acb->offset,
> +                                          acb->bytes, acb->flags);
> +    } else {
> +        sacb->ret = bdrv_co_pwritev(s->children[i], acb->offset, acb->bytes,
> +                                    acb->qiov, acb->flags);
> +    }

Seems unnecessary (bdrv_co_pwritev() can handle BDRV_REQ_ZERO_WRITE), 
but perhaps it’s good to be explicit.

>       if (sacb->ret == 0) {
>           acb->success_count++;
>       } else {

[...]

> diff --git a/tests/qemu-iotests/312 b/tests/qemu-iotests/312
> index 1b08f1552f..93046393e7 100755
> --- a/tests/qemu-iotests/312
> +++ b/tests/qemu-iotests/312
> @@ -114,6 +114,13 @@ $QEMU_IO -c "write -P 0 $((0x200000)) $((0x10000))" "$TEST_IMG.0" | _filter_qemu
>   $QEMU_IO -c "write -z   $((0x200000)) $((0x30000))" "$TEST_IMG.1" | _filter_qemu_io
>   $QEMU_IO -c "write -P 0 $((0x200000)) $((0x20000))" "$TEST_IMG.2" | _filter_qemu_io
>   
> +# Test 5: write data to a region and then zeroize it, doing it
> +# directly on the quorum device instead of the individual images.
> +# This has no effect on the end result but proves that the quorum driver
> +# supports 'write -z'.
> +$QEMU_IO -c "open -o $quorum" -c "write $((0x250000)) $((0x10000))" | _filter_qemu_io
> +$QEMU_IO -c "open -o $quorum" -c "write -z $((0x250000)) $((0x10000))" | _filter_qemu_io
> +

My gut would have preferred a test where the data region is larger than 
the zeroed region (so we can see that the first write has done 
something), but who cares about my gut.

I don’t mind not setting supported_zero_flags enough to warrant 
withholding a

Reviewed-by: Max Reitz <mreitz@redhat.com>

But I’ll give you some time to reply before I’d take this patch to 
block-next.  (That is, unless Kevin takes it during my two-week PTO...)

>   echo
>   echo '### Launch the drive-mirror job'
>   echo


