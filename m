Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103C4343D76
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:06:01 +0100 (CET)
Received: from localhost ([::1]:48072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHRg-0005QA-1k
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lOHOQ-0003Sy-Dr
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:02:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lOHOJ-0007e1-PN
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616407350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kl3ufcYg6H8cidp1EOT8XNlIIyH+xI6dlLyTCOOjCl4=;
 b=PTENjQSFEPBYQaw+9p4OinzuYUPuH1uBPsPzxDTDvcn+aaOUqtvMm5CPagNZuzvjHxTtj/
 dAG8HgLKJV49Wvy3NmVezR4M8JsehPMEoSwRRnjEprXmJJ+Dd1595dQ36C2qRWhv4k48Tg
 6eJgywCKHj3EiJ4AOci2wTrm0vA/DzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-PpGpYpZePQOE1z2Awe7Qug-1; Mon, 22 Mar 2021 06:02:26 -0400
X-MC-Unique: PpGpYpZePQOE1z2Awe7Qug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4CA8881D65;
 Mon, 22 Mar 2021 10:02:24 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-196.ams2.redhat.com
 [10.36.114.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EAC59CA0;
 Mon, 22 Mar 2021 10:02:23 +0000 (UTC)
Subject: Re: [PATCH 2/2] hw/block/nvme: fix resource leak in nvme_format_ns
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210322061951.186748-1-its@irrelevant.dk>
 <20210322061951.186748-3-its@irrelevant.dk>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <75eb366b-32d9-ba67-971b-e5993f5ae192@redhat.com>
Date: Mon, 22 Mar 2021 11:02:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322061951.186748-3-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.21 07:19, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> In nvme_format_ns(), if the namespace is of zero size (which might be
> useless, but not invalid), the `count` variable will leak. Fix this by
> returning early in that case.

When looking at the Coverity report, something else caught my eye: As 
far as I’m aware, blk_aio_pwrite_zeroes() may invoke the CB before 
returning (if blk_do_pwritev_part() returns without yielding).  I don’t 
think that will happen with real hardware (who knows, though), but it 
should be possible to see with the null-co block driver.

nvme_format_ns() doesn’t quite look like it takes that into account. 
For example, because *count starts at 1 and is decremented after the 
while (len) loop, all nvme_aio_format_cb() invocations (if they are 
invoked before their blk_aio_pwrite_zeroes() returns) will see
*count == 2, and thus not free it, or call nvme_enqueue_req_completion().

I don’t know whether the latter is problematic, but not freeing `count` 
doesn’t seem right.  Perhaps this could be addressed by adding a 
condition to the `(*count)--` to see whether `(*count)-- == 1` (or 
rather `--(*count) == 0`), which would indicate that there are no AIO 
functions still in flight?

Max

> Reported-by: Coverity (CID 1451082)
> Fixes: dc04d25e2f3f ("hw/block/nvme: add support for the format nvm command")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/block/nvme.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 6842b01ab58b..dad275971a84 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -4984,6 +4984,11 @@ static uint16_t nvme_format_ns(NvmeCtrl *n, NvmeNamespace *ns, uint8_t lbaf,
>       ns->status = NVME_FORMAT_IN_PROGRESS;
>   
>       len = ns->size;
> +
> +    if (!len) {
> +        return NVME_SUCCESS;
> +    }
> +
>       offset = 0;
>   
>       count = g_new(int, 1);
> 


