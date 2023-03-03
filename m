Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B064B6A9429
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:30:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1JT-0005Ic-9Z; Fri, 03 Mar 2023 04:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pY1JL-0005BK-A3; Fri, 03 Mar 2023 04:02:44 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pY1JH-00083n-66; Fri, 03 Mar 2023 04:02:41 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 1C6DB4780F;
 Fri,  3 Mar 2023 10:02:36 +0100 (CET)
Message-ID: <a294096d-1604-585c-6703-293cf8193b0c@proxmox.com>
Date: Fri, 3 Mar 2023 10:02:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] scsi: megasas: Internal cdbs have 16-byte length
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Hannes Reinecke <hare@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20230228171129.4094709-1-linux@roeck-us.net>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <20230228171129.4094709-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 28.02.23 um 18:11 schrieb Guenter Roeck:
> Host drivers do not necessarily set cdb_len in megasas io commands.
> With commits 6d1511cea0 ("scsi: Reject commands if the CDB length
> exceeds buf_len") and fe9d8927e2 ("scsi: Add buf_len parameter to
> scsi_req_new()"), this results in failures to boot Linux from affected
> SCSI drives because cdb_len is set to 0 by the host driver.
> Set the cdb length to its actual size to solve the problem.
> 

Tested-by: Fiona Ebner <f.ebner@proxmox.com>

But I do have a question:

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/scsi/megasas.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index 9cbbb16121..d624866bb6 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -1780,7 +1780,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>      uint8_t cdb[16];
>      int len;
>      struct SCSIDevice *sdev = NULL;
> -    int target_id, lun_id, cdb_len;
> +    int target_id, lun_id;
>  
>      lba_count = le32_to_cpu(cmd->frame->io.header.data_len);
>      lba_start_lo = le32_to_cpu(cmd->frame->io.lba_lo);
> @@ -1789,7 +1789,6 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>  
>      target_id = cmd->frame->header.target_id;
>      lun_id = cmd->frame->header.lun_id;
> -    cdb_len = cmd->frame->header.cdb_len;
>  
>      if (target_id < MFI_MAX_LD && lun_id == 0) {
>          sdev = scsi_device_find(&s->bus, 0, target_id, lun_id);
> @@ -1804,15 +1803,6 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>          return MFI_STAT_DEVICE_NOT_FOUND;
>      }
>  
> -    if (cdb_len > 16) {
> -        trace_megasas_scsi_invalid_cdb_len(
> -            mfi_frame_desc(frame_cmd), 1, target_id, lun_id, cdb_len);
> -        megasas_write_sense(cmd, SENSE_CODE(INVALID_OPCODE));
> -        cmd->frame->header.scsi_status = CHECK_CONDITION;
> -        s->event_count++;
> -        return MFI_STAT_SCSI_DONE_WITH_ERROR;
> -    }

Shouldn't we still fail when cmd->frame->header.cdb_len > 16? Or is the
consequence of

> Host drivers do not necessarily set cdb_len in megasas io commands.

that this can be uninitialized memory and we need to assume it was not
explicitly set?

Best Regards,
Fiona

> -
>      cmd->iov_size = lba_count * sdev->blocksize;
>      if (megasas_map_sgl(s, cmd, &cmd->frame->io.sgl)) {
>          megasas_write_sense(cmd, SENSE_CODE(TARGET_FAILURE));
> @@ -1823,7 +1813,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>  
>      megasas_encode_lba(cdb, lba_start, lba_count, is_write);
>      cmd->req = scsi_req_new(sdev, cmd->index,
> -                            lun_id, cdb, cdb_len, cmd);
> +                            lun_id, cdb, sizeof(cdb), cmd);
>      if (!cmd->req) {
>          trace_megasas_scsi_req_alloc_failed(
>              mfi_frame_desc(frame_cmd), target_id, lun_id);


