Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AC1534EE6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:13:41 +0200 (CEST)
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCN0-0008H9-0R
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCIW-0005a3-NS
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nuCIU-00071x-VU
 for qemu-devel@nongnu.org; Thu, 26 May 2022 08:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653566938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+z8BrInXT+x2nri9RWScM8pXvCLeSyebY5XS74YqbnM=;
 b=L+VIHsYTXRuCXU4w8XmMWUKDI3Ymk7xXU10xGXNCmnuSM60V558zBEu/BxWvtibivv5Ox0
 9sLKWFHQRH+qfZBemyiP+sDlDSiGOsa4vC00bvjMjBaxa8stVjPSyP1nEcepKzJUBu/eLF
 L6z69Vph/ZK1NMxsJ3J7moElUpdHfrw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-ocrfsziKOxWZV6hK5JbTag-1; Thu, 26 May 2022 08:08:55 -0400
X-MC-Unique: ocrfsziKOxWZV6hK5JbTag-1
Received: by mail-ed1-f70.google.com with SMTP id
 bc17-20020a056402205100b0042aa0e072d3so937680edb.17
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 05:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+z8BrInXT+x2nri9RWScM8pXvCLeSyebY5XS74YqbnM=;
 b=e4GlOI22fcXMxCoTKavG47LdTzkDf95qyZvpg+dDVkdi8V+76bDTkqKBcuqWIyNoS/
 y+U2PdROReD6gAPsbK9xK0iNY3prB0ge09Cxf6g6lqhbt1VaKWRUagijy6tq3vOP/Tk6
 uD0RST1rReMzdr8MxEkjMtexHlxj4fB2huFMG/zK/Sfz4DBl+IxWtHbIPpIuwpRmxJrY
 NnzzI7Et3HO1nWlQEjt2s3PN5wxmMMopE+knhhB+2JBGwat0KLpUN+rfRtTwWsd+/zCp
 7XX4T9rCqVv3N3T7wXEfOF0W9hqiTqh5DpQixwS1UB2xuSnTgWFA2BMNI0Kv5QCzueU8
 KFIg==
X-Gm-Message-State: AOAM5320KLNsA3+6G3Yt02Y/9VZGxxwfJg9AQqm/9Z8W00zq+WcEDj8W
 DF2IkM+67UjjavfyYN/Ywm8Ufpp93p+s+lxF5UBws8v5it+EfXWzPOfAk93WToP8gMcSHxfie30
 p+FK6Jm1DAp7XSrw=
X-Received: by 2002:a05:6402:e85:b0:41d:121b:f436 with SMTP id
 h5-20020a0564020e8500b0041d121bf436mr39618774eda.121.1653566933337; 
 Thu, 26 May 2022 05:08:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVed6apUyHed0sX9HejeFEpmU1gBN42oWZQbYL1XU+87UsAv6FuM/MJ8dli6n7Rifhlb7RJg==
X-Received: by 2002:a05:6402:e85:b0:41d:121b:f436 with SMTP id
 h5-20020a0564020e8500b0041d121bf436mr39618707eda.121.1653566932580; 
 Thu, 26 May 2022 05:08:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 18-20020a508e12000000b0042617ba63c8sm708723edw.82.2022.05.26.05.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 05:08:52 -0700 (PDT)
Message-ID: <873eddc7-a18f-2728-14dd-681d951eebbb@redhat.com>
Date: Thu, 26 May 2022 14:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 09/11] scsi-disk: allow MODE SELECT block descriptor to
 set the ROM device block size
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-10-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220424164935.7339-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/24/22 18:49, Mark Cave-Ayland wrote:
> Whilst CDROM drives usually have a 2048 byte sector size, older drives have the
> ability to switch between 2048 byte and 512 byte sector sizes by specifying a
> block descriptor in the MODE SELECT command.
> 
> If a MODE SELECT block descriptor is provided, update the scsi-cd device block
> size with the provided value accordingly.
> 
> This allows CDROMs to be used with A/UX whose driver only works with a 512 byte
> sector size.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Why do this only for MMC?

Paolo

> ---
>   hw/scsi/scsi-disk.c  | 7 +++++++
>   hw/scsi/trace-events | 1 +
>   2 files changed, 8 insertions(+)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index 6991493cf4..41ebbe3045 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -1583,6 +1583,13 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
>           goto invalid_param;
>       }
>   
> +    /* Allow changing the block size of ROM devices */
> +    if (s->qdev.type == TYPE_ROM && bd_len &&
> +        p[6] != (s->qdev.blocksize >> 8)) {
> +            s->qdev.blocksize = p[6] << 8;
> +            trace_scsi_disk_mode_select_rom_set_blocksize(s->qdev.blocksize);
> +    }
> +
>       len -= bd_len;
>       p += bd_len;
>   
> diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
> index 25eae9f307..1a021ddae9 100644
> --- a/hw/scsi/trace-events
> +++ b/hw/scsi/trace-events
> @@ -340,6 +340,7 @@ scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(se
>   scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
>   scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) timeout=%u"
>   scsi_disk_mode_select_page_truncated(int page, int len, int page_len) "page %d expected length %d but received length %d"
> +scsi_disk_mode_select_rom_set_blocksize(int blocksize) "set ROM block size to %d"
>   
>   # scsi-generic.c
>   scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command complete %p tag=0x%x status=%d"


