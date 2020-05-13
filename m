Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB471D2023
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 22:22:56 +0200 (CEST)
Received: from localhost ([::1]:60114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYxu3-0006Mq-Td
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 16:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jYxtK-0005y1-DK
 for qemu-devel@nongnu.org; Wed, 13 May 2020 16:22:10 -0400
Received: from relay68.bu.edu ([128.197.228.73]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jYxtI-0003wi-QD
 for qemu-devel@nongnu.org; Wed, 13 May 2020 16:22:09 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 04DKKZC1028042
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 13 May 2020 16:20:36 -0400
Date: Wed, 13 May 2020 16:20:35 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH v2 2/3] megasas: avoid NULL pointer dereference
Message-ID: <20200513202035.7gax7nnobhnfsynp@mozz.bu.edu>
References: <20200513192540.1583887-1-ppandit@redhat.com>
 <20200513192540.1583887-3-ppandit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513192540.1583887-3-ppandit@redhat.com>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 16:22:07
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Ding Ren <rding@gatech.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200514 0055, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While in megasas_handle_frame(), megasas_enqueue_frame() may
> set a NULL frame into MegasasCmd object for a given 'frame_addr'
> address. Add check to avoid a NULL pointer dereference issue.
> 
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1878259
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>

Acked-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  hw/scsi/megasas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index 6ce598cd69..b531d88a9b 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -504,7 +504,7 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState *s,
>      cmd->pa = frame;
>      /* Map all possible frames */
>      cmd->frame = pci_dma_map(pcid, frame, &frame_size_p, 0);
> -    if (frame_size_p != frame_size) {
> +    if (!cmd->frame || frame_size_p != frame_size) {
>          trace_megasas_qf_map_failed(cmd->index, (unsigned long)frame);
>          if (cmd->frame) {
>              megasas_unmap_frame(s, cmd);
> -- 
> 2.25.4
> 

