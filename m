Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2129D29CF76
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 11:24:23 +0100 (CET)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXicw-0003aI-5u
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 06:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kXiar-0002Ep-Iu
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 06:22:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kXiaq-0004xl-1c
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 06:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603880529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iTWQMBziymceoWVaQwiWofr7v6XRiKuHwAT38NaXic8=;
 b=Wl76DhqzVDsJ0BK53f7SNWttsyaztw3yJsmzyxpe2nIXQQkuQI0TvQFnU/svLap5e1bS0g
 DRdmblgHreY+UnDJvZOKa0VFUvXFHUNcI2Ks12MnVnCE0PHIsOorLEs4LokqJLSQozwSDm
 WfVkXA21smhDxEeP8og4l+lywYzRsu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-Nln0ywBpNriG2Cntmk8wsA-1; Wed, 28 Oct 2020 06:22:08 -0400
X-MC-Unique: Nln0ywBpNriG2Cntmk8wsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7352B8015FD;
 Wed, 28 Oct 2020 10:22:06 +0000 (UTC)
Received: from [10.36.112.194] (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADFF86EF65;
 Wed, 28 Oct 2020 10:22:01 +0000 (UTC)
Subject: Re: [PATCH 03/25] block/nvme: Report warning with warn_report()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201027135547.374946-1-philmd@redhat.com>
 <20201027135547.374946-4-philmd@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <98483e98-e729-1e17-9fab-8d67aeee53d9@redhat.com>
Date: Wed, 28 Oct 2020 11:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201027135547.374946-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 10/27/20 2:55 PM, Philippe Mathieu-Daudé wrote:
> Instead of displaying warning on stderr, use warn_report()
> which also displays it on the monitor.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  block/nvme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index 739a0a700cb..6f1d7f9b2a1 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -399,8 +399,8 @@ static bool nvme_process_completion(NVMeQueuePair *q)
>          }
>          cid = le16_to_cpu(c->cid);
>          if (cid == 0 || cid > NVME_QUEUE_SIZE) {
> -            fprintf(stderr, "Unexpected CID in completion queue: %" PRIu32 "\n",
> -                    cid);
> +            warn_report("NVMe: Unexpected CID in completion queue: %"PRIu32", "
> +                        "queue size: %u", cid, NVME_QUEUE_SIZE);
>              continue;
>          }
>          trace_nvme_complete_command(s, q->index, cid);
> 


