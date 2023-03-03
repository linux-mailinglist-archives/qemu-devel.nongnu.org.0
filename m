Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8B46A9A45
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:10:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY730-00041f-2W; Fri, 03 Mar 2023 10:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pY72u-0003ss-Hl; Fri, 03 Mar 2023 10:10:08 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pY72s-0003HZ-DD; Fri, 03 Mar 2023 10:10:08 -0500
Received: by mail-il1-x12c.google.com with SMTP id i12so1764500ila.5;
 Fri, 03 Mar 2023 07:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677856204;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Wheplk7LA8m18bTcOJKFW9gPyToD59CgEbKzOZ7bMHk=;
 b=HRL7zQYe9clvBbD8S9IZqn0A0oYL4ySnAc8vbomX5eJ4DPRTEYm6XUWE1yA0m08gMJ
 XqrP0TRgDd83DjaOctW710WK85gksHEFZR6eosQtgBditIVA8xxQQcGB6YfNhE17vxEw
 2PdX6HbSKPTw5hOcMOsOGG2asLxv4WxIH6gBP8MCcHvpdUAz8VWkjrwqVa1hzy3vbCLz
 cmp9tYXoMvC/lkovJOZxGEUSdyypGLOx0dZjbU3fILbV5ZJ9Y/f9gR0DGWkYUKY/9B0w
 a+QGvP6Pv1vI4O9KbiFw0P+76DPaouMSlu68h5P6rPjCUB2cS5F9fNOnXAQsvnTnjtEB
 SaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677856204;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wheplk7LA8m18bTcOJKFW9gPyToD59CgEbKzOZ7bMHk=;
 b=yloGzvFgA+KCJyVfeA2/KB1+cf81wb0VWkgo01yQcEGJ2AmgVLl/v90EDEi8dZHLOO
 jQnlDaHdSbQh66tYdhR1vVEPxNF2T0e/GvBZLN4DOoi1UzRuunoqr5V9MVBoDfApJ9Hg
 ck/87Xpl3jQhV5LjEYJBtU03SfWU4zWD2hXEpJs0mmPoizrviz1X433eTS9MmGi/sZRm
 HioTs7kRCpV1xSVji23cSlL+PMpcrIAYR65MTZXC+xLOpZsNNOWfs0z8lTXckFDxmOcK
 HkOuiTVHJCj+gAx/NVGu5nUBs590bDjEgUNRRJRF9EBTPtRFenGRNSo1GiwDvq6bBEhG
 NrrA==
X-Gm-Message-State: AO0yUKVi4Jg7LGX+2PRJaEU0QMTmlcbYNZDCuDRztiU+XVbWrnAB3Tfc
 mptkHVYfMMUY/w72pga+Ruk=
X-Google-Smtp-Source: AK7set+8q738MiguY/6wCgM3OFCRQI16dopfkQ+VpHdCf8KwcOKr29BjZu7isYQ50ilWQ0YXMI+NUw==
X-Received: by 2002:a05:6e02:20c1:b0:318:d56e:9ef2 with SMTP id
 1-20020a056e0220c100b00318d56e9ef2mr2077701ilq.8.1677856204120; 
 Fri, 03 Mar 2023 07:10:04 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a92d846000000b003186cc462d9sm667111ilq.38.2023.03.03.07.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 07:10:03 -0800 (PST)
Message-ID: <01c1344a-9041-1a56-75a2-a7dd3410420c@roeck-us.net>
Date: Fri, 3 Mar 2023 07:10:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] scsi: megasas: Internal cdbs have 16-byte length
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, Hannes Reinecke <hare@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20230228171129.4094709-1-linux@roeck-us.net>
 <a294096d-1604-585c-6703-293cf8193b0c@proxmox.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <a294096d-1604-585c-6703-293cf8193b0c@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=groeck7@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 3/3/23 01:02, Fiona Ebner wrote:
> Am 28.02.23 um 18:11 schrieb Guenter Roeck:
>> Host drivers do not necessarily set cdb_len in megasas io commands.
>> With commits 6d1511cea0 ("scsi: Reject commands if the CDB length
>> exceeds buf_len") and fe9d8927e2 ("scsi: Add buf_len parameter to
>> scsi_req_new()"), this results in failures to boot Linux from affected
>> SCSI drives because cdb_len is set to 0 by the host driver.
>> Set the cdb length to its actual size to solve the problem.
>>
> 
> Tested-by: Fiona Ebner <f.ebner@proxmox.com>
> 
> But I do have a question:
> 
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   hw/scsi/megasas.c | 14 ++------------
>>   1 file changed, 2 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
>> index 9cbbb16121..d624866bb6 100644
>> --- a/hw/scsi/megasas.c
>> +++ b/hw/scsi/megasas.c
>> @@ -1780,7 +1780,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>>       uint8_t cdb[16];
>>       int len;
>>       struct SCSIDevice *sdev = NULL;
>> -    int target_id, lun_id, cdb_len;
>> +    int target_id, lun_id;
>>   
>>       lba_count = le32_to_cpu(cmd->frame->io.header.data_len);
>>       lba_start_lo = le32_to_cpu(cmd->frame->io.lba_lo);
>> @@ -1789,7 +1789,6 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>>   
>>       target_id = cmd->frame->header.target_id;
>>       lun_id = cmd->frame->header.lun_id;
>> -    cdb_len = cmd->frame->header.cdb_len;
>>   
>>       if (target_id < MFI_MAX_LD && lun_id == 0) {
>>           sdev = scsi_device_find(&s->bus, 0, target_id, lun_id);
>> @@ -1804,15 +1803,6 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>>           return MFI_STAT_DEVICE_NOT_FOUND;
>>       }
>>   
>> -    if (cdb_len > 16) {
>> -        trace_megasas_scsi_invalid_cdb_len(
>> -            mfi_frame_desc(frame_cmd), 1, target_id, lun_id, cdb_len);
>> -        megasas_write_sense(cmd, SENSE_CODE(INVALID_OPCODE));
>> -        cmd->frame->header.scsi_status = CHECK_CONDITION;
>> -        s->event_count++;
>> -        return MFI_STAT_SCSI_DONE_WITH_ERROR;
>> -    }
> 
> Shouldn't we still fail when cmd->frame->header.cdb_len > 16? Or is the
> consequence of
> 
>> Host drivers do not necessarily set cdb_len in megasas io commands.
> 
> that this can be uninitialized memory and we need to assume it was not
> explicitly set?
> 

I doubt that real hardware uses or checks the field for the affected commands
because that would be pointless, but it is really up to you to decide how
you want to handle it.

Guenter

> Best Regards,
> Fiona
> 
>> -
>>       cmd->iov_size = lba_count * sdev->blocksize;
>>       if (megasas_map_sgl(s, cmd, &cmd->frame->io.sgl)) {
>>           megasas_write_sense(cmd, SENSE_CODE(TARGET_FAILURE));
>> @@ -1823,7 +1813,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>>   
>>       megasas_encode_lba(cdb, lba_start, lba_count, is_write);
>>       cmd->req = scsi_req_new(sdev, cmd->index,
>> -                            lun_id, cdb, cdb_len, cmd);
>> +                            lun_id, cdb, sizeof(cdb), cmd);
>>       if (!cmd->req) {
>>           trace_megasas_scsi_req_alloc_failed(
>>               mfi_frame_desc(frame_cmd), target_id, lun_id);
> 


