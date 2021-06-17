Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2413AB67E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:51:32 +0200 (CEST)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lttMh-0000ED-Af
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lttLf-0007qO-H1; Thu, 17 Jun 2021 10:50:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:44176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lttLd-0003j9-4J; Thu, 17 Jun 2021 10:50:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CBFB613CA;
 Thu, 17 Jun 2021 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623941422;
 bh=bKrgAosSUWMq81kuWWflFUE7rsDgE1VmKXp0qBIZ9ik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ERJZ64ph5F65yIe/+J9bO7PSzwZvkJEFXmUTAbQhQIvAL6ymUsC3yVvuPTu73zm6V
 XPmigjtu+C/PY7ewmV72iQnGAi+FPWtdITlyGljXyfLPwo6LLxLNf4T85pxUwivTgP
 9nwaqQe5nyNDQIuEr7+DtCchDbtrmopnCX9iTlw90HNOU3PglZGjhOnHXLdU7BRjX/
 CyeguPoUnP8yflqYYdyIwhqi5ip4DML6ird2DKLUfJJW90qb27q41bXIdRq+EMRWrJ
 KjfZQ6jucqDV8wweXHUOP+1ksrK8+81xd1aAgAmoG0YLHYjVpjmq6TFiEAvFbtzQJ8
 5zFjkfcfXTobw==
Date: Thu, 17 Jun 2021 07:50:19 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: fix pin-based interrupt behavior (again)
Message-ID: <20210617145019.GB1133213@dhcp-10-100-145-180.wdc.com>
References: <20210617100820.75510-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617100820.75510-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Jakub =?utf-8?B?SmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 12:08:20PM +0200, Klaus Jensen wrote:
>      if (cq->tail != cq->head) {
> +        if (!pending) {
> +            n->cq_pending++;
> +        }

You should check cq->irq_enabled before incrementing cq_pending. You
don't want to leave the irq asserted when polled queues have outsanding
CQEs.

