Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6629CF9D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 12:05:07 +0100 (CET)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXjGM-0005KU-7K
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 07:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kXjEe-0004jk-6a
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 07:03:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kXjEc-0002r9-Ji
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 07:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603882997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iF9bly2xxc9od8VzjkLUt1otCvq7S5ffUTJOo0WEx4=;
 b=cI5XZ84ocqmAuF0Vf4ykK3a9mBcfW3ms0Pybd3CZ/UN9nDFf6CPWElL0xanonh7skG48RI
 lzhA3AmthxXoA/wkUtf0F8sPx2z1jzA979HFELsEQrHxMAW1MliCFekzozkkbEhz5UCo2Y
 Ts2N1/TQs/EkPtOl+xx6/UChxnrlCLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-yhRb_md5PKOp1bHmtKtbhg-1; Wed, 28 Oct 2020 07:03:13 -0400
X-MC-Unique: yhRb_md5PKOp1bHmtKtbhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CB819CC02;
 Wed, 28 Oct 2020 11:03:11 +0000 (UTC)
Received: from [10.36.112.194] (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EA3B1C4;
 Wed, 28 Oct 2020 11:03:01 +0000 (UTC)
Subject: Re: [PATCH 11/25] block/nvme: Make nvme_identify() return boolean
 indicating error
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201027135547.374946-1-philmd@redhat.com>
 <20201027135547.374946-12-philmd@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e111dfd1-a5ec-771f-fde0-317eb9a52420@redhat.com>
Date: Wed, 28 Oct 2020 12:03:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201027135547.374946-12-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 10/27/20 2:55 PM, Philippe Mathieu-Daudé wrote:
> Just for consistency, following the example documented since
> commit e3fe3988d7 ("error: Document Error API usage rules"),
> return a boolean value indicating an error is set or not.
Then I think the returned value should be used by the caller in this patch

Thanks

Eric
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  block/nvme.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index 8b0fd59c6ea..74994c442e5 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -506,9 +506,11 @@ static int nvme_cmd_sync(BlockDriverState *bs, NVMeQueuePair *q,
>      return ret;
>  }
>  
> -static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
> +/* Returns true on success, false on failure. */
> +static bool nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
>  {
>      BDRVNVMeState *s = bs->opaque;
> +    bool ret = false;>      union {
>          NvmeIdCtrl ctrl;
>          NvmeIdNs ns;
> @@ -585,10 +587,13 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
>          goto out;
>      }
>  
> +    ret = true;
>      s->blkshift = lbaf->ds;
>  out:
>      qemu_vfio_dma_unmap(s->vfio, id);
>      qemu_vfree(id);
> +
> +    return ret;
>  }
>  
>  static bool nvme_poll_queue(NVMeQueuePair *q)
> 


