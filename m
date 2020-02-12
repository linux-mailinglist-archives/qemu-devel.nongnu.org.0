Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0AB15A668
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 11:32:02 +0100 (CET)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1pJJ-0001As-8f
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 05:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58042)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1j1pHz-0000aG-2J
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 05:30:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1j1pHx-0003re-Ce
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 05:30:38 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32904
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1j1pHx-0003rJ-99
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 05:30:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581503436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eY9cDCNxs33CcsEdgt30rxERRZcFu854/lAG3JpO3XY=;
 b=JfEtXF+He/7VYfGB56+cDyxjBtJ4Q1x9G/4YTK898ilhHN+v25N4brDjJRAR6A0dzHnltD
 OisAcme1wcBTdGJhH5oLvWayPAD5iDnT8Qow8bbwe2edUaEe5hdBnO0ji/0gVIlUy5hpZJ
 lW2sGbZmntJt8CLrChbgIZNAaeoRbxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-U-9sglcPNVKbXtLyQaahYg-1; Wed, 12 Feb 2020 05:30:32 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5272B1005502;
 Wed, 12 Feb 2020 10:30:31 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 222EE27181;
 Wed, 12 Feb 2020 10:30:28 +0000 (UTC)
Message-ID: <2c5efa159da9d0a5f128ca85374e457134b55f31.camel@redhat.com>
Subject: Re: [PATCH v5 14/26] nvme: make sure ncqr and nsqr is valid
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Klaus Jensen <k.jensen@samsung.com>, qemu-block@nongnu.org
Date: Wed, 12 Feb 2020 12:30:17 +0200
In-Reply-To: <20200204095208.269131-15-k.jensen@samsung.com>
References: <20200204095208.269131-1-k.jensen@samsung.com>
 <CGME20200204095224eucas1p10807239f5dc4aa809650c85186c426a8@eucas1p1.samsung.com>
 <20200204095208.269131-15-k.jensen@samsung.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: U-9sglcPNVKbXtLyQaahYg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-02-04 at 10:51 +0100, Klaus Jensen wrote:
> 0xffff is not an allowed value for NCQR and NSQR in Set Features on
> Number of Queues.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 30c5b3e7a67d..900732bb2f38 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1133,6 +1133,10 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
>          blk_set_enable_write_cache(n->conf.blk, dw11 & 1);
>          break;
>      case NVME_NUMBER_OF_QUEUES:
> +        if ((dw11 & 0xffff) == 0xffff || ((dw11 >> 16) & 0xffff) == 0xffff) {
> +            return NVME_INVALID_FIELD | NVME_DNR;
> +        }
Very minor nitpick: since this spec requirement is not obvious, a quote/reference to the spec
would be nice to have here. 

> +
>          trace_nvme_dev_setfeat_numq((dw11 & 0xFFFF) + 1,
>              ((dw11 >> 16) & 0xFFFF) + 1, n->params.num_queues - 1,
>              n->params.num_queues - 1);

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


