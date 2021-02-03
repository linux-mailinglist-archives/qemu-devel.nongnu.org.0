Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3768B30E3DC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 21:09:21 +0100 (CET)
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OSm-0001VV-AB
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 15:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7OPs-0007Iz-J6
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7OPq-0003Ai-15
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612382775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RsDCOyvBGheLTI77K06r/Mg7rDRIpQcBq/dWbO6JpDs=;
 b=WII0ziu7WExfs7j05mu2k5wr+QpsZMyoaST9a+pShyVVvCDv2q7LbGhv8wsCDFngMt1vzt
 e0pUezNmOpJnjTG1U2hO9mMZDwcl/oaFKz3APGc8wh4llmHjIGHkomxKljM+g5zzHPGpFT
 6McVEwlChrYZxMLw6AhZjcV0rdKCfiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-v90qeM8BMSut0ss5J58nTw-1; Wed, 03 Feb 2021 15:06:12 -0500
X-MC-Unique: v90qeM8BMSut0ss5J58nTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9461192AB78;
 Wed,  3 Feb 2021 20:06:10 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E63110013DB;
 Wed,  3 Feb 2021 20:06:08 +0000 (UTC)
Date: Wed, 3 Feb 2021 20:06:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 13/18] migration/rdma: Add the function for dynamic
 page registration
Message-ID: <20210203200605.GW2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-14-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-14-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Add the 'qemu_rdma_registration' function, multifd send threads
> call it to register memory.

This function is a copy of the code out of qemu_rdma_registration_stop;
with some of the comments removed.
It's OK to split this code out so you can use it as well; but then why
not make qemu_rdma_registration_stop use this function as well to stop
having two copies ?  And keep the comments!

> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/rdma.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index cff9446..1095a8f 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3739,6 +3739,57 @@ out:
>      return ret;
>  }
>  
> +/*
> + * Dynamic page registrations for multifd RDMA threads.
> + */
> +static int qemu_rdma_registration(void *opaque)
> +{
> +    RDMAContext *rdma = opaque;

Can't you keep that as qemu_rdma_registration(RDMAContext *rdma) ?

> +    RDMAControlHeader resp = {.type = RDMA_CONTROL_RAM_BLOCKS_RESULT };
> +    RDMALocalBlocks *local = &rdma->local_ram_blocks;
> +    int reg_result_idx, i, nb_dest_blocks;
> +    RDMAControlHeader head = { .len = 0, .repeat = 1 };
> +    int ret = 0;
> +
> +    head.type = RDMA_CONTROL_RAM_BLOCKS_REQUEST;
> +
> +    ret = qemu_rdma_exchange_send(rdma, &head, NULL, &resp,
> +            &reg_result_idx, rdma->pin_all ?
> +            qemu_rdma_reg_whole_ram_blocks : NULL);
> +    if (ret < 0) {
> +        goto out;
> +    }
> +
> +    nb_dest_blocks = resp.len / sizeof(RDMADestBlock);
> +
> +    if (local->nb_blocks != nb_dest_blocks) {
> +        rdma->error_state = -EINVAL;
> +        ret = -1;
> +        goto out;
> +    }
> +
> +    qemu_rdma_move_header(rdma, reg_result_idx, &resp);
> +    memcpy(rdma->dest_blocks,
> +           rdma->wr_data[reg_result_idx].control_curr, resp.len);
> +
> +    for (i = 0; i < nb_dest_blocks; i++) {
> +        network_to_dest_block(&rdma->dest_blocks[i]);
> +
> +        /* We require that the blocks are in the same order */
> +        if (rdma->dest_blocks[i].length != local->block[i].length) {
> +            rdma->error_state = -EINVAL;
> +            ret = -1;
> +            goto out;
> +        }
> +        local->block[i].remote_host_addr =
> +            rdma->dest_blocks[i].remote_host_addr;
> +        local->block[i].remote_rkey = rdma->dest_blocks[i].remote_rkey;
> +    }
> +
> +out:
> +    return ret;
> +}
> +
>  /* Destination:
>   * Called via a ram_control_load_hook during the initial RAM load section which
>   * lists the RAMBlocks by name.  This lets us know the order of the RAMBlocks
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


