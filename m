Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F029B3FD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 16:02:11 +0100 (CET)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXQUE-0004OO-E7
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 11:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kXQE9-0003MV-Ly; Tue, 27 Oct 2020 10:45:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:56846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kXQE4-00036Y-Jx; Tue, 27 Oct 2020 10:45:33 -0400
Received: from dhcp-10-100-145-180.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD310206B2;
 Tue, 27 Oct 2020 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603809926;
 bh=bLG6DIpDVJFxqXGq5H/qy40U0e9kvbp9y5pfLK6E0G0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iN7H9CrOHBIh6bga6W4Agb/p161bR5ROeSopmN+VouEf+jUa6RdSEPVjnaAfyqFMS
 rlvTS4y4+XFMTTMDEfjeI6yytallOf5osaL6lBeTpuo6SKcGXlqu+NAUo7SBcGetUH
 dO0Gv1VWMYqNvmaatdnzpxFhsftwrEGcDglUsUfk=
Date: Tue, 27 Oct 2020 07:45:23 -0700
From: Keith Busch <kbusch@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 03/25] block/nvme: Report warning with warn_report()
Message-ID: <20201027144523.GA1942271@dhcp-10-100-145-180.wdc.com>
References: <20201027135547.374946-1-philmd@redhat.com>
 <20201027135547.374946-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201027135547.374946-4-philmd@redhat.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 10:45:26
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 27, 2020 at 02:55:25PM +0100, Philippe Mathieu-Daud� wrote:
> Instead of displaying warning on stderr, use warn_report()
> which also displays it on the monitor.
> 
> Signed-off-by: Philippe Mathieu-Daud� <philmd@redhat.com>
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

Not related to your patch, but it stands out as odd that this is treated
as an endian type. The field is just an opaque cookie, so there shouldn't
be a need for byte swapping. It in fact looks like this is broken on a
big-endian host, as the swaping on submission uses a 32-bit value. Won't
that truncate the relavant bits?

>          if (cid == 0 || cid > NVME_QUEUE_SIZE) {
> -            fprintf(stderr, "Unexpected CID in completion queue: %" PRIu32 "\n",
> -                    cid);
> +            warn_report("NVMe: Unexpected CID in completion queue: %"PRIu32", "
> +                        "queue size: %u", cid, NVME_QUEUE_SIZE);
>              continue;
>          }
>          trace_nvme_complete_command(s, q->index, cid);

