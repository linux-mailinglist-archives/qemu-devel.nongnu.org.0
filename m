Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B36B55BBB5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 21:22:14 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5uJI-0008UR-Rs
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 15:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o5uF3-0007Ix-MS
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:17:49 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:37632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o5uF1-00039T-JL
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:17:49 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2A4361601;
 Mon, 27 Jun 2022 19:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19819C3411D;
 Mon, 27 Jun 2022 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656357464;
 bh=V52DWXolOeHWC9Tq/mqBZWHTk9TX6mhvuv+Tbq5bgcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYKmK4a2dQzDmRVk8kf4XORS9fqpO/96x3DgnGs6rLl90kJBVqmFWUBQsWm15sDW1
 0lbswNGXMHpep4XKws+58fd8qhcCdRAIizPq5ILcpp8iSPboCzYCOeHd7GjWYQn9F/
 yCRyrvkz6KesISq/22A0SdZe7qtzsf2c05G8kO8ZCD5xrw9/NZS4zl+df6rJunmVfL
 ZBRn9OkkbDXY7FoUfJFy4jtKu4zVScLQQNAxS/l0pfW80apyBiDxu5XbmUAEdDjm2p
 sBCp0MQDHfVj3e0LLmwyDNo154awPufnqkfbPnLQqeWKsxUI6gBRChdiPiiS/7yz/B
 o1YcTXENd+qfA==
Date: Mon, 27 Jun 2022 13:17:41 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, its@irrelevant.dk
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YroCVQvTq+z/mgc9@kbusch-mbp.dhcp.thefacebook.com>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 16, 2022 at 08:34:07PM +0800, Jinhao Fan wrote:
>      }
>      sq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
>  
> +    if (n->dbbuf_enabled) {
> +        sq->db_addr = n->dbbuf_dbs + (sqid << 3);
> +        sq->ei_addr = n->dbbuf_eis + (sqid << 3);
> +    }
> +
>      assert(n->cq[cqid]);
>      cq = n->cq[cqid];
>      QTAILQ_INSERT_TAIL(&(cq->sq_list), sq, entry);
> @@ -4615,6 +4631,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
>      cq->head = cq->tail = 0;
>      QTAILQ_INIT(&cq->req_list);
>      QTAILQ_INIT(&cq->sq_list);
> +    if (n->dbbuf_enabled) {
> +        cq->db_addr = n->dbbuf_dbs + (cqid << 3) + (1 << 2);
> +        cq->ei_addr = n->dbbuf_eis + (cqid << 3) + (1 << 2);
> +    }
>      n->cq[cqid] = cq;
>      cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
>  }

I just notice these address calculations changed from previous versions. What
happened to taking the doorbell stride into account? Spec says the shadows and
events follow the same stride spacing as the registers.

