Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94086563ED4
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:29:10 +0200 (CEST)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Wcv-0006OQ-NO
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o7Wa6-0003vi-10
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o7WZy-0005Dg-Jn
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656743163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDC95QlDmw/JUDu0CImtn8obUX4/3oP6celVPU9lyyA=;
 b=YxOWR8GUDlmDjnQ0q/GR9vypub3SLpBbEZLQawbW6xvMoqH2L8ad178PBkUe1FPSlWS0dT
 EcFvhBCrptN0mhcdRLExi3+0L99l75g/6u9ocfXGZlVtZJYClSitdENcPhFn4MDp9dsU8P
 6Y01uznmX1nRO9j11LpwTRyKV05PVAA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-GaSvtPZJPvGCyhB5qye3tA-1; Sat, 02 Jul 2022 02:26:02 -0400
X-MC-Unique: GaSvtPZJPvGCyhB5qye3tA-1
Received: by mail-ed1-f71.google.com with SMTP id
 g8-20020a056402090800b00433940d207eso3174834edz.1
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 23:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oDC95QlDmw/JUDu0CImtn8obUX4/3oP6celVPU9lyyA=;
 b=g0OU0AEwgpYuK/UbRntuh7RrmjyQxmWz3nAYtu10gtF/mukd/n+cBZRGZ4SRXDN+AE
 22fmtk+NDT3R3IKhusMhR5CtfLXcMdtbzsTbogmKjZnyUBw7z1gYdVPiKe04dFactkxO
 oRwodzIRrkjf333m7SSUs79ge+93orwr2MgZqtMDhRYp88+zsjzNlW8mL8uH2jB4/S38
 1xoiTbR9jXOz0V7+6iJL2v8mxan8mr+2kpWNJ49sE5pnex4uxm6Eoeu+7gCphib9RZI5
 pg5Ssok3CZvwaMOmuGrLcSO4dXURYvivLLMjjyQ94sqctxv2/x2+k9LhRO4Bdd7otFxh
 i6kg==
X-Gm-Message-State: AJIora8Wnpvp7bZdJgQGV9JPlB1IMT+/I+QCigaVZyiyNb/UQRaOpR+4
 o+RRU2EYO5c+fUl0imbloNoU00oeNm3m2XyeKL2I2AcWYgoMyjBA8Q8aIz5fn90UMdkOegMpLq9
 yJSrdrIkwR+XYHMM=
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id
 gb5-20020a170907960500b006f50c667c13mr18243274ejc.66.1656743161007; 
 Fri, 01 Jul 2022 23:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sn41M/SlGSkRoTpWybNAr1UHwJHIYcmbhkiTp/Csj4J8PA2qmiPRr0NngftfRLEzA3168WWA==
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id
 gb5-20020a170907960500b006f50c667c13mr18243263ejc.66.1656743160773; 
 Fri, 01 Jul 2022 23:26:00 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 e12-20020a170906314c00b0072aa009aa68sm643415eje.36.2022.07.01.23.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 23:26:00 -0700 (PDT)
Message-ID: <907d519e-8286-52bd-be45-90c2e8fd332c@redhat.com>
Date: Sat, 2 Jul 2022 08:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/12] pc-bios/s390-ccw/virtio: Introduce a macro for the
 DASD block size
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-3-thuth@redhat.com> <87wnd0c49r.fsf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87wnd0c49r.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 28/06/2022 15.21, Cornelia Huck wrote:
> On Tue, Jun 28 2022, Thomas Huth <thuth@redhat.com> wrote:
> 
>> Use VIRTIO_DASD_BLOCK_SIZE instead of the magic value 4096.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   pc-bios/s390-ccw/virtio.h        | 1 +
>>   pc-bios/s390-ccw/virtio-blkdev.c | 2 +-
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
>> index 19fceb6495..c2c17c29ca 100644
>> --- a/pc-bios/s390-ccw/virtio.h
>> +++ b/pc-bios/s390-ccw/virtio.h
>> @@ -198,6 +198,7 @@ extern int virtio_read_many(ulong sector, void *load_addr, int sec_num);
>>   #define VIRTIO_SECTOR_SIZE 512
>>   #define VIRTIO_ISO_BLOCK_SIZE 2048
>>   #define VIRTIO_SCSI_BLOCK_SIZE 512
>> +#define VIRTIO_DASD_BLOCK_SIZE 4096
>>   
>>   static inline ulong virtio_sector_adjust(ulong sector)
>>   {
>> diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
>> index 7d35050292..49ed2b4bee 100644
>> --- a/pc-bios/s390-ccw/virtio-blkdev.c
>> +++ b/pc-bios/s390-ccw/virtio-blkdev.c
>> @@ -155,7 +155,7 @@ void virtio_assume_eckd(void)
>>       vdev->config.blk.physical_block_exp = 0;
>>       switch (vdev->senseid.cu_model) {
>>       case VIRTIO_ID_BLOCK:
>> -        vdev->config.blk.blk_size = 4096;
>> +        vdev->config.blk.blk_size = VIRTIO_DASD_BLOCK_SIZE;
>>           break;
>>       case VIRTIO_ID_SCSI:
>>           vdev->config.blk.blk_size = vdev->scsi_block_size;
> 
> Unrelated to this change, but can't dasd be formatted with other block
> sizes as well?

You're right, "dasdfmt" has a parameter for this. Shall I rename the macro 
to VIRTIO_DASD_DEFAULT_BLOCK_SIZE ?

  Thomas


