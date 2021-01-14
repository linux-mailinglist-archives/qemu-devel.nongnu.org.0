Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DA2F6E3C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 23:32:15 +0100 (CET)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0BA6-0002TA-KD
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 17:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0B7y-0001Sw-Mv; Thu, 14 Jan 2021 17:30:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:55714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0B7x-00081Q-3B; Thu, 14 Jan 2021 17:30:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE56123107;
 Thu, 14 Jan 2021 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610663399;
 bh=2da4ARQrZe0AXoaxSeVvJuNqLpdSmadkdMCPy+0M7bU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jb6DjQmZM2jII6Y6o17fXy/6Hi7ZXfqy5n6s2W4oWu3zLVcHQRu9aVV2awEK1MaIj
 ri3+tR1wlVs9L9Co3dhDh6YuvqI/zsG9OkAjLkj4TrY/FY2TqlN4/a2Q/KSw5grMOn
 uxBNQHVBkretB9rzqDpecB28fAcz/9/WT77QCXQaOJP6dzLZscxVLScbr0M78KCCoA
 qVtWzHDBAxipj+DQufdhjKlT6aIic6Ms5zFQWUmhG/5bzX3DBdKEZobf9KObbrgHwE
 r1v8b+ttlhMbh8d4JtIZyKZlCmTv9f2FHK0tftqWy48PhuVOZyd1YfjyTanTsYCo03
 4ueuPPUjznMyA==
Date: Thu, 14 Jan 2021 14:29:56 -0800
From: Keith Busch <kbusch@kernel.org>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v3 4/4] hw/blocl/nvme: trigger async event during
 injecting smart warning
Message-ID: <20210114222956.GB1511902@dhcp-10-100-145-180.wdc.com>
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
 <20210114072251.334304-5-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114072251.334304-5-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, its@irrelevant.dk, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 03:22:51PM +0800, zhenwei pi wrote:
> @@ -2860,6 +2887,12 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
>      }
>  
>      s->smart_critical_warning = value;
> +
> +    /* test each bit of uint8_t for smart.critical_warning */
> +    for (event = 0; event < 8; event++) {
> +        if (value & (1 << event))
> +            nvme_enqueue_smart_event(s, 1 << event);

I think you need to save the events that have already been raised with
the host so that you don't send duplicate responses everytime a new
event is added to the 'critical_warning'.

