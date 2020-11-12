Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB22B0869
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:29:54 +0100 (CET)
Received: from localhost ([::1]:41744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEXp-0006Kq-Sq
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kdEWU-0005rS-PR
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:28:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:38778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kdEWR-0004t0-PG
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:28:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD347ABD1;
 Thu, 12 Nov 2020 15:28:23 +0000 (UTC)
Subject: Re: [PATCH] scsi-disk: convert more errno values back to SCSI statuses
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201112095220.52590-1-pbonzini@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <8c23f562-44aa-2cac-eabb-5eb6c2486d45@suse.de>
Date: Thu, 12 Nov 2020 16:04:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201112095220.52590-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 10:28:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/20 10:52 AM, Paolo Bonzini wrote:
> Linux has some OS-specific (and sometimes weird) mappings for various SCSI
> statuses and sense codes.  The most important is probably RESERVATION
> CONFLICT.  Add them so that they can be reported back to the guest
> kernel.
> 
> Cc: Hannes Reinecke <hare@suse.de>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/scsi/scsi-disk.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index 424bc192b7..fa14d1527a 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -461,6 +461,25 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
>               }
>               error = scsi_sense_buf_to_errno(r->req.sense, sizeof(r->req.sense));
>               break;
> +#ifdef CONFIG_LINUX
> +            /* These errno mapping are specific to Linux.  For more information:
> +             * - scsi_decide_disposition in drivers/scsi/scsi_error.c
> +             * - scsi_result_to_blk_status in drivers/scsi/scsi_lib.c
> +             * - blk_errors[] in block/blk-core.c
> +             */
> +        case EBADE:
> +            /* DID_NEXUS_FAILURE -> BLK_STS_NEXUS.  */
> +            scsi_req_complete(&r->req, RESERVATION_CONFLICT);
> +            break;
> +        case ENODATA:
> +            /* DID_MEDIUM_ERROR -> BLK_STS_MEDIUM.  */
> +            scsi_check_condition(r, SENSE_CODE(READ_ERROR));
> +            break;
> +        case EREMOTEIO:
> +            /* DID_TARGET_FAILURE -> BLK_STS_TARGET.  */
> +            scsi_req_complete(&r->req, HARDWARE_ERROR);
> +            break;
> +#endif
>           case ENOMEDIUM:
>               scsi_check_condition(r, SENSE_CODE(NO_MEDIUM));
>               break;
> 
Well, ironically I'm currently debugging a customer escalation which 
touches exactly this area.
It revolves more around the SG_IO handling; qemu ignores the host_status 
setting completely, leading to data corruption if the host has to abort 
commands.
(Not that the host _does_ abort commands, as qemu SG_IO sets an infinite 
timeout. But that's another story).

And part of the patchset is to enable passing of the host_status code 
back to the drivers. In particular virtio_scsi has a 'response' code 
which matches pretty closely to the linux SCSI DID_XXX codes.
So my idea is to pass the host_status directly down to the drivers, 
allowing virtio-scsi to do a mapping between DID_XX and virtio response 
codes. That way we can get rid of the weird mapping in utils/scsi.c 
where we try to map the DID_XXX codes onto Sense or SCSI status.
And with that we could map the error codes above onto DID_XXX codes, 
too, allowing us to have a more streamlined mapping.

Thoughts?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

