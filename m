Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A5A563790
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:16:19 +0200 (CEST)
Received: from localhost ([::1]:48906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JJa-0006Dd-1P
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o7J8c-0001Tc-7L
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:04:58 -0400
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1]:57598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1o7J8W-0004PS-7k
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:04:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F2F1CCE29BC;
 Fri,  1 Jul 2022 16:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3081FC3411E;
 Fri,  1 Jul 2022 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656691485;
 bh=eqaYuGZexvH8nOzLzpUgpRWEHcabZUKI05HdLx+oOeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WQ55tGeYI+/VVpWZ9vkQ2USmhhSHIB8I8736Z8x2TS3je+5FrA9o8Xjv22LAbSIX0
 msyen9IpolmS8tTt+7ygVKhQwY55/zrKmXi/wg6kL17yBC0p1KT81+W///Yupg2qeY
 I8KNzLxA7YKIKvFeNrz+JT1Yfe5yE3WKgtYwa55Hnc0IqUFLmWF8xGw+Qm8ojgoxkB
 W87XDEdRE4DQ+hrNUpdkNQXri1Sbybuh34tyWDM+PHjwLSkVXgADAHzqOz9AcE0d16
 YhV+P7M53HkgnRkR90sv6JVPXxRn/D1cS5mZ/VBdoL/rm5sjkNT1Tz6hy32/u58Axf
 5TTxl1Zcx2Tog==
Date: Fri, 1 Jul 2022 10:04:42 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, its@irrelevant.dk
Subject: Re: [PATCH v2] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Yr8bGnaDRsivoY9b@kbusch-mbp.dhcp.thefacebook.com>
References: <20220630032231.2881787-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630032231.2881787-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=kbusch@kernel.org; helo=sin.source.kernel.org
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

On Thu, Jun 30, 2022 at 11:22:31AM +0800, Jinhao Fan wrote:
> +static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
> +{
> +    NvmeCtrl *n = sq->ctrl;
> +    uint16_t offset = sq->sqid << 3;
> +    int ret;
> +
> +    ret = event_notifier_init(&sq->notifier, 0);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
> +    memory_region_add_eventfd(&n->iomem,
> +                              0x1000 + offset, 4, false, 0, &sq->notifier);
> +
> +    return 0;
> +}
> +
>  static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
>  {
>      n->sq[sq->sqid] = NULL;
>      timer_free(sq->timer);
> +    event_notifier_cleanup(&sq->notifier);
>      g_free(sq->io_req);
>      if (sq->sqid) {
>          g_free(sq);

I believe there needs to be a corresponding memory_region_del_eventfd() when
deleting the queue before event_notifier_cleanup(), otherwise you'll leak
invalid listeners.

