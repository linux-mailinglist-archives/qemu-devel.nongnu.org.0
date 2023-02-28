Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35A6A620D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX82c-0003mU-L6; Tue, 28 Feb 2023 17:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX825-0003kb-VN
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:01:13 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX823-0005FT-4c
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:01:13 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso7165272wmb.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677621654;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rnIO8qtp9HsOHSCgocKOEi2w0u3Gs9XOvA2UHugIZ5o=;
 b=nFuKtWixN/oVaxqGlGkNSeqvyTbYROIoA8l5mUNHHE4rnfBVXiMuBMQlzOBduBheGk
 SwpBVcNTcM7+EV/G6GQCu0X4FU/PhPXoA4o31T8SuBRlzGW6A/90XKEelRf1PGMDhLwt
 Xd2KyloehGNUEzh9PgNPG+CBC/IdcBXyiy/LQi+Pwg+LLoHt19uNw++Dnb+59A/5K6OQ
 3GfnjsAvqC77oy/UQKhhI9f6XI1AwWVYFXpcsEON29JTR0zJoc5VhdUgpqbHLteB1P4E
 TXDp9vgHZtlGtfU4jT7xH7Jc4qidexIuw5eR2TEGgP+Yq1/1BHMqNVXAbPRpmlqV3QnN
 BCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677621654;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rnIO8qtp9HsOHSCgocKOEi2w0u3Gs9XOvA2UHugIZ5o=;
 b=Gq7fVghJS1YkErOMP3Vvcxem5HJep52KvewDyah6wBPKukde3AaOxpJ5wRQIyDS6Z7
 3sKGN4jktJPq5OJ8vG5uLcIslW3q6rAzdqvzaBEizbWoVdMLRkF/4RpcoKgT8x6YSDcS
 rHfxXnRz0QQh7DG074Xca8Gnlp4GluTHJ7JEGFUdB1iq3qAtHthvteqpNY8TjBlm+Fah
 /pDp2QgzHKyVC1P8y0Qd8y892jeWKxrpGEPKFDiVOhtoev6b3/FicTSV0KXZKGHv0Cbc
 3V5a8qb8me4GUQNn/ky1cL5rcPMkVnKdwjYfuH+5RjHu6dzvfE69ahPkiyID7VHRLRHm
 OwoQ==
X-Gm-Message-State: AO0yUKXitCjI0naT7AVnEdM58XlK/hHj4THOdhaKF/x/O2ZhKsaDVefx
 WDyrGNG5STpgbGiZWEXxywAQ6g==
X-Google-Smtp-Source: AK7set+WKqbY9HO1JENY9KukA2qJJoM6Kf7Jv71mIfcJ5w1ZaFK6tqrFp+Ge6n4kUHS/hYOVDMWb+Q==
X-Received: by 2002:a05:600c:4b27:b0:3eb:3945:d3f4 with SMTP id
 i39-20020a05600c4b2700b003eb3945d3f4mr3652123wmp.2.1677621654618; 
 Tue, 28 Feb 2023 14:00:54 -0800 (PST)
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.166]) by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c0b5800b003e00c453447sm16622543wmr.48.2023.02.28.14.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 14:00:54 -0800 (PST)
Message-ID: <1c67be2a-08ea-46ba-e5ea-aed9026de4a3@linaro.org>
Date: Tue, 28 Feb 2023 23:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] scsi: megasas: Internal cdbs have 16-byte length
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Hannes Reinecke <hare@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.com>
References: <20230228171129.4094709-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228171129.4094709-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

+Hannes

On 28/2/23 18:11, Guenter Roeck wrote:
> Host drivers do not necessarily set cdb_len in megasas io commands.
> With commits 6d1511cea0 ("scsi: Reject commands if the CDB length
> exceeds buf_len") and fe9d8927e2 ("scsi: Add buf_len parameter to
> scsi_req_new()"), this results in failures to boot Linux from affected
> SCSI drives because cdb_len is set to 0 by the host driver.
> Set the cdb length to its actual size to solve the problem.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/scsi/megasas.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index 9cbbb16121..d624866bb6 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -1780,7 +1780,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>       uint8_t cdb[16];
>       int len;
>       struct SCSIDevice *sdev = NULL;
> -    int target_id, lun_id, cdb_len;
> +    int target_id, lun_id;
>   
>       lba_count = le32_to_cpu(cmd->frame->io.header.data_len);
>       lba_start_lo = le32_to_cpu(cmd->frame->io.lba_lo);
> @@ -1789,7 +1789,6 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>   
>       target_id = cmd->frame->header.target_id;
>       lun_id = cmd->frame->header.lun_id;
> -    cdb_len = cmd->frame->header.cdb_len;
>   
>       if (target_id < MFI_MAX_LD && lun_id == 0) {
>           sdev = scsi_device_find(&s->bus, 0, target_id, lun_id);
> @@ -1804,15 +1803,6 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>           return MFI_STAT_DEVICE_NOT_FOUND;
>       }
>   
> -    if (cdb_len > 16) {
> -        trace_megasas_scsi_invalid_cdb_len(
> -            mfi_frame_desc(frame_cmd), 1, target_id, lun_id, cdb_len);
> -        megasas_write_sense(cmd, SENSE_CODE(INVALID_OPCODE));
> -        cmd->frame->header.scsi_status = CHECK_CONDITION;
> -        s->event_count++;
> -        return MFI_STAT_SCSI_DONE_WITH_ERROR;
> -    }
> -
>       cmd->iov_size = lba_count * sdev->blocksize;
>       if (megasas_map_sgl(s, cmd, &cmd->frame->io.sgl)) {
>           megasas_write_sense(cmd, SENSE_CODE(TARGET_FAILURE));
> @@ -1823,7 +1813,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
>   
>       megasas_encode_lba(cdb, lba_start, lba_count, is_write);
>       cmd->req = scsi_req_new(sdev, cmd->index,
> -                            lun_id, cdb, cdb_len, cmd);
> +                            lun_id, cdb, sizeof(cdb), cmd);

I haven't checked the spec, but this logic makes sense to me, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       if (!cmd->req) {
>           trace_megasas_scsi_req_alloc_failed(
>               mfi_frame_desc(frame_cmd), target_id, lun_id);


